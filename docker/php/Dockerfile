FROM php:7.4-fpm

ENV ROOT_PATH /var/www/html
ENV LANG C.UTF-8

FROM wordpress:5.4.2-fpm

ENV ROOT_PATH /var/www/html
ENV LANG C.UTF-8

# パイプ(|) を使用した場合、パイプ前の処理が失敗しても
# 最後の処理が成功すれば、その行のexitは0になる
# pipefail オプションをつけることで、パイプの前の処理が失敗した場合も
# 戻り値を非1とすることが可能
#
# see: https://github.com/hadolint/hadolint/wiki/DL4006
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# 特殊なアクセス権、suid, sgid を排除
# 想定外のアクセス権でコマンドを実行されることを防ぐ
#
# see: https://github.com/goodwithtech/dockle/blob/master/CHECKPOINT.md#CIS-DI-0008
RUN chmod u-s /bin/umount && \
    chmod g-s /usr/bin/expiry && \
    chmod u-s /bin/su && \
    chmod g-s /usr/bin/wall && \
    chmod u-s /usr/bin/gpasswd && \
    chmod u-s /bin/mount && \
    chmod u-s /usr/bin/passwd && \
    chmod g-s /sbin/unix_chkpwd && \
    chmod g-s /usr/bin/chage && \
    chmod u-s /usr/bin/chsh && \
    chmod u-s /usr/bin/chfn && \
    chmod u-s /usr/bin/newgrp

# 作業ディレクトリ作成
RUN \
  rm -rf $ROOT_PATH && \
  mkdir -p $ROOT_PATH
WORKDIR $ROOT_PATH

COPY . $ROOT_PATH

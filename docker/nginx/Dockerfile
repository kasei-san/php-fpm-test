FROM nginx:1.20.0

ENV TZ /usr/share/zoneinfo/Asia/Tokyo
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

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
RUN chown -R nginx:nginx /var/cache/nginx

# Base Imageに置かれている設定ファイルを削除
RUN rm -f /etc/nginx/conf.d/*

# 実行ユーザ作成
USER nginx

COPY --chown=nginx files/run.sh /
COPY --chown=nginx files/nginx.conf /etc/nginx/nginx.conf

# use SIGQUIT for graceful shutdown
# c.f. http://nginx.org/en/docs/control.html
STOPSIGNAL SIGQUIT

ENTRYPOINT ["/run.sh"]

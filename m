Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8371D7AFA
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 16:20:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19B7C16ED;
	Mon, 18 May 2020 16:20:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19B7C16ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589811656;
	bh=ZT8rqF0UbU/sPA1r2pcmHraexsk64Q/96MaWzYPuPbA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nG55h6+jufegjuO/GUHOKd27wB/HBPrSr22ZTQc95UJ/XMCj/sQrbgS3ENdjiKMy6
	 zKJ2ajmnHe0T/GqV1ENn18VPHqfLMHaUxtkZNLtwkOgceMTfv4GV1QofiMaaj6uFjj
	 UU75oI+7vGU3ddFW0pQPDsasUaon92vpcXVOS1B0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4142F8028E;
	Mon, 18 May 2020 16:18:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDE70F801A3; Sun, 17 May 2020 18:43:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFD19F800E3
 for <alsa-devel@alsa-project.org>; Sun, 17 May 2020 18:43:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFD19F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="d/bFl9zc"
Received: by mail-io1-xd41.google.com with SMTP id s10so8010240iog.7
 for <alsa-devel@alsa-project.org>; Sun, 17 May 2020 09:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bW2tMhxWyyjNncTb2G7OX7x0LZat/kQuDZNZwydNgqI=;
 b=d/bFl9zc2OyPGpLznpmI7A+ZDvS789Kbw8lTq2WEMKo+Oi/9p7s+GtNlQtjyzAAHWs
 3xz2VcLzijw/7uk3s2hE8szH+6A9PFoNPbF5GzOAXXPCexmAwQu/qBbf+PcNfCRxEMDO
 x+QH6O02AYW3LjPO6VG2z8b/gDDlPMSBBJG1PlJMSsGuP7oNUilHi3uZnDU+sjOqnpay
 /jHs8xzHBCUGY4ALEcrBqEonOR0KpSKjcy//YuiZ9/l/Okvq6rfaXddyJGk8ufKmEXJG
 JcoxOqF4dXi/hTMstDEBPtdW330tAhbx/o9s7N84zN7yw6vXHKMCxOYgrfuHn/t2qkwi
 V8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bW2tMhxWyyjNncTb2G7OX7x0LZat/kQuDZNZwydNgqI=;
 b=KQq2jHsXVXjbhqowPr05eaKK1iSsdUtqQsyEixtvmar5A8cquyd6oJSKUl1d2CYrI6
 kRUis1WSNoalIRb/4dXS6Zej7emzObLsreJgAmmnHi0XhI/uc4KA5f7Jebcr0xjKIxY1
 2bLnUjG1Qd49RgyLB49XxrwmQLYUj/DUxE8/IzNGq/b2hqGjHztm1Xi8xQxrp7HJXgp5
 RvvTBlGAHij6dSeDhVvttc3GBWFvfc6ts2OGqI+vu3i6lS2BdyEEy8hpnVitMWbDEj+m
 E21f6XurJXFlHMBaDjiATX6OFm0YvuqzYW1XG1/hPuEU413OKX7/6q0bsSbbkTYjsUIk
 /T/Q==
X-Gm-Message-State: AOAM532nvXll3I66fud6jK12y88wsYyRo/vJI3WnFGhDA36m5i4tCGXN
 Kj3EHW5rRExmrq3mTO4TENngrjMI2WLsfDwoDu8=
X-Google-Smtp-Source: ABdhPJzqbU5i3pOsh9QTXXqsMPl4e4nnE4VT8jwhh5K7/GgAT+qqtvyWdOaHb1xfeVtbgJbnihxKRLuVNNoF7TrLW3Q=
X-Received: by 2002:a5e:8d17:: with SMTP id m23mr11036234ioj.11.1589733813147; 
 Sun, 17 May 2020 09:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200516173934.31527-1-oscar.carter@gmx.com>
In-Reply-To: <20200516173934.31527-1-oscar.carter@gmx.com>
From: "Lev R. Oshvang ." <levonshe@gmail.com>
Date: Sun, 17 May 2020 19:43:21 +0300
Message-ID: <CAP22eLF2Q3O+=tnHRKE5q=jn9gw2G1rjAKiewM4qGsf4WYvP0Q@mail.gmail.com>
Subject: Re: [PATCH] firewire: Remove function callback casts
To: Oscar Carter <oscar.carter@gmx.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 18 May 2020 16:18:11 +0200
Cc: alsa-devel@alsa-project.org, Kees Cook <keescook@chromium.org>,
 kernel-hardening@lists.openwall.com, linux-kernel@vger.kernel.org,
 Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux1394-devel@lists.sourceforge.net, linux-media@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sat, May 16, 2020 at 8:40 PM Oscar Carter <oscar.carter@gmx.com> wrote:
>
> In an effort to enable -Wcast-function-type in the top-level Makefile to
> support Control Flow Integrity builds, remove all the function callback
> casts.
>
> To do this, modify the "fw_iso_context_create" function prototype adding
> a new parameter for the multichannel callback. Also, fix all the
> function calls accordingly.
>
> Signed-off-by: Oscar Carter <oscar.carter@gmx.com>
> ---
>  drivers/firewire/core-cdev.c        | 12 +++++++-----
>  drivers/firewire/core-iso.c         | 10 ++++++++--
>  drivers/firewire/net.c              |  2 +-
>  drivers/media/firewire/firedtv-fw.c |  3 ++-
>  include/linux/firewire.h            |  3 ++-
>  sound/firewire/amdtp-stream.c       |  2 +-
>  sound/firewire/isight.c             |  4 ++--
>  7 files changed, 23 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
> index 6e291d8f3a27..cc368b35be2e 100644
> --- a/drivers/firewire/core-cdev.c
> +++ b/drivers/firewire/core-cdev.c
> @@ -957,7 +957,8 @@ static int ioctl_create_iso_context(struct client *client, union ioctl_arg *arg)
>  {
>         struct fw_cdev_create_iso_context *a = &arg->create_iso_context;
>         struct fw_iso_context *context;
> -       fw_iso_callback_t cb;
> +       fw_iso_callback_t cb_sc = NULL;
> +       fw_iso_mc_callback_t cb_mc = NULL;
>         int ret;
>
>         BUILD_BUG_ON(FW_CDEV_ISO_CONTEXT_TRANSMIT != FW_ISO_CONTEXT_TRANSMIT ||
> @@ -970,7 +971,7 @@ static int ioctl_create_iso_context(struct client *client, union ioctl_arg *arg)
>                 if (a->speed > SCODE_3200 || a->channel > 63)
>                         return -EINVAL;
>
> -               cb = iso_callback;
> +               cb_sc = iso_callback;
>                 break;
>
>         case FW_ISO_CONTEXT_RECEIVE:
> @@ -978,11 +979,11 @@ static int ioctl_create_iso_context(struct client *client, union ioctl_arg *arg)
>                     a->channel > 63)
>                         return -EINVAL;
>
> -               cb = iso_callback;
> +               cb_sc = iso_callback;
>                 break;
>
>         case FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL:
> -               cb = (fw_iso_callback_t)iso_mc_callback;
> +               cb_mc = iso_mc_callback;
>                 break;
>
>         default:
> @@ -990,7 +991,8 @@ static int ioctl_create_iso_context(struct client *client, union ioctl_arg *arg)
>         }
>
>         context = fw_iso_context_create(client->device->card, a->type,
> -                       a->channel, a->speed, a->header_size, cb, client);
> +                       a->channel, a->speed, a->header_size, cb_sc, cb_mc,
> +                       client);
>         if (IS_ERR(context))
>                 return PTR_ERR(context);
>         if (client->version < FW_CDEV_VERSION_AUTO_FLUSH_ISO_OVERFLOW)
> diff --git a/drivers/firewire/core-iso.c b/drivers/firewire/core-iso.c
> index 185b0b78b3d6..3b8e349704f8 100644
> --- a/drivers/firewire/core-iso.c
> +++ b/drivers/firewire/core-iso.c
> @@ -131,7 +131,8 @@ size_t fw_iso_buffer_lookup(struct fw_iso_buffer *buffer, dma_addr_t completed)
>
>  struct fw_iso_context *fw_iso_context_create(struct fw_card *card,
>                 int type, int channel, int speed, size_t header_size,
> -               fw_iso_callback_t callback, void *callback_data)
> +               fw_iso_callback_t cb_sc, fw_iso_mc_callback_t cb_mc,
> +               void *callback_data)
>  {
>         struct fw_iso_context *ctx;
>
> @@ -145,7 +146,12 @@ struct fw_iso_context *fw_iso_context_create(struct fw_card *card,
>         ctx->channel = channel;
>         ctx->speed = speed;
>         ctx->header_size = header_size;
> -       ctx->callback.sc = callback;
> +
> +       if (cb_sc)
> +               ctx->callback.sc = cb_sc;
> +       else
> +               ctx->callback.mc = cb_mc;
> +
>         ctx->callback_data = callback_data;
>
>         return ctx;
> diff --git a/drivers/firewire/net.c b/drivers/firewire/net.c
> index 715e491dfbc3..c5cc0a311aa0 100644
> --- a/drivers/firewire/net.c
> +++ b/drivers/firewire/net.c
> @@ -1136,7 +1136,7 @@ static int fwnet_broadcast_start(struct fwnet_device *dev)
>         context = fw_iso_context_create(dev->card, FW_ISO_CONTEXT_RECEIVE,
>                                         IEEE1394_BROADCAST_CHANNEL,
>                                         dev->card->link_speed, 8,
> -                                       fwnet_receive_broadcast, dev);
> +                                       fwnet_receive_broadcast, NULL, dev);
>         if (IS_ERR(context)) {
>                 retval = PTR_ERR(context);
>                 goto failed;
> diff --git a/drivers/media/firewire/firedtv-fw.c b/drivers/media/firewire/firedtv-fw.c
> index 97144734eb05..d2940adefd8c 100644
> --- a/drivers/media/firewire/firedtv-fw.c
> +++ b/drivers/media/firewire/firedtv-fw.c
> @@ -141,7 +141,8 @@ int fdtv_start_iso(struct firedtv *fdtv)
>
>         ctx->context = fw_iso_context_create(device->card,
>                         FW_ISO_CONTEXT_RECEIVE, fdtv->isochannel,
> -                       device->max_speed, ISO_HEADER_SIZE, handle_iso, fdtv);
> +                       device->max_speed, ISO_HEADER_SIZE,
> +                       handle_iso, NULL, fdtv);
>         if (IS_ERR(ctx->context)) {
>                 err = PTR_ERR(ctx->context);
>                 goto fail_free;
> diff --git a/include/linux/firewire.h b/include/linux/firewire.h
> index aec8f30ab200..3a0b5e18e140 100644
> --- a/include/linux/firewire.h
> +++ b/include/linux/firewire.h
> @@ -452,7 +452,8 @@ struct fw_iso_context {
>
>  struct fw_iso_context *fw_iso_context_create(struct fw_card *card,
>                 int type, int channel, int speed, size_t header_size,
> -               fw_iso_callback_t callback, void *callback_data);
> +               fw_iso_callback_t cb_sc, fw_iso_mc_callback_t cb_mc,
> +               void *callback_data);
>  int fw_iso_context_set_channels(struct fw_iso_context *ctx, u64 *channels);
>  int fw_iso_context_queue(struct fw_iso_context *ctx,
>                          struct fw_iso_packet *packet,
> diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
> index 37d38efb4c87..8629ab3e2c64 100644
> --- a/sound/firewire/amdtp-stream.c
> +++ b/sound/firewire/amdtp-stream.c
> @@ -1093,7 +1093,7 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
>
>         s->context = fw_iso_context_create(fw_parent_device(s->unit)->card,
>                                           type, channel, speed, ctx_header_size,
> -                                         ctx_cb, ctx_data);
> +                                         ctx_cb, NULL, ctx_data);
>         if (IS_ERR(s->context)) {
>                 err = PTR_ERR(s->context);
>                 if (err == -EBUSY)
> diff --git a/sound/firewire/isight.c b/sound/firewire/isight.c
> index 6655af53b367..51cc37fca736 100644
> --- a/sound/firewire/isight.c
> +++ b/sound/firewire/isight.c
> @@ -361,8 +361,8 @@ static int isight_start_streaming(struct isight *isight)
>         isight->context = fw_iso_context_create(isight->device->card,
>                                                 FW_ISO_CONTEXT_RECEIVE,
>                                                 isight->resources.channel,
> -                                               isight->device->max_speed,
> -                                               4, isight_packet, isight);
> +                                               isight->device->max_speed, 4,
> +                                               isight_packet, NULL, isight);
>         if (IS_ERR(isight->context)) {
>                 err = PTR_ERR(isight->context);
>                 isight->context = NULL;
> --
> 2.20.1
>

Hi Oscar,
I would recommend to explicitly set NULL to _cb and use if elif to
exclude the case where botm _cb paraneters are passed as NULLs :
> +
  ctx->callback.mc =NULL:
  ctx->callback.sc = NULL;
> +       if (cb_sc)
> +               ctx->callback.sc = cb_sc;

> +       elif (cb_ms)
> +               ctx->callback.mc = cb_mc;
> +         else
                    return -EINVAL;

Hope you get the point.
Lev

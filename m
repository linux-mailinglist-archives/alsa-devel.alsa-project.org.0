Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E3E8314D5
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 09:38:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FC1D820;
	Thu, 18 Jan 2024 09:37:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FC1D820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705567079;
	bh=blT46EeNAT2lvM0XGAEM/w5Qul65WnYYWgsZC3sBwwI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F0LzRgPY2vFs1EwoJ32crRTfwPDjutyKBm9GdqQdbD6Z4X48elHOb3NmMpQeDRZia
	 Va21jiKMfZ9WUdgFe4fMESJViP5h1czCfd+3xylh7vNfDAQWwY/7ElvjC5+/vYW0c9
	 Hmp4nEex3qeIJaW9eORpdetXOQJs6vlbd9ZueH2g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DC34F80589; Thu, 18 Jan 2024 09:37:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7761F8057D;
	Thu, 18 Jan 2024 09:37:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C316F801F5; Thu, 18 Jan 2024 09:37:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7864BF8003A
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 09:37:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7864BF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PkH8pJmt
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3619cc9cc65so1541085ab.3
        for <alsa-devel@alsa-project.org>;
 Thu, 18 Jan 2024 00:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705567024; x=1706171824;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fh9hL8siDGAkPJkrugRo3TBGAwILVgXfs1AnjA1KuoA=;
        b=PkH8pJmt3zYCezhHk0+aBD7FJqNzxHiWk+7pSGXE3JGNNMjOZohpDdMsF5lE8Lloyv
         peLl35bnjs5K+POujW6Qjdm4W8APpV+BAYtipgMO9CwN/vLA3R5n2qcZRII6uPgCpRdL
         uHtmlfZhDDVvXv/BWY5RTKtp4Z5siDZsqWQ7sm4ruMRtAxbi0qUq9ECghf3DMRZ+U7Ks
         Kvx6x9k4z9uOLQzaH+znzjrwZE1irJlPX4tUksq+V28575gCaEb5DdkVAYKMmifKQFg2
         xXBhiUTzmySKlpdQa7HRrLJmPflg2NKk/tKiMsdfZ4EbPdkY4wKmWAxaoL2WCS6D9P9v
         LjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705567024; x=1706171824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fh9hL8siDGAkPJkrugRo3TBGAwILVgXfs1AnjA1KuoA=;
        b=RDv8QLBUD6KHxZFTzOoWCaTKGHNeapxIv4xWlTEh1NHvUUBDEnD8CfT4gFadF1ebkG
         75n1jItL5Yqk1Sd4MjHVKK10BDXqZDotTbZ92nzYEGXdMPdNmkHr/naD7gKlEjNtm2zi
         1fa5Q1ZuwTnmeDE5gZb9J4p+Gm0zec41KqoX1aqEzsckZ9IG7yQxQ6JGMO61WUvJsPGE
         O/3D5daB2dM1NwytkWf8Axm3dLyr2E9wJeKYSwssmAivLTAuHkhPfPmxYAtTRa3dEtHg
         3f/7ICULVJDAunx8d1roNhVShxEGarJtFFr1qKF4YGBUBkDgHPNBN1QOdk63IeA63+YD
         B1XA==
X-Gm-Message-State: AOJu0YyKj2tdufc9IQmLPV6AbE0AUdK7957VDerKjC6g1A9MIo5H6Ht1
	dkTkql+beJkpw8rp0aPZm4imB52utnp1U5zDZd5tUZl3P09g5BcoVHLTcuS4NE3k5t0GwvCCoYV
	5AqUEXbB0juXS79mhENKby9IsKHo=
X-Google-Smtp-Source: 
 AGHT+IGRS1MB9b/FeahgRnO/sHuiqaEenCNdikBhB5J7hFZDZenBbXYmia0YjqpNtKpaWkHvwxhQEPHs94i62pVA46M=
X-Received: by 2002:a92:d812:0:b0:360:62c9:4209 with SMTP id
 y18-20020a92d812000000b0036062c94209mr582034ilm.0.1705567024010; Thu, 18 Jan
 2024 00:37:04 -0800 (PST)
MIME-Version: 1.0
References: <1700637838-6743-1-git-send-email-shengjiu.wang@nxp.com>
 <1700637838-6743-16-git-send-email-shengjiu.wang@nxp.com>
 <6d96cf56-c534-4abf-8819-03cd32fda3d5@xs4all.nl>
 <CAA+D8ANfkQkuV9YgQQ1ggS2G0GhqvmhZrA6Yn-et0E5z6mPSxQ@mail.gmail.com>
 <099df0d8-10c8-4a78-827b-7e000f02ca3f@xs4all.nl>
In-Reply-To: <099df0d8-10c8-4a78-827b-7e000f02ca3f@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 18 Jan 2024 16:36:53 +0800
Message-ID: 
 <CAA+D8AM-ESJJp8M-gPVm2zvUu_WMXasy0BLjp4uk_ujeQYrkXg@mail.gmail.com>
Subject: Re: [PATCH v11 15/15] media: vim2m-audio: add virtual driver for
 audio memory to memory
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 2UR5RGV56Y3WGQRDKX4DAIQH5LF4RUX7
X-Message-ID-Hash: 2UR5RGV56Y3WGQRDKX4DAIQH5LF4RUX7
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2UR5RGV56Y3WGQRDKX4DAIQH5LF4RUX7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jan 18, 2024 at 3:56=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 18/01/2024 07:13, Shengjiu Wang wrote:
> > On Wed, Jan 17, 2024 at 6:32=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.n=
l> wrote:
> >>
> >> On 22/11/2023 08:23, Shengjiu Wang wrote:
> >>> Audio memory to memory virtual driver use video memory to memory
> >>> virtual driver vim2m.c as example. The main difference is
> >>> device type is VFL_TYPE_AUDIO and device cap type is V4L2_CAP_AUDIO_M=
2M.
> >>>
> >>> The device_run function is a dummy function, which is simply
> >>> copy the data from input buffer to output buffer.
> >>>
> >>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>> ---
> >>>  drivers/media/test-drivers/Kconfig       |  11 +
> >>>  drivers/media/test-drivers/Makefile      |   1 +
> >>>  drivers/media/test-drivers/vim2m-audio.c | 799 +++++++++++++++++++++=
++
> >>>  3 files changed, 811 insertions(+)
> >>>  create mode 100644 drivers/media/test-drivers/vim2m-audio.c
> >>>
> >>> diff --git a/drivers/media/test-drivers/Kconfig b/drivers/media/test-=
drivers/Kconfig
> >>> index 459b433e9fae..55f8af6ee4e2 100644
> >>> --- a/drivers/media/test-drivers/Kconfig
> >>> +++ b/drivers/media/test-drivers/Kconfig
> >>> @@ -17,6 +17,17 @@ config VIDEO_VIM2M
> >>>         This is a virtual test device for the memory-to-memory driver
> >>>         framework.
> >>>
> >>> +config VIDEO_VIM2M_AUDIO
> >>> +     tristate "Virtual Memory-to-Memory Driver For Audio"
> >>> +     depends on VIDEO_DEV
> >>> +     select VIDEOBUF2_VMALLOC
> >>> +     select V4L2_MEM2MEM_DEV
> >>> +     select MEDIA_CONTROLLER
> >>> +     select MEDIA_CONTROLLER_REQUEST_API
> >>
> >> Drop this. This option has been removed.
> >>
> >>> +     help
> >>> +       This is a virtual audio test device for the memory-to-memory =
driver
> >>> +       framework.
> >>> +
> >>>  source "drivers/media/test-drivers/vicodec/Kconfig"
> >>>  source "drivers/media/test-drivers/vimc/Kconfig"
> >>>  source "drivers/media/test-drivers/vivid/Kconfig"
> >>> diff --git a/drivers/media/test-drivers/Makefile b/drivers/media/test=
-drivers/Makefile
> >>> index 740714a4584d..0c61c9ada3e1 100644
> >>> --- a/drivers/media/test-drivers/Makefile
> >>> +++ b/drivers/media/test-drivers/Makefile
> >>> @@ -10,6 +10,7 @@ obj-$(CONFIG_DVB_VIDTV) +=3D vidtv/
> >>>
> >>>  obj-$(CONFIG_VIDEO_VICODEC) +=3D vicodec/
> >>>  obj-$(CONFIG_VIDEO_VIM2M) +=3D vim2m.o
> >>> +obj-$(CONFIG_VIDEO_VIM2M_AUDIO) +=3D vim2m-audio.o
> >>>  obj-$(CONFIG_VIDEO_VIMC) +=3D vimc/
> >>>  obj-$(CONFIG_VIDEO_VIVID) +=3D vivid/
> >>>  obj-$(CONFIG_VIDEO_VISL) +=3D visl/
> >>> diff --git a/drivers/media/test-drivers/vim2m-audio.c b/drivers/media=
/test-drivers/vim2m-audio.c
> >>> new file mode 100644
> >>> index 000000000000..72806ada8628
> >>> --- /dev/null
> >>> +++ b/drivers/media/test-drivers/vim2m-audio.c
> >>> @@ -0,0 +1,799 @@
> >>> +// SPDX-License-Identifier: GPL-2.0+
> >>> +/*
> >>> + * A virtual v4l2-mem2mem example for audio device.
> >>> + */
> >>> +
> >>> +#include <linux/module.h>
> >>> +#include <linux/delay.h>
> >>> +#include <linux/fs.h>
> >>> +#include <linux/sched.h>
> >>> +#include <linux/slab.h>
> >>> +
> >>> +#include <linux/platform_device.h>
> >>> +#include <media/v4l2-mem2mem.h>
> >>> +#include <media/v4l2-device.h>
> >>> +#include <media/v4l2-ioctl.h>
> >>> +#include <media/v4l2-ctrls.h>
> >>> +#include <media/v4l2-event.h>
> >>> +#include <media/videobuf2-vmalloc.h>
> >>> +#include <sound/dmaengine_pcm.h>
> >>> +
> >>> +MODULE_DESCRIPTION("Virtual device for audio mem2mem testing");
> >>> +MODULE_LICENSE("GPL");
> >>> +
> >>> +static unsigned int debug;
> >>> +module_param(debug, uint, 0644);
> >>> +MODULE_PARM_DESC(debug, "debug level");
> >>> +
> >>> +#define MEM2MEM_NAME "vim2m-audio"
> >>> +
> >>> +#define dprintk(dev, lvl, fmt, arg...) \
> >>> +     v4l2_dbg(lvl, debug, &(dev)->v4l2_dev, "%s: " fmt, __func__, ##=
 arg)
> >>> +
> >>> +#define SAMPLE_NUM 4096
> >>> +
> >>> +static void audm2m_dev_release(struct device *dev)
> >>> +{}
> >>> +
> >>> +static struct platform_device audm2m_pdev =3D {
> >>> +     .name           =3D MEM2MEM_NAME,
> >>> +     .dev.release    =3D audm2m_dev_release,
> >>> +};
> >>> +
> >>> +static u32 formats[] =3D {
> >>> +     V4L2_AUDIO_FMT_S16_LE,
> >>> +};
> >>> +
> >>> +#define NUM_FORMATS ARRAY_SIZE(formats)
> >>> +
> >>> +/* Per-queue, driver-specific private data */
> >>> +struct audm2m_q_data {
> >>> +     unsigned int            rate;
> >>> +     unsigned int            channels;
> >>> +     unsigned int            buffersize;
> >>> +     unsigned int            sequence;
> >>> +     u32                     fourcc;
> >>> +};
> >>> +
> >>> +enum {
> >>> +     V4L2_M2M_SRC =3D 0,
> >>> +     V4L2_M2M_DST =3D 1,
> >>> +};
> >>> +
> >>> +static snd_pcm_format_t find_format(u32 fourcc)
> >>> +{
> >>> +     snd_pcm_format_t fmt;
> >>> +     unsigned int k;
> >>> +
> >>> +     for (k =3D 0; k < NUM_FORMATS; k++) {
> >>> +             if (formats[k] =3D=3D fourcc)
> >>> +                     break;
> >>> +     }
> >>> +
> >>> +     if (k =3D=3D NUM_FORMATS)
> >>> +             return 0;
> >>> +
> >>> +     fmt =3D v4l2_fourcc_to_audfmt(formats[k]);
> >>> +
> >>> +     return fmt;
> >>> +}
> >>> +
> >>> +struct audm2m_dev {
> >>> +     struct v4l2_device      v4l2_dev;
> >>> +     struct video_device     vfd;
> >>> +
> >>> +     struct mutex            dev_mutex;
> >>> +
> >>> +     struct v4l2_m2m_dev     *m2m_dev;
> >>> +#ifdef CONFIG_MEDIA_CONTROLLER
> >>> +     struct media_device     mdev;
> >>> +#endif
> >>> +};
> >>> +
> >>> +struct audm2m_ctx {
> >>> +     struct v4l2_fh          fh;
> >>> +     struct v4l2_ctrl_handler        ctrl_handler;
> >>> +     struct audm2m_dev       *dev;
> >>> +
> >>> +     struct mutex            vb_mutex;
> >>> +
> >>> +     /* Source and destination queue data */
> >>> +     struct audm2m_q_data   q_data[2];
> >>> +};
> >>> +
> >>> +static inline struct audm2m_ctx *file2ctx(struct file *file)
> >>> +{
> >>> +     return container_of(file->private_data, struct audm2m_ctx, fh);
> >>> +}
> >>> +
> >>> +static struct audm2m_q_data *get_q_data(struct audm2m_ctx *ctx,
> >>> +                                     enum v4l2_buf_type type)
> >>> +{
> >>> +     if (type =3D=3D V4L2_BUF_TYPE_AUDIO_OUTPUT)
> >>> +             return &ctx->q_data[V4L2_M2M_SRC];
> >>> +     return &ctx->q_data[V4L2_M2M_DST];
> >>> +}
> >>> +
> >>> +static const char *type_name(enum v4l2_buf_type type)
> >>> +{
> >>> +     if (type =3D=3D V4L2_BUF_TYPE_AUDIO_OUTPUT)
> >>> +             return "Output";
> >>> +     return "Capture";
> >>> +}
> >>> +
> >>> +/*
> >>> + * mem2mem callbacks
> >>> + */
> >>> +
> >>> +/*
> >>> + * device_run() - prepares and starts the device
> >>> + */
> >>> +static void device_run(void *priv)
> >>> +{
> >>> +     struct audm2m_ctx *ctx =3D priv;
> >>> +     struct audm2m_dev *audm2m_dev;
> >>> +     struct vb2_v4l2_buffer *src_buf, *dst_buf;
> >>> +     struct audm2m_q_data *q_data_src, *q_data_dst;
> >>> +     int src_size, dst_size =3D 0;
> >>> +     short *src_addr, *dst_addr;
> >>> +     int i;
> >>> +
> >>> +     audm2m_dev =3D ctx->dev;
> >>> +
> >>> +     q_data_src =3D get_q_data(ctx, V4L2_BUF_TYPE_AUDIO_OUTPUT);
> >>> +     if (!q_data_src)
> >>> +             return;
> >>> +
> >>> +     q_data_dst =3D get_q_data(ctx, V4L2_BUF_TYPE_AUDIO_CAPTURE);
> >>> +     if (!q_data_dst)
> >>> +             return;
> >>> +
> >>> +     src_buf =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> >>> +     dst_buf =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> >>> +     src_buf->sequence =3D q_data_src->sequence++;
> >>> +     dst_buf->sequence =3D q_data_dst->sequence++;
> >>> +     v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
> >>> +
> >>> +     /* Process the conversion */
> >>> +     src_size =3D vb2_get_plane_payload(&src_buf->vb2_buf, 0);
> >>> +
> >>> +     src_addr =3D vb2_plane_vaddr(&src_buf->vb2_buf, 0);
> >>> +     dst_addr =3D vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
> >>> +
> >>> +     if (q_data_src->rate =3D=3D q_data_dst->rate) {
> >>> +             memcpy(dst_addr, src_addr, src_size);
> >>> +             dst_size =3D src_size;
> >>> +     } else if (q_data_src->rate =3D=3D 2 * q_data_dst->rate) {
> >>> +             /* 8k to 16k */
> >>> +             for (i =3D 0; i < src_size / 2; i++) {
> >>> +                     *dst_addr++ =3D *src_addr++;
> >>> +                     src_addr++;
> >>> +             }
> >>> +
> >>> +             dst_size =3D src_size / 2;
> >>> +     } else if (q_data_src->rate * 2 =3D=3D q_data_dst->rate) {
> >>> +             /* 16k to 8k */
> >>> +             for (i =3D 0; i < src_size / 2; i++) {
> >>> +                     *dst_addr++ =3D *src_addr;
> >>> +                     *dst_addr++ =3D *src_addr++;
> >>> +             }
> >>> +
> >>> +             dst_size =3D src_size * 2;
> >>> +     }
> >>> +
> >>> +     vb2_set_plane_payload(&dst_buf->vb2_buf, 0, dst_size);
> >>> +
> >>> +     src_buf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> >>> +     dst_buf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> >>> +
> >>> +     v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
> >>> +     v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
> >>> +     v4l2_m2m_job_finish(audm2m_dev->m2m_dev, ctx->fh.m2m_ctx);
> >>> +}
> >>> +
> >>> +static int audm2m_querycap(struct file *file, void *priv,
> >>> +                        struct v4l2_capability *cap)
> >>> +{
> >>> +     strscpy(cap->driver, MEM2MEM_NAME, sizeof(cap->driver));
> >>> +     strscpy(cap->card, MEM2MEM_NAME, sizeof(cap->card));
> >>> +     snprintf(cap->bus_info, sizeof(cap->bus_info),
> >>> +              "platform:%s", MEM2MEM_NAME);
> >>
> >> You can drop this bus_info line, it's filled in for you.
> >
> > I see there is a warning from v4l2-compliance test if this line is remo=
ved.
> >
> > warn: v4l2-compliance.cpp(676): media bus_info 'platform:vim2m-audio'
> > differs from V4L2 bus_info 'platform:vim2m-audio.0'
>
> You should also drop the line filling in the bus_info in the media device=
:
>
> <snip>
>
>
> >>> +static int audm2m_probe(struct platform_device *pdev)
> >>> +{
>
> <snip>
>
> >>> +#ifdef CONFIG_MEDIA_CONTROLLER
> >>> +     dev->mdev.dev =3D &pdev->dev;
> >>> +     strscpy(dev->mdev.model, MEM2MEM_NAME, sizeof(dev->mdev.model))=
;
> >>> +     snprintf(dev->mdev.bus_info, sizeof(dev->mdev.bus_info),
> >>> +              "platform:%s", MEM2MEM_NAME);
>
> Drop this line.
>
> >>> +     media_device_init(&dev->mdev);
>
> This function will fill it in automatically as well, and with the same
> name as querycap.
>

Got it. thanks!

Best regards
Shengjiu Wang

> Regards,
>
>         Hans
>
> >>> +     dev->mdev.ops =3D &audm2m_media_ops;
> >>> +     dev->v4l2_dev.mdev =3D &dev->mdev;
> >>> +#endif
> >>> +
> >>> +     ret =3D video_register_device(vfd, VFL_TYPE_AUDIO, 0);
> >>> +     if (ret) {
> >>> +             v4l2_err(&dev->v4l2_dev, "Failed to register video devi=
ce\n");
> >>> +             goto error_m2m;
> >>> +     }
> >>> +
> >>> +#ifdef CONFIG_MEDIA_CONTROLLER
> >>> +     ret =3D v4l2_m2m_register_media_controller(dev->m2m_dev, vfd,
> >>> +                                              MEDIA_ENT_F_PROC_AUDIO=
_RESAMPLER);
> >>> +     if (ret) {
> >>> +             v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem media =
controller\n");
> >>> +             goto error_v4l2;
> >>> +     }
> >>> +
> >>> +     ret =3D media_device_register(&dev->mdev);
> >>> +     if (ret) {
> >>> +             v4l2_err(&dev->v4l2_dev, "Failed to register mem2mem me=
dia device\n");
> >>> +             goto error_m2m_mc;
> >>> +     }
> >>> +#endif
> >>> +
> >>> +     v4l2_info(&dev->v4l2_dev,
> >>> +               "Device registered as /dev/v4l-audio%d\n", vfd->num);
> >>> +
> >>> +     return 0;
> >>> +
> >>> +#ifdef CONFIG_MEDIA_CONTROLLER
> >>> +error_m2m_mc:
> >>> +     v4l2_m2m_unregister_media_controller(dev->m2m_dev);
> >>> +#endif
> >>> +error_v4l2:
> >>> +     video_unregister_device(&dev->vfd);
> >>> +     /* audm2m_device_release called by video_unregister_device to r=
elease various objects */
> >>> +     return ret;
> >>> +error_m2m:
> >>> +     v4l2_m2m_release(dev->m2m_dev);
> >>> +error_dev:
> >>> +     v4l2_device_unregister(&dev->v4l2_dev);
> >>> +error_free:
> >>> +     kfree(dev);
> >>> +
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +static void audm2m_remove(struct platform_device *pdev)
> >>> +{
> >>> +     struct audm2m_dev *dev =3D platform_get_drvdata(pdev);
> >>> +
> >>> +     v4l2_info(&dev->v4l2_dev, "Removing " MEM2MEM_NAME);
> >>> +
> >>> +#ifdef CONFIG_MEDIA_CONTROLLER
> >>> +     media_device_unregister(&dev->mdev);
> >>> +     v4l2_m2m_unregister_media_controller(dev->m2m_dev);
> >>> +#endif
> >>> +     video_unregister_device(&dev->vfd);
> >>> +}
> >>> +
> >>> +static struct platform_driver audm2m_pdrv =3D {
> >>> +     .probe          =3D audm2m_probe,
> >>> +     .remove_new     =3D audm2m_remove,
> >>> +     .driver         =3D {
> >>> +             .name   =3D MEM2MEM_NAME,
> >>> +     },
> >>> +};
> >>> +
> >>> +static void __exit audm2m_exit(void)
> >>> +{
> >>> +     platform_driver_unregister(&audm2m_pdrv);
> >>> +     platform_device_unregister(&audm2m_pdev);
> >>> +}
> >>> +
> >>> +static int __init audm2m_init(void)
> >>> +{
> >>> +     int ret;
> >>> +
> >>> +     ret =3D platform_device_register(&audm2m_pdev);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     ret =3D platform_driver_register(&audm2m_pdrv);
> >>> +     if (ret)
> >>> +             platform_device_unregister(&audm2m_pdev);
> >>> +
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +module_init(audm2m_init);
> >>> +module_exit(audm2m_exit);
> >>
> >> Regards,
> >>
> >>         Hans
>

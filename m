Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5815076C6A2
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 09:21:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 907453E7;
	Wed,  2 Aug 2023 09:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 907453E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690960886;
	bh=Acq1R2y+a32y4uBbeoFhRbkkjpukDFUGxU1Um6o59Qk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pK9PgNq19keUJn6qO5qnb4GDWCNH8OgWl1rZI8xy2h/vOYJ0qvWkfgo51V7QdO7LV
	 AUNNBCr4FF0MURrgVIuITa8uL/kXO0gux8Lts0smA5BcIx5i37I+e7tLDx+kqo/Spw
	 2mjzyT8nTxNhqvsa+7e8TuuLyEjDblxjb0pE/i9M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22745F80425; Wed,  2 Aug 2023 09:20:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10FE6F80163;
	Wed,  2 Aug 2023 09:20:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86DA7F801D5; Wed,  2 Aug 2023 09:20:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 439BBF80087
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 09:19:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 439BBF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=ETtEoNZv
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-63d03d3cac6so32774806d6.2
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 00:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690960774; x=1691565574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbMvUxwH+/+y3la1xiXvJTcsHrArNwK80KsvHS3wgHI=;
        b=ETtEoNZvnjIBRiuHg18aaJj9lWN9itCP7KatlxIPWQ4BVkrWVd9Hs3OVR7KiXBvXZX
         ELat7kx0R40ZAqmd+vw5l6NwvIegkuEjf5hg3gs/22hy2rQU7GSOmOUpCyC1VTOI4lTe
         i8uG8m56winr/X6ogtu71//Sxua0RgEaI1f0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690960774; x=1691565574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbMvUxwH+/+y3la1xiXvJTcsHrArNwK80KsvHS3wgHI=;
        b=caAQ+f9pLtsoT2BNuBrhAOwAc+Vodr4lYs+iGuhj6zbv3OSeX2pgC/f/b6AkP1cUwD
         YTCJ4ZMLLmVi0wjPI98jCgvptOhJJqObxNStcPZ05xcHaJuducc8wLlzddPS8bbp1/ep
         ynS2qqaqs+i7mYsJxjHsnFvlW4yoRn3Q4zCASF+tU1edvb79dzyaObpREwj2Rf7RHgee
         KpRmuVQpeo8sC5yOSv4GkODmm0WIg3TOSyx4PTQyvWJnYMzKZMo8Aa/eFjEiDUQzi4ok
         rCmqQa3nL/EuyZmjrX1uK5N8DtLDguP+Ufgvl7o4Y7kTTTjyAH1vhEKgdl2tZya/YP3W
         wuAA==
X-Gm-Message-State: ABy/qLYUGkCy95nU94hfxqbSHDqAc39uRI6KiFFGxxOUZnZyaw7TmHTm
	/imCG1tak1oEXl/e5u36iNtLgW/2QxroOmxMDAEUtBqA
X-Google-Smtp-Source: 
 APBJJlF4qaoFH4Fb50D3GXkC05Aor+hbMQsvazTEMslIWoOdDaZR4q6mD90pM24BkkXfPQt45kkZ/Q==
X-Received: by 2002:a05:6214:ab4:b0:63c:ec3a:ad71 with SMTP id
 ew20-20020a0562140ab400b0063cec3aad71mr5396142qvb.11.1690960774106;
        Wed, 02 Aug 2023 00:19:34 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com.
 [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id
 d5-20020a05620a140500b0076cd2591629sm208376qkj.6.2023.08.02.00.19.32
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 00:19:33 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-4053cc10debso37335111cf.2
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 00:19:32 -0700 (PDT)
X-Received: by 2002:a05:620a:25c8:b0:768:34e2:6473 with SMTP id
 y8-20020a05620a25c800b0076834e26473mr14652022qko.73.1690960772081; Wed, 02
 Aug 2023 00:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
 <1690265540-25999-5-git-send-email-shengjiu.wang@nxp.com>
 <20230728075933.pdepqspznenazs5f@chromium.org>
 <CAA+D8APU-F93JH539cUYDJ83PeMQwyfNV1kF7iGSmZrsdSeiUg@mail.gmail.com>
In-Reply-To: 
 <CAA+D8APU-F93JH539cUYDJ83PeMQwyfNV1kF7iGSmZrsdSeiUg@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 2 Aug 2023 16:19:15 +0900
X-Gmail-Original-Message-ID: 
 <CAAFQd5AD9U8F0DzLLGMVE6EiVPiNRd5v5fLCcvGputSBmLc-0g@mail.gmail.com>
Message-ID: 
 <CAAFQd5AD9U8F0DzLLGMVE6EiVPiNRd5v5fLCcvGputSBmLc-0g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/7] media: v4l2: Add audio capture and output
 support
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, hverkuil@xs4all.nl,
 sakari.ailus@iki.fi,
	m.szyprowski@samsung.com, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: DBMDFSVU3PZVF5TDO7PLHL2RLZCDFNGD
X-Message-ID-Hash: DBMDFSVU3PZVF5TDO7PLHL2RLZCDFNGD
X-MailFrom: tfiga@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DBMDFSVU3PZVF5TDO7PLHL2RLZCDFNGD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 1, 2023 at 6:47=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.c=
om> wrote:
>
> On Fri, Jul 28, 2023 at 3:59=E2=80=AFPM Tomasz Figa <tfiga@chromium.org> =
wrote:
> >
> > Hi Shengjiu,
> >
> > On Tue, Jul 25, 2023 at 02:12:17PM +0800, Shengjiu Wang wrote:
> > > Audio signal processing has the requirement for memory to
> > > memory similar as Video.
> > >
> > > This patch is to add this support in v4l2 framework, defined
> > > new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> > > V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> > > for audio case usage.
> > >
> > > The created audio device is named "/dev/audioX".
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  .../media/common/videobuf2/videobuf2-v4l2.c   |  4 ++
> > >  drivers/media/v4l2-core/v4l2-dev.c            | 17 ++++++
> > >  drivers/media/v4l2-core/v4l2-ioctl.c          | 52 +++++++++++++++++=
++
> > >  include/media/v4l2-dev.h                      |  2 +
> > >  include/media/v4l2-ioctl.h                    | 34 ++++++++++++
> > >  include/uapi/linux/videodev2.h                | 19 +++++++
> > >  6 files changed, 128 insertions(+)
> > >
> >
> > Thanks for the patch! Please check my comments inline.
>
> Thanks for reviewing.
>
> Sorry for sending again for using the plain text mode.
>
> >
> > > diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/driver=
s/media/common/videobuf2/videobuf2-v4l2.c
> > > index c7a54d82a55e..12f2be2773a2 100644
> > > --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > > +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > > @@ -785,6 +785,10 @@ int vb2_create_bufs(struct vb2_queue *q, struct =
v4l2_create_buffers *create)
> > >       case V4L2_BUF_TYPE_META_OUTPUT:
> > >               requested_sizes[0] =3D f->fmt.meta.buffersize;
> > >               break;
> > > +     case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> > > +     case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> > > +             requested_sizes[0] =3D f->fmt.audio.buffersize;
> > > +             break;
> > >       default:
> > >               return -EINVAL;
> > >       }
> > > diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-=
core/v4l2-dev.c
> > > index f81279492682..67484f4c6eaf 100644
> > > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > > @@ -553,6 +553,7 @@ static void determine_valid_ioctls(struct video_d=
evice *vdev)
> > >       bool is_tch =3D vdev->vfl_type =3D=3D VFL_TYPE_TOUCH;
> > >       bool is_meta =3D vdev->vfl_type =3D=3D VFL_TYPE_VIDEO &&
> > >                      (vdev->device_caps & meta_caps);
> > > +     bool is_audio =3D vdev->vfl_type =3D=3D VFL_TYPE_AUDIO;
> > >       bool is_rx =3D vdev->vfl_dir !=3D VFL_DIR_TX;
> > >       bool is_tx =3D vdev->vfl_dir !=3D VFL_DIR_RX;
> > >       bool is_io_mc =3D vdev->device_caps & V4L2_CAP_IO_MC;
> > > @@ -664,6 +665,19 @@ static void determine_valid_ioctls(struct video_=
device *vdev)
> > >               SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_meta_ou=
t);
> > >               SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_met=
a_out);
> > >       }
> > > +     if (is_audio && is_rx) {
> > > +             /* audio capture specific ioctls */
> > > +             SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_a=
udio_cap);
> > > +             SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_audio_c=
ap);
> > > +             SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_audio_c=
ap);
> > > +             SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_aud=
io_cap);
> > > +     } else if (is_audio && is_tx) {
> > > +             /* audio output specific ioctls */
> > > +             SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_a=
udio_out);
> > > +             SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_audio_o=
ut);
> > > +             SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_audio_o=
ut);
> > > +             SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_aud=
io_out);
> > > +     }
> > >       if (is_vbi) {
> > >               /* vbi specific ioctls */
> > >               if ((is_rx && (ops->vidioc_g_fmt_vbi_cap ||
> > > @@ -927,6 +941,9 @@ int __video_register_device(struct video_device *=
vdev,
> > >       case VFL_TYPE_TOUCH:
> > >               name_base =3D "v4l-touch";
> > >               break;
> > > +     case VFL_TYPE_AUDIO:
> > > +             name_base =3D "audio";
> >
> > I think it was mentioned before that "audio" could be confusing. Wasn't
> > there actually some other kind of /dev/audio device long ago?
> >
> > Seems like for touch, "v4l-touch" was introduced. Maybe it would also
> > make sense to call it "v4l-audio" for audio?
>
> Ok,  will change to use "v4l-audio".
>
> >
> > > +             break;
> > >       default:
> > >               pr_err("%s called with unknown type: %d\n",
> > >                      __func__, type);
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l=
2-core/v4l2-ioctl.c
> > > index 01ba27f2ef87..aa9d872bba8d 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -188,6 +188,8 @@ const char *v4l2_type_names[] =3D {
> > >       [V4L2_BUF_TYPE_SDR_OUTPUT]         =3D "sdr-out",
> > >       [V4L2_BUF_TYPE_META_CAPTURE]       =3D "meta-cap",
> > >       [V4L2_BUF_TYPE_META_OUTPUT]        =3D "meta-out",
> > > +     [V4L2_BUF_TYPE_AUDIO_CAPTURE]      =3D "audio-cap",
> > > +     [V4L2_BUF_TYPE_AUDIO_OUTPUT]       =3D "audio-out",
> > >  };
> > >  EXPORT_SYMBOL(v4l2_type_names);
> > >
> > > @@ -276,6 +278,7 @@ static void v4l_print_format(const void *arg, boo=
l write_only)
> > >       const struct v4l2_sliced_vbi_format *sliced;
> > >       const struct v4l2_window *win;
> > >       const struct v4l2_meta_format *meta;
> > > +     const struct v4l2_audio_format *audio;
> > >       u32 pixelformat;
> > >       u32 planes;
> > >       unsigned i;
> > > @@ -346,6 +349,12 @@ static void v4l_print_format(const void *arg, bo=
ol write_only)
> > >               pr_cont(", dataformat=3D%p4cc, buffersize=3D%u\n",
> > >                       &pixelformat, meta->buffersize);
> > >               break;
> > > +     case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> > > +     case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> > > +             audio =3D &p->fmt.audio;
> > > +             pr_cont(", rate=3D%u, format=3D%u, channels=3D%u, buffe=
rsize=3D%u\n",
> > > +                     audio->rate, audio->format, audio->channels, au=
dio->buffersize);
> > > +             break;
> > >       }
> > >  }
> > >
> > > @@ -927,6 +936,7 @@ static int check_fmt(struct file *file, enum v4l2=
_buf_type type)
> > >       bool is_tch =3D vfd->vfl_type =3D=3D VFL_TYPE_TOUCH;
> > >       bool is_meta =3D vfd->vfl_type =3D=3D VFL_TYPE_VIDEO &&
> > >                      (vfd->device_caps & meta_caps);
> > > +     bool is_audio =3D vfd->vfl_type =3D=3D VFL_TYPE_AUDIO;
> > >       bool is_rx =3D vfd->vfl_dir !=3D VFL_DIR_TX;
> > >       bool is_tx =3D vfd->vfl_dir !=3D VFL_DIR_RX;
> > >
> > > @@ -992,6 +1002,14 @@ static int check_fmt(struct file *file, enum v4=
l2_buf_type type)
> > >               if (is_meta && is_tx && ops->vidioc_g_fmt_meta_out)
> > >                       return 0;
> > >               break;
> > > +     case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> > > +             if (is_audio && is_rx && ops->vidioc_g_fmt_audio_cap)
> > > +                     return 0;
> > > +             break;
> > > +     case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> > > +             if (is_audio && is_tx && ops->vidioc_g_fmt_audio_out)
> > > +                     return 0;
> > > +             break;
> > >       default:
> > >               break;
> > >       }
> > > @@ -1594,6 +1612,16 @@ static int v4l_enum_fmt(const struct v4l2_ioct=
l_ops *ops,
> > >                       break;
> > >               ret =3D ops->vidioc_enum_fmt_meta_out(file, fh, arg);
> > >               break;
> > > +     case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> > > +             if (unlikely(!ops->vidioc_enum_fmt_audio_cap))
> > > +                     break;
> > > +             ret =3D ops->vidioc_enum_fmt_audio_cap(file, fh, arg);
> > > +             break;
> > > +     case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> > > +             if (unlikely(!ops->vidioc_enum_fmt_audio_out))
> > > +                     break;
> > > +             ret =3D ops->vidioc_enum_fmt_audio_out(file, fh, arg);
> > > +             break;
> > >       }
> > >       if (ret =3D=3D 0)
> > >               v4l_fill_fmtdesc(p);
> > > @@ -1670,6 +1698,10 @@ static int v4l_g_fmt(const struct v4l2_ioctl_o=
ps *ops,
> > >               return ops->vidioc_g_fmt_meta_cap(file, fh, arg);
> > >       case V4L2_BUF_TYPE_META_OUTPUT:
> > >               return ops->vidioc_g_fmt_meta_out(file, fh, arg);
> > > +     case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> > > +             return ops->vidioc_g_fmt_audio_cap(file, fh, arg);
> > > +     case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> > > +             return ops->vidioc_g_fmt_audio_out(file, fh, arg);
> > >       }
> > >       return -EINVAL;
> > >  }
> > > @@ -1781,6 +1813,16 @@ static int v4l_s_fmt(const struct v4l2_ioctl_o=
ps *ops,
> > >                       break;
> > >               memset_after(p, 0, fmt.meta);
> > >               return ops->vidioc_s_fmt_meta_out(file, fh, arg);
> > > +     case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> > > +             if (unlikely(!ops->vidioc_s_fmt_audio_cap))
> > > +                     break;
> > > +             memset_after(p, 0, fmt.audio);
> > > +             return ops->vidioc_s_fmt_audio_cap(file, fh, arg);
> > > +     case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> > > +             if (unlikely(!ops->vidioc_s_fmt_audio_out))
> > > +                     break;
> > > +             memset_after(p, 0, fmt.audio);
> > > +             return ops->vidioc_s_fmt_audio_out(file, fh, arg);
> > >       }
> > >       return -EINVAL;
> > >  }
> > > @@ -1889,6 +1931,16 @@ static int v4l_try_fmt(const struct v4l2_ioctl=
_ops *ops,
> > >                       break;
> > >               memset_after(p, 0, fmt.meta);
> > >               return ops->vidioc_try_fmt_meta_out(file, fh, arg);
> > > +     case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> > > +             if (unlikely(!ops->vidioc_try_fmt_audio_cap))
> > > +                     break;
> > > +             memset_after(p, 0, fmt.audio);
> > > +             return ops->vidioc_try_fmt_audio_cap(file, fh, arg);
> > > +     case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> > > +             if (unlikely(!ops->vidioc_try_fmt_audio_out))
> > > +                     break;
> > > +             memset_after(p, 0, fmt.audio);
> > > +             return ops->vidioc_try_fmt_audio_out(file, fh, arg);
> > >       }
> > >       return -EINVAL;
> > >  }
> > > diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> > > index e0a13505f88d..0924e6d1dab1 100644
> > > --- a/include/media/v4l2-dev.h
> > > +++ b/include/media/v4l2-dev.h
> > > @@ -30,6 +30,7 @@
> > >   * @VFL_TYPE_SUBDEV: for V4L2 subdevices
> > >   * @VFL_TYPE_SDR:    for Software Defined Radio tuners
> > >   * @VFL_TYPE_TOUCH:  for touch sensors
> > > + * @VFL_TYPE_AUDIO:  for audio input/output devices
> > >   * @VFL_TYPE_MAX:    number of VFL types, must always be last in the=
 enum
> > >   */
> > >  enum vfl_devnode_type {
> > > @@ -39,6 +40,7 @@ enum vfl_devnode_type {
> > >       VFL_TYPE_SUBDEV,
> > >       VFL_TYPE_SDR,
> > >       VFL_TYPE_TOUCH,
> > > +     VFL_TYPE_AUDIO,
> > >       VFL_TYPE_MAX /* Shall be the last one */
> > >  };
> > >
> > > diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> > > index edb733f21604..f840cf740ce1 100644
> > > --- a/include/media/v4l2-ioctl.h
> > > +++ b/include/media/v4l2-ioctl.h
> > > @@ -45,6 +45,12 @@ struct v4l2_fh;
> > >   * @vidioc_enum_fmt_meta_out: pointer to the function that implement=
s
> > >   *   :ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
> > >   *   for metadata output
> > > + * @vidioc_enum_fmt_audio_cap: pointer to the function that implemen=
ts
> > > + *   :ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
> > > + *   for audio capture
> > > + * @vidioc_enum_fmt_audio_out: pointer to the function that implemen=
ts
> > > + *   :ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
> > > + *   for audio output
> > >   * @vidioc_g_fmt_vid_cap: pointer to the function that implements
> > >   *   :ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video captur=
e
> > >   *   in single plane mode
> > > @@ -79,6 +85,10 @@ struct v4l2_fh;
> > >   *   :ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for metadata cap=
ture
> > >   * @vidioc_g_fmt_meta_out: pointer to the function that implements
> > >   *   :ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for metadata out=
put
> > > + * @vidioc_g_fmt_audio_cap: pointer to the function that implements
> > > + *   :ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for audio captur=
e
> > > + * @vidioc_g_fmt_audio_out: pointer to the function that implements
> > > + *   :ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for audio output
> > >   * @vidioc_s_fmt_vid_cap: pointer to the function that implements
> > >   *   :ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video captur=
e
> > >   *   in single plane mode
> > > @@ -113,6 +123,10 @@ struct v4l2_fh;
> > >   *   :ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for metadata cap=
ture
> > >   * @vidioc_s_fmt_meta_out: pointer to the function that implements
> > >   *   :ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for metadata out=
put
> > > + * @vidioc_s_fmt_audio_cap: pointer to the function that implements
> > > + *   :ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for audio captur=
e
> > > + * @vidioc_s_fmt_audio_out: pointer to the function that implements
> > > + *   :ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for audio output
> > >   * @vidioc_try_fmt_vid_cap: pointer to the function that implements
> > >   *   :ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video capt=
ure
> > >   *   in single plane mode
> > > @@ -149,6 +163,10 @@ struct v4l2_fh;
> > >   *   :ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for metadata c=
apture
> > >   * @vidioc_try_fmt_meta_out: pointer to the function that implements
> > >   *   :ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for metadata o=
utput
> > > + * @vidioc_try_fmt_audio_cap: pointer to the function that implement=
s
> > > + *   :ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for audio capt=
ure
> > > + * @vidioc_try_fmt_audio_out: pointer to the function that implement=
s
> > > + *   :ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for audio outp=
ut
> > >   * @vidioc_reqbufs: pointer to the function that implements
> > >   *   :ref:`VIDIOC_REQBUFS <vidioc_reqbufs>` ioctl
> > >   * @vidioc_querybuf: pointer to the function that implements
> > > @@ -315,6 +333,10 @@ struct v4l2_ioctl_ops {
> > >                                       struct v4l2_fmtdesc *f);
> > >       int (*vidioc_enum_fmt_meta_out)(struct file *file, void *fh,
> > >                                       struct v4l2_fmtdesc *f);
> > > +     int (*vidioc_enum_fmt_audio_cap)(struct file *file, void *fh,
> > > +                                      struct v4l2_fmtdesc *f);
> > > +     int (*vidioc_enum_fmt_audio_out)(struct file *file, void *fh,
> > > +                                      struct v4l2_fmtdesc *f);
> > >
> > >       /* VIDIOC_G_FMT handlers */
> > >       int (*vidioc_g_fmt_vid_cap)(struct file *file, void *fh,
> > > @@ -345,6 +367,10 @@ struct v4l2_ioctl_ops {
> > >                                    struct v4l2_format *f);
> > >       int (*vidioc_g_fmt_meta_out)(struct file *file, void *fh,
> > >                                    struct v4l2_format *f);
> > > +     int (*vidioc_g_fmt_audio_cap)(struct file *file, void *fh,
> > > +                                   struct v4l2_format *f);
> > > +     int (*vidioc_g_fmt_audio_out)(struct file *file, void *fh,
> > > +                                   struct v4l2_format *f);
> > >
> > >       /* VIDIOC_S_FMT handlers */
> > >       int (*vidioc_s_fmt_vid_cap)(struct file *file, void *fh,
> > > @@ -375,6 +401,10 @@ struct v4l2_ioctl_ops {
> > >                                    struct v4l2_format *f);
> > >       int (*vidioc_s_fmt_meta_out)(struct file *file, void *fh,
> > >                                    struct v4l2_format *f);
> > > +     int (*vidioc_s_fmt_audio_cap)(struct file *file, void *fh,
> > > +                                   struct v4l2_format *f);
> > > +     int (*vidioc_s_fmt_audio_out)(struct file *file, void *fh,
> > > +                                   struct v4l2_format *f);
> > >
> > >       /* VIDIOC_TRY_FMT handlers */
> > >       int (*vidioc_try_fmt_vid_cap)(struct file *file, void *fh,
> > > @@ -405,6 +435,10 @@ struct v4l2_ioctl_ops {
> > >                                      struct v4l2_format *f);
> > >       int (*vidioc_try_fmt_meta_out)(struct file *file, void *fh,
> > >                                      struct v4l2_format *f);
> > > +     int (*vidioc_try_fmt_audio_cap)(struct file *file, void *fh,
> > > +                                     struct v4l2_format *f);
> > > +     int (*vidioc_try_fmt_audio_out)(struct file *file, void *fh,
> > > +                                     struct v4l2_format *f);
> > >
> > >       /* Buffer handlers */
> > >       int (*vidioc_reqbufs)(struct file *file, void *fh,
> > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vide=
odev2.h
> > > index 3af6a82d0cad..e5051410928a 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -153,6 +153,8 @@ enum v4l2_buf_type {
> > >       V4L2_BUF_TYPE_SDR_OUTPUT           =3D 12,
> > >       V4L2_BUF_TYPE_META_CAPTURE         =3D 13,
> > >       V4L2_BUF_TYPE_META_OUTPUT          =3D 14,
> > > +     V4L2_BUF_TYPE_AUDIO_CAPTURE        =3D 15,
> > > +     V4L2_BUF_TYPE_AUDIO_OUTPUT         =3D 16,
> > >       /* Deprecated, do not use */
> > >       V4L2_BUF_TYPE_PRIVATE              =3D 0x80,
> > >  };
> > > @@ -169,6 +171,7 @@ enum v4l2_buf_type {
> > >        || (type) =3D=3D V4L2_BUF_TYPE_VBI_OUTPUT                  \
> > >        || (type) =3D=3D V4L2_BUF_TYPE_SLICED_VBI_OUTPUT           \
> > >        || (type) =3D=3D V4L2_BUF_TYPE_SDR_OUTPUT                  \
> > > +      || (type) =3D=3D V4L2_BUF_TYPE_AUDIO_OUTPUT                \
> > >        || (type) =3D=3D V4L2_BUF_TYPE_META_OUTPUT)
> > >
> > >  #define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
> > > @@ -2415,6 +2418,20 @@ struct v4l2_meta_format {
> > >       __u32                           buffersize;
> > >  } __attribute__ ((packed));
> > >
> > > +/**
> > > + * struct v4l2_audio_format - audio data format definition
> > > + * @rate:            sample rate
> > > + * @format:          sample format
> > > + * @channels:                channel numbers
> > > + * @buffersize:              maximum size in bytes required for data
> > > + */
> > > +struct v4l2_audio_format {
> > > +     __u32                           rate;
> > > +     __u32                           format;
> >
> > What are the values for the rate and format fields? Since they are part
> > of the UAPI, they need to be defined.
> >
>
> The range for sample rate is [5512, 768000].
> The format is defined in include/uapi/sound/asound.h,  they are
> SNDRV_PCM_FORMAT_S8, SNDRV_PCM_FORMAT_U8, ...
>
> Where should I put these info?
>

I see, so those are standard definitions of the sound subsystem. I
think we should refer to the right header and/or data types in the
kerneldoc comment for the struct. We also need to provide the sphinx
documentation for the new device type and extend the description of
relevant ioctls (e.g. VIDIOC_S_FMT) that accept the new structs. I.e.
the v4l2_format struct used by VIDIOC_S_FMT is documented in

https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-g-fmt=
.html?highlight=3Dg_fmt#c.V4L.v4l2_format

and there is documentation for each of the union members, like
v4l2_pix_format_mplane that is commonly used for video data:

https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-v4l2-=
mplane.html#c.v4l2_pix_format_mplane

We'll need a similar one for the new v4l2_audio_format.

Best regards,
Tomasz

> Best regards
> Wang shengjiu
>
> > Best regards,
> > Tomasz
> >
> > > +     __u32                           channels;
> > > +     __u32                           buffersize;
> > > +} __attribute__ ((packed));
> > > +
> > >  /**
> > >   * struct v4l2_format - stream data format
> > >   * @type:    enum v4l2_buf_type; type of the data stream
> > > @@ -2423,6 +2440,7 @@ struct v4l2_meta_format {
> > >   * @win:     definition of an overlaid image
> > >   * @vbi:     raw VBI capture or output parameters
> > >   * @sliced:  sliced VBI capture or output parameters
> > > + * @audio:   definition of an audio format
> > >   * @raw_data:        placeholder for future extensions and custom fo=
rmats
> > >   * @fmt:     union of @pix, @pix_mp, @win, @vbi, @sliced, @sdr, @met=
a
> > >   *           and @raw_data
> > > @@ -2437,6 +2455,7 @@ struct v4l2_format {
> > >               struct v4l2_sliced_vbi_format   sliced;  /* V4L2_BUF_TY=
PE_SLICED_VBI_CAPTURE */
> > >               struct v4l2_sdr_format          sdr;     /* V4L2_BUF_TY=
PE_SDR_CAPTURE */
> > >               struct v4l2_meta_format         meta;    /* V4L2_BUF_TY=
PE_META_CAPTURE */
> > > +             struct v4l2_audio_format        audio;   /* V4L2_BUF_TY=
PE_AUDIO_CAPTURE */
> > >               __u8    raw_data[200];                   /* user-define=
d */
> > >       } fmt;
> > >  };
> > > --
> > > 2.34.1
> > >

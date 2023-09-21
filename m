Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D45D7A91D6
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 08:57:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D5FAA4A;
	Thu, 21 Sep 2023 08:56:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D5FAA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695279434;
	bh=+pXEIhjyEsgvQMa16xxFenvysqGGQBAyA3+oZk90Uik=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dC2hdEEvJIyG30hxZ4GEcjneDokLn5cPxFMI4AGsrlQZH+4oOWs4XVnsmQwK/Advq
	 EuIZsqmPbjOnrSuskKSaHtABYcVveJZI/WmQosrlwH+XdhVH6TmzksNCzQ9V6QSft/
	 e4SJ956UqndR/CCyCI13PHwEvnoP7EV3tHNrpaas=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63E7BF80558; Thu, 21 Sep 2023 08:56:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8D45F801F5;
	Thu, 21 Sep 2023 08:56:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 453BDF8025A; Thu, 21 Sep 2023 08:55:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9E0CF800AA
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 08:55:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9E0CF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BslbIUoH
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-26934bc3059so1201130a91.1
        for <alsa-devel@alsa-project.org>;
 Wed, 20 Sep 2023 23:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695279348; x=1695884148;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bVL+jGs6sqP7VG1dEZazWMAPQBBD+mX9InFJhTfc4M=;
        b=BslbIUoHWGvU6Fil1ANVjYJepbQRupafk3nDb/U85+37cFw6XyFGMAwpOMBgjuXbn6
         ZUgnhgW0TSq2/U69DAgvZfa7g2rnaXnKjfXK50V2p/AcSXyOwcM0N71L3uiu7dlSA5uK
         VOp0RG/Kq1tBu+IzeOnZu3Mbxt5PJAq5/fntbyVIHS/NtmSTefsM5WZjjYB/VHwg7vqm
         wCqp1wh/0+pcAyUlbZugE2Z9rVhjNXAs6zQ2VuoClSCpMgjVq2aANX87uqsHe52Qp5Q+
         +z7d5jAdwqo885QBEvHOQRV/BRU3X4zRUmgv0GMPqaP5Q2JUBHAP3uTweYevJN1uCIT/
         pmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695279348; x=1695884148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bVL+jGs6sqP7VG1dEZazWMAPQBBD+mX9InFJhTfc4M=;
        b=TcPvcpRlE/gHrmLi/IGBHPDOsxDYB6i6YIgjpuklYYlFiqFjkOntO5zSuXWc9yEU9J
         Ulier2I1R6Dt85x59rh/bX7KL2Cm3lf6li7ieK/aY2zfBLyOpYE0mYehYILqiq74/RV5
         av5prAdOHs9MwvLnfJKgIKx49cEVhHs5JS/xSxBUBEg+Be/Q5TNmG3CVhCmK3OQ+hDa8
         bGyoRqHeXpchzngugfq6kGiQeCkd7plMODZvwg9VEgp2z+PA+8K5Uvik0qwJTyB/J4WE
         tcfwfujPCXEmklXIjtKfng/4a/7O8u/wwCp7jfoomKlXl7K+sF2J6qyy1McjMaRM4vKq
         haew==
X-Gm-Message-State: AOJu0YxbTlGecFYjLKYtuLmY2fo92wV4h2QbwUpvU6ePsz6GqZlU8nbs
	VYVAYVCirQi5LQWux6ty0CGIHoSNXO6cDev6GQI=
X-Google-Smtp-Source: 
 AGHT+IFVBrCouVQWwD+e2QYzdo6XT481j2Idi0aW4ihmGivrnNEgvLCRqXRTybpDG6APLo336LaCnJUTntu6YTFsRW0=
X-Received: by 2002:a17:90b:1482:b0:276:6be8:8bfe with SMTP id
 js2-20020a17090b148200b002766be88bfemr7106957pjb.23.1695279348052; Wed, 20
 Sep 2023 23:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <1695202370-24678-1-git-send-email-shengjiu.wang@nxp.com>
 <1695202370-24678-10-git-send-email-shengjiu.wang@nxp.com>
 <fbedcbf1-d925-47d6-b9fb-c9e15263c117@xs4all.nl>
In-Reply-To: <fbedcbf1-d925-47d6-b9fb-c9e15263c117@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 21 Sep 2023 14:55:36 +0800
Message-ID: 
 <CAA+D8APyNGFSry1GUv6TOW0nKYHKSwQd5bTcRNuT7cu0Xf8eUA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 09/11] media: uapi: Add
 V4L2_CID_USER_IMX_ASRC_RATIO_MOD
 control
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
Message-ID-Hash: PSACBLFQDJ7RVEQ2KQYL4S6NXHFHLNEU
X-Message-ID-Hash: PSACBLFQDJ7RVEQ2KQYL4S6NXHFHLNEU
X-MailFrom: shengjiu.wang@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PSACBLFQDJ7RVEQ2KQYL4S6NXHFHLNEU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 20, 2023 at 6:19=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 20/09/2023 11:32, Shengjiu Wang wrote:
> > The input clock and output clock may not be the accurate
> > rate as the sample rate, there is some drift, so the convert
> > ratio of i.MX ASRC module need to be changed according to
> > actual clock rate.
> >
> > Add V4L2_CID_USER_IMX_ASRC_RATIO_MOD control for user to
> > adjust the ratio.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  Documentation/userspace-api/media/v4l/control.rst | 5 +++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 1 +
> >  include/uapi/linux/v4l2-controls.h                | 1 +
> >  3 files changed, 7 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Docume=
ntation/userspace-api/media/v4l/control.rst
> > index 4463fce694b0..2bc175900a34 100644
> > --- a/Documentation/userspace-api/media/v4l/control.rst
> > +++ b/Documentation/userspace-api/media/v4l/control.rst
> > @@ -318,6 +318,11 @@ Control IDs
> >      depending on particular custom controls should check the driver na=
me
> >      and version, see :ref:`querycap`.
> >
> > +.. _v4l2-audio-imx:
> > +
> > +``V4L2_CID_USER_IMX_ASRC_RATIO_MOD``
> > +    sets the rasampler ratio modifier of i.MX asrc module.
>
> rasampler -> resampler (I think?)
>
> This doesn't document at all what the type of the control is or how to in=
terpret it.
>
> > +
> >  Applications can enumerate the available controls with the
> >  :ref:`VIDIOC_QUERYCTRL` and
> >  :ref:`VIDIOC_QUERYMENU <VIDIOC_QUERYCTRL>` ioctls, get and set a
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/=
v4l2-core/v4l2-ctrls-defs.c
> > index 8696eb1cdd61..16f66f66198c 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1242,6 +1242,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >       case V4L2_CID_COLORIMETRY_CLASS:        return "Colorimetry Contr=
ols";
> >       case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:               return "H=
DR10 Content Light Info";
> >       case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:      return "H=
DR10 Mastering Display";
> > +     case V4L2_CID_USER_IMX_ASRC_RATIO_MOD:                  return "A=
SRC RATIO MOD";
>
> Let's stay consistent with the other control names:
>
> "ASRC Ratio Modifier"
>
> But if this is a driver specific control, then this doesn't belong here.
>
> Driver specific controls are defined in the driver itself, including this
> description.
>
> Same for the control documentation: if it is driver specific, then that
> typically is documented either in a driver-specific public header, or
> possibly in driver-specific documentation (Documentation/admin-guide/medi=
a/).
>
> But is this imx specific? Wouldn't other similar devices need this?

It is imx specific.

Does this mean that I need to create a header file in include/uapi/linux
folder to put this definition?  I just hesitate if this is necessary.

There is folder Documentation/userspace-api/media/drivers/ for drivers
Should this document in this folder, not in the
Documentation/admin-guide/media/?

Best regards
Wang shengjiu
>
> >       default:
> >               return NULL;
> >       }
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4=
l2-controls.h
> > index c3604a0a3e30..b1c319906d12 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -162,6 +162,7 @@ enum v4l2_colorfx {
> >  /* The base for the imx driver controls.
> >   * We reserve 16 controls for this driver. */
> >  #define V4L2_CID_USER_IMX_BASE                       (V4L2_CID_USER_BA=
SE + 0x10b0)
> > +#define V4L2_CID_USER_IMX_ASRC_RATIO_MOD     (V4L2_CID_USER_IMX_BASE +=
 0)
> >
> >  /*
> >   * The base for the atmel isc driver controls.
>
> Regards,
>
>         Hans

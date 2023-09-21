Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6137C7A93CC
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 13:14:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07782A4E;
	Thu, 21 Sep 2023 13:13:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07782A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695294889;
	bh=F8AQTbfwT6CJSzzbjJYqZ5vvStV2pORtU0Cfex5Nmig=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PI0dvT3+1tht0bJXFiHGH48CzqLz/PTX/GIJb/F/1pm34pxOly0nBC4adkfaA6+vi
	 N2AF+y+tIkLjoHQ+DJDhq7xLJJwJ/rNNXcx5g7gWWlcy3RTJ7OaoZYMh7j8M6i5BQA
	 wndIVrQax0/++7vdfVailPDcsRC15ag8N1AxyCYE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A853F80558; Thu, 21 Sep 2023 13:13:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61AF7F801F5;
	Thu, 21 Sep 2023 13:13:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26FEDF8025A; Thu, 21 Sep 2023 13:13:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5DEA8F800AA
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 13:13:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DEA8F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aoXY1N4Z
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1c5bbb205e3so7236025ad.0
        for <alsa-devel@alsa-project.org>;
 Thu, 21 Sep 2023 04:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695294806; x=1695899606;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6Io+NqdH4bxbw7qedQ2WLW3wnG7KpfohNDHzRzQ7HQ=;
        b=aoXY1N4Z41sToQ96nlnof993cR7JSZ1/ssApE4+zgsCbFzNPX56Jgs/Bh5IPcWKPQn
         8Els2RWOUDpeVXWOZpMHFOo3w/jIebWhiVPaac/R3rgWKgxu2+qYT7fbtsZ6HR+YK49Q
         pvma4gzRN3lNOkCfqSaawj9np1q0VP2ZX0Bk91MWrwcUubitbSRVVlfW6vs5iOgoe/O/
         8StQgCxgfKqdeAEqOzZVeLiewjwmeevhmIR01+ctmcUpfOLFzTcGk7UEkWKw78wJPXbe
         yUxPs7vLYnCfIQSjo/DnTC42rTWS8QnS14IDd65ub343LJnpj3h2b/Rd03GEklV+NBjB
         avxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695294806; x=1695899606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6Io+NqdH4bxbw7qedQ2WLW3wnG7KpfohNDHzRzQ7HQ=;
        b=gOW5Xtz6eo/7ZSeI9uAvs1QZgkJg+9pMMMfcRYAz9w+m2Gw1bwMDDUJtNSx+usTkFm
         hT7HhX3XLQAW4XwmMg4V6h2kAzI3XLAMGMgBrJhidpaIDOk2+zvuM2QrrSHAG7yKoNAp
         wL4S720awZ4VIWJAMM+1sut5pF89bAEBvN7jFiKuc8kPThkGfDLw1K4BQyXREtopaPJA
         DmY5H5Ku1ARwwAtHae98b7nxPcL8M4LBFdZS78jDI3E2Dbmtx7jJoP4zBn5H3rWw14HV
         rFujenp4XAHPO/WQtIx0xUy6Y8rPnWWaup3JTGT1nAB2XHgpczulk2Om88rbXSA6Bjx9
         zMBw==
X-Gm-Message-State: AOJu0YxIr75QKIx602aw9oKJFmkylBG72Uws9guCH7J/vssfjt11tkFf
	UZzqvck0tebzCxXuaYSKpK6q4vPiszGSaXmEGVY=
X-Google-Smtp-Source: 
 AGHT+IFd83OFEN20e4ml9L8pmlvbvhS2daJ1R+Y7BWCut39c7qxVh2xC1k3KYOAJpyayzaGsCncOE3w/BFNte+w5Fc8=
X-Received: by 2002:a17:90b:390a:b0:26d:2bac:a0bb with SMTP id
 ob10-20020a17090b390a00b0026d2baca0bbmr4967326pjb.6.1695294806097; Thu, 21
 Sep 2023 04:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <1695202370-24678-1-git-send-email-shengjiu.wang@nxp.com>
 <1695202370-24678-10-git-send-email-shengjiu.wang@nxp.com>
 <fbedcbf1-d925-47d6-b9fb-c9e15263c117@xs4all.nl>
 <CAA+D8APyNGFSry1GUv6TOW0nKYHKSwQd5bTcRNuT7cu0Xf8eUA@mail.gmail.com>
 <5292ce53-643e-44f0-b2cc-cb66efee9712@xs4all.nl>
In-Reply-To: <5292ce53-643e-44f0-b2cc-cb66efee9712@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 21 Sep 2023 19:13:14 +0800
Message-ID: 
 <CAA+D8AMZN59uTRs2sOrSeVb5AGopTzurNVCTNwJOVPahfEXd+w@mail.gmail.com>
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
Message-ID-Hash: ZIPZO3MTH74EVXUHZB7H6HKUFJ56OMLJ
X-Message-ID-Hash: ZIPZO3MTH74EVXUHZB7H6HKUFJ56OMLJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZIPZO3MTH74EVXUHZB7H6HKUFJ56OMLJ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Sep 21, 2023 at 3:11=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 21/09/2023 08:55, Shengjiu Wang wrote:
> > On Wed, Sep 20, 2023 at 6:19=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.n=
l> wrote:
> >>
> >> On 20/09/2023 11:32, Shengjiu Wang wrote:
> >>> The input clock and output clock may not be the accurate
> >>> rate as the sample rate, there is some drift, so the convert
> >>> ratio of i.MX ASRC module need to be changed according to
> >>> actual clock rate.
> >>>
> >>> Add V4L2_CID_USER_IMX_ASRC_RATIO_MOD control for user to
> >>> adjust the ratio.
> >>>
> >>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>> ---
> >>>  Documentation/userspace-api/media/v4l/control.rst | 5 +++++
> >>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 1 +
> >>>  include/uapi/linux/v4l2-controls.h                | 1 +
> >>>  3 files changed, 7 insertions(+)
> >>>
> >>> diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Docu=
mentation/userspace-api/media/v4l/control.rst
> >>> index 4463fce694b0..2bc175900a34 100644
> >>> --- a/Documentation/userspace-api/media/v4l/control.rst
> >>> +++ b/Documentation/userspace-api/media/v4l/control.rst
> >>> @@ -318,6 +318,11 @@ Control IDs
> >>>      depending on particular custom controls should check the driver =
name
> >>>      and version, see :ref:`querycap`.
> >>>
> >>> +.. _v4l2-audio-imx:
> >>> +
> >>> +``V4L2_CID_USER_IMX_ASRC_RATIO_MOD``
> >>> +    sets the rasampler ratio modifier of i.MX asrc module.
> >>
> >> rasampler -> resampler (I think?)
> >>
> >> This doesn't document at all what the type of the control is or how to=
 interpret it.
> >>
> >>> +
> >>>  Applications can enumerate the available controls with the
> >>>  :ref:`VIDIOC_QUERYCTRL` and
> >>>  :ref:`VIDIOC_QUERYMENU <VIDIOC_QUERYCTRL>` ioctls, get and set a
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/medi=
a/v4l2-core/v4l2-ctrls-defs.c
> >>> index 8696eb1cdd61..16f66f66198c 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>> @@ -1242,6 +1242,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >>>       case V4L2_CID_COLORIMETRY_CLASS:        return "Colorimetry Con=
trols";
> >>>       case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:               return =
"HDR10 Content Light Info";
> >>>       case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:      return =
"HDR10 Mastering Display";
> >>> +     case V4L2_CID_USER_IMX_ASRC_RATIO_MOD:                  return =
"ASRC RATIO MOD";
> >>
> >> Let's stay consistent with the other control names:
> >>
> >> "ASRC Ratio Modifier"
> >>
> >> But if this is a driver specific control, then this doesn't belong her=
e.
> >>
> >> Driver specific controls are defined in the driver itself, including t=
his
> >> description.
> >>
> >> Same for the control documentation: if it is driver specific, then tha=
t
> >> typically is documented either in a driver-specific public header, or
> >> possibly in driver-specific documentation (Documentation/admin-guide/m=
edia/).
> >>
> >> But is this imx specific? Wouldn't other similar devices need this?
> >
> > It is imx specific.
>
> Why? I'm not opposed to this, but I wonder if you looked at datasheets of
> similar devices from other vendors: would they use something similar?

I tried to find some datasheets for other vendors, but failed to find them.
So I don't know how they implement this part.

Ratio modification on i.MX is to modify the configured ratio.
For example, the input rate is 44.1kHz,  output rate is 48kHz,
configured ratio =3D 441/480,   the ratio modification is to modify
the fractional part of (441/480) with small steps.  because the
input clock or output clock has drift in the real hardware.
The ratio modification is signed value, it is added to configured
ratio.

In our case, we have some sysfs interface for user to get the
clock from input audio device and output audio device, user
need to calculate the ratio dynamically , then configure the
modification to driver

May be other vendors has similar implementation. or make
the definition be generic is an option.

best regards
wang shengjiu

>
> And the very short description you gave in the commit log refers to input
> and output clock: how would userspace know those clock frequencies? In
> other words, what information does userspace need in order to set this
> control correctly? And is that information actually available? How would
> you use this control?
>
> I don't really understand how this is supposed to be used.
>
> >
> > Does this mean that I need to create a header file in include/uapi/linu=
x
> > folder to put this definition?  I just hesitate if this is necessary.
>
> Yes, put it there. There are some examples of this already:
>
> include/uapi/linux/aspeed-video.h
> include/uapi/linux/max2175.h
>
> >
> > There is folder Documentation/userspace-api/media/drivers/ for drivers
> > Should this document in this folder, not in the
> > Documentation/admin-guide/media/?
>
> Yes, you are correct. For the headers above, the corresponding documentat=
ion
> is in:
>
> Documentation/userspace-api/media/drivers/aspeed-video.rst
> Documentation/userspace-api/media/drivers/max2175.rst
>
> So you have some examples as reference.
>
> Frankly, what is in admin-guide and in userspace-api is a bit random, it
> probably could use a cleanup.
>
> Regards,
>
>         Hans
>
> >
> > Best regards
> > Wang shengjiu
> >>
> >>>       default:
> >>>               return NULL;
> >>>       }
> >>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/=
v4l2-controls.h
> >>> index c3604a0a3e30..b1c319906d12 100644
> >>> --- a/include/uapi/linux/v4l2-controls.h
> >>> +++ b/include/uapi/linux/v4l2-controls.h
> >>> @@ -162,6 +162,7 @@ enum v4l2_colorfx {
> >>>  /* The base for the imx driver controls.
> >>>   * We reserve 16 controls for this driver. */
> >>>  #define V4L2_CID_USER_IMX_BASE                       (V4L2_CID_USER_=
BASE + 0x10b0)
> >>> +#define V4L2_CID_USER_IMX_ASRC_RATIO_MOD     (V4L2_CID_USER_IMX_BASE=
 + 0)
> >>>
> >>>  /*
> >>>   * The base for the atmel isc driver controls.
> >>
> >> Regards,
> >>
> >>         Hans
>

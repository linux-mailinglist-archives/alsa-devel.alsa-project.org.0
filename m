Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AA77AA72D
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 04:58:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95125DF5;
	Fri, 22 Sep 2023 04:57:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95125DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695351529;
	bh=3tUBv898VIdVY1Pe9vEOCDdxofQ1Z11yD6auiHwNQDo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LI49wYXLlyqYuoGxxdQe7C8oQ4E/Zea5GjR5/Lelv8LF+gjFc0Ua6uzG0BvykFXiV
	 e6WOIALrxNBIubPH7izJJHhuasjtraK2W97UPGYLBbO1O2Nm8rM8gNU9hx/Ak7F2KG
	 HAEZY3YAk6ypVxBCraxdOhxyfFfZOKL7Y/5tvlyI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C79CFF8047D; Fri, 22 Sep 2023 04:57:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90F0CF80125;
	Fri, 22 Sep 2023 04:57:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E12FDF801F5; Fri, 22 Sep 2023 04:52:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F389F800F4
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 04:51:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F389F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=exiruIn4
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2746889aa89so1163982a91.2
        for <alsa-devel@alsa-project.org>;
 Thu, 21 Sep 2023 19:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695351104; x=1695955904;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYkrqB9uA7M+0eOAqW1r8qSkknHUZhDVrIi/aSlq6T8=;
        b=exiruIn4v8zaHS0S+4ohyD7Gmm/DhgCSFEqEDdCQEwlWMb5I+C9xL2+F1oM6x3ghdJ
         DBViM6ssueewlIULwuVpdxx1wkwXZFB+6DA1pOfC4N9vlIX2V4IBn03wPUBhNNB4YFtd
         E9vUDD+fu81XwD/KINp975vvgtaI8RZg/s/5Ks069w3Vc4Taoz4cEydXtEPs3scu5Uy9
         PZBnutmSu47MBlJMAiPGWKgNYED6BbmrYFWQ0L+O4hrXU0LIFtc7+jqw+ikImfbZg1H2
         WdNCpLezbpQp80JG65nN1n60im/31ef7LnTUOEsvLKPe4s6Kz0IVgrgZfqa3Wsuo9ABl
         0BIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695351104; x=1695955904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYkrqB9uA7M+0eOAqW1r8qSkknHUZhDVrIi/aSlq6T8=;
        b=ZoXGaVGFbMycwABokaUBi8ZHqdF0XLIo01p0viKzcaFcwh0PI/blgsjc2WejzjCpPP
         JElcUH0ZdIgN05z8q9ip2U/2uLwi/Jncrn18g3IxSmeFtnP68g/Mi1kF42Le2H1udg5d
         Q5/RKEBiEZjk9KxlEoM5beXYy6OEQVeXnBMtrrS6uxYKT4VMLXEIAhNNuobhkpAJa+qT
         aPdlKqP3TizwjDzwjX01JUKyjArwXgs3pinyWDOBInguAynhQ5tdXABZFdMahVhJ75Lv
         qBkRKBoZ8jPEH9SFFnRaM1dXgankVFHiTziJmezD5jip0W1cnTHDPT28TRte6wZeyqVV
         gKxw==
X-Gm-Message-State: AOJu0Yzgscon0azT1THbRP8YU8TsTOC5SF4rM18Q1SbgZixQTu9GC2KA
	ttzgLSxtAF+vdONGG/MsexlqYoKESdaIHahzzc4=
X-Google-Smtp-Source: 
 AGHT+IGtiz5wXyrbAhyFg8avb8jX5ymjFN23gqRi0pY8tk76E77xHmkQsY5RA8geWyon6mrn/RqdLparfr1kcZjp+nY=
X-Received: by 2002:a17:90b:19cb:b0:276:cd68:6081 with SMTP id
 nm11-20020a17090b19cb00b00276cd686081mr5418829pjb.40.1695351103836; Thu, 21
 Sep 2023 19:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <1695202370-24678-1-git-send-email-shengjiu.wang@nxp.com>
 <1695202370-24678-10-git-send-email-shengjiu.wang@nxp.com>
 <fbedcbf1-d925-47d6-b9fb-c9e15263c117@xs4all.nl>
 <CAA+D8APyNGFSry1GUv6TOW0nKYHKSwQd5bTcRNuT7cu0Xf8eUA@mail.gmail.com>
 <5292ce53-643e-44f0-b2cc-cb66efee9712@xs4all.nl>
 <CAA+D8AMZN59uTRs2sOrSeVb5AGopTzurNVCTNwJOVPahfEXd+w@mail.gmail.com>
 <2d44d574-08e5-4db3-87d9-5d12657f8935@xs4all.nl>
In-Reply-To: <2d44d574-08e5-4db3-87d9-5d12657f8935@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 22 Sep 2023 10:51:32 +0800
Message-ID: 
 <CAA+D8AN+Uz+3CN9BnD5R_gp5opD1v-D8FBjANRpGrH43Ac2tdg@mail.gmail.com>
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
Message-ID-Hash: TMKEOTZY6JHM36B364KBW2CWWSM3SNJ6
X-Message-ID-Hash: TMKEOTZY6JHM36B364KBW2CWWSM3SNJ6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TMKEOTZY6JHM36B364KBW2CWWSM3SNJ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Sep 21, 2023 at 10:09=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> =
wrote:
>
> On 21/09/2023 13:13, Shengjiu Wang wrote:
> > On Thu, Sep 21, 2023 at 3:11=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.n=
l> wrote:
> >>
> >> On 21/09/2023 08:55, Shengjiu Wang wrote:
> >>> On Wed, Sep 20, 2023 at 6:19=E2=80=AFPM Hans Verkuil <hverkuil@xs4all=
.nl> wrote:
> >>>>
> >>>> On 20/09/2023 11:32, Shengjiu Wang wrote:
> >>>>> The input clock and output clock may not be the accurate
> >>>>> rate as the sample rate, there is some drift, so the convert
> >>>>> ratio of i.MX ASRC module need to be changed according to
> >>>>> actual clock rate.
> >>>>>
> >>>>> Add V4L2_CID_USER_IMX_ASRC_RATIO_MOD control for user to
> >>>>> adjust the ratio.
> >>>>>
> >>>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>>> ---
> >>>>>  Documentation/userspace-api/media/v4l/control.rst | 5 +++++
> >>>>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 1 +
> >>>>>  include/uapi/linux/v4l2-controls.h                | 1 +
> >>>>>  3 files changed, 7 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Do=
cumentation/userspace-api/media/v4l/control.rst
> >>>>> index 4463fce694b0..2bc175900a34 100644
> >>>>> --- a/Documentation/userspace-api/media/v4l/control.rst
> >>>>> +++ b/Documentation/userspace-api/media/v4l/control.rst
> >>>>> @@ -318,6 +318,11 @@ Control IDs
> >>>>>      depending on particular custom controls should check the drive=
r name
> >>>>>      and version, see :ref:`querycap`.
> >>>>>
> >>>>> +.. _v4l2-audio-imx:
> >>>>> +
> >>>>> +``V4L2_CID_USER_IMX_ASRC_RATIO_MOD``
> >>>>> +    sets the rasampler ratio modifier of i.MX asrc module.
> >>>>
> >>>> rasampler -> resampler (I think?)
> >>>>
> >>>> This doesn't document at all what the type of the control is or how =
to interpret it.
> >>>>
> >>>>> +
> >>>>>  Applications can enumerate the available controls with the
> >>>>>  :ref:`VIDIOC_QUERYCTRL` and
> >>>>>  :ref:`VIDIOC_QUERYMENU <VIDIOC_QUERYCTRL>` ioctls, get and set a
> >>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/me=
dia/v4l2-core/v4l2-ctrls-defs.c
> >>>>> index 8696eb1cdd61..16f66f66198c 100644
> >>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>>>> @@ -1242,6 +1242,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >>>>>       case V4L2_CID_COLORIMETRY_CLASS:        return "Colorimetry C=
ontrols";
> >>>>>       case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:               retur=
n "HDR10 Content Light Info";
> >>>>>       case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:      retur=
n "HDR10 Mastering Display";
> >>>>> +     case V4L2_CID_USER_IMX_ASRC_RATIO_MOD:                  retur=
n "ASRC RATIO MOD";
> >>>>
> >>>> Let's stay consistent with the other control names:
> >>>>
> >>>> "ASRC Ratio Modifier"
> >>>>
> >>>> But if this is a driver specific control, then this doesn't belong h=
ere.
> >>>>
> >>>> Driver specific controls are defined in the driver itself, including=
 this
> >>>> description.
> >>>>
> >>>> Same for the control documentation: if it is driver specific, then t=
hat
> >>>> typically is documented either in a driver-specific public header, o=
r
> >>>> possibly in driver-specific documentation (Documentation/admin-guide=
/media/).
> >>>>
> >>>> But is this imx specific? Wouldn't other similar devices need this?
> >>>
> >>> It is imx specific.
> >>
> >> Why? I'm not opposed to this, but I wonder if you looked at datasheets=
 of
> >> similar devices from other vendors: would they use something similar?
> >
> > I tried to find some datasheets for other vendors, but failed to find t=
hem.
> > So I don't know how they implement this part.
> >
> > Ratio modification on i.MX is to modify the configured ratio.
> > For example, the input rate is 44.1kHz,  output rate is 48kHz,
> > configured ratio =3D 441/480,   the ratio modification is to modify
> > the fractional part of (441/480) with small steps.  because the
> > input clock or output clock has drift in the real hardware.
> > The ratio modification is signed value, it is added to configured
> > ratio.
> >
> > In our case, we have some sysfs interface for user to get the
> > clock from input audio device and output audio device, user
> > need to calculate the ratio dynamically , then configure the
> > modification to driver
>
> So this ratio modifier comes into play when either the audio input
> or audio output (or both) are realtime audio inputs/outputs where
> the sample rate is not a perfect 44.1 or 48 kHz, but slightly different?

yes.

>
> If you would use this resampler to do offline resampling (i.e. resample
> a 44.1 kHz wav file to a 48 kHz wav file), then this wouldn't be needed,
> correct?

yes.

>
> When dealing with realtime audio, userspace will know how to get the
> precise sample rate, but that is out-of-scope of this driver. Here
> you just need a knob to slightly tweak the resampling ratio.
>
> If my understanding is correct, then I wonder if it is such a good
> idea to put the rate into the v4l2_audio_format: it really has nothing
> to do with the audio format as it is stored in memory.
>
> What if you would drop that 'rate' field and instead create just a single
> control for the resampling ratio. This can use struct v4l2_fract to repre=
sent
> a fraction. It would be more work since v4l2_fract is currently not suppo=
rted
> for controls, but it is not hard to add support for that (just a bit tedi=
ous)
> and I actually think this might be a perfect solution.
>
> That way userspace can quite precisely tweak the ratio on the fly, and
> it is a generic solution as well instead of mediatek specific.
>

(rate, channel, format) are the basic parameters for audio stream.
For example, if there is decoder/encoder requirement, the rate field is
still needed,  I think the rate shouldn't be removed.

tweak ratio is not always needed by use case. As you said, for
file to file conversion, it is not needed, so keeping 'rate' is necessary.

best regards
wang shengjiu

> Regards,
>
>         Hans
>
> >
> > May be other vendors has similar implementation. or make
> > the definition be generic is an option.
> >
> > best regards
> > wang shengjiu
> >
> >>
> >> And the very short description you gave in the commit log refers to in=
put
> >> and output clock: how would userspace know those clock frequencies? In
> >> other words, what information does userspace need in order to set this
> >> control correctly? And is that information actually available? How wou=
ld
> >> you use this control?
> >>
> >> I don't really understand how this is supposed to be used.
> >>
> >>>
> >>> Does this mean that I need to create a header file in include/uapi/li=
nux
> >>> folder to put this definition?  I just hesitate if this is necessary.
> >>
> >> Yes, put it there. There are some examples of this already:
> >>
> >> include/uapi/linux/aspeed-video.h
> >> include/uapi/linux/max2175.h
> >>
> >>>
> >>> There is folder Documentation/userspace-api/media/drivers/ for driver=
s
> >>> Should this document in this folder, not in the
> >>> Documentation/admin-guide/media/?
> >>
> >> Yes, you are correct. For the headers above, the corresponding documen=
tation
> >> is in:
> >>
> >> Documentation/userspace-api/media/drivers/aspeed-video.rst
> >> Documentation/userspace-api/media/drivers/max2175.rst
> >>
> >> So you have some examples as reference.
> >>
> >> Frankly, what is in admin-guide and in userspace-api is a bit random, =
it
> >> probably could use a cleanup.
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>>
> >>> Best regards
> >>> Wang shengjiu
> >>>>
> >>>>>       default:
> >>>>>               return NULL;
> >>>>>       }
> >>>>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linu=
x/v4l2-controls.h
> >>>>> index c3604a0a3e30..b1c319906d12 100644
> >>>>> --- a/include/uapi/linux/v4l2-controls.h
> >>>>> +++ b/include/uapi/linux/v4l2-controls.h
> >>>>> @@ -162,6 +162,7 @@ enum v4l2_colorfx {
> >>>>>  /* The base for the imx driver controls.
> >>>>>   * We reserve 16 controls for this driver. */
> >>>>>  #define V4L2_CID_USER_IMX_BASE                       (V4L2_CID_USE=
R_BASE + 0x10b0)
> >>>>> +#define V4L2_CID_USER_IMX_ASRC_RATIO_MOD     (V4L2_CID_USER_IMX_BA=
SE + 0)
> >>>>>
> >>>>>  /*
> >>>>>   * The base for the atmel isc driver controls.
> >>>>
> >>>> Regards,
> >>>>
> >>>>         Hans
> >>
>

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDE77AAFFF
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 12:53:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89F9BE7B;
	Fri, 22 Sep 2023 12:53:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89F9BE7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695380035;
	bh=gz1XV4Nif7TdC7OqzJuAnlhDWVBME7f8q/y2Oq65WdU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G9QEcKbY1A+YRW0HMs7urVcYMG0HfbYa1gUIJOGMU7lJxqzsakS4E5aRSWT/qNhld
	 hzQC9IIUxWTH7erFE7CIW4IKniwX6TXyhouunB3qogw/E+8aGzvrxw1CymBu45Dutr
	 hMtsOPpNObm/0maZWmhGo2okbxEKcy7V0WrWFepI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 708C3F80125; Fri, 22 Sep 2023 12:52:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD84CF80125;
	Fri, 22 Sep 2023 12:52:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79050F801F5; Fri, 22 Sep 2023 12:52:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83AC5F80124
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 12:52:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83AC5F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=G7y6UEHU
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-578a6bb11ecso1485880a12.0
        for <alsa-devel@alsa-project.org>;
 Fri, 22 Sep 2023 03:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695379939; x=1695984739;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXP+Gy+MxOWebxaWRVXPfd0CMf5oRBMNdo87YUFe1WE=;
        b=G7y6UEHUEJP5VcCfqZ0jCSRQ3IcZYz/yzzfPSCi8ZjKSpTNujqnA76n/qL3pGBJ4ui
         lI8fCJ/8gDRFlucIfeu0Gv/Gr8xYkAchU9HZU42Yl5j3VJG5NjBmF1AZpqulWiUycGgB
         KHnKlfmQI6K59coyw6wO7kjYhHutH2hsMctpI1W6IkDQT4LrWPjVQogz5ai/JMwrOV1h
         QPHjaPCshX4tyoW1i77UMHJA6QfFGmMlm8HiDJvO8Tk7KvlSJuJh4ZgcQRZ5NV3HGIey
         T87OXgQHRX+Vpo33Kf9kSVVTeeK20C/9bjsUi0CX99LWfXAS5MYGM9ymiClA5XggirB0
         2oEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695379939; x=1695984739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXP+Gy+MxOWebxaWRVXPfd0CMf5oRBMNdo87YUFe1WE=;
        b=Bg/gFzYccKxK1GUrGAO46oo1+pRevUW4Cl/1Fi660tXFpaYr+9WlxaGTLQ0WFTMZi+
         5VJjMePGCpdAbCgWMbtkiy6dZgq4vF/DPXoL+afkIY0zcGTddOK9wDD66NkCSP7WYoMT
         xbL5hO4/YFaSn7Oai2NXy2Kfspp36a/pRG1/fgG+qyOt3hmpisQW5JG2cpK93HyqUDZw
         dncBGMgTPINVfIN8rys5Kkvdnz7qByFHd9ER5TgyVxZMDG1uJDUpSjAUXcL0JqG84aMz
         n/6/HOmzFi5j49Es26TTowO9OfXl0g0PupzrgdVWZjKl9N+0SIjA4O0IcObsCmJltJI7
         vkTA==
X-Gm-Message-State: AOJu0YyqUgtTLHyrorF6N3mpFMRSFL94bl46lzKKDRnAq8JnJbQVgi4X
	C5u2Wb8K9rBCDCjmTheM8titTqDLYEmtPOTtO8Q=
X-Google-Smtp-Source: 
 AGHT+IF40FWyeKvMtqrsNbHUnfIKezt/WC7GNQkjin8ISB4fG67+kltmw8KGIZVWBXmdLfj95fdEabTY+zsGIkoJCnE=
X-Received: by 2002:a05:6a20:3d91:b0:14c:a53c:498c with SMTP id
 s17-20020a056a203d9100b0014ca53c498cmr9575730pzi.10.1695379939033; Fri, 22
 Sep 2023 03:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <1695202370-24678-1-git-send-email-shengjiu.wang@nxp.com>
 <1695202370-24678-10-git-send-email-shengjiu.wang@nxp.com>
 <fbedcbf1-d925-47d6-b9fb-c9e15263c117@xs4all.nl>
 <CAA+D8APyNGFSry1GUv6TOW0nKYHKSwQd5bTcRNuT7cu0Xf8eUA@mail.gmail.com>
 <5292ce53-643e-44f0-b2cc-cb66efee9712@xs4all.nl>
 <CAA+D8AMZN59uTRs2sOrSeVb5AGopTzurNVCTNwJOVPahfEXd+w@mail.gmail.com>
 <2d44d574-08e5-4db3-87d9-5d12657f8935@xs4all.nl>
 <CAA+D8AN+Uz+3CN9BnD5R_gp5opD1v-D8FBjANRpGrH43Ac2tdg@mail.gmail.com>
 <c3d08bc5-49af-4967-8d06-572219cad9de@xs4all.nl>
In-Reply-To: <c3d08bc5-49af-4967-8d06-572219cad9de@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 22 Sep 2023 18:52:07 +0800
Message-ID: 
 <CAA+D8AMDN+0VZJ0BwfjqV2qxv99-WvqePTjkdo1xO7jhM8O=xw@mail.gmail.com>
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
Message-ID-Hash: NXPWBMOU52TUME6FAELEXYOYXCDDGK6C
X-Message-ID-Hash: NXPWBMOU52TUME6FAELEXYOYXCDDGK6C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NXPWBMOU52TUME6FAELEXYOYXCDDGK6C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Sep 22, 2023 at 4:54=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> Hi Shengjiu,
>
> On 22/09/2023 04:51, Shengjiu Wang wrote:
> > On Thu, Sep 21, 2023 at 10:09=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.=
nl> wrote:
> >>
> >> On 21/09/2023 13:13, Shengjiu Wang wrote:
> >>> On Thu, Sep 21, 2023 at 3:11=E2=80=AFPM Hans Verkuil <hverkuil@xs4all=
.nl> wrote:
> >>>>
> >>>> On 21/09/2023 08:55, Shengjiu Wang wrote:
> >>>>> On Wed, Sep 20, 2023 at 6:19=E2=80=AFPM Hans Verkuil <hverkuil@xs4a=
ll.nl> wrote:
> >>>>>>
> >>>>>> On 20/09/2023 11:32, Shengjiu Wang wrote:
> >>>>>>> The input clock and output clock may not be the accurate
> >>>>>>> rate as the sample rate, there is some drift, so the convert
> >>>>>>> ratio of i.MX ASRC module need to be changed according to
> >>>>>>> actual clock rate.
> >>>>>>>
> >>>>>>> Add V4L2_CID_USER_IMX_ASRC_RATIO_MOD control for user to
> >>>>>>> adjust the ratio.
> >>>>>>>
> >>>>>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>>>>> ---
> >>>>>>>  Documentation/userspace-api/media/v4l/control.rst | 5 +++++
> >>>>>>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 1 +
> >>>>>>>  include/uapi/linux/v4l2-controls.h                | 1 +
> >>>>>>>  3 files changed, 7 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/Documentation/userspace-api/media/v4l/control.rst b/=
Documentation/userspace-api/media/v4l/control.rst
> >>>>>>> index 4463fce694b0..2bc175900a34 100644
> >>>>>>> --- a/Documentation/userspace-api/media/v4l/control.rst
> >>>>>>> +++ b/Documentation/userspace-api/media/v4l/control.rst
> >>>>>>> @@ -318,6 +318,11 @@ Control IDs
> >>>>>>>      depending on particular custom controls should check the dri=
ver name
> >>>>>>>      and version, see :ref:`querycap`.
> >>>>>>>
> >>>>>>> +.. _v4l2-audio-imx:
> >>>>>>> +
> >>>>>>> +``V4L2_CID_USER_IMX_ASRC_RATIO_MOD``
> >>>>>>> +    sets the rasampler ratio modifier of i.MX asrc module.
> >>>>>>
> >>>>>> rasampler -> resampler (I think?)
> >>>>>>
> >>>>>> This doesn't document at all what the type of the control is or ho=
w to interpret it.
> >>>>>>
> >>>>>>> +
> >>>>>>>  Applications can enumerate the available controls with the
> >>>>>>>  :ref:`VIDIOC_QUERYCTRL` and
> >>>>>>>  :ref:`VIDIOC_QUERYMENU <VIDIOC_QUERYCTRL>` ioctls, get and set a
> >>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/=
media/v4l2-core/v4l2-ctrls-defs.c
> >>>>>>> index 8696eb1cdd61..16f66f66198c 100644
> >>>>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>>>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>>>>>> @@ -1242,6 +1242,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >>>>>>>       case V4L2_CID_COLORIMETRY_CLASS:        return "Colorimetry=
 Controls";
> >>>>>>>       case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:               ret=
urn "HDR10 Content Light Info";
> >>>>>>>       case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:      ret=
urn "HDR10 Mastering Display";
> >>>>>>> +     case V4L2_CID_USER_IMX_ASRC_RATIO_MOD:                  ret=
urn "ASRC RATIO MOD";
> >>>>>>
> >>>>>> Let's stay consistent with the other control names:
> >>>>>>
> >>>>>> "ASRC Ratio Modifier"
> >>>>>>
> >>>>>> But if this is a driver specific control, then this doesn't belong=
 here.
> >>>>>>
> >>>>>> Driver specific controls are defined in the driver itself, includi=
ng this
> >>>>>> description.
> >>>>>>
> >>>>>> Same for the control documentation: if it is driver specific, then=
 that
> >>>>>> typically is documented either in a driver-specific public header,=
 or
> >>>>>> possibly in driver-specific documentation (Documentation/admin-gui=
de/media/).
> >>>>>>
> >>>>>> But is this imx specific? Wouldn't other similar devices need this=
?
> >>>>>
> >>>>> It is imx specific.
> >>>>
> >>>> Why? I'm not opposed to this, but I wonder if you looked at datashee=
ts of
> >>>> similar devices from other vendors: would they use something similar=
?
> >>>
> >>> I tried to find some datasheets for other vendors, but failed to find=
 them.
> >>> So I don't know how they implement this part.
> >>>
> >>> Ratio modification on i.MX is to modify the configured ratio.
> >>> For example, the input rate is 44.1kHz,  output rate is 48kHz,
> >>> configured ratio =3D 441/480,   the ratio modification is to modify
> >>> the fractional part of (441/480) with small steps.  because the
> >>> input clock or output clock has drift in the real hardware.
> >>> The ratio modification is signed value, it is added to configured
> >>> ratio.
> >>>
> >>> In our case, we have some sysfs interface for user to get the
> >>> clock from input audio device and output audio device, user
> >>> need to calculate the ratio dynamically , then configure the
> >>> modification to driver
> >>
> >> So this ratio modifier comes into play when either the audio input
> >> or audio output (or both) are realtime audio inputs/outputs where
> >> the sample rate is not a perfect 44.1 or 48 kHz, but slightly differen=
t?
> >
> > yes.
> >
> >>
> >> If you would use this resampler to do offline resampling (i.e. resampl=
e
> >> a 44.1 kHz wav file to a 48 kHz wav file), then this wouldn't be neede=
d,
> >> correct?
> >
> > yes.
> >
> >>
> >> When dealing with realtime audio, userspace will know how to get the
> >> precise sample rate, but that is out-of-scope of this driver. Here
> >> you just need a knob to slightly tweak the resampling ratio.
> >>
> >> If my understanding is correct, then I wonder if it is such a good
> >> idea to put the rate into the v4l2_audio_format: it really has nothing
> >> to do with the audio format as it is stored in memory.
> >>
> >> What if you would drop that 'rate' field and instead create just a sin=
gle
> >> control for the resampling ratio. This can use struct v4l2_fract to re=
present
> >> a fraction. It would be more work since v4l2_fract is currently not su=
pported
> >> for controls, but it is not hard to add support for that (just a bit t=
edious)
> >> and I actually think this might be a perfect solution.
> >>
> >> That way userspace can quite precisely tweak the ratio on the fly, and
> >> it is a generic solution as well instead of mediatek specific.
> >>
> >
> > (rate, channel, format) are the basic parameters for audio stream.
> > For example, if there is decoder/encoder requirement, the rate field is
> > still needed,  I think the rate shouldn't be removed.
>
> The v4l2_format struct is meant to describe the format of the data in mem=
ory,
> not the rate at which the data has to be processed. It is the same for vi=
deo:
> v4l2_format describes the memory layout of the video data, not the framer=
ate.
> That is done through other ioctls (VIDIOC_S/G_PARM, a horrible ioctl, but
> that's another story). So for audio the channel and format fields define =
how
> the audio data is laid out in memory, but the rate has nothing to do with
> that.
>
> For this resampler you don't even need the rate at all, all you need is t=
he
> rate ratio, right? I.e. there is no difference when resampling from 10 kH=
z to 20 kHz
> vs. 30 kHz to 60 kHz, the ratio is the same.
>
> Or is that too simplistic and the hardware needs the actual rates as well=
?
>
> Remember that I am a video guy, not an audio guy, so apologies if I ask s=
tupid
> questions!
>
> Regardless, I don't believe the rate belongs to the audio format struct. =
It's
> not how v4l2_format works. If the rate is needed, then that is probably b=
est
> done through controls, one for the source (output queue) and one for the
> destination (capture queue).
>

I am also not familiar with V4L2.  So I try not to touch too many things in
V4L2.

The current asrc memory to memory is implemented based on the alsa
asrc driver,  that asrc alsa driver needs 'rate' parameter.

The struct v4l2_vbi_format has a value: sampling_rate,  is there any reason
here?

if use controls,  do I need to define a new one?

best regards
wang shengjiu

> Regards,
>
>         Hans
>
> >
> > tweak ratio is not always needed by use case. As you said, for
> > file to file conversion, it is not needed, so keeping 'rate' is necessa=
ry.
> >
> > best regards
> > wang shengjiu
> >
> >> Regards,
> >>
> >>         Hans
> >>
> >>>
> >>> May be other vendors has similar implementation. or make
> >>> the definition be generic is an option.
> >>>
> >>> best regards
> >>> wang shengjiu
> >>>
> >>>>
> >>>> And the very short description you gave in the commit log refers to =
input
> >>>> and output clock: how would userspace know those clock frequencies? =
In
> >>>> other words, what information does userspace need in order to set th=
is
> >>>> control correctly? And is that information actually available? How w=
ould
> >>>> you use this control?
> >>>>
> >>>> I don't really understand how this is supposed to be used.
> >>>>
> >>>>>
> >>>>> Does this mean that I need to create a header file in include/uapi/=
linux
> >>>>> folder to put this definition?  I just hesitate if this is necessar=
y.
> >>>>
> >>>> Yes, put it there. There are some examples of this already:
> >>>>
> >>>> include/uapi/linux/aspeed-video.h
> >>>> include/uapi/linux/max2175.h
> >>>>
> >>>>>
> >>>>> There is folder Documentation/userspace-api/media/drivers/ for driv=
ers
> >>>>> Should this document in this folder, not in the
> >>>>> Documentation/admin-guide/media/?
> >>>>
> >>>> Yes, you are correct. For the headers above, the corresponding docum=
entation
> >>>> is in:
> >>>>
> >>>> Documentation/userspace-api/media/drivers/aspeed-video.rst
> >>>> Documentation/userspace-api/media/drivers/max2175.rst
> >>>>
> >>>> So you have some examples as reference.
> >>>>
> >>>> Frankly, what is in admin-guide and in userspace-api is a bit random=
, it
> >>>> probably could use a cleanup.
> >>>>
> >>>> Regards,
> >>>>
> >>>>         Hans
> >>>>
> >>>>>
> >>>>> Best regards
> >>>>> Wang shengjiu
> >>>>>>
> >>>>>>>       default:
> >>>>>>>               return NULL;
> >>>>>>>       }
> >>>>>>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/li=
nux/v4l2-controls.h
> >>>>>>> index c3604a0a3e30..b1c319906d12 100644
> >>>>>>> --- a/include/uapi/linux/v4l2-controls.h
> >>>>>>> +++ b/include/uapi/linux/v4l2-controls.h
> >>>>>>> @@ -162,6 +162,7 @@ enum v4l2_colorfx {
> >>>>>>>  /* The base for the imx driver controls.
> >>>>>>>   * We reserve 16 controls for this driver. */
> >>>>>>>  #define V4L2_CID_USER_IMX_BASE                       (V4L2_CID_U=
SER_BASE + 0x10b0)
> >>>>>>> +#define V4L2_CID_USER_IMX_ASRC_RATIO_MOD     (V4L2_CID_USER_IMX_=
BASE + 0)
> >>>>>>>
> >>>>>>>  /*
> >>>>>>>   * The base for the atmel isc driver controls.
> >>>>>>
> >>>>>> Regards,
> >>>>>>
> >>>>>>         Hans
> >>>>
> >>
>

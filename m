Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE18D958057
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 09:53:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 354C39F6;
	Tue, 20 Aug 2024 09:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 354C39F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724140398;
	bh=t+SS2sYV3XPALotEG8GtBNrD6YUGb7AIiW/aIuUoKwQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M3weEsWXz9donT4Y1+WtWMGPy/Yetqm346ufTcvPW1f1ML13CROAdflDDiLDsTtxT
	 YfVVXI+2SEoTAdxv6QyZxtTsnWB9eeG58XcSmK3cRTIHlCGHPwPlCyAPdnTfFOVEEd
	 +273rvhfbF8QPQrSwhDtlWVyAaiZlEknkftznlR0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEA25F80579; Tue, 20 Aug 2024 09:52:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 629B9F8057A;
	Tue, 20 Aug 2024 09:52:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37553F80494; Tue, 20 Aug 2024 09:52:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11EF8F800F0
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 09:52:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11EF8F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=alaBJNg6
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-39b0826298cso18004135ab.2
        for <alsa-devel@alsa-project.org>;
 Tue, 20 Aug 2024 00:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724140351; x=1724745151;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2IPnhCGoD3q9tMfApbwEBiQbgRS87uwpXJiohxsSxo=;
        b=alaBJNg6JxOZSMPU84Lgxiym7Z9xlDBw2rgqVAaAbY31tDICc0wLYDA4niL/2pmNje
         goc/hHFjqCzCGqayr3PWCleDRu5KKez0F8fbCVj5krH7cHSGkCfVCMgl+/wktH7w4q2b
         SrhEG4U319q7v87zPWJIHVTYQ+Pojc1Y0Vk6ufJf78eKtyRUdcIKl7AxCu0cif7BMDa9
         yDGRMdMDHwyeVREvbIvIOA+XK3N+JFczKkdrK+G64vdNTg383yFuirkUptK4mCGxdewS
         2OXnIi5dNvuCVWkkCuQV78jPkIYupnIjwQuFsP7d2xEShwiy03xzeL2U2E0t7D/lOJrI
         I/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724140351; x=1724745151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2IPnhCGoD3q9tMfApbwEBiQbgRS87uwpXJiohxsSxo=;
        b=kCIh/B7gdyNYuYFsLSLKYk7AEgIAg3sl954X3tVzUY/p6UAdPiIiMfUuHauuUyzFUA
         bAbZ/BEzafZhmUPO+CAL/KtUvuu6RbhwchTRsSVDS0fbNENLwCcOK6RUOz2hEQ/vx81N
         wCwaxAs5/WyjKy+kAAvltqHQkajXyDbR2ziJ5/Wdt8HU22Xwosi2K2qbOfpn95GqwzMX
         NS9oOFMdAqYg06lLIe0ga2/UXhOvp0sxZUy3bMkMsFn6tcrktfJKVp+i9oxHUJjG9+9F
         1B7M3g4MfcWzFZs0gazhCkrFnwwxPHj4gPCOS0hFQ3FaiZnYwwCc/Q2VNek2bPI2gstw
         4YPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGWHnGpBZDQR5wXxm1HPzRBiLqS5+TPZGwsozmVe+koQS2ZMH/ApRNv0OH1NwEcvb+Fp68UYqDnXnR@alsa-project.org
X-Gm-Message-State: AOJu0YyK9UODUkrjwN8B2zjKmKnuco5eVSTgiRES0GxKH5kgAZH2tHxO
	CldZcBU1gS1hOTI8iUWeipeapaVF82IoBJOlfTKjRxpGPClxds2acbwFLwQI9ksM3Q5uMCNvzZo
	esSxjye9Y40x9/asRu4MeT9VKp88=
X-Google-Smtp-Source: 
 AGHT+IEO2EWDuz6eY2EowaDwGtJ0jIVrmGJxLUqdqJsxC8SyVkLr3sdjBBMTIcU/r8joe3Kel+0mWeYYnFgqJYzgQmc=
X-Received: by 2002:a05:6e02:1a25:b0:398:36c0:7968 with SMTP id
 e9e14a558f8ab-39d26ce6426mr141331125ab.6.1724140350868; Tue, 20 Aug 2024
 00:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <1723804959-31921-1-git-send-email-shengjiu.wang@nxp.com>
 <1723804959-31921-5-git-send-email-shengjiu.wang@nxp.com>
 <6d83cd58-5f02-414b-b627-a0022e071052@linux.intel.com>
 <CAA+D8ANDAxS42=9zOLQY_h_ihvJCmaXzE+_iZyxbSuikqt1CBw@mail.gmail.com>
 <ceb54a27-144b-40ed-8de5-482f2b0664a0@linux.intel.com>
 <CAA+D8ANqb89UavAXTiHvcHyv9uMt8_MYR9hfBaxEJDPNy5C=-g@mail.gmail.com>
 <eceafeef-2dba-48aa-b8b3-198b9bb39fb6@perex.cz>
In-Reply-To: <eceafeef-2dba-48aa-b8b3-198b9bb39fb6@perex.cz>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 20 Aug 2024 15:52:20 +0800
Message-ID: 
 <CAA+D8AMOr8=JS7A0DvOEatL79CwwT4De7vDs6H-VDi05AnkjHQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/6] ASoC: fsl_asrc_m2m: Add memory to memory
 function
To: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: KSNOI2XBNOXV32VOA5KCXRIPY2MGY5RY
X-Message-ID-Hash: KSNOI2XBNOXV32VOA5KCXRIPY2MGY5RY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KSNOI2XBNOXV32VOA5KCXRIPY2MGY5RY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 20, 2024 at 3:42=E2=80=AFPM Jaroslav Kysela <perex@perex.cz> wr=
ote:
>
> On 20. 08. 24 9:37, Shengjiu Wang wrote:
> > On Tue, Aug 20, 2024 at 2:59=E2=80=AFPM Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com> wrote:
> >>
> >>
> >>
> >> On 8/20/24 04:53, Shengjiu Wang wrote:
> >>> On Mon, Aug 19, 2024 at 3:42=E2=80=AFPM Pierre-Louis Bossart
> >>> <pierre-louis.bossart@linux.intel.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 8/16/24 12:42, Shengjiu Wang wrote:
> >>>>> Implement the ASRC memory to memory function using
> >>>>> the compress framework, user can use this function with
> >>>>> compress ioctl interface.
> >>>>>
> >>>>> Define below private metadata key value for output
> >>>>> format, output rate and ratio modifier configuration.
> >>>>> ASRC_OUTPUT_FORMAT 0x80000001
> >>>>> ASRC_OUTPUT_RATE   0x80000002
> >>>>> ASRC_RATIO_MOD     0x80000003
> >>>>
> >>>> Can the output format/rate change at run-time?
> >>>
> >>> Seldom I think.
> >>>
> >>>>
> >>>> If no, then these parameters should be moved somewhere else - e.g.
> >>>> hw_params or something.
> >>>
> >>> This means I will do some changes in compress_params.h, add
> >>> output format and output rate definition, follow Jaroslav's example
> >>> right?
> >>
> >> yes, having parameters for the PCM case would make sense.
> >>
> >>>> I am still not very clear on the expanding the SET_METADATA ioctl to
> >>>> deal with the ratio changes. This isn't linked to the control layer =
as
> >>>> suggested before, and there's no precedent of calling it multiple ti=
mes
> >>>> during streaming.
> >>>
> >>> Which control layer? if you means the snd_kcontrol_new?  it is bound
> >>> with sound card,  but in my case,  I need to the control bind with
> >>> the snd_compr_stream to support multi streams/instances.
> >>
> >> I can only quote Jaroslav's previous answer:
> >>
> >> "
> >> This argument is not valid. The controls are bound to the card, but th=
e
> >> element identifiers have already iface (interface), device and subdevi=
ce
> >> numbers. We are using controls for PCM devices for example. The bindin=
g
> >> is straight.
> >>
> >> Just add SNDRV_CTL_ELEM_IFACE_COMPRESS define and specify the compress
> >> device number in the 'struct snd_ctl_elem_id'.
> >> "
> >
> > I don't think it is doable,  or at least I don't know how to do it.
> >
> > My case is just one card/one device/one subdevice.  can't use it to
> > distinguish multi streams.
>
> I already wrote that the compress core code should be extended to support
> subdevices like other ALSA APIs. I'll work on it. For now, just add suppo=
rt
> for one converter.

Thanks.

What does this subdevices mean?  Is it equal to the compress streams?

When I call snd_compr_ops.open(),  it means to create an instance, the inst=
ance
is created at runtime (call open()), not created when the sound card is cre=
ated.

Best regards
Shengjiu Wang




>
>                                         Jaroslav
>
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>

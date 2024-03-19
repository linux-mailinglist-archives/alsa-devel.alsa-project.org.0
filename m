Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0808812E0
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 15:05:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B736D2BC2;
	Wed, 20 Mar 2024 15:05:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B736D2BC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710943513;
	bh=sggre/bwedm+SjhOnNs5oKMSJXt1Hx/MhvbnEbYdQRE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QujSfy6H9TpEdwRY0jNSPT+2OkOQaT28cbmokwmFoWVVzxZQrCnSG9N7Mtc82BUX3
	 gy6uGKwgQMMTmkU3CpZLgdjGSkNGBaZpzPBLBFyAZtEoWp3g4rCcjRmndHChTAGuTU
	 PhM0rBX1S+UO+q8/J8zVl78LLe22Hku3Ii9/qL6M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35981F89612; Wed, 20 Mar 2024 15:00:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6106AF80CC4;
	Wed, 20 Mar 2024 15:00:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A98EDF80548; Tue, 19 Mar 2024 03:26:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	HK_RANDOM_ENVFROM,HK_RANDOM_FROM,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B49EF8025F
	for <alsa-devel@alsa-project.org>; Tue, 19 Mar 2024 03:26:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B49EF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=YOpgQ7+u
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a46cc855600so197787166b.0
        for <alsa-devel@alsa-project.org>;
 Mon, 18 Mar 2024 19:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710815182; x=1711419982;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PVwebktWBWty2mBrf17cNCGtAzEMmWTbg3BNLwRbR4=;
        b=YOpgQ7+ujiPT8rhnql3VRO69+inTxJOCmS8cEcUVmZvQk8Z71TnAYzJ+F0FFlVQKOU
         6AldirRM7oNjbP97JZQCXZ8KoFdlnyP8po0EDYIo5ROPs0O5c5b4nJhRLTvlHgAFvgQC
         quuilpkKZygk9egCA7o7pIWuQ9S98Rn9PcOyq41U19h1mBQQyji0q5mJegCYSVuW1ZrY
         GLImglMvK8C7nXv9WPPN+qLf9RgdFpVZLgKGEUo+zY4PR1vY/ClnrOdwqupGNmHTk6Do
         bW0edfW/1+i51/mAVf4w5v5moq4q9yynyyRODRDbvgigDa3Sjtiu7zTGC8saYqvXZUBe
         omow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710815182; x=1711419982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PVwebktWBWty2mBrf17cNCGtAzEMmWTbg3BNLwRbR4=;
        b=lJvsdCt/ZNx2GPWTiCQAn+29tiFqkqAMr32kZgCMkCYyiB/RTUHE1E0MbnIZH50U+h
         na1niQ3Sw29l7xfmll9Jj25ejF4GPPIjUE4uC3mBQJM3SUgi/WUbdrDbOYggDxvEhLL4
         FObEwp4iu/cvHG3Cz9yzxjtqmj0VP8WcIFP67R+cma4Vw0OCsd/ZAuKfI8cYXm1GIYh4
         Q+6+3SiFVTZZtoSTvaQrCoIrxmhQXgICj2yqZgvHpaGwqxN7GkxJ5azS+6cv+Ujdbzfw
         I/1cczNxyULFpAjk5HDtMyGBFYU8O7Pgj/WOTYdAuXDtAXL/VNpk34mNDforQMEA6PjH
         zW1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfj2QJ8sWM36C8DLkeVWXL18A7h6uQJCB2vVqp1AaPAJ94lsyC8DFFajn6+wVDZSiugqz4+7eQ4v/iZvDDHEG6QWBAAeGNxRRjgsY=
X-Gm-Message-State: AOJu0YwznImATEgjxvYFD83q662ydenZhU715JNuxLKJEu3ZA1ZgDn6p
	c3GeJeSJ2jYQwET1Ukzej36+ArOh2MJVQ2a6gzmDICMVAbIBuofAqq3AKsqFvZeUNb2o4GeEWx2
	jA9C4YAmmanxL8QBRybKFvN4MnVSEl98Wtend
X-Google-Smtp-Source: 
 AGHT+IFu9/5+j8r+Fb4pBtW95+Cl0mFkAx99vWRUt0Y35XyzFmr6MbTbI8DsVSvg5VsvJGnE/Mvw9QqpeiGeWfWctas=
X-Received: by 2002:a17:906:81c9:b0:a46:6958:c415 with SMTP id
 e9-20020a17090681c900b00a466958c415mr639887ejx.8.1710815181445; Mon, 18 Mar
 2024 19:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240228013619.29758-1-quic_wcheng@quicinc.com>
 <20240228013619.29758-21-quic_wcheng@quicinc.com>
 <CANqn-rjTgHgzssxZiuwvTKzOS31wzjS4Y9G-XacZN4a7c82MaA@mail.gmail.com>
 <d97f635f-053b-70a7-5ffe-a1ae273091d1@quicinc.com>
 <CANqn-ring2uf=A-F7VuRwnJ--n=FtFzSddCmR-=nfxCGcFAF2g@mail.gmail.com>
 <0e9f0f2f-a404-3b76-3c52-9eca7594efa3@quicinc.com>
In-Reply-To: <0e9f0f2f-a404-3b76-3c52-9eca7594efa3@quicinc.com>
From: Albert Wang <albertccwang@google.com>
Date: Tue, 19 Mar 2024 10:26:08 +0800
Message-ID: 
 <CANqn-rjMcncjZv9YNZJOZgFo0_ro9hk=TBSFrY9RfhE1Mi13qw@mail.gmail.com>
Subject: Re: [PATCH v18 20/41] ALSA: usb-audio: qcom: Introduce QC USB SND
 offloading support
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, corbet@lwn.net, lgirdwood@gmail.com,
	andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, broonie@kernel.org,
	bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org,
	konrad.dybcio@linaro.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: albertccwang@google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ET4IKDAA7XLUMYNDK4FUMFKVVOHN76DU
X-Message-ID-Hash: ET4IKDAA7XLUMYNDK4FUMFKVVOHN76DU
X-Mailman-Approved-At: Wed, 20 Mar 2024 13:59:00 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ET4IKDAA7XLUMYNDK4FUMFKVVOHN76DU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> We can discuss that offline and come up with an approach that is
> reviewable by maintainers and the community.

Sure, looking forward to working together with you!

Thanks,
Albert Wang

On Fri, Mar 15, 2024 at 4:57=E2=80=AFAM Wesley Cheng <quic_wcheng@quicinc.c=
om> wrote:
>
> Hi Albert
>
> On 3/14/2024 3:29 AM, Albert Wang wrote:
> > On Thu, Mar 14, 2024 at 3:18=E2=80=AFAM Wesley Cheng <quic_wcheng@quici=
nc.com> wrote:
> >>
> >> Hi Albert,
> >>
> >> On 3/13/2024 1:03 AM, Albert Wang wrote:
> >>> Hi Wesley,
> >>>
> >>> The suspend function `qc_usb_audio_offload_suspend()` looks to stop
> >>> the traffic on the bus, so that the bus can be suspended. That allows
> >>> the application processor(AP) to enter suspend. There is a subtle
> >>> difference with our feature, which is to allow AP suspend with the
> >>> Host and USB controller active to continue the audio offloading. We
> >>> call this feature `allow AP suspend in playback`. So, I have some
> >>> points to clarify with you:
> >>
> >> Yes, I'm aware of that feature also.
> >>
> >>> 1. Will the suspend flow `usb_audio_suspend() -->
> >>> platform_ops->suspend_cb() --> qc_usb_audio_offload_suspend()` be
> >>> called when offloading is active?
> >>
> >> It can be.  This is why in our case, we are going to issue the
> >> disconnect event to the audio DSP to stop the session if it is current=
ly
> >> in one.
> >>
> >>> 2. As my understanding, the suspend function is to allow AP suspend
> >>> when the offloading is IDLE, but it won't allow AP suspend when in
> >>> playback or capture. Please correct me if anything is wrong.
> >>
> >> As mentioned above, it will let apps go into PM suspend after forcing
> >> the audio stream to be idle.  We won't block PM suspend entry.
> >>
> > Right. Your design is to force the audio stream idle, or say, inform
> > the audio DSP
> > to stop the current offloading session first, then AP can go into PM
> > suspend as usual.
> > Then I can say the current design did not support the `allow AP
> > suspend in playback`
> > feature, right?
> >
>
> Correct, this series does not cover this mechanism.
>
> >> Yes, I saw that patch as well.  I'll take a look once this series land=
s
> >> upstream.
> >
> > That patch is rejected and archived now. So we need to find another
> > approach to do
> > that, even based on your framework.
> >
>
> We can discuss that offline and come up with an approach that is
> reviewable by maintainers and the community.
>
> Thanks
> Wesley Cheng
>
> > Thanks,
> > Albert
> >
> >
> >>> 3. We would like to integrate the `allow AP suspend in playback`
> >>> feature with your framework to become one upstream offload solution.
> >>> Here is the patch:
> >>> https://patchwork.kernel.org/project/linux-pm/patch/20240223143833.15=
09961-1-guanyulin@google.com/
> >>> .
> >>
> >> Yes, I saw that patch as well.  I'll take a look once this series land=
s
> >> upstream.
> >>
> >> Thanks
> >> Wesley Cheng

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 963BB869D31
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 18:09:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0524D84A;
	Tue, 27 Feb 2024 18:09:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0524D84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709053760;
	bh=PGntO9HZ7nB0drpm+YsqMGgrsQ12kaan0DEUm5AB9oE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I2xmfr/chG1MzhXBW5AGPfK2qkQW28esJHZNL89HiosTn91N618RqOwdLE8zCpkxQ
	 Q6SGSX4YPhPYLlUOK5EUT4meU5+7wtEzpgr7/ZZBlRNBfIiBiT8JkyTLydy3X/ejMG
	 TkCsoQH2oyqgqU6qud/bI2SfVfhAsw5eL297wtuw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67AC8F805A8; Tue, 27 Feb 2024 18:08:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6B77F805A0;
	Tue, 27 Feb 2024 18:08:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4697F801C0; Tue, 27 Feb 2024 18:08:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CA41F800F0
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 18:08:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CA41F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zHJTdgWC
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5d8b70b39efso4507181a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Feb 2024 09:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709053711; x=1709658511;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o4T8k/GzPwrI1R62VQXBd8xMeTbbVe30Wb070cxDcDU=;
        b=zHJTdgWC60iO6QFHzeBtiSbAJ+r5Wl0CiBY0wA+FOuBCkmK/UMtimKfkelnebfhwMD
         sCElLvKNJvSPShAi/FX7iO5w6UDa2t9uOzouxNsN/bTygOtln6VDXy73lPOrlGZPngRd
         M8PAGhGcxUoMMv4NZS3tv0X2EHApViCoPwFNxlq9YF7/8gIRZudp83X92CBnYAbRvvW1
         W4JXLWlTGvrFRalC//NlJXJ+2nrUzTlXOKfKTzslVZn3z2LIut3czFY2NCNhoKGDXqcK
         7K45Kl0sDx8kT5HvlmPo/AtfiRtjjz/ruH3d/euNENGnRWJBYR6dLSDRya0lI4zzQ/HU
         8XXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709053711; x=1709658511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4T8k/GzPwrI1R62VQXBd8xMeTbbVe30Wb070cxDcDU=;
        b=vRFRfcplOVdU5dRPA50WGp7BTq16pLmMUIlx2uDrk6rY4HgEh3+SBeTHTe7S+6Yf5L
         SfBjAOZUVGS2KshL7QmpnA8MzeOWskEIfRf4RiXd9DDnRfpZBK3ufWA1M+6qokkVhB94
         rq8shl7bmNrozD6Fxex3ntPHLA6jFCSnpTbJMcXSUpbmeUe8M061VjxENMZmxHEBV0Ko
         iaJh4d07/yu4a/1qbuKyXF/7umSAp1ec8PPoNo7oiVEbwK13JV3F29sUHIlDUfoKBzH9
         0Xgk/fAu9E5sbLHrX61EMWTBiI3jlZWugGMltehGfPnbLmqNKnAv7il1NZZN7hP+9hv6
         vEeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0Bj6LwaPMA6Yhz5rclgBLVAShdtqssSZh5wNo42eIVrNrn7/ogFBmdAPwvo2JdHOSj3P4MkhcoQWLJONxeoczJljAkx1LqTg/Q+A=
X-Gm-Message-State: AOJu0Yz6MwyTKeeDUDFuzAO6P2TeIWvMf5I+xBICIWmN/h60Kt+iZWoe
	NFgiwfFk+lN6jb9z1BgGCO57uFpv8Blbi/j0MsYuNLDB+BrBrTeJ8cZDtfJ3F1Q=
X-Google-Smtp-Source: 
 AGHT+IHGOOOwOx6ckcP28mlDFlcimec/bT0+8kqrte9hVw72AiMZ3sj24eHALgOXdlaTtDeDW9juig==
X-Received: by 2002:a17:90a:b014:b0:299:5d2c:9aa1 with SMTP id
 x20-20020a17090ab01400b002995d2c9aa1mr7690525pjq.5.1709053710806;
        Tue, 27 Feb 2024 09:08:30 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:77b:bbfe:c3af:16dc])
        by smtp.gmail.com with ESMTPSA id
 nb12-20020a17090b35cc00b00296fd5e0de1sm8797823pjb.34.2024.02.27.09.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 09:08:30 -0800 (PST)
Date: Tue, 27 Feb 2024 10:08:27 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: noman pouigt <variksla@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: Audio dsp recovery using remoteproc
Message-ID: <Zd4XCwOeJ+exUjN0@p14s>
References: 
 <CAES_P+_0tWVtn+tyUi1TvkWi4rA-ZBj8e7_pnJd1h_J3S3Cn8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAES_P+_0tWVtn+tyUi1TvkWi4rA-ZBj8e7_pnJd1h_J3S3Cn8Q@mail.gmail.com>
Message-ID-Hash: ZZVLM3M6XRU7BLSKWT4MGORSS3GAOI5G
X-Message-ID-Hash: ZZVLM3M6XRU7BLSKWT4MGORSS3GAOI5G
X-MailFrom: mathieu.poirier@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZZVLM3M6XRU7BLSKWT4MGORSS3GAOI5G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Good day,

On Fri, Feb 16, 2024 at 03:29:56PM -0800, noman pouigt wrote:
> mailbox to dsp_1 is currently modeling platform pcm driver.
> mailbox to dsp_2 is also doing the same.
> 
> Platform driver callbacks cause IPC to be sent to dsp's.
> Lifecycle of two dsp's are managed by separate remoteproc
> drivers. Single sound card is exposed.
> 
> Separate watchdog interrupts from the corresponding dsp's
> are connected to remoteproc to manage crashing of the
> individual dsp's. How can I restart both the dsp when either
> of them crashes using the kernel device model? Remoteproc
> driver currently only restarts the crashed dsp instead of restarting
> both the dsp. It is needed to bring up the hardware in a consistent
> state as both the dsp's are connected to a common hardware.
>

Ok

> I thought of making a virtual parent remoteproc device
> and then managing individual dsp as a subdevice of that parent device
> but remoteproc device node is associated with the individual elf file i.e.
> it can manage only a single dsp.

You are on the right track but perhaps not fully aware of what is already done
for multi core remote processors.  I suggest you have a thorough look at TI's
K3R5 driver[1] and one of it's DTB[2].  In the DTB each remote processor loads a
different firmware file, which seems to be what you are looking for.

Thanks,
Mathieu

[1]. https://elixir.bootlin.com/linux/v6.8-rc6/source/drivers/remoteproc/ti_k3_r5_remoteproc.c
[2]. https://elixir.bootlin.com/linux/v6.8-rc6/source/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi#L397 


> 
> How can I model remoteproc drivers using linux device model so that when either
> of them crashes both the dsp's get reloaded by the remoteproc framework.
> 
>            MailBox ---- DSP_1 ---
>          |                                    |
> Linux                                      ------ common_hw -> speaker/mic
>           |                                    |
>             MailBox ---- DSP_2 ---
> 

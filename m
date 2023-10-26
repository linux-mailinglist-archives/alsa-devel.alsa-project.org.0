Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2137D87EE
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 19:59:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D92B0850;
	Thu, 26 Oct 2023 19:58:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D92B0850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698343188;
	bh=3gQINRdDAHFP0GeXFBQ35uXulS8rn4EDqsZdLJHQs9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uIOSw6p4Pi/x6WvW0NChn7PKMKBqewn+gsHTqHgkQFpaoxwzV5SiTN3tj4Rp1yJQ5
	 bSBWJVFuwp+SoF7bFgNHG8no1jd4g7tiUdfrtZPmqSwKv8yilewppYPGM0MxerJ8/E
	 ULirBlClBLuxyaDelohuuenbhxJYqYIgO/sV8cTg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EE81F8014B; Thu, 26 Oct 2023 19:58:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC3E6F80165;
	Thu, 26 Oct 2023 19:58:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83C1BF8019B; Thu, 26 Oct 2023 19:58:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65987F80152
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 19:58:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65987F80152
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-1e98e97c824so1160406fac.1
        for <alsa-devel@alsa-project.org>;
 Thu, 26 Oct 2023 10:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698343124; x=1698947924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8z1yGiJBBI9AoK8qoFUV3Ia7kjAwo9PR+/1kimU+UtM=;
        b=sMUMUf6wq2ipB5tnIMC6mX+fp053eWe7JcL8NwLq3GP1il1PoaTwZi8eLUiFPM2VG8
         zmjcXHLa8bcB7IrH98bGkFRfwFnFXTJxz9bATL4TjUdsKM/jP0rxqvKnwqHj9oiFceji
         i+iJUnEbXBTcJxs0yRZBV/VNR/9rxsYCYMiEymvlZwbKikN4qQnWvDDuEXnuiHfVWHCn
         Tm1y5uvay2/qED0UOSoABQQPP6H93V71iwu5m1VorVxpHUEbPMaglY/ww/iCOnACzAzz
         6WckFmaw1n2mpDklY0H1xCFn6IwMdA37AyiUO1gzNA7HhG+ALjr3QHxFPCAapsFPkR7b
         nayg==
X-Gm-Message-State: AOJu0YyuMZdcGzgzPc7nj139ImvkESN5cHmzORYHd3a9qOtAOhR04CpU
	nM0b6BiYTg95Jt1skN3XKA==
X-Google-Smtp-Source: 
 AGHT+IHr9EOYODQ6j0BtriylyMdcCEFd57N1ORR/U0SxrpWPOj4Kh9FB988mGZIYTgeXUar4RzptMg==
X-Received: by 2002:a05:6870:10d4:b0:1e9:eb35:c548 with SMTP id
 20-20020a05687010d400b001e9eb35c548mr313657oar.6.1698343124249;
        Thu, 26 Oct 2023 10:58:44 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 v24-20020a056830141800b006ce3241a7fasm2740604otp.72.2023.10.26.10.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 10:58:43 -0700 (PDT)
Received: (nullmailer pid 4107072 invoked by uid 1000);
	Thu, 26 Oct 2023 17:58:42 -0000
Date: Thu, 26 Oct 2023 12:58:42 -0500
From: Rob Herring <robh@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] ASoC: dt-bindings: sound-card-common: List sound
 widgets ignoring system suspend
Message-ID: <20231026175842.GA4101469-robh@kernel.org>
References: <20231023020718.1276000-1-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023020718.1276000-1-chancel.liu@nxp.com>
Message-ID-Hash: CPLMJMJQPDUJ3EXWYNK3OGWZXJYHIN4V
X-Message-ID-Hash: CPLMJMJQPDUJ3EXWYNK3OGWZXJYHIN4V
X-MailFrom: robherring2@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CPLMJMJQPDUJ3EXWYNK3OGWZXJYHIN4V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 23, 2023 at 10:07:17AM +0800, Chancel Liu wrote:
> Add a property to list audio sound widgets which are marked ignoring
> system suspend. Paths between these endpoints are still active over
> suspend of the main application processor that the current operating
> system is running.

Perhaps it would be better to define components used for low power 
audio rather than the OS mode that gets used. Isn't LPA just audio 
handling that doesn't require the OS CPU to be involved? So the state of 
the CPU is kind of orthogonal.

Rob

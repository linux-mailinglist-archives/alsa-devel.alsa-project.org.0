Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B719A30AB
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2024 00:25:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6856284D;
	Fri, 18 Oct 2024 00:25:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6856284D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729203945;
	bh=hJcKXZZqP1q18W3w7Qs8TRcql16FNs7FzZ3BFU+kkYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R75IQfjWYdVpWyBqMVUDAGGetXgPGqx7f0WlCQc++aBr6ahYM+lBvTw4DPwHU+LNW
	 hRLcb69oXjYsaZpHxXuLPUMPxnbBiKbr8LrEyuOaD2pW5V1CuJ2FdBpDK0TD6yynqz
	 XNZDCmazX8Y+kk58I9eythgvDfapxwODGdsWCOWo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83BC2F804F3; Fri, 18 Oct 2024 00:25:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B71BF804F3;
	Fri, 18 Oct 2024 00:25:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C03A8F80448; Fri, 18 Oct 2024 00:24:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0210EF80149
	for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2024 00:24:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0210EF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HbItzteo
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-539f72c8fc1so1712772e87.1
        for <alsa-devel@alsa-project.org>;
 Thu, 17 Oct 2024 15:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729203884; x=1729808684;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VocsO7a9C7Q0Qui7xbnKUaUO0s/uFElHeUCAM0fdE+E=;
        b=HbItzteoPXmdiDVpVHnn0RgaLASiROYCjUUoGbiHpbyNEN7nAaxt+fuFbIVTNXWPEF
         Tu0Q4DPFJyQOtLbnYyGBnPRtENH36Or/4XYBMzSbW+wCQYNCkxSwehymTXcwnxS97Dxl
         zdj+G49v9mFoYo6rsAVAxCNb2QuJgwJO07qviQoqjCul+p+sSKmA838MdlQDmxxFv8dp
         eb0YkesHe9TO062mTCwwjtLEQa3HNPVkXzzYWbb7qGyXAW6Ckgh+eoExJXBL4uuJUnXl
         zAzrDB7ntlrxUXntDNjh+gsQhGhXPsSkTmmJjRLeergHNiWdmzyy6iwJThwx6P4abfFq
         69BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729203884; x=1729808684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VocsO7a9C7Q0Qui7xbnKUaUO0s/uFElHeUCAM0fdE+E=;
        b=IwL+mQN1dn/47BeyRnPcV7zREN3Sg4Li1Ly/QLMFcMKKKDrcuK0zxtJkPhCC/6801O
         /m4YJ2k4RBqxZ9tPcRTNYbwMeTjj32UfvAhqDvJQQNCdRHUCWYVL0Jk4wtORE4HfxUQV
         txpZdlewHC7KHo9oy4UChvyIENgWTwnecKpL4r7zdNkh93R4cbRBeYM1bHIM8sRjv3wb
         jovJtF9aZM3GpDI7efLLUYPtpXKZNmJIssQVUJy8E3OhQ+2Q6cpvQVM3i1toAcWVCgmz
         fNAshchvmLoikbXGWDAQ9dY3uLO8dz2n/0AJLK4QSi1+CXJTU8R0h4tP7+pFasBOWQwU
         2Vyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF1WpaMh4l7NNBzob4a76ZthA+vEMi2l4Rw+/lLFTKU+rp6qKQmK03Qj2AFENx7n0IKpWganQNSFxc@alsa-project.org
X-Gm-Message-State: AOJu0YzyoxrNVCvhFmjF0mNym2nLYQeRgym2dnDOgMenkCsIZrWMzZBd
	D48Z4spsBCCMCpV2Pdf8gbY2MVIAE2qVP/gALNQOe2PxJJ2/WcTBT9+w0OqzKlg=
X-Google-Smtp-Source: 
 AGHT+IEa6anJV3E0K7CppiPuZYQbyLcF3shfaKC5Kb78/SiQ3aJxOxbLaEaE05j/Agx5EYEUizZnhg==
X-Received: by 2002:a05:6512:b06:b0:539:e1ea:c298 with SMTP id
 2adb3069b0e04-53a15218cdbmr264581e87.22.1729203883984;
        Thu, 17 Oct 2024 15:24:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a15211bbcsm44012e87.284.2024.10.17.15.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 15:24:43 -0700 (PDT)
Date: Fri, 18 Oct 2024 01:24:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: srinivas.kandagatla@linaro.org, a39.skl@gmail.com,
	linux-sound@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
 perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 vkoul@kernel.org
Subject: Re: [PATCH v2] ASoC: codecs: lpass-rx-macro: fix RXn(rx,n) macro for
 DSM_CTL and SEC7 regs
Message-ID: <nhpeyezvodnww4m4hou3of5xy7lbvme5jydpprpmj3yzr7yarj@thiyvzume4bo>
References: <20241016221049.1145101-1-alexey.klimov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016221049.1145101-1-alexey.klimov@linaro.org>
Message-ID-Hash: OHOEBW67MIE2HSURITX2CSDEVPWOZIUY
X-Message-ID-Hash: OHOEBW67MIE2HSURITX2CSDEVPWOZIUY
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OHOEBW67MIE2HSURITX2CSDEVPWOZIUY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Oct 16, 2024 at 11:10:49PM +0100, Alexey Klimov wrote:
> Turns out some registers of pre-2.5 version of rxmacro codecs are not
> located at the expected offsets but 0xc further away in memory. So far
> the detected registers are CDC_RX_RX2_RX_PATH_SEC7 and
> CDC_RX_RX2_RX_PATH_DSM_CTL.
> 
> CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n) macro incorrectly generates the address
> 0x540 for RX2 but it should be 0x54C and it also overwrites
> CDC_RX_RX2_RX_PATH_SEC7 which is located at 0x540.
> The same goes for CDC_RX_RXn_RX_PATH_SEC7(rx, n).
> 
> Fix this by introducing additional rxn_reg_stride2 offset. For 2.5 version
> and above this offset will be equal to 0.
> With such change the corresponding RXn() macros will generate the same
> values for 2.5 codec version for all RX paths and the same old values
> for pre-2.5 version for RX0 and RX1. However for the latter case with
> RX2 path it will also add rxn_reg_stride2 on top.
> 
> While at this, also remove specific if-check for INTERP_AUX from
> rx_macro_digital_mute() and rx_macro_enable_interp_clk(). These if-check
> was used to handle such special offset for AUX interpolator but since
> CDC_RX_RXn_RX_PATH_SEC7(rx, n) and CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)
> macros will generate the correst addresses of dsm register, they are no
> longer needed.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

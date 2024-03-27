Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F0A88ECB8
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 18:33:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA83C2C36;
	Wed, 27 Mar 2024 18:33:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA83C2C36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711560827;
	bh=3+VqtmATpJblwRQt9MVkGbCCHJ4KeR0YviYHYv4LBC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aq68TLFL9kBV2XW1tuTZdEBnflhXNqLHShjW+aaWLEEP5LjVL/C3VjsrNdn0uH0Lp
	 Lp7bK2iS6kRvwHEZ71Sg5F1Ksbm1qgrkIN/q71tPR0yLIfxvx7Kg6O+ZUxpqeO2jfF
	 TTkesm/Rfj96qdcFpu+bLuOFT+isoWOKSbYPW8lk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FA3AF80563; Wed, 27 Mar 2024 18:33:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD30BF8057C;
	Wed, 27 Mar 2024 18:33:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09BF8F8025F; Wed, 27 Mar 2024 18:33:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 203B9F80093
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 18:32:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 203B9F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Qwe7dwQ8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2C9B1CE2772;
	Wed, 27 Mar 2024 17:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396A4C433C7;
	Wed, 27 Mar 2024 17:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711560754;
	bh=3+VqtmATpJblwRQt9MVkGbCCHJ4KeR0YviYHYv4LBC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qwe7dwQ8aexSMGFGOq7jVjNjV18DghOH/LISpBbFjJI7UDK92aWvKB2T6oE3fIWis
	 mYvWLE5AeVmBAeh7UjBQOFOtmIDfxEH3xfOO6U0abqnePrtntxaI+rrQiOPfen8cOf
	 e/AAkjtKPpJERDcVkSR2RanVewGdjaleblntoazWlO0qzV+O7IyJkYIclSCmISFM1F
	 TcKfgCS/rcH+Tdp8tGQ30ucgET8pnsJP3Qv+dWVXmEtkceaVOTo0N3XXk1KMxY1J6G
	 r0ZC/OhRhLj6ChfuLhqQt3ToSpBf+eRhIjwPRlO4cK3q12k7M7IkUqgDuHDm1X9N/d
	 6mCWkSHWO+gGA==
Date: Wed, 27 Mar 2024 12:32:32 -0500
From: Rob Herring <robh@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: supercraig0719@gmail.com, conor+dt@kernel.org, YHCHuang@nuvoton.com,
	linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
	SJLIN0@nuvoton.com, scott6986@gmail.com, perex@perex.cz,
	tiwai@suse.com, robh+dt@kernel.org, broonie@kernel.org,
	alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	dardar923@gmail.com, devicetree@vger.kernel.org, CTLIN0@nuvoton.com,
	linux-sound@vger.kernel.org, KCHSU0@nuvoton.com
Subject: Re: [PATCH v5 1/2] ASoC: dt-bindings: Added schema for
 "nuvoton,nau8325"
Message-ID: <171156075147.3680539.3171999562825718335.robh@kernel.org>
References: <20240327075755.3410381-1-wtli@nuvoton.com>
 <20240327075755.3410381-2-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327075755.3410381-2-wtli@nuvoton.com>
Message-ID-Hash: XBTKORCKZVL36ZEDXMTB36KSGLE76CGD
X-Message-ID-Hash: XBTKORCKZVL36ZEDXMTB36KSGLE76CGD
X-MailFrom: robh@kernel.org
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 27 Mar 2024 15:57:54 +0800, Seven Lee wrote:
> Add a DT schema for describing nau8325 audio amplifiers. The key features
> are as follows:
>   - Low SPK_VDD Quiescent Current
>   - Gain Setting with 2-wire interface
>   - Powerful Stereo Class-D Amplifier
>   - Low Output Noise
>   - Low Current Shutdown Mode
>   - Click-and Pop Suppression
> 
> More resources :
> https://www.nuvoton.com/products/smart-home-audio/audio-amplifiers/class-d-series/nau8325yg/
> 
> Signed-off-by: Seven Lee <wtli@nuvoton.com>
> ---
>  .../bindings/sound/nuvoton,nau8325.yaml       | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DD175A21B
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 00:41:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFFC73E7;
	Thu, 20 Jul 2023 00:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFFC73E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689806496;
	bh=qrdWCQK214hl1LeQQAZG5WIyx6uTUdmIiR4IHkfdhLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b1AL6A7/GWePf6gkAuPbi//WqQ2pRy5aXx6umIPGZAQxfYREQSFbfYIj180hD2dvc
	 lwo8fXAIAXjiRe4nYDGcQzLDYd15AHtkY5ujJiFPQDBARMgRCT0blhht9FQXygY+qa
	 q70zWHhH6Bl/7rJzhmrrEXfwGKrsfzyWSO9/W2I0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B66DF80549; Thu, 20 Jul 2023 00:40:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42E02F80494;
	Thu, 20 Jul 2023 00:40:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71DD5F80564; Thu, 20 Jul 2023 00:40:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80687F80558
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 00:40:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80687F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qXtznVOu
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2CE7E61867;
	Wed, 19 Jul 2023 22:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09B6C433C8;
	Wed, 19 Jul 2023 22:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689806431;
	bh=qrdWCQK214hl1LeQQAZG5WIyx6uTUdmIiR4IHkfdhLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qXtznVOuaSYMubANpDEyplsjCDQ8j6R3XJw5Hz3AZezZKlHIMRHAMDaNWD35LrlB0
	 /Tp2YO99xn7Eg0c8TMqVE8+YGC9oW3W0yDERn2sEzAykplZqrjBV9Vlpq0FyVNC/k0
	 pulmEapILi3AamNmGrRX4H3KlrfEIS+qBgrBv4WAEnA9Cj13i3SxIYQ/Pi4O312qhy
	 BxzZAB0XH6+ekitSAQr8EmyzfMQcjAqy1P8vOAlul60LRIkfG9AXYjJA7FfJRR93jJ
	 BsG6iIBsk5XiKlMRgYFJoeBUiTwH76+RYEAFTxjJnbPLCzsdZNDvZpDXgjGAHT6Mg+
	 0+JR2T4VXn1Hw==
Received: (nullmailer pid 900862 invoked by uid 1000);
	Wed, 19 Jul 2023 22:40:29 -0000
Date: Wed, 19 Jul 2023 16:40:29 -0600
From: Rob Herring <robh@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: alsa-devel@alsa-project.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, CTLIN0@nuvoton.com,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 2/2] ASoC: dt-bindings: nau8822: Add MCLK clock
Message-ID: <168980642934.900810.16549122314642905552.robh@kernel.org>
References: <20230719124752.248898-1-francesco@dolcini.it>
 <20230719124752.248898-3-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230719124752.248898-3-francesco@dolcini.it>
Message-ID-Hash: EOQ6W2V5KSR4N6N4SYV7Q5L2TGHC5NH4
X-Message-ID-Hash: EOQ6W2V5KSR4N6N4SYV7Q5L2TGHC5NH4
X-MailFrom: SRS0=QU89=DF=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EOQ6W2V5KSR4N6N4SYV7Q5L2TGHC5NH4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 19 Jul 2023 14:47:52 +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add nau8822 master clock input.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  .../devicetree/bindings/sound/nuvoton,nau8822.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


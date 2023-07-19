Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3745875A21A
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 00:41:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B5F020C;
	Thu, 20 Jul 2023 00:40:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B5F020C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689806489;
	bh=8UkSiNiVeE9+fz85NbdSbU/eHOWoE2ija6HcvmQcNtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W1Vwe9aRybUbfD6cQSPYGhXBG6TLIeY33TNWSycP6AskWxBK05vRfbemj79Y+T7Wo
	 misC86OM9ZERUNh0BYckOHbFclvtUTsowNKnoZznQbqth7TfXVCqJQOjZriMPlE45g
	 JOmZKfNF6hmo+jz1vitxG2tSI5I2Zw1RMbJPYYUw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D0DDF80153; Thu, 20 Jul 2023 00:40:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BE2EF80548;
	Thu, 20 Jul 2023 00:40:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41D3BF80551; Thu, 20 Jul 2023 00:40:20 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F2B57F80153
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 00:40:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2B57F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HMRIuOmH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9D48D61856;
	Wed, 19 Jul 2023 22:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD7DC433C8;
	Wed, 19 Jul 2023 22:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689806416;
	bh=8UkSiNiVeE9+fz85NbdSbU/eHOWoE2ija6HcvmQcNtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HMRIuOmH74tUoEaDWhDjbvBmRBEnTKZDDblR4iDpUHmDPSQHKpZDz2nOFlzicbAhn
	 jjlVqftFzcExqQo4sbs59MqC97T/kpXf3/sRYGx8KJbbyO3v8u/WSfA9+k/4+03hmd
	 B5BiQlTzxHmNuETowZRx92kNf1Gl+37CraoWN0jlcGlXdyizXqqBUmfhZosFkx2iK8
	 VQj910usiJGJGFvyXOSPZVPgbUJGk1hfMmkjrOqLf/1Lh/6BwyCuvfYtSd/DAguny3
	 PsM77X/vExgeiu2qBsUMRlzbiwGCYCQ/7zY/N+i10ldze+643KsVYl10EKxEn+1yjd
	 TxhS2QN4jvKMg==
Received: (nullmailer pid 900473 invoked by uid 1000);
	Wed, 19 Jul 2023 22:40:14 -0000
Date: Wed, 19 Jul 2023 16:40:14 -0600
From: Rob Herring <robh@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, CTLIN0@nuvoton.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: nau8822: Add #sound-dai-cells
Message-ID: <168980641364.900412.9978374566695268236.robh@kernel.org>
References: <20230719124752.248898-1-francesco@dolcini.it>
 <20230719124752.248898-2-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230719124752.248898-2-francesco@dolcini.it>
Message-ID-Hash: V4U3MNYDFVEMFYXAJKLBZOWU4BRDC5K4
X-Message-ID-Hash: V4U3MNYDFVEMFYXAJKLBZOWU4BRDC5K4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V4U3MNYDFVEMFYXAJKLBZOWU4BRDC5K4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 19 Jul 2023 14:47:51 +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add #sound-dai-cells property and reference dai-common.yaml schema, this
> is required since NAU8822 can be used as a platform DAI link.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  .../devicetree/bindings/sound/nuvoton,nau8822.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


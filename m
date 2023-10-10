Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A6F7C04D1
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 21:41:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57586151D;
	Tue, 10 Oct 2023 21:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57586151D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696966916;
	bh=jLybmmqCIxDnVXPrUBWg4L5usGGWYSA0Tz28a1z32eI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sJFpiqhn02//7ref8XVjJTU6KJugktGD+jZ59nR2gEPwD8RAqFVWQ/RvYAm2OeQRf
	 sZOrsguF4wHjAIl9yY0BcEHFtcXIRftvvzLTeolI5FMe3lZNO58AN/gycIzHNXSii3
	 XI7a6Da1mLq7jbj3GKc0Em8u2L3PKP4LHlhC1SBg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E66FF802BE; Tue, 10 Oct 2023 21:40:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 707FCF8027B;
	Tue, 10 Oct 2023 21:40:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C7B4F802BE; Tue, 10 Oct 2023 21:39:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73B69F80166
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 21:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73B69F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OhW6aqX9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2D666CE1E52;
	Tue, 10 Oct 2023 19:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201B5C433C8;
	Tue, 10 Oct 2023 19:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696966757;
	bh=jLybmmqCIxDnVXPrUBWg4L5usGGWYSA0Tz28a1z32eI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OhW6aqX9qYWPUWDh37OuLKGEds1Y7s1JNlK96sq2lea69gtAuYyBX2UHuUwcaXK95
	 zLhbTqJYwaovHiATNuAGy/MUR/Gg0JsxiQr9vmUheTGlJMzqNeFocPgWhdBL6MTOnp
	 UDcWMNtPTTjPqQTloYsW3osT26E89Zn5H2pQYVYQaGLzp4c8zp5yRYbsDUB8nEKfPY
	 +/sbb5C1vPCnXsDRH2ZDOu+FRU1vqIBO06uSaEOSQK5HOF0MZE1pzvPGc2CK4gTxOa
	 njcpS2CjFU05n6LE+fj55Rdto71TywMmlhWyFeIcxXn8RhgEcEUXl991NqB62WqsU7
	 WYLkmafY6SOkg==
Received: (nullmailer pid 1426033 invoked by uid 1000);
	Tue, 10 Oct 2023 19:39:15 -0000
Date: Tue, 10 Oct 2023 14:39:15 -0500
From: Rob Herring <robh@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: conor+dt@kernel.org, s.hauer@pengutronix.de, broonie@kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, linux-imx@nxp.com, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, robh+dt@kernel.org, festevam@gmail.com,
 kernel@pengutronix.de
Subject: Re: [PATCH v2 3/3] ASoC: dt-bindings: fsl,mqs: Convert format to
 json-schema
Message-ID: <169696675468.1425993.2823968878328380539.robh@kernel.org>
References: <20231010133838.799714-1-chancel.liu@nxp.com>
 <20231010133838.799714-4-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010133838.799714-4-chancel.liu@nxp.com>
Message-ID-Hash: GKHYFZSS7IONV43CP2CMW7UFZ7CFDAIS
X-Message-ID-Hash: GKHYFZSS7IONV43CP2CMW7UFZ7CFDAIS
X-MailFrom: rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GKHYFZSS7IONV43CP2CMW7UFZ7CFDAIS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 10 Oct 2023 21:38:38 +0800, Chancel Liu wrote:
> Convert NXP medium quality sound (MQS) device tree binding
> documentation to json-schema.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,mqs.txt     |  36 ------
>  .../devicetree/bindings/sound/fsl,mqs.yaml    | 113 ++++++++++++++++++
>  2 files changed, 113 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/fsl,mqs.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,mqs.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


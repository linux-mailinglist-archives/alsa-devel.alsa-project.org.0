Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9941E82F559
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jan 2024 20:28:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37B5C20E;
	Tue, 16 Jan 2024 20:28:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37B5C20E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705433294;
	bh=vBWLu8oHrZSwoN6aHtVx9YgfqkzR3n3V63/JGBFBvgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZnZayybEUmnVYKSMga8wd+Cx+Z1GeUznWJas1K+prIX7H4NyDx0znRyJFLI+gZ7OH
	 1VdI9w+hNS+ffm28TLanHprmKCBtkO2w2mRVAQfW4n2wVs11zQcU0TxP9rIu4cfSk9
	 3+EfyRwJyFPuc/sujSGlnd/b12A/RIfqwdUgk3YI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 794E8F80564; Tue, 16 Jan 2024 20:27:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EEB3DF8057E;
	Tue, 16 Jan 2024 20:27:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 527E5F801F5; Tue, 16 Jan 2024 20:27:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C55AF800F5
	for <alsa-devel@alsa-project.org>; Tue, 16 Jan 2024 20:27:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C55AF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WUX/YzJ3
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id F3B62B80D60;
	Tue, 16 Jan 2024 19:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D0DC433F1;
	Tue, 16 Jan 2024 19:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705433249;
	bh=vBWLu8oHrZSwoN6aHtVx9YgfqkzR3n3V63/JGBFBvgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WUX/YzJ3V1h/6jM1zyh4v68+kfhTEJaEI9PRNiDhyi1007mqpShYR0h8hSYbRySO3
	 mPvJg51xtSjKaPtZllVhHCXl0ZB5g6KzMm+3lBOuEVsn8Bm9WA4U0L//JWSGx4UD3R
	 /tsF26L6xS/bLyksbSX6ZxbRBVHX4Dis6c6t2q/O1oA7VZ1ueUKt2HrUSBetzkg31i
	 f7O002Yn58NFmK2hjZZ8lXqC22FourVoI29spnEV0lA3I7lPShQTYTo/X0/CmYcPFL
	 Wm/Iuh63JBkI5BDk31+CBqXkriYjITIGY6lMf4nib8rcXZs8R3fo5GoJiWg9AzggJ3
	 SydBDRYamJsUQ==
Date: Tue, 16 Jan 2024 13:27:26 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>, devicetree@vger.kernel.org,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Do not override firmware-name $ref
Message-ID: <170543324653.279718.18172687756006729713.robh@kernel.org>
References: <20240115182017.1610055-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240115182017.1610055-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: V6663PZ6QTQSABPMCRJ3COBJ5KJ42AGC
X-Message-ID-Hash: V6663PZ6QTQSABPMCRJ3COBJ5KJ42AGC
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V6663PZ6QTQSABPMCRJ3COBJ5KJ42AGC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 15 Jan 2024 19:20:17 +0100, Krzysztof Kozlowski wrote:
> dtschema package defines firmware-name as string-array, so individual
> bindings should not make it a string but instead just narrow the number
> of expected firmware file names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/fsl,easrc.yaml        | 4 ++--
>  Documentation/devicetree/bindings/sound/infineon,peb2466.yaml | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


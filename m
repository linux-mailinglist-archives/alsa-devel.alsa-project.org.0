Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5979B3B495
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Aug 2025 09:45:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA3CB602B9;
	Fri, 29 Aug 2025 09:44:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA3CB602B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756453502;
	bh=UK2uW67ec5x+08v6vV2jlWqCPKcZr8vv4roBxG38sHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NjSSwG+dodIWb+U2gJ78DEMCXtIL0jfAjDwLNH91DKno7V0scn1LAS1wHi4bh0jva
	 FkSVu2r/vOEI4JFkkbkg8+DSfcU4tB4rtCZHeMbQl8FkwKZkWrBiB4kjfI8PSiH4hy
	 0zSP3+BSyQqkjGARorqIPWEsezPTVETfe+NBk4Rw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 450BCF8057B; Fri, 29 Aug 2025 09:44:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ED8AF805C8;
	Fri, 29 Aug 2025 09:44:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DF37F80171; Fri, 29 Aug 2025 09:43:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81DADF80149
	for <alsa-devel@alsa-project.org>; Fri, 29 Aug 2025 09:43:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81DADF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NvfiFxAY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 578E944AFB;
	Fri, 29 Aug 2025 07:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92DD7C4CEF0;
	Fri, 29 Aug 2025 07:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756453413;
	bh=UK2uW67ec5x+08v6vV2jlWqCPKcZr8vv4roBxG38sHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NvfiFxAYJ7gJJr1nu2uBXoz8U6xai4fMXhrg3dEmLBMVEOQoB6cW3wn5loGt4Qshd
	 6bWokTKBP4rPg7MtN9FpXLwasYeTPN47LIhv8Fq6vxwCifTxj1/1SK1RvCUSArLq91
	 0rxOHkKL4FG7FCqYwz0qbw+WG7zfePy3um0+POPsmbNMG7Yjzg6CyY7l3Fhwxpir8I
	 fYPX18UOLiIPNwQKkVTHtY2jXaPsBQERnV8PZK3cDjvSwiDSuFGR3GCpCZUWdCZEM4
	 5dvqQvwnV/Twy+m0AnrwwqGGB2URxnDt3dqBaNxVOyodeuGAv3/JbbsF5tEr32C/ec
	 EWl0YbIXEoc9w==
Date: Fri, 29 Aug 2025 09:43:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: broonie@kernel.org, tiwai@suse.de, andriy.shevchenko@linux.intel.com,
	13916275206@139.com, alsa-devel@alsa-project.org, shenghao-ding@ti.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, k-yi@ti.com, henry.lo@ti.com, robinchen@ti.com,
 jesse-ji@ti.com,
	will-wang@ti.com, jim.shil@goertek.com, toastcheng@google.com,
	chinkaiting@google.com
Subject: Re: [PATCH v3 2/2] ASoC: tas2781: Add tas2118, tas2x20, tas5825
 support
Message-ID: <20250829-turquoise-jackdaw-of-joy-cc91fc@kuoka>
References: <20250825034039.9713-1-baojun.xu@ti.com>
 <20250825034039.9713-2-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825034039.9713-2-baojun.xu@ti.com>
Message-ID-Hash: HFMTKTT42OVSPDVH6TNL5QL2WPHEP65Q
X-Message-ID-Hash: HFMTKTT42OVSPDVH6TNL5QL2WPHEP65Q
X-MailFrom: krzk@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HFMTKTT42OVSPDVH6TNL5QL2WPHEP65Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 25, 2025 at 11:40:39AM +0800, Baojun Xu wrote:
>  allOf:
>    - $ref: dai-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - ti,tas2020
> +              - ti,tas2118
> +              - ti,tas2120
> +              - ti,tas2320
> +    then:
> +      properties:
> +        reg:
> +          description:
> +            I2C address, in multiple-AMP case, all the i2c address
> +            aggregate as one Audio Device to support multiple audio slots.

I don't think you resolved Rob's comment.

> +          maxItems: 4
> +          items:
> +            minimum: 0x48
> +            maximum: 0x4b

Also, fix finally order of patches so docs go before the user (see
submitting patches in DT dir).

Best regards,
Krzysztof


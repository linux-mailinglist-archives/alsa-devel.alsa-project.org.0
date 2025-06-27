Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 881F6AEB060
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 09:44:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33704601E0;
	Fri, 27 Jun 2025 09:44:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33704601E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751010270;
	bh=kz3halVjDAvMYM/eCk68+xflrEIhAJlSuhTmJPcBC9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KjFJIE8HchxxnoJenfKlreUYJu5D357Z1JS0Jhr6hLiighF5vo97u0ABFMKRjuApC
	 jVN9z1DCW2tucHP6ewVYvZAZI/VtIrmC++AEm5T1DNJ5T/dWJr1k5CuH6Pl0W2W5x5
	 rHzUxlT9cHu3t9Oj0ZgCkgBvbs4Ed5OMFO6PaHus=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 041A0F805CB; Fri, 27 Jun 2025 09:44:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E58E4F805C6;
	Fri, 27 Jun 2025 09:44:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26DEDF80217; Fri, 27 Jun 2025 09:44:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org
 [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3118EF800E4
	for <alsa-devel@alsa-project.org>; Fri, 27 Jun 2025 09:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3118EF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mcj0jPFs
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8017143421;
	Fri, 27 Jun 2025 07:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B049C4CEE3;
	Fri, 27 Jun 2025 07:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751010238;
	bh=kz3halVjDAvMYM/eCk68+xflrEIhAJlSuhTmJPcBC9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mcj0jPFsExEIls5LXU5mrujeZYLqg+p8Qguxv+vEY46U78oCQ4ihMvaMIgaFDYSpU
	 EpKcsi+MIu9pvfCZ94D5sdAxpp/VObqzLTRfLz3SBqg5NblmhCbzAECYB/z/JvUeQJ
	 Dtrst2Kpe4Ts9ZvKLlyXOjkxWkFBky/N2OAIZTnSdhF1NsttFheZk+GM1x9pxo9IQQ
	 d+ult1iDHosOcCghCyHURmO5IxVBUnV6Fu+DrB1zdOb/kttPciCByAU46aE7VuSkgH
	 rDNLjZ7OFrbceJJ0N+5y3kXk29iqysGR5ISpk9ACwGhyoEXnvYKdRVL9EpUEHqTMp2
	 MpHB2H6FVsk/g==
Date: Fri, 27 Jun 2025 09:43:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: broonie@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com, tiwai@suse.de,
 alsa-devel@alsa-project.org, baojun.xu@ti.com,
	shenghao-ding@ti.com, liam.r.girdwood@intel.com, lgirdwood@gmail.com,
 robh@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, navada@ti.com,
 v-hampiholi@ti.com
Subject: Re: [PATCH v3 4/4] dt-bindings: sound: device support list for
 pcm6240
Message-ID: <20250627-lean-pumpkin-giraffe-6fad55@krzk-bin>
References: <20250626181334.1200-1-niranjan.hy@ti.com>
 <20250626181334.1200-5-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250626181334.1200-5-niranjan.hy@ti.com>
Message-ID-Hash: 45N7ELDHM6J52ONHMLLSO3ZV77CGEIZV
X-Message-ID-Hash: 45N7ELDHM6J52ONHMLLSO3ZV77CGEIZV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/45N7ELDHM6J52ONHMLLSO3ZV77CGEIZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 26, 2025 at 11:43:33PM +0530, Niranjan H Y wrote:
> Removed taa* and tad* device from the support list
> as these devices are supported by tac5x1x codec driver

No, why? Hardware does not change.

> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> 
> ---
> v3:
> - update the subject of the patch file
> ---
>  .../devicetree/bindings/sound/ti,pcm6240.yaml          | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml b/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml
> index d89b4255b51c..b0d5f57dc0f5 100644
> --- a/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml
> +++ b/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml
> @@ -29,8 +29,6 @@ description: |
>      https://www.ti.com/lit/gpn/pcm9211
>      https://www.ti.com/lit/gpn/pcmd3140
>      https://www.ti.com/lit/gpn/pcmd3180
> -    https://www.ti.com/lit/gpn/taa5212
> -    https://www.ti.com/lit/gpn/tad5212
>  
>  properties:
>    compatible:
> @@ -81,10 +79,6 @@ properties:
>        ti,pcmd3180: Eight-channel pulse-density-modulation input to TDM or
>        I2S output converter.
>  
> -      ti,taa5212: Low-power high-performance stereo audio ADC with 118-dB
> -      dynamic range.
> -
> -      ti,tad5212: Low-power stereo audio DAC with 120-dB dynamic range.
>      oneOf:
>        - items:
>            - enum:
> @@ -98,8 +92,6 @@ properties:
>            - enum:
>                - ti,pcmd512x
>                - ti,pcm9211
> -              - ti,taa5212
> -              - ti,tad5212
>            - const: ti,adc6120

All this is ABI break without explanation.


Best regards,
Krzysztof


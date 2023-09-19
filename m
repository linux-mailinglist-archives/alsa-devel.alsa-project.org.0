Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 745967A6B8E
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 21:24:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 251F19F6;
	Tue, 19 Sep 2023 21:23:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 251F19F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695151449;
	bh=L9B6iQFYVFE8/QUAlzZYDGUhWzMyXslVtHTNTP0/pg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V5GXUoAmxh+A8+Yq+hhT8+M5A7kvhnMZ4tV3XPzgNAl5ITDUMp5vz1QFF4Z/c2O+W
	 IMvwhIEHHG+gHoOKaWHAzn7/7DR0r/pGn3Pm+Wc9iXYbQz5qmFIBOuEpzewO3q/1Tw
	 nVY0/oqFc0A5/J4MUAlj9O1/P155SYkvTE5E+F+w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AC5DF80549; Tue, 19 Sep 2023 21:23:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18600F801F5;
	Tue, 19 Sep 2023 21:23:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0561AF8025A; Tue, 19 Sep 2023 21:23:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79388F800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 21:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79388F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nXMjocKI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 43239B81761;
	Tue, 19 Sep 2023 19:23:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B15C433C7;
	Tue, 19 Sep 2023 19:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695151384;
	bh=L9B6iQFYVFE8/QUAlzZYDGUhWzMyXslVtHTNTP0/pg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nXMjocKI9U/ID2nceoowFp0f1rdOUerNUb0a/Dc78S45mJJZvivEDg7/PE0kd0n19
	 pjbXlHJms5NC23Wc8jj/Ie2VrbCZ80U5saYJBunoauCWjHX5SBPdlFlmLv5fGLB9/C
	 2bLkwEsGyciU5gcwhx7CAy95HM/HkXloV05f6e7o1LAklUDLDWdvbISThXUAEdM0lb
	 I9oyGoxutjNzKUt5BV6JVCrgNZfryd87eVN+qqgffEXdIFUPwkbVp7bgStNicQutla
	 eUmAFGl/zpns+Np8UJx8MBUlNGVTpLpuUAQ2PjW/zgGT3B/VwOnCz3v6zeonnLr+ZR
	 5H6+AKxcr0ESA==
Received: (nullmailer pid 56749 invoked by uid 1000);
	Tue, 19 Sep 2023 19:23:02 -0000
Date: Tue, 19 Sep 2023 14:23:02 -0500
From: Rob Herring <robh@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 1/5] dt-bindings: ASoC: cirrus,cs42l43: Update a couple
 of default values
Message-ID: <20230919192302.GA51154-robh@kernel.org>
References: <20230919103116.580305-1-ckeepax@opensource.cirrus.com>
 <20230919103116.580305-2-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919103116.580305-2-ckeepax@opensource.cirrus.com>
Message-ID-Hash: CXDRXA5SUBNIIEJINWNBGNCYNO64CFOL
X-Message-ID-Hash: CXDRXA5SUBNIIEJINWNBGNCYNO64CFOL
X-MailFrom: SRS0=1Vuh=FD=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CXDRXA5SUBNIIEJINWNBGNCYNO64CFOL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Sep 19, 2023 at 11:31:12AM +0100, Charles Keepax wrote:
> The bias sense is being enabled by default in the driver, and the
> default detect time is being dropped slightly. Update the binding
> document to match.

That's not really a compatible change. If I wrote my DT expecting bias 
sense was disabled by default then the OS changes behavior, my 
platform behavior would change. Maybe that doesn't matter here? IDK. 
It's on you if this breaks anyone, so:

Acked-by: Rob Herring <robh@kernel.org>

> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
> index 7a6de938b11d1..4fa22fa70ace5 100644
> --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
> @@ -83,7 +83,7 @@ properties:
>        Current at which the headset micbias sense clamp will engage, 0 to
>        disable.
>      enum: [ 0, 14, 23, 41, 50, 60, 68, 86, 95 ]
> -    default: 0
> +    default: 14
>  
>    cirrus,bias-ramp-ms:
>      description:
> @@ -97,7 +97,7 @@ properties:
>        Time in microseconds the type detection will run for. Long values will
>        cause more audible effects, but give more accurate detection.
>      enum: [ 20, 100, 1000, 10000, 50000, 75000, 100000, 200000 ]
> -    default: 10000
> +    default: 1000
>  
>    cirrus,button-automute:
>      type: boolean
> -- 
> 2.39.2
> 

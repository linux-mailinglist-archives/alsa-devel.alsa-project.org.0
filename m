Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85415678A6A
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 23:11:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1F84E78;
	Mon, 23 Jan 2023 23:10:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1F84E78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674511882;
	bh=45PK4+sJ2sFK3pYXBEj4/8TOmd056DUqCAExCCxRA5M=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Va/hkFrwcIZX6A6kd6ZrcH/RTkxm9th0DoBCHF85zny+exOfLiRgf+Nu5KLNOFw47
	 W0vlIuU0S5w9PllRurhYWmwT4y4BZXZbsqZxa26Wehhb8vft1Cw4PJKaBspD01nJRj
	 EmHads4cB9M//NHGeLrppiaUIwpcZr474s6zf3GE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42EC5F804FC;
	Mon, 23 Jan 2023 23:10:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC112F804FC; Mon, 23 Jan 2023 23:10:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCCB6F804C2
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 23:10:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCCB6F804C2
Received: by mail-oo1-f50.google.com with SMTP id
 r1-20020a4a3701000000b004f2b4f8200eso2357243oor.7
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 14:10:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Em4yLToJJ1hEYDhrB1K/Pnv5W/1yBPepHvqgVre0Rt8=;
 b=6csYJhADb/tVMj6IYvR/Z0q3r69htrhKM2hPiGBbLHAlyb1D7+z1Xzy6N6WyPEOK5y
 SS3L3DryzLia+3J4V2n89povCbM1NFGeodOWL4SEtcvkFphZea3exTkX7XZDp/RMsh0e
 E713MEieN1mfJifJhSYg5HajqkCuIJdZNcLQnuI/yWrRa6OYnMui/a6ZlbdUBREEj1fX
 K7nyqqff2368i/F7jprp8pZkta/1ef+6fwcCVU8TgLsfEaCWONVh6u5yhse2PO/6lLq0
 aszN+vSldsloO18JZ7ZMnVS9pNlVSWPh6LKLSbgyCKtnubMBAbM51s1d33V8h0P/UMwX
 izNw==
X-Gm-Message-State: AFqh2koqSks3tuHQbrTKUBrgUZMcFcQo2CKzHwlC+QRy9yvc8WCpLV9d
 71Xr5ukJC7VcbUEdUVMJXg==
X-Google-Smtp-Source: AMrXdXsdzsqBqDlx8hokaDRzfDjWN/30A3SmqaMkdXTIv61SlrrT0+t5Vl11hrtfD7yMBBqcparY2w==
X-Received: by 2002:a4a:d198:0:b0:4f2:19c3:c3a8 with SMTP id
 j24-20020a4ad198000000b004f219c3c3a8mr21656804oor.0.1674511825410; 
 Mon, 23 Jan 2023 14:10:25 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e13-20020a4ac3cd000000b004f28d09a880sm110495ooq.13.2023.01.23.14.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 14:10:25 -0800 (PST)
Received: (nullmailer pid 2727748 invoked by uid 1000);
 Mon, 23 Jan 2023 22:10:24 -0000
Date: Mon, 23 Jan 2023 16:10:24 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: samsung, odroid: correct codec DAI
 phandles
Message-ID: <167451182407.2727709.11885849845114785735.robh@kernel.org>
References: <20230120153020.320270-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120153020.320270-1-krzysztof.kozlowski@linaro.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Fri, 20 Jan 2023 16:30:19 +0100, Krzysztof Kozlowski wrote:
> The order of codec DAI phandles is reversed - first comes HDMI (always
> present) and then codec (physically not present on Odroid XU4).
> 
> Fixes: 97709d365bbd ("ASoC: dt-bindings: Centralize the 'sound-dai' definition")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/samsung,odroid.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

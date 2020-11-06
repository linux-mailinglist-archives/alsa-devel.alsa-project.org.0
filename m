Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4662A9945
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 17:17:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2533C1687;
	Fri,  6 Nov 2020 17:16:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2533C1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604679444;
	bh=tEoiuLbNsHKQItaIYzqe9jxuzG62kVQlNP8jI5wChAo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IEgFMCGVcD4dVuzIA2kIyyiH7uEuq2qvrM9rf2oakSLxDgqukO462cv7GBEQHmTqt
	 gH0Sne4AxWe1gyu0UBvlcGIvPIS2Oetpxuitx3klYUkBpRf5M/34bpNt/XnP2shVZX
	 TZ7vyrOOCX3AMfdAn21Kgy7YgnghW9TFYcijaazA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B892F8023E;
	Fri,  6 Nov 2020 17:15:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CE34F80234; Fri,  6 Nov 2020 17:15:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35A70F800BA
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 17:15:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35A70F800BA
Received: by mail-oi1-f193.google.com with SMTP id d9so1852848oib.3
 for <alsa-devel@alsa-project.org>; Fri, 06 Nov 2020 08:15:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JKTC9t6U56PdRSRllEeWLwbdLXcSPIAe13lQUZ7E930=;
 b=Y23yZeICl2gCa4xXxPHPjlJt/RGCfp/2Wij1fiyoM+OG2lkxE0o2E6xzp8bAalYQhH
 XhgU4pziMBvrdHwdmLe/Ohn1qiDI4eKv8T0w91OqXXpKlwSZuf8dZO19E4pzQDg2FtCB
 sT5VtcbSvgogC4ROCMmkg8LBiBmZvSJjnu1psM9GEOEFSeyAJ4FYDzlLTJgNlERt8coQ
 o8/NEeE7w/sDBjNt8mHSZ+dpNnpJgK8S8jjWfOFncmg1JbDiOfh+cptvptJp/G2Px7P2
 0VH/Xkd1HNS03s+CPqhR+l1DPzv++BPw6iJkClv6xEfT+vsfMWAFuKOZWSRaHjfk0EOE
 OOhw==
X-Gm-Message-State: AOAM530vcR7SzpOMYeYkWXSI1WVA9nmdeMZws1p3OnW+/WO9vO4a6V28
 SKZjfPNGUkScqW/F6+4HsQ==
X-Google-Smtp-Source: ABdhPJyrNJ22bUa+bEB3u2wV8J2lLCG70ySvIv54k7b/vpLloNjlu10MYF+8PMmPZQweX552ICB7lg==
X-Received: by 2002:aca:4454:: with SMTP id r81mr1481777oia.43.1604679341288; 
 Fri, 06 Nov 2020 08:15:41 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u16sm402311ooj.8.2020.11.06.08.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 08:15:40 -0800 (PST)
Received: (nullmailer pid 3296044 invoked by uid 1000);
 Fri, 06 Nov 2020 16:15:39 -0000
Date: Fri, 6 Nov 2020 10:15:39 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 1/7] ASoC: dt-bindings: sun8i-codec: Increase
 #sound-dai-cells
Message-ID: <20201106161539.GA3295779@bogus>
References: <20201106041513.38481-1-samuel@sholland.org>
 <20201106041513.38481-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106041513.38481-2-samuel@sholland.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, phone-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 05 Nov 2020 22:15:07 -0600, Samuel Holland wrote:
> Increase sound-dai-cells to 1 to allow using the DAIs in the codec
> corresponding to AIF2 and AIF3.
> 
> The generic ASoC OF code supports a #sound-dai-cells value of 0 or 1
> with no impact to the driver, so this is a backward-compatible change.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.example.dt.yaml: audio-codec@1c22e00: #sound-dai-cells:0:0: 1 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml


See https://patchwork.ozlabs.org/patch/1395481

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


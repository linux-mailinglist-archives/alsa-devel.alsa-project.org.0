Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2894540AE88
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Sep 2021 15:04:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B980E1788;
	Tue, 14 Sep 2021 15:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B980E1788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631624691;
	bh=fBKmNKEb5yLlVQqU1TtHAJ371L7T1/kFEqZoFHh2tlY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hBjc4ezPirDl5LKhSFM9Ji8q4TODftsKYP8yLyFdGse7WLH7XNSTr2/MBQe3O3d4i
	 2iabpVXHsKTDi0Lpmo0dzEeHTzBMh1Ny3ZxH8S6YfdBouFTBgOxd+EYybeusDBsl9r
	 f9zgi8H736O5tbvEgw54YfDf5jaDN9mcOwScjxg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D89BF80271;
	Tue, 14 Sep 2021 15:03:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 173D8F8025E; Tue, 14 Sep 2021 15:03:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DACBCF80132
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 15:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DACBCF80132
Received: by mail-ot1-f53.google.com with SMTP id
 c42-20020a05683034aa00b0051f4b99c40cso18293490otu.0
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 06:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Pk8zZoiVs5GhCcDVjL5q1Yy6EnpN4Rc7X2p/zks6FFE=;
 b=Dvxu3EyqpwgzExtSpyJDqbUc4r6RPBSjSRmmrNseInefuBYmwZA/yOZhyYKlq2K6oJ
 DVwJDRPdZTS5rxlbK+Xk06IhJcPFE1lmhhnbt7Fwjw1blWPz4ym1HMs0Ma+K7UCTf6d6
 vMBhm50NTeSpueDPnvRPdIjkvMeCxM2sWHEY4XJ+OumDqPV9BJUhOMtcpBp1bb1RyZtf
 kIqVCZwC51PNcIWar1ko5Iuc/zyR6Rv8R9aV+mv+p0cvZgVle3Lq9R5v7OfeI8yZJ0ne
 9Sel6bHtfNmKpW4EvwEGY4nxvuMRkHjBSLbSl7wmhXGAzFkDjbxOJEAzLayO2eyEOhKw
 Piww==
X-Gm-Message-State: AOAM530fIeF8bswikfgEjo961xTfm4EJ4L250on9GuCwfkMWVuKp67TL
 AzsZvOC5J4vkj+zh+02RVg==
X-Google-Smtp-Source: ABdhPJxj4YGFwyTkKruktE3IxyMYlAAtjid+DcwTtzHegIJqvlBcEZixiGAx+ZJhiSnrYOeQI2TVBw==
X-Received: by 2002:a9d:7258:: with SMTP id a24mr14972621otk.190.1631624600949; 
 Tue, 14 Sep 2021 06:03:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w23sm2463246oih.4.2021.09.14.06.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 06:03:18 -0700 (PDT)
Received: (nullmailer pid 3002731 invoked by uid 1000);
 Tue, 14 Sep 2021 13:03:14 -0000
From: Rob Herring <robh@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20210914091204.2204278-1-tzungbi@google.com>
References: <20210914091204.2204278-1-tzungbi@google.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: mediatek: mt8192: re-add audio afe
 document
Date: Tue, 14 Sep 2021 08:03:14 -0500
Message-Id: <1631624594.154331.3002730.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 broonie@kernel.org
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

On Tue, 14 Sep 2021 17:12:04 +0800, Tzung-Bi Shih wrote:
> The document was merged as commit 1afc60e00de3 ("dt-bindings:
> mediatek: mt8192: add audio afe document").
> 
> However, [1] revealed that the commit 1afc60e00de3 breaks
> dt_binding_check due to dt-bindings/clock/mt8192-clk.h doesn't
> exist.
> 
> As a temporary fix, commit 7d94ca3c8acd ("ASoC: mt8192: revert
> add audio afe document") reverted commit 1afc60e00de3.
> 
> dt-bindings/clock/mt8192-clk.h is in mainline per commit
> f35f1a23e0e1 ("clk: mediatek: Add dt-bindings of MT8192 clocks").
> Re-adds the document back.
> 
> [1]: https://mailman.alsa-project.org/pipermail/alsa-devel/2020-November/176873.html
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> Changes from v2 (https://mailman.alsa-project.org/pipermail/alsa-devel/2021-August/189058.html):
> - Simplify the commit message.
> 
> Changes from v1 (https://mailman.alsa-project.org/pipermail/alsa-devel/2021-August/189048.html):
> - Add more context to the commit message.
> 
>  .../bindings/sound/mt8192-afe-pcm.yaml        | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml:10:4: [warning] wrong indentation: expected 2 but found 3 (indentation)
./Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml:15:7: [warning] wrong indentation: expected 4 but found 6 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1527802

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


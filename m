Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A631C3ABE1B
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 23:28:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 434E917AB;
	Thu, 17 Jun 2021 23:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 434E917AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623965336;
	bh=Uxl5bdXlcgeheBnIaOuigwLXR8YPwvdLFb8f8RdFUwQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z/jJkhhWh+f3DfTHrSF8kSnlfYs7M/gWGeVX82dKUOI3ISUXdVDs7F6I/R/V0Bci4
	 YJazzXscektxXHgTdXoiEV4jxh4EBOwJuSOIGDx36JBzzDtGE6BFXm22Y33JEcNiLB
	 LuCgGIvrJ8N4pqhqDqNRhTvbAxZgMAvqgpG9K1fc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90CA4F8049E;
	Thu, 17 Jun 2021 23:26:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FBBBF804D1; Thu, 17 Jun 2021 23:26:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25EFDF8049E
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 23:26:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25EFDF8049E
Received: by mail-io1-f53.google.com with SMTP id a6so4817985ioe.0
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 14:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=WRkbRg9Bf/LCif0asWJibTLvFQ8qESLyCcw61Dt7ZUI=;
 b=noc33NQPWpqgtjUxihIOPHxFfEYhADTIRk8IlriqqPG13SOJS4kql6sXdQxR8Jf5Ux
 R0s2FzO7mvcRrpDffrJp343J6wpi2zjId669jBVEvKUJteKJZZLudu72+FkU542RPc82
 QJL3ERsehWCBqiTroBweT4NCWZlolPUPXY3vTm/euM9+XmWsyF5CpArZHVoh8PJhtlPg
 1K5cmAVMBi9xk18pLw6PFR7sLH1dtFfxAbUoVWXAtCYlNIFA6hZK+t4/ea64PesNmOO/
 WKvDL1yKcFrtShbg/h4gDcZMC46wqwH1roexjI78i77DLoA6g07VFcfr/eHWjr8xGAwt
 YyxQ==
X-Gm-Message-State: AOAM533mRXQry6Zs6YLPx5vc9BxiQoj9A/VXVgzqjm6uOrUPjkQLoyOY
 Ajwl38KXfnYghSrDHorxug==
X-Google-Smtp-Source: ABdhPJz2qR9tCm9/RgsjEGUFcsdmjgfskMAzB3MZ0zAiG+SDMl2EubL2S4imr4UV7CvSdcCsKP3zNg==
X-Received: by 2002:a05:6638:168d:: with SMTP id
 f13mr242927jat.124.1623965203489; 
 Thu, 17 Jun 2021 14:26:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id n2sm3559875iod.54.2021.06.17.14.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 14:26:42 -0700 (PDT)
Received: (nullmailer pid 3336119 invoked by uid 1000);
 Thu, 17 Jun 2021 21:26:24 -0000
From: Rob Herring <robh@kernel.org>
To: Ban Tao <fengzheng923@gmail.com>
In-Reply-To: <20210617131005.2416-1-fengzheng923@gmail.com>
References: <20210617131005.2416-1-fengzheng923@gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings
 for DMIC controller
Date: Thu, 17 Jun 2021 15:26:24 -0600
Message-Id: <1623965184.555815.3336118.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 lgirdwood@gmail.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 wens@csie.org, robh+dt@kernel.org, jernej.skrabec@gmail.com,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

On Thu, 17 Jun 2021 21:10:05 +0800, Ban Tao wrote:
> DT binding documentation for this new ASoC driver.
> 
> Signed-off-by: Ban Tao <fengzheng923@gmail.com>
> ---
>  .../sound/allwinner,sun50i-h6-dmic.yaml       | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.example.dt.yaml: dmic@5095000: #sound-dai-cells:0:0: 0 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1493498

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3869612AD1
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Oct 2022 14:51:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B71815C1;
	Sun, 30 Oct 2022 14:50:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B71815C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667137891;
	bh=KjiSe/9azakk4CqhWfNdRj4wpTv8adnllq1HMP8IDz0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iVMX8DQJCTP/QIyDJSNxdHSzguxFPmqtDYHVW8mIbLwDpessNwZ2EwUMdfooldKTg
	 yqAxC4ErDjI8AWdS4RIwUXAU+1/71aFwP/kq4LbYTAMCmN/Wm2xAoWKDhFKO1CuNqZ
	 aNNO6A0CKv0W/7/FGxsmt7RLZ514nDQXREBAdyrM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0CE3F8023B;
	Sun, 30 Oct 2022 14:50:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82167F80217; Sun, 30 Oct 2022 14:50:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51BB9F800CC
 for <alsa-devel@alsa-project.org>; Sun, 30 Oct 2022 14:50:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51BB9F800CC
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-13c569e5ff5so10774077fac.6
 for <alsa-devel@alsa-project.org>; Sun, 30 Oct 2022 06:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mNqQtPZFw1ZRUiXn/bpdnJoMGSfAm72IDjxJO9YExkw=;
 b=qZICR4CfbqZDBdZ24N5JnWi/utzaiNqsDiFAiPFb67ssbXpN9nMXcl1QyMPy40S5+R
 eWuFlfWPmNxneHzl51bHdArAMCC3kQeXWj9pOM2DMfaTT5rjlwbyMktF7WrS9Zd5MNTL
 iNUANtXkgaCUqaAcSrXyh4KNEzkyux89rgZ9wqMj4TQIiYPwnKNIfMzY2JPAoi5h0GlI
 QzTLDTwJra8xBt6nR/9+8BzIniTGouxFK/uCOdxqqms8Cay9MztvZm/MvpbyNL+f1Zw8
 hRbdBQJ9MxZrOiKMbV8t+SCuGGG5pZ5uTTVMGOCcV2chM60TptdsAfvzSSug6mbIgnE3
 A3ew==
X-Gm-Message-State: ACrzQf3/kxqfGcMFa6KwRgGmQ7mn3g989hOZVUOHtWob3rSEdZT3nMo+
 pOIarbi1fstR06aQvmSV/Q==
X-Google-Smtp-Source: AMsMyM7SrfS+jRFoPnPWEbktrG/CDV4pS8dOM5/QuFFdmGAKqtq17e4SrJOdAQGLFcw5yG4ZvqRQYw==
X-Received: by 2002:a05:6870:e889:b0:13c:c80:7188 with SMTP id
 q9-20020a056870e88900b0013c0c807188mr13919904oan.93.1667137827142; 
 Sun, 30 Oct 2022 06:50:27 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q16-20020a4a88d0000000b00476995b5f0fsm1460946ooh.9.2022.10.30.06.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 06:50:26 -0700 (PDT)
Received: (nullmailer pid 992224 invoked by uid 1000);
 Sun, 30 Oct 2022 13:50:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20221030085358.1619285-2-ajye_huang@compal.corp-partner.google.com>
References: <20221030085358.1619285-1-ajye_huang@compal.corp-partner.google.com>
 <20221030085358.1619285-2-ajye_huang@compal.corp-partner.google.com>
Message-Id: <166713668618.965877.11108951663566363754.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for two MICs case
Date: Sun, 30 Oct 2022 08:50:23 -0500
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 "chunxu . li" <chunxu.li@mediatek.com>,
 "=?utf-8?q?N=C3=ADcolas?= F . R . A . Prado" <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


On Sun, 30 Oct 2022 16:53:57 +0800, Ajye Huang wrote:
> Add a property "dmic-gpios" for switching between two MICs.
> 
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
>  .../sound/mt8186-mt6366-rt1019-rt5682s.yaml         | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 



My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.example.dts:29.35-36 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


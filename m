Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A42CB40503B
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 14:34:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43FDD16D8;
	Thu,  9 Sep 2021 14:33:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43FDD16D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631190867;
	bh=zX5kZJi02mf1M+SlIAqEjNs1O3oDOJSkh5J+XG3zGDM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KxqrxFlgcj1VZ+m7AEew8iRurnii8oPmv5buhYkUZQXL1TptakD5ne3DSKim1wtd2
	 knRzYyd58Er6A6Wna0uHfCvYtMmUV4v8vdQfmG03cQs3F+5vao1mSqQFGlhWkgWfj6
	 mD53kL05S6HtPhYdHQeeNtULwiamHWppdhKdRzP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A907BF80253;
	Thu,  9 Sep 2021 14:33:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E9B7F80224; Thu,  9 Sep 2021 14:33:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0FB2F800C7
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 14:32:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0FB2F800C7
Received: by mail-ot1-f47.google.com with SMTP id
 m7-20020a9d4c87000000b0051875f56b95so2252534otf.6
 for <alsa-devel@alsa-project.org>; Thu, 09 Sep 2021 05:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=abEhaeOy2YSPN/FnaISQGKPeJ66igV5iFQgXJZSBBLU=;
 b=ptW4AsUwSIFFGfv1rBG30Q8lhaKAWHYpntwqiK7KNDRC1CGkth+Uf/MbyfNu+6XbpC
 b46eqjwfOCAbC8nWeCfWzzUu5O7HE13DIKHCnz7l8L5Q+H0Br9RwkaJE91/tIUlBDVSz
 Zk3AJI1aqvz/0fANRMT9lcEpxxgOJhfbh1exuJxdjcMABAjY1coizZgCWVBAzq27LgAy
 yEyzkSkYlP4qCh3bBnbCe/M2cmuFIhjm68jy4AT8G6YQexGcEsGUM/VuqBXPCIlbdgFG
 KKQP/eGhnUCtd0KgT9ZWw0mvFfRUzvl5ii7tlDnTKL8eAJ3s2N5GqEKg+LZLWAW+8Jbf
 3STQ==
X-Gm-Message-State: AOAM532BGe1onbOGVVTEhMoIkWfga9O7mCyWEtonIs6WsQbxcZ9JctZt
 8z/GctSXdKkXyhFw4kYN4w==
X-Google-Smtp-Source: ABdhPJxcpJ9iZIIumS08m5EWjFkP5+Lg9n++RGx/6qUcAsMjiuJwc9M/jZdbHzbGyu4mT27btG7wgg==
X-Received: by 2002:a9d:2053:: with SMTP id n77mr2273577ota.9.1631190777626;
 Thu, 09 Sep 2021 05:32:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g23sm405642otl.23.2021.09.09.05.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 05:32:56 -0700 (PDT)
Received: (nullmailer pid 200340 invoked by uid 1000);
 Thu, 09 Sep 2021 12:32:53 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
In-Reply-To: <1631124057-17155-2-git-send-email-srivasam@codeaurora.org>
References: <1631124057-17155-1-git-send-email-srivasam@codeaurora.org>
 <1631124057-17155-2-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine
 machine bindings
Date: Thu, 09 Sep 2021 07:32:53 -0500
Message-Id: <1631190773.288819.200339.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 broonie@kernel.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
 rohitkr@codeaurora.org, swboyd@chromium.org, judyhsiao@chromium.org,
 plai@codeaurora.org
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

On Wed, 08 Sep 2021 23:30:56 +0530, Srinivasa Rao Mandadapu wrote:
> Add devicetree bindings documentation file for sc7280 sound card
> registration.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  .../bindings/sound/google,sc7280-herobrine.yaml    | 169 +++++++++++++++++++++
>  1 file changed, 169 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dts:46.24-25 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:379: Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1438: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1525980

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


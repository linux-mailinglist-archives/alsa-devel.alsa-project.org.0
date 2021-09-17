Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A029D410006
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Sep 2021 21:50:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22E7D1765;
	Fri, 17 Sep 2021 21:49:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22E7D1765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631908228;
	bh=vGpQmtK/lHQvioPJ69+Sb79b3xtA4HepYLpzuBjsVGQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q8zMWT+aUeYLsPB8Jtbq645KSYkIbq0d49XnS69dPBLl2sh1LkvJkfTeehhvSV6Zz
	 P22SqxgVL51rMkkDC0Hc9N7Ohx5gE8JxLC5zkydXZ27lROwLsluz8TvheG1Wg5QtRT
	 EMuucSJKFjYAWDuB8TgfBoi0qtHNnc8Gqdl4l8oA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89397F802E8;
	Fri, 17 Sep 2021 21:49:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BD59F8027C; Fri, 17 Sep 2021 21:49:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D130AF800E3
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 21:49:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D130AF800E3
Received: by mail-oi1-f170.google.com with SMTP id n78so2177165oig.6
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 12:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=k73+20oMzuAw5PJdzXrVZQ8DNLKi5Ygwc7hTogsnp9k=;
 b=7XsZeGvdHfSesSLNls+xZ8fBTZIff66zUUEpYI8tGvBMgYbG2XYhftiRHakapA5XYq
 Wyg0YCgyUIigr500w+JtlpyPwQEhYqo8W2vPkMqyQznvs1NfsbBnSOVHvXCuWjWQc2vn
 NeErWGVY68QvcK/T/qdHhEtuw/b2EqvIZ5OGDTdJ7OycxJ+iFMHiZPEx4pO2GesF0DvI
 m/BxcQxZFFiI1CdnD79YA87UWCWhPZ19I6Rhq6PS1DGYhP7hXL8bop8ePKRXxLKn2kIi
 rNV0refWRh4wthl01PcWHIufFH5CN2s55kJwclOowBLGaLzZknMkm/D355+ZiRqU+OPC
 40yw==
X-Gm-Message-State: AOAM5304EqYwcztk3rtoYOlPSHDi46EeYycb3PX9Z+C/zBAVd1xgw8DW
 0b32Rtzg2kIx9YVsMmMzwQ==
X-Google-Smtp-Source: ABdhPJyHkJprsjX0KNy6IqPp7iO8QrFdQymObPv0zprHFsIFbUJLu1hwZxjDZRpoBAGKg4nANmhoNQ==
X-Received: by 2002:aca:3114:: with SMTP id x20mr1734704oix.174.1631908138523; 
 Fri, 17 Sep 2021 12:48:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o8sm1642429oiw.55.2021.09.17.12.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 12:48:57 -0700 (PDT)
Received: (nullmailer pid 2025331 invoked by uid 1000);
 Fri, 17 Sep 2021 19:48:54 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
In-Reply-To: <1631872892-1821-2-git-send-email-srivasam@codeaurora.org>
References: <1631872892-1821-1-git-send-email-srivasam@codeaurora.org>
 <1631872892-1821-2-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v3 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine
 machine bindings
Date: Fri, 17 Sep 2021 14:48:54 -0500
Message-Id: <1631908134.321286.2025330.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 robh+dt@kernel.org, broonie@kernel.org, linux-arm-msm@vger.kernel.org,
 agross@kernel.org, rohitkr@codeaurora.org, swboyd@chromium.org,
 judyhsiao@chromium.org
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

On Fri, 17 Sep 2021 15:31:31 +0530, Srinivasa Rao Mandadapu wrote:
> Add devicetree bindings documentation file for sc7280 sound card
> registration.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
> This patch depends on the dt-bindings header patch
>   -- https://patchwork.kernel.org/project/alsa-devel/list/?series=543829
>  .../bindings/sound/google,sc7280-herobrine.yaml    | 170 +++++++++++++++++++++
>  1 file changed, 170 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dts:46.24-25 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1529313

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


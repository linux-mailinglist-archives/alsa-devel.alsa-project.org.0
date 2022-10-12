Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A61825FBE93
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Oct 2022 02:02:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 040E84409;
	Wed, 12 Oct 2022 02:02:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 040E84409
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665532972;
	bh=2NAVmCyesfW7vDUSV9/XIwmu8VMlM0HLhAfubnu4o/k=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cMJnjpmCm4BdF8qa+tXrt1gFhAPePExY9EVZg+WsiSZXAm3DbMgXmlDhlLrJ2Cpco
	 fsppDyhRfLjt66Jyv/7nOzdnF030f4zhBuPfyUncyxWJ4YNbzzFsi79fTQXRX6RenA
	 H2ToviTHX5SVyyqVLv/sn2QrvXt7xEmsztYE7f3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74E85F8021D;
	Wed, 12 Oct 2022 02:01:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D1C4F801D5; Wed, 12 Oct 2022 02:01:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1858F80132
 for <alsa-devel@alsa-project.org>; Wed, 12 Oct 2022 02:01:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1858F80132
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-1364357a691so11317811fac.7
 for <alsa-devel@alsa-project.org>; Tue, 11 Oct 2022 17:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yu7+tEZ6aYM6e8Y/GPKskmbmDxOQCtazL2x0VzwdFp8=;
 b=x8xFY5XPK67gvbgjg0MJIZ5OIoJUaOAmdbTwJkxMAmZ8/+WQ1cLaFPhRZuxTkk/WSq
 jynXiuS44XBsCpcMqMJWn7J4Szggw8EEkJooOYIW5Zw14NHgrv5tDG2U6ZG9HwK1Awiv
 Frl/bHUOw2ssXuneMQTe9Z9NPLxBWsK5/jykZ2q1Q0KQj90nZKtBBIWX47BLygauSvGk
 bpoFGs8n/IozX/Tx8Q5dRwY1j6G//jkujLtB9kCk7cbIprD2m+HXZjBzpSn1/AQ/AlcO
 3xwTKrw5nUwMEqhmXukhgTuRmxMdcn0cHs0KKx9yM2T+DczoV8oKktlzyQgGy+NRCXoY
 mrMg==
X-Gm-Message-State: ACrzQf1e/aq/Nzj4sLrjh1COeGxJqUJQByzHUC3G6CCCGSQNYB0G7c2F
 4HBeKgQOEMNymFiQbfr62g==
X-Google-Smtp-Source: AMsMyM6p0HBUTyPXJ8P4LZSlHr46dkxleO8f8BdMw6orJHncRRJCeYkVoVfsQ9bAvCRazLwTfJ6WNA==
X-Received: by 2002:a05:6870:3415:b0:133:197:3ca3 with SMTP id
 g21-20020a056870341500b0013301973ca3mr1000187oah.115.1665532905521; 
 Tue, 11 Oct 2022 17:01:45 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w22-20020a9d6756000000b00661a38ebbdasm2330547otm.59.2022.10.11.17.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 17:01:44 -0700 (PDT)
Received: (nullmailer pid 418283 invoked by uid 1000);
 Wed, 12 Oct 2022 00:01:46 -0000
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
In-Reply-To: <20221011184119.3754096-1-robh@kernel.org>
References: <20221011184119.3754096-1-robh@kernel.org>
Message-Id: <166553283000.416500.15587145212925837942.robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Convert dmic-codec to DT schema
Date: Tue, 11 Oct 2022 19:01:46 -0500
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

On Tue, 11 Oct 2022 13:41:19 -0500, Rob Herring wrote:
> Convert the dmic-codec binding to DT schema format.
> 
> The '#sound-dai-cells' and 'sound-name-prefix' properties were not
> documented, but are in use, so add them.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/sound/dmic-codec.yaml | 55 +++++++++++++++++++
>  .../devicetree/bindings/sound/dmic.txt        | 22 --------
>  2 files changed, 55 insertions(+), 22 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/dmic-codec.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/dmic.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sound/dmic-codec.example.dts:18:18: fatal error: dt-bindings/gpio.h: No such file or directory
   18 |         #include <dt-bindings/gpio.h>
      |                  ^~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:384: Documentation/devicetree/bindings/sound/dmic-codec.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1420: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


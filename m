Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F25D3623575
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 22:10:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EF0C162F;
	Wed,  9 Nov 2022 22:09:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EF0C162F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668028218;
	bh=nHBCjAgrvTFJtXenPKJXaP1G9M1GYxP5OLCBSBydCE0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YpoETN4OouFmuYsq4WZKUNqoqtpMlEfeK1XTwKPlqRjQon4cmKVgVWV5OTL/mKzhY
	 c+vs8A03r/IxTwSrPAZ/4vVGBcovAQdjQS/3eCuK/DjwbDc3m19r4mpeg4q4YcDQBu
	 OB52qSuqvdsJ6aSdLVEXYJ49MHs4UnZfGqPcHRoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF897F800EC;
	Wed,  9 Nov 2022 22:09:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81845F80121; Wed,  9 Nov 2022 22:09:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52B4DF80121
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 22:09:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52B4DF80121
Received: by mail-oo1-f44.google.com with SMTP id
 o140-20020a4a2c92000000b0049effb01130so567ooo.9
 for <alsa-devel@alsa-project.org>; Wed, 09 Nov 2022 13:09:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pTx6KXl8drPJ8E5PhGgj7I7ubFV4pBqM5D1m7ayvNZY=;
 b=DihzTkXOQlUrSnL+dvcAbED5Jsk1bU9tWceYTALIyHiwkncoV9E2B94BLwt6Qwk6lr
 1tCu0aakW53JPnTYxnKsTzSFe4vkvso4oCrjBFF0SWwx3egj2n7JW8+YnhbsXH1eHd78
 uKW38cNQcl9zTkDK6WY0F81IMzR9MvPbfFp4cZTKp79vASMzCzBNtjEkCmIDU97lZRxg
 Mrx+RsEAhvqoWHYpoDBepGLkYW4Ggdkgbq88D05gzArcLDQbmo9EIlNrEdclyriF2sAx
 8+AOB09dqNR48eN9hywOxYjmZPQm2vUny/s9lqUqsPD2jILZ1XGYI0+UdAR0sALaOj1C
 OCxw==
X-Gm-Message-State: ACrzQf2sTLud7gQYRqYsi6qWzynYCpxGsg1LSB/aKD00xlsagcgjlU5b
 Xwgh/APBWK5Mr7opmfNxrN7ydxvp/g==
X-Google-Smtp-Source: AMsMyM74l5mv/EC48QYKoj/YZepZ9v4bVhOyjqW8nyLfXzz90f1TERxX/QeKPgV/jeuamIsn6OI3iQ==
X-Received: by 2002:a4a:e810:0:b0:47f:775a:b028 with SMTP id
 b16-20020a4ae810000000b0047f775ab028mr26271145oob.12.1668028153073; 
 Wed, 09 Nov 2022 13:09:13 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q189-20020acac0c6000000b0035a0c543ad6sm5032033oif.21.2022.11.09.13.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 13:09:12 -0800 (PST)
Received: (nullmailer pid 2868050 invoked by uid 1000);
 Wed, 09 Nov 2022 21:09:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20221109165331.29332-12-rf@opensource.cirrus.com>
References: <20221109165331.29332-1-rf@opensource.cirrus.com>
 <20221109165331.29332-12-rf@opensource.cirrus.com>
Message-Id: <166802788527.2833369.15841700036002494433.robh@kernel.org>
Subject: Re: [PATCH 11/12] dt-bindings: sound: Add Cirrus Logic CS48L31/32/33
 codecs
Date: Wed, 09 Nov 2022 15:09:10 -0600
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, maz@kernel.org,
 linus.walleij@linaro.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, patches@opensource.cirrus.com,
 tglx@linutronix.de
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


On Wed, 09 Nov 2022 16:53:30 +0000, Richard Fitzgerald wrote:
> Codecs in this family have multiple digital and analog audio I/O that
> support a variety of external hardware connections and configurations.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  .../bindings/sound/cirrus,cs48l32.yaml        | 96 +++++++++++++++++++
>  include/dt-bindings/sound/cs48l32.h           | 25 +++++
>  2 files changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml
>  create mode 100644 include/dt-bindings/sound/cs48l32.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml:44:20: [error] syntax error: mapping values are not allowed here (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/sound/cirrus,cs48l32.example.dts'
Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml:44:20: mapping values are not allowed here
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/sound/cirrus,cs48l32.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml:44:20: mapping values are not allowed here
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml: ignoring, error parsing file
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):
Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml: Documentation/devicetree/bindings/mfd/cirrus,cs48l32.yaml

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


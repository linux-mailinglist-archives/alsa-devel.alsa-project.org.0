Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A49F34E1978
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Mar 2022 03:15:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25CD2166D;
	Sun, 20 Mar 2022 03:14:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25CD2166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647742504;
	bh=mvY274Nm1m2FfHNccto9wJpa3RoSKsA9MqC0mo0tvJw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KtTF+G3ufM7ROY3F/tLDSaOHjDcLsFfQwi0cZGBMFCsgsYbPYgQeXsYiSLjI+5Mfq
	 0hxhCBj1MdaJtCwGkDN7/9narJmbx5Nglx973nQY2+pN8LNdL5a/Bxhx/1qiXaI8wJ
	 OcY7VoISr4Q0Ep6mvfw1rPPmbhKdMU9B+n1RYCGQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91039F80254;
	Sun, 20 Mar 2022 03:13:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EE73F80253; Sun, 20 Mar 2022 03:13:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFF38F800FB
 for <alsa-devel@alsa-project.org>; Sun, 20 Mar 2022 03:13:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFF38F800FB
Received: by mail-io1-f54.google.com with SMTP id l18so13400495ioj.2
 for <alsa-devel@alsa-project.org>; Sat, 19 Mar 2022 19:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=bzqzRVsSfXzHXdH4cnEBtF3cJOqZ6zkfx1jImREFrRU=;
 b=lHrj2plb25VtAJPrj6m0IQDYVinGUXquHxdg2WS1FiBdejwgE94onnvcP7QDyM/RWt
 CclgI+3ynYNuTUnAbwM4jxY4+1WS8t1miCJFBuMOsyFsBJFX8yfr0EyTZc8EBpDxf5+z
 NWzujD76eob91U0zXjdrRSxHL3fL0coqEGR3jCgMX4uRDp72wrSOuwIb9oMA3k2lHL7y
 r4/Pw6RSgRT9nMhr3cQRJ4+7/04z8T1XAVPPHPu4PhiC0QzzpIIp/p9E9fN/u4LyL1Ep
 j8HHIaGabFBIYox7bCKC4/C5+CgmesnAuPuGroxnztvwpV0oL6XGyuxa+XmNtyXvTHXh
 W0aw==
X-Gm-Message-State: AOAM532uMKp1euBJsFzzxVWb81TkuFJRGmPwA6bE48eqfNZCRyTLLeyz
 lzInxHtZ/9Q7n/+rEaNxTg==
X-Google-Smtp-Source: ABdhPJxXBYFfeWib69UF2Qp22+Gx9dSv9nABSOAWi4J0Slm6vo8aEV2BDl8nbwjDxt8OLD+UrOtqVg==
X-Received: by 2002:a05:6602:160a:b0:648:cf59:3613 with SMTP id
 x10-20020a056602160a00b00648cf593613mr7118338iow.163.1647742420034; 
 Sat, 19 Mar 2022 19:13:40 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a6b4a12000000b00645b70866c2sm6225624iob.18.2022.03.19.19.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Mar 2022 19:13:38 -0700 (PDT)
Received: (nullmailer pid 2990517 invoked by uid 1000);
 Sun, 20 Mar 2022 02:13:33 -0000
From: Rob Herring <robh@kernel.org>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
In-Reply-To: <20220317093120.168534-16-tanureal@opensource.cirrus.com>
References: <20220317093120.168534-1-tanureal@opensource.cirrus.com>
 <20220317093120.168534-16-tanureal@opensource.cirrus.com>
Subject: Re: [PATCH v4 15/16] ASoC: dt-bindings: cs35l41: Document CS35l41
 External Boost
Date: Sat, 19 Mar 2022 20:13:33 -0600
Message-Id: <1647742413.945686.2990516.nullmailer@robh.at.kernel.org>
Cc: David Rhodes <drhodes@opensource.cirrus.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
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

On Thu, 17 Mar 2022 09:31:19 +0000, Lucas Tanure wrote:
> From: David Rhodes <drhodes@opensource.cirrus.com>
> 
> Document internal and external boost feature for ASoC CS35L41.
> For internal boost the following properties are required:
> - cirrus,boost-peak-milliamp
> - cirrus,boost-ind-nanohenry
> - cirrus,boost-cap-microfarad
> 
> For external boost, the GPIO1 must be configured as output,
> so the following properties are required:
> - cirrus,gpio1-src-select = <1>
> - cirrus,gpio1-output-enable
> 
> Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> ---
>  .../bindings/sound/cirrus,cs35l41.yaml        | 44 +++++++++++++++++--
>  1 file changed, 41 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml:152:13: [warning] wrong indentation: expected 10 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1606485

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


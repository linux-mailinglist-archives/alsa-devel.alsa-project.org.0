Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D94E589350
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Aug 2022 22:35:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0C7A836;
	Wed,  3 Aug 2022 22:34:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0C7A836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659558933;
	bh=My2KHBnIj2lvdE7CjMS1RK74UUW+fuO1wkMES/i3tSw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qVp2a7YSnuv8YYM8jLrq9QRSc+czNdkN0RQfNuEv7oLhJfnEgFUE46ojYm3kfLwLv
	 CfX511yWoIdtHk1ZgaWtjv8WPYHL/BcrRjp5ILqoCo+sTckQj+uat53KZikUFBZnuz
	 jMCK6HtgGA05qD293lqv2HSmJWpPx2gekFzTWO4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CF67F8025E;
	Wed,  3 Aug 2022 22:34:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C7CDF8016A; Wed,  3 Aug 2022 22:34:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E82D7F800B8
 for <alsa-devel@alsa-project.org>; Wed,  3 Aug 2022 22:34:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E82D7F800B8
Received: by mail-io1-f45.google.com with SMTP id e69so13777121iof.5
 for <alsa-devel@alsa-project.org>; Wed, 03 Aug 2022 13:34:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc;
 bh=sy0PwHGMpgR2DJVISTy8eXI/nlvufmA5Ye3PE/bOB+Q=;
 b=qKsHCl/rxtSfRTyfzteMn0IhRjtvTrzcJae4zwaSY03itr+VpKvxR870XENHobXwuQ
 QUZiG8EY8GL1iSXeKkOP+A1065TIgHxnUwTE0rMadtLL1Tl95XEm6yfQeU9RBT1oFP94
 JdwkmWEXZUdGjAdNwESDr5niR9NvTkovjNt5gOizhSV0QdO/CgYOAaziZ+OXwxdqTNt6
 YdejO33kdmllfBNDZ2ZgT50TEaCXAEnRSR2+qoL4Uni5+bcneItCtqomTP21ZFbzNTby
 B3LFa3jXEW6KgjgAt+/qwXD19dB+9OcqM+IGhF6BWHoB6Bi46iUpRBsPswfPOmGeSkYW
 hByQ==
X-Gm-Message-State: ACgBeo3djJuzsrBRHSj5JrD8WLJRBrpG09SqksIMM4UuGgxKR5qhAd8V
 1OjmOIyH2lznAKnkFzr42Q==
X-Google-Smtp-Source: AA6agR7LLSQANxQxTu6rbbHddUerm1lOHrVSd3soiL2HV9IzRJfpkFHye/9Vr6sjUkfF/OiI9TlfRQ==
X-Received: by 2002:a6b:916:0:b0:67f:a5e7:68af with SMTP id
 t22-20020a6b0916000000b0067fa5e768afmr5081861ioi.89.1659558862764; 
 Wed, 03 Aug 2022 13:34:22 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a056602158500b006814fd71117sm70746iow.12.2022.08.03.13.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 13:34:22 -0700 (PDT)
Received: (nullmailer pid 2576748 invoked by uid 1000);
 Wed, 03 Aug 2022 20:34:18 -0000
From: Rob Herring <robh@kernel.org>
To: Jai Luthra <j-luthra@ti.com>
In-Reply-To: <20220803151726.31628-1-j-luthra@ti.com>
References: <20220803151726.31628-1-j-luthra@ti.com>
Subject: Re: [PATCH v2] dt-bindings: sound: tlv320aic3x: Convert to dtschema
Date: Wed, 03 Aug 2022 14:34:18 -0600
Message-Id: <1659558858.566275.2576747.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
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

On Wed, 03 Aug 2022 10:17:26 -0500, Jai Luthra wrote:
> Convert bindings for TI's TLV320AIC3x audio codecs to dtschema.
> 
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>  .../bindings/sound/ti,tlv320aic3x.yaml        | 158 ++++++++++++++++++
>  .../devicetree/bindings/sound/tlv320aic3x.txt |  97 -----------
>  2 files changed, 158 insertions(+), 97 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/tlv320aic3x.txt
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


aic33@18: 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap2420-n810.dtb

codec@18: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/imx6dl-gw5903.dtb
	arch/arm/boot/dts/imx6q-gw5903.dtb

tlv320aic3104@18: 'adc-settle-ms', 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am57xx-beagle-x15.dtb
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dtb
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dtb

tlv320aic3106@18: 'adc-settle-ms' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/da850-lcdk.dtb

tlv320aic3106@19: 'adc-settle-ms' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/dra71-evm.dtb
	arch/arm/boot/dts/dra72-evm.dtb
	arch/arm/boot/dts/dra72-evm-revc.dtb
	arch/arm/boot/dts/dra76-evm.dtb
	arch/arm/boot/dts/dra7-evm.dtb

tlv320aic3106@1b: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-sl50.dtb


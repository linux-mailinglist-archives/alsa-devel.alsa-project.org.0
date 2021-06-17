Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E583ABE15
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 23:28:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB37E17A4;
	Thu, 17 Jun 2021 23:27:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB37E17A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623965299;
	bh=4Qkp7ow6TIV/yIRwGbWUKgTqH6qtppJ12O5uIIyHHdc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fpDw+aqHUiQAVV5dsNBEuVMcmiu8bus6tVK8p3HppVV2c5awF/aYEW6X1KpcmxJA8
	 Wbj3LYtQhCFPYry6zvQaEloyL/s1v1LVeiYLp8yohRz3IRNOFMK+5n6490lOoK0gUW
	 BepngGZCY6DFPRho2MRKVqpJJ4tUxBre/FfF60s8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD79AF80088;
	Thu, 17 Jun 2021 23:26:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56B67F8025A; Thu, 17 Jun 2021 23:26:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C252BF8025A
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 23:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C252BF8025A
Received: by mail-io1-f44.google.com with SMTP id k11so3604368ioa.5
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 14:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=5eq4f8x/PBXQ0L0KWI8lbvRWrLgR98TD03TAWNAHP0I=;
 b=fvIlspQ53rttjlaJw8kHpwjKrg6+ptG70VjjBinFBMDvn1Zh3+0Qq58DGNv0+zVkcm
 cVlhuniE2KSRe5AIZCVQw9BvwSRIq9C2J07PUAFMBpumH0MuZcQk+nX//9Q5qY1ta/Wj
 ZBeB8+YPLDEy3qQlMsihlNBbNX0mGKHKCrSeSAKlZREHRCaalprf04M0D/MdQqWWDL9+
 42nZEDNHeadBdmTXuQ2P9SxRGcsTmCZPuza3atrcIybmYFXDlf1g7IWU9vpO3IWTFqMF
 ix066s9dlhrsM8TTzLdY/jOxSFX4k+itbH8CDi4QVCooBqxXMqbCRQIuwv0AwY3n/120
 BlTw==
X-Gm-Message-State: AOAM533kKxtRPWev8Sd6aQGFts9UEqdMNhzck58cyAXOvnfUOElj1wET
 t6PzxogL/a1yCVW2615YtQ==
X-Google-Smtp-Source: ABdhPJzKYftIYW1nBl+6hxGS0Ti9h9zAzlQz9WsWpBDeaZqwQntNxz3ul/G3t+wNmMg4w6xTU/xNXw==
X-Received: by 2002:a05:6602:581:: with SMTP id
 v1mr5561875iox.192.1623965195650; 
 Thu, 17 Jun 2021 14:26:35 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id 6sm3685511ioe.43.2021.06.17.14.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 14:26:35 -0700 (PDT)
Received: (nullmailer pid 3336117 invoked by uid 1000);
 Thu, 17 Jun 2021 21:26:24 -0000
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
In-Reply-To: <20210617054740.8081-9-trevor.wu@mediatek.com>
References: <20210617054740.8081-1-trevor.wu@mediatek.com>
 <20210617054740.8081-9-trevor.wu@mediatek.com>
Subject: Re: [PATCH 8/8] dt-bindings: mediatek: mt8195: add
 mt8195-mt6359-rt1019-rt5682 document
Date: Thu, 17 Jun 2021 15:26:24 -0600
Message-Id: <1623965184.524304.3336116.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, bicycle.tsai@mediatek.com, tiwai@suse.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, jiaxin.yu@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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

On Thu, 17 Jun 2021 13:47:39 +0800, Trevor Wu wrote:
> This patch adds document for mt8195 board with mt6359, rt1019 and rt5682
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../sound/mt8195-mt6359-rt1019-rt5682.yaml    | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml:10:4: [warning] wrong indentation: expected 2 but found 3 (indentation)
./Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml:17:7: [warning] wrong indentation: expected 4 but found 6 (indentation)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.example.dt.yaml:0:0: /example-0/mt8195-sound: failed to match any schema with compatible: ['mediatek,mt8195-sound']
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1493198

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


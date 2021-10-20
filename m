Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6E6434CB2
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 15:51:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9703B16E4;
	Wed, 20 Oct 2021 15:51:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9703B16E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634737916;
	bh=XC2HExLdSuUABH8IolksMtWfL/ZTHbMrMH4uhm/89Zs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ChQgKZpO6gmQ2kBrnOa8c8RLu2WDxRuNrl+rYh1Z5ljnk/xkJzbXqIxcgXpAajEQH
	 Zbx41eIRCuoTzjF1IZ4Hx7lpVzk4TlcVI9MVq1RTDX2tLb7E8ZHy36IszDAV17DbZ+
	 X1bWQn3EL8Aq4WrLwGtQfMM08oeicLDoqWJkEdBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8807F80082;
	Wed, 20 Oct 2021 15:50:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD121F80229; Wed, 20 Oct 2021 15:50:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8A53F800ED
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 15:50:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8A53F800ED
Received: by mail-oi1-f176.google.com with SMTP id u69so9734281oie.3
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 06:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=jLTSb3KEYnCRlQ01oYFy7OkpNs2aWBBSeM7tBxCTpD8=;
 b=5PmuUDiFN8ywbf+e7BdF/MuZBIdu9cWkJyomSznPnw1LxxGbB2Am17aks+5UjpUUZh
 kKqq2PuY4OCDAKvCis1xEdSdxXqrcz9pmKIJMyCWbNjUO7D1j+vjo9idtCGmqku5d/vh
 oy1DEzE3OCbJDwswDkP9lKl8mlOmD1E44jgRvHv5lztJxNFnsgyVVZEb7/bPkFD5CMSW
 t9uU+URd2y3t88Ph0kjztKGVpvqPV3TWhhfGGPesSybHe+Ukujdh0OqXsk3A4dtS3icd
 TKFjKQO9JHpOp9XmUiVOJXUJ9myHiLRnvgWzSzeuEMczhBF7qm/DWQrQkVOD9DEovoIe
 qAqg==
X-Gm-Message-State: AOAM531TDxUtEnkKwdEnvyk+VtAMduvylTdzTE1Ml3ac4UNPrWKOLf5C
 CsAgcDBF6oz8KHr2ciSUDw==
X-Google-Smtp-Source: ABdhPJwS8b8/9bct2qZ/+hc4vStE7P565pOQsKf7sXcrPBm2vGWkW+CqezjlGdG+8JVNIlAgfkiBiA==
X-Received: by 2002:aca:3741:: with SMTP id e62mr9560890oia.107.1634737827694; 
 Wed, 20 Oct 2021 06:50:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v13sm488307otn.41.2021.10.20.06.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 06:50:26 -0700 (PDT)
Received: (nullmailer pid 2259920 invoked by uid 1000);
 Wed, 20 Oct 2021 13:50:23 -0000
From: Rob Herring <robh@kernel.org>
To: YC Hung <yc.hung@mediatek.com>
In-Reply-To: <20211020115155.9909-3-yc.hung@mediatek.com>
References: <20211020115155.9909-1-yc.hung@mediatek.com>
 <20211020115155.9909-3-yc.hung@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: dsp: mediatek: Add mt8195 DSP binding
 support
Date: Wed, 20 Oct 2021 08:50:23 -0500
Message-Id: <1634737823.680277.2259919.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 tiwai@suse.com, broonie@kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, matthias.bgg@gmail.com, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org
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

On Wed, 20 Oct 2021 19:51:55 +0800, YC Hung wrote:
> This describes the mt8195 DSP device tree node.
> 
> Signed-off-by: YC Hung <yc.hung@mediatek.com>
> ---
>  .../bindings/dsp/mtk,mt8195-dsp.yaml          | 138 ++++++++++++++++++
>  1 file changed, 138 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml: properties:sound: 'anyOf' conditional failed, one must be fixed:
	'type' is a required property
	'$ref' is a required property
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml: ignoring, error in schema: properties: sound
warning: no schema found in file: ./Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.example.dt.yaml:0:0: /example-0/adsp@10803000: failed to match any schema with compatible: ['mediatek,mt8195-dsp']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1543854

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


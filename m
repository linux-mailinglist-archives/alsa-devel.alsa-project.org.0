Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4042A606844
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 20:37:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3E56B303;
	Thu, 20 Oct 2022 20:36:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3E56B303
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666291020;
	bh=mcSMefRYVnzbEjgltcF+JDupkQyqifH3fGzHUl/+imQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YfrVDZ67+xOoa+hoYYmAl2mrfrRvOySk8rbY95QtQRYB2kDs7vB5YG/uqwWOCWTDQ
	 HAwDYN4tPOxRlXuV23W/7ktbTfvnhWzLhgqvPey3VJ6E4WHZxcSri6tBsX8ileVE1Q
	 zb3T2sryvwVmrCRZQMF4WTHFFiJldJB9iCPHprz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50847F80137;
	Thu, 20 Oct 2022 20:36:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CED1F804D8; Thu, 20 Oct 2022 20:36:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69F0AF8032B
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 20:35:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69F0AF8032B
Received: by mail-oi1-f180.google.com with SMTP id l5so592689oif.7
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 11:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hu3QJgsLCoS+vfp9HN0FHUunihCVkS1IyOV5MfUmUG0=;
 b=Ojiky2Xesa59j6jDrcgaovRYdY5yGJpsjnwl51IUtfispgSqIpuSzMEcdT0O7/rHTR
 QqJVvC3gdQJHrg8r+/ZZk/KU4yDyaqjFU9dW/1t2cmjjzszvekHDZgRmH9/H8afwqiNC
 lF4680Mzvof3Hivg3D2Ar2xzN5wjh1tQNX5uzaj+MSmqUqqTAipUw1tGl56JbncO6BHC
 VKh9dsNmkAjnawjqQOw3K1PezufKk4zhCdWvaWxBkfNcdPEUcNQbCVuOIsNcBklsmlH0
 7lyca87ibFXXoe5UMIwnfQnJiiHZ5bO47C4MjGmX3DpytShNO5kchr1+4sOoMfleJwoM
 6yiw==
X-Gm-Message-State: ACrzQf1HIQD+tGDok+6kspWNu8ImdvueY0AemWHakvbzmWils4k/Y1XU
 bzQbtv36TK74+bfbi1MoiQ==
X-Google-Smtp-Source: AMsMyM5qNUJ94xIXCMBvdhoSyM1ZAccL+fHVKAJh43zOfpXKNYwlRAh7/ryPkPhO5BnqcpXUyGHpGQ==
X-Received: by 2002:a05:6808:2215:b0:354:856f:f524 with SMTP id
 bd21-20020a056808221500b00354856ff524mr21731807oib.185.1666290957465; 
 Thu, 20 Oct 2022 11:35:57 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a23-20020a05683012d700b006618fc435absm209622otq.43.2022.10.20.11.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 11:35:56 -0700 (PDT)
Received: (nullmailer pid 1675933 invoked by uid 1000);
 Thu, 20 Oct 2022 18:35:57 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
In-Reply-To: <1666271160-22424-1-git-send-email-quic_srivasam@quicinc.com>
References: <1666271160-22424-1-git-send-email-quic_srivasam@quicinc.com>
Message-Id: <166629081432.1672392.1870693936470507385.robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: soundwire: Convert text bindings to DT
 Schema
Date: Thu, 20 Oct 2022 13:35:57 -0500
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.com,
 bgoswami@quicinc.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org, quic_rohkumar@quicinc.com,
 quic_plai@quicinc.com, swboyd@chromium.org, judyhsiao@chromium.org,
 Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
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

On Thu, 20 Oct 2022 18:36:00 +0530, Srinivasa Rao Mandadapu wrote:
> Convert soundwire text bindings to DT Schema format.
> 
> Update interrupt property items as per device tree,
> as it is not appropriately described in text file.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
> Signed-off-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
> ---
> This patch depends on:
>     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=42801e6185290d63691bd39cf8a3bba6cd5fe520
> Changes since V2:
>   -- Update commit message.
>   -- Add child node property.
>   -- Change file name.
>   -- Remove minIteams for few properties.
>   -- Remove redundant required properties.
>   -- Remove redundant description for wakeup-source property.
>   -- Update interrupt property items.
> Changes since V1:
>   -- Remove the status field in example.
>   -- Remove interrupt-names property in the required list.
>   -- Add the wakeup-source property.
> 
>  .../devicetree/bindings/soundwire/qcom,sdw.txt     | 214 ---------------------
>  .../bindings/soundwire/qcom,soundwire.yaml         | 184 ++++++++++++++++++
>  2 files changed, 184 insertions(+), 214 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
>  create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


soundwire@3210000: 'codec@0,4' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

soundwire@3210000: interrupts: [[0, 155, 4]] is too short
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

soundwire@3230000: 'codec@0,3', 'qcom,port-offset' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

soundwire@3230000: qcom,ports-block-group-count: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

soundwire@3230000: qcom,ports-block-pack-mode: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

soundwire@3230000: qcom,ports-hstart: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

soundwire@3230000: qcom,ports-hstop: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

soundwire@3230000: qcom,ports-lane-control: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

soundwire@3230000: qcom,ports-offset1: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

soundwire@3230000: qcom,ports-offset2: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

soundwire@3230000: qcom,ports-sinterval-low: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

soundwire@3230000: qcom,ports-word-length: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

soundwire-controller@3210000: interrupts: [[0, 298, 4]] is too short
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb
	arch/arm64/boot/dts/qcom/sm8250-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8250-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb

soundwire-controller@3210000: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb
	arch/arm64/boot/dts/qcom/sm8250-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb

soundwire-controller@3210000: 'label', 'wcd9380-rx@0,4' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sm8250-mtp.dtb

soundwire-controller@3230000: interrupt-names:0: 'wakeup' was expected
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb
	arch/arm64/boot/dts/qcom/sm8250-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8250-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb

soundwire-controller@3230000: interrupt-names: ['core'] is too short
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb
	arch/arm64/boot/dts/qcom/sm8250-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8250-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb

soundwire-controller@3230000: interrupts-extended: [[1, 0, 297, 4]] is too short
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb
	arch/arm64/boot/dts/qcom/sm8250-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8250-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb

soundwire-controller@3230000: 'label', 'qcom,port-offset' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb
	arch/arm64/boot/dts/qcom/sm8250-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb

soundwire-controller@3230000: 'label', 'qcom,port-offset', 'wcd9380-tx@0,3' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sm8250-mtp.dtb

soundwire-controller@3250000: interrupts: [[0, 202, 4]] is too short
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb
	arch/arm64/boot/dts/qcom/sm8250-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8250-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb

soundwire-controller@3250000: qcom,ports-block-pack-mode: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb
	arch/arm64/boot/dts/qcom/sm8250-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8250-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb

soundwire-controller@3250000: qcom,ports-offset1: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb
	arch/arm64/boot/dts/qcom/sm8250-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8250-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb

soundwire-controller@3250000: qcom,ports-offset2: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb
	arch/arm64/boot/dts/qcom/sm8250-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8250-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb

soundwire-controller@3250000: qcom,ports-sinterval-low: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb
	arch/arm64/boot/dts/qcom/sm8250-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8250-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb

soundwire-controller@3250000: 'wsa8810-left@0,4', 'wsa8810-right@0,3' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sm8250-mtp.dtb

soundwire-controller@3250000: 'wsa8810-left', 'wsa8810-right' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb

swm@c85: interrupts-extended: [[169, 20]] is too short
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb

swm@c85: interrupts-extended: [[175, 20]] is too short
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb

swm@c85: interrupts-extended: [[176, 20]] is too short
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb

swm@c85: interrupts-extended: [[177, 20]] is too short
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb

swm@c85: interrupts-extended: [[178, 20]] is too short
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb

swm@c85: interrupts-extended: [[179, 20]] is too short
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

swm@c85: interrupts-extended: [[180, 20]] is too short
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb

swm@c85: interrupts-extended: [[181, 20]] is too short
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb

swm@c85: interrupts-extended: [[186, 20]] is too short
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb

swm@c85: interrupts-extended: [[189, 20]] is too short
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb

swm@c85: interrupts-extended: [[190, 20]] is too short
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb

swm@c85: qcom,ports-offset1: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

swm@c85: qcom,ports-offset2: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

swm@c85: qcom,ports-sinterval-low: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

swm@c85: 'wsa8810-left', 'wsa8810-right' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DD2427191
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 21:50:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 852B8168B;
	Fri,  8 Oct 2021 21:49:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 852B8168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633722631;
	bh=+uMBxO6mhTw8CeBLw1JZHpw65oek+Q7CArTex31Jbt8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F6jsdRAqr+wrzE+mGlOsTSeQWNs89/Y5XgyXwE2oBmWUwI2a+TQBEcMT8ISfyrLP6
	 txeAyXqDmn6G15i//Q27xSgz9IX4lAY9ZPLDWG7q1ryC8Smshq7DXUoAN06TF3LQwq
	 roWF5k84RuVtohmlFdVUhvHX7KSaDA7ce64NmOiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0CD6F800F0;
	Fri,  8 Oct 2021 21:49:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE9F7F80246; Fri,  8 Oct 2021 21:49:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A137FF80229
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 21:49:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A137FF80229
Received: by mail-oi1-f181.google.com with SMTP id z126so853110oiz.12
 for <alsa-devel@alsa-project.org>; Fri, 08 Oct 2021 12:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=AyVTeSC8Yf3uhrD+x/CO53ijqdVFcAJcsxUhs3MRvmM=;
 b=ciPz6CRD3OLl/2S2YeW1Ho6zsqR14COUDLBkLEwx4fguSiwrycvQdkOyA1fhOKnsdj
 H5EsIQvt2aeVq0qtm7Qkjt7oM8CkB51DcEBjCe9NzUBiXOv7EqAx7wy/REREcAg++zfX
 XopCFg24dpAGiOBvo1F/VOeWdWNqT5PkANNvykeCHaOSGjbWms49lPl2sSrJQAbI5qRa
 muxLFNJtWroUoqJH9HeX9fADOrE9lAHZas0yGJvbt+8hCdI0LlTGId836gLXJkfFSsPh
 CfVFwepu12jsfS+gXoS2Ieiw2icLfcrreQ6V06Vd7DaBAEd0o+YFAKC3by0PKoHQNlVp
 dP4w==
X-Gm-Message-State: AOAM530hn2B9WMqZR4XZxC4OL9JYoPi2QdpmgsH0GuCYl/IqJJIVkK7z
 PfYPKo1qMN3GSh6LHwNrUA==
X-Google-Smtp-Source: ABdhPJxfsMuBS32ogXG9PGtxIo/2x9osllcxajr/6xd0Jr7jQHCTqWEa16x2E6BS+7PFnBz0C84cOw==
X-Received: by 2002:aca:b388:: with SMTP id c130mr18261120oif.39.1633722540517; 
 Fri, 08 Oct 2021 12:49:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id k2sm42536oot.37.2021.10.08.12.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 12:48:59 -0700 (PDT)
Received: (nullmailer pid 3211957 invoked by uid 1000);
 Fri, 08 Oct 2021 19:48:56 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
In-Reply-To: <1633702144-19017-3-git-send-email-srivasam@codeaurora.org>
References: <1633702144-19017-1-git-send-email-srivasam@codeaurora.org>
 <1633702144-19017-3-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v3 2/5] ASoC: qcom: dt-bindings: Add compatible names for
 lpass sc7280 digital codecs
Date: Fri, 08 Oct 2021 14:48:56 -0500
Message-Id: <1633722536.892404.3211956.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
 Venkata Prasad Potturu <potturu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 plai@codeaurora.org, tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 broonie@kernel.org, agross@kernel.org, rohitkr@codeaurora.org,
 swboyd@chromium.org, judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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

On Fri, 08 Oct 2021 19:39:01 +0530, Srinivasa Rao Mandadapu wrote:
> Update compatible names in va, wsa, rx and tx macro codes for lpass sc7280
> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 4 +++-
>  Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml  | 4 +++-
>  Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 4 +++-
>  Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml | 4 +++-
>  4 files changed, 12 insertions(+), 4 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1538394


codec@3240000: 'clock-frequency' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

codec@3240000: clock-names:4: 'fsgen' was expected
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

codec@3240000: clock-names: Additional items are not allowed ('fsgen' was unexpected)
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

codec@3240000: clock-names: ['mclk', 'npl', 'macro', 'dcodec', 'va', 'fsgen'] is too long
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

codec@3240000: clocks: [[75, 1], [75, 0], [76, 102, 1], [76, 103, 1], [77, 0], [78]] is too long
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml

codec@3240000: clocks: [[78, 1], [78, 0], [79, 102, 1], [79, 103, 1], [80, 0], [81]] is too long
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

codec@3240000: clocks: [[86, 1], [86, 0], [87, 102, 1], [87, 103, 1], [88, 0], [89]] is too long
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml

codec@3370000: 'clock-frequency' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

codec@3370000: clock-names:1: 'core' was expected
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml


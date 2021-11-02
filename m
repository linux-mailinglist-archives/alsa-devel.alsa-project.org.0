Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDDC442E5C
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Nov 2021 13:40:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B72816EC;
	Tue,  2 Nov 2021 13:39:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B72816EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635856822;
	bh=nrC8IMYVDnSOQHrq19rkRShvY4+eyERme40svcQeYm4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LYLIJNJ5waEdefYTtWcWllbdb+B6XnaNORknAXL6D+exK8YcaRrDYmP35l8Ullqy+
	 waZo7Vf2FIQbva6OwH2DIJq2R0BJEGy9g1hGUf6VhrhcaUf5WqPDbDy0SwT7n35zhN
	 4fjrb2ODT7vD2xjAJE5EXq6+staF9QCzzQeoQOg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1F1DF800BF;
	Tue,  2 Nov 2021 13:39:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0EA6F8025D; Tue,  2 Nov 2021 13:39:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47329F800BF
 for <alsa-devel@alsa-project.org>; Tue,  2 Nov 2021 13:38:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47329F800BF
Received: by mail-oi1-f169.google.com with SMTP id g125so29762827oif.9
 for <alsa-devel@alsa-project.org>; Tue, 02 Nov 2021 05:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=0yfbsryEjmN9vwwP//YfNBCrdvNe0yYLPhJeAfuOOQs=;
 b=3WKWM5idnd+GECXJTOo/JXPvndsRDyfeOwUC10KKlKA0Eh3qoFLwEhwbvI2gUBNyDk
 Rr781Nb4Rk6YYCBHND8dur1GFzj0ZPUg9ldHEp0V6bYBJwIgQDQwB2Ugsiljej8HC+YD
 PFj8BI5HrF7yJfnA144cYlJ//ujG6WdYEVjK3SiDUveUsiAMV5sxDWnuNaL38n3DRSJ1
 RjYR1ZBjkjS0g2wZbTt4SCMcGNV/MI94ehsKDSSlFSivHzCALNkCwJgvj2JyiNdHhIcN
 8hzrjvM/GnAe5NLcbnKOh7AALgcFmSWNNNhuBlRznltAD6WsjM1i3NDGaYreBHF5mCZq
 KYng==
X-Gm-Message-State: AOAM532SFjAtU27Xfry5PfqymGHJFN0sBy5GFIwJmVK9PKqFCR9D2KoA
 z5YtKlIUqgTv1TcMEslmnQ==
X-Google-Smtp-Source: ABdhPJzNemQUYREkjWtK4Z7J5RwmZFURPklIkPVqCmGlI2S/6JIc3SWDKlpQ8oWJVKw+syDJjuRyDQ==
X-Received: by 2002:a05:6808:e84:: with SMTP id
 k4mr4928387oil.135.1635856734298; 
 Tue, 02 Nov 2021 05:38:54 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bd5sm2582438oib.2.2021.11.02.05.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 05:38:53 -0700 (PDT)
Received: (nullmailer pid 2636024 invoked by uid 1000);
 Tue, 02 Nov 2021 12:38:52 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
In-Reply-To: <1635838265-27346-9-git-send-email-srivasam@codeaurora.org>
References: <1635838265-27346-1-git-send-email-srivasam@codeaurora.org>
 <1635838265-27346-9-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v4 08/10] ASoC: dt-bindings: Add SC7280 sound card bindings
Date: Tue, 02 Nov 2021 07:38:52 -0500
Message-Id: <1635856732.594488.2636023.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 Venkata Prasad Potturu <potturu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 plai@codeaurora.org, broonie@kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 agross@kernel.org, rohitkr@codeaurora.org, swboyd@chromium.org,
 judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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

On Tue, 02 Nov 2021 13:01:03 +0530, Srinivasa Rao Mandadapu wrote:
> Add bindings for lpass sc7280 based soundcards which supports
> audio over i2s based speaker, soundwire based headset, msm dmics
> and HDMI Port.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 69 +++++++++++++++++++---
>  1 file changed, 61 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml: lpass@62d80000: reg: [[0, 1658351616, 0, 425984], [0, 1659895808, 0, 167936]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml: lpass@62d80000: reg-names: ['lpass-hdmiif', 'lpass-lpaif'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml: lpass@62d80000: interrupts: [[0, 160, 1], [0, 268, 1]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml: lpass@62d80000: interrupt-names: ['lpass-irq-lpaif', 'lpass-irq-hdmi'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml: lpass@62d80000: iommus: [[4294967295, 4128, 0], [4294967295, 4146, 0]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1549500

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


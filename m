Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B58F0438405
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Oct 2021 17:15:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BCC1166B;
	Sat, 23 Oct 2021 17:14:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BCC1166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635002135;
	bh=7H1yqXkqsmC/9e3zmhPrWPjwjkoTWWopvjnIUR5P3w0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nlC0UFI8Jwnlg+YW0H9l9IJV4Wz9SKymfTMAXOOO1yAvprnJqmegNMOjtRD5Mwixv
	 3EzFHcYrDOiMHDv2AnBMS29JO+jzEI8DxMQWNNjdhbTiWJqSh0+2DpgTtCUOXNcYR3
	 nz/0oSMlZNuJi6RQY1iO0sgrPylfQUT2cbtmSnJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 555E7F80246;
	Sat, 23 Oct 2021 17:14:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D27EAF80240; Sat, 23 Oct 2021 17:14:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12D53F8010B
 for <alsa-devel@alsa-project.org>; Sat, 23 Oct 2021 17:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12D53F8010B
Received: by mail-oi1-f179.google.com with SMTP id z126so8904907oiz.12
 for <alsa-devel@alsa-project.org>; Sat, 23 Oct 2021 08:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Bg2HoxcvGMf9Ovj9pzcdsVijqJ6NR5PA0icgim7NWfg=;
 b=7OM/BVRaemFDrgqi22w2O6AVfCwHQRNDMyWe0wusdZY75FcET51PiYdZwaIIF+Eby7
 +bDko4HcuCBY0fz7gp7QZVt1eVDoVGGpwuTCyoNctXVqEqy6tHl72HaNHpCAyk97fXY+
 MJfITJKGMLoM2MHa/E5t4/RfBLMu4xCG/SyizuI/A99+1upc9wUH14ntk4sRNNUJhCYq
 WlRu5w9rWSbq1/TxaXKxMroO0hLDvjti5kXFDeZgK405jn1GkITSmrfvXMQ4nOhV115y
 EWvhzmzgfTTnMSe/ENc7qebuZpQSOc7r3re0cAz0ZtWlliFjPjkTXC5j42Q6febokNNV
 3GYA==
X-Gm-Message-State: AOAM533N1SHO9w121wDZ1j/P5JADFWeAaxxchrB/vSHNbI2ob4Ao7RdE
 ngnStE6gJn3mOLSfBu60cQ==
X-Google-Smtp-Source: ABdhPJwQDNUGM05bn4X0T3kRMyChqK0m5VA0mJAMxX4DU1XqHz1ATJcKoGJH4PT3tIl5jnn3ivdTug==
X-Received: by 2002:a05:6808:1392:: with SMTP id
 c18mr4610058oiw.23.1635002047669; 
 Sat, 23 Oct 2021 08:14:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l7sm2001249oog.22.2021.10.23.08.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 08:14:06 -0700 (PDT)
Received: (nullmailer pid 457390 invoked by uid 1000);
 Sat, 23 Oct 2021 15:14:05 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
In-Reply-To: <1634982842-7477-9-git-send-email-srivasam@codeaurora.org>
References: <1634982842-7477-1-git-send-email-srivasam@codeaurora.org>
 <1634982842-7477-9-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v3 08/10] ASoC: dt-bindings: Add SC7280 sound card bindings
Date: Sat, 23 Oct 2021 10:14:05 -0500
Message-Id: <1635002045.623723.457389.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com,
 Venkata Prasad Potturu <potturu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 plai@codeaurora.org, tiwai@suse.com, agross@kernel.org, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, broonie@kernel.org, rohitkr@codeaurora.org,
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

On Sat, 23 Oct 2021 15:24:00 +0530, Srinivasa Rao Mandadapu wrote:
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

See https://patchwork.ozlabs.org/patch/1545178

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


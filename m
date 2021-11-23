Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCA745A819
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 17:36:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5835F167E;
	Tue, 23 Nov 2021 17:35:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5835F167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637685393;
	bh=wP/u1iYZMIW4ulPgDWsPH/1Amfu5s4H5dcv6zX0/cj4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TAwb/VAiuRUvS9LE8/2ILjscAXFHHYI6MmJhyIAEDUSMSn1nHaP/9RW/lchDNGpk1
	 LUvyiVhi1K6YpQ3mPlg23e4+HXQGDc2u72wPWKnygXaXqFyNtp+pg04bawI/Lnd+s7
	 jMdiH1l/qbglzNE6MVPdndxtQHupwQbmp0S1/q58=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD20FF804AC;
	Tue, 23 Nov 2021 17:35:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 744C1F8049E; Tue, 23 Nov 2021 17:35:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04B55F80087
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 17:35:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04B55F80087
Received: by mail-io1-f49.google.com with SMTP id e144so28674972iof.3
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 08:35:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=bgBtIYtL7cZLwHi0L+w9re6YrEvFyB7ccly3PyNrDyU=;
 b=u6CZE7/CAHnjcVivLBuiiJW+Rz3nYOTPPFyDCVYYM8HmrwOUlfM8apTsgZybn89AFE
 Nu30YNUrW0Lsod730EX/5cO3LWiLWj2CqyWl/yF74f6XZ+kt9zqPgG6mqKt+8n5r0xyJ
 1c+ju/ZxcyNv8fYWHGLehjdf3mT5n2vBUqTGrOjOULitaQNWwHrzjrEh9B0JyY0Nal9E
 fTNknmhiXWu++DX+Rs3x/vSvLo9f+Aj2/TcYSoor5Ibyuzhmri7CK5zQvPQ+6pkT73/f
 WK7v0HAOizQ9Zm6+Q8qQS0VfabDmC1OGkhObMS69y63eNuHVxrz7qwXRRH2noilFf73q
 ruzA==
X-Gm-Message-State: AOAM533066m2qGwaI0t+viibEAkoJNvYOwgPWHgnjYDMTd8jPlj8HsKB
 UrFttc91BwpzDcpWkVuAgQ==
X-Google-Smtp-Source: ABdhPJyP64Phebi0pVUPZ/k/nTCv7LmrCcljL5544fGi89PXitfCOjUCM83X7GDD0NIiKnJEGGvAxQ==
X-Received: by 2002:a05:6638:25c8:: with SMTP id
 u8mr8081813jat.23.1637685306186; 
 Tue, 23 Nov 2021 08:35:06 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id n12sm9272035ilk.80.2021.11.23.08.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 08:35:05 -0800 (PST)
Received: (nullmailer pid 3442906 invoked by uid 1000);
 Tue, 23 Nov 2021 16:34:29 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
In-Reply-To: <1637581599-24120-4-git-send-email-srivasam@codeaurora.org>
References: <1637581599-24120-1-git-send-email-srivasam@codeaurora.org>
 <1637581599-24120-4-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v5 08/10] ASoC: dt-bindings: Add SC7280 sound card bindings
Date: Tue, 23 Nov 2021 09:34:29 -0700
Message-Id: <1637685269.630368.3442905.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <potturu@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, swboyd@chromium.org, lgirdwood@gmail.com,
 robh+dt@kernel.org, agross@kernel.org, rohitkr@codeaurora.org,
 broonie@kernel.org, bjorn.andersson@linaro.org, judyhsiao@chromium.org
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

On Mon, 22 Nov 2021 17:16:37 +0530, Srinivasa Rao Mandadapu wrote:
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

See https://patchwork.ozlabs.org/patch/1558044

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


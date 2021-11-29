Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0234A461AF1
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 16:32:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D9861ABD;
	Mon, 29 Nov 2021 16:31:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D9861ABD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638199954;
	bh=mgFhtybKfrfduJTdE55A8sNxla/AXnVdvUTZX1RKHRw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NfgIZotUxEVUMdAGQ/YyTX5vlEGMduVneyEpn2iCmJTlaBuk6N6DQKNyJBlbR9EIY
	 PpxY9c16pwlbtPhJxeIzLlmb95FmdL/xr4aTUmPpgrGOzJDvw/oa6cLwj2IJ4w5//r
	 NKUbsbZZi4+Gfprpy4fJ5JTMWYeLty9FnRWu3UdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBE31F8025C;
	Mon, 29 Nov 2021 16:30:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07691F80249; Mon, 29 Nov 2021 16:30:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 999A1F8020D
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 16:30:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 999A1F8020D
Received: by mail-ot1-f50.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so25974665otv.9
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 07:30:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=o9/xltpZS8/e+Fx8LAzHE+t3v33y8dbhp5g24ocDpeA=;
 b=Y5FpJXzIO8wwfAClFx25fcMG3Vl4+8bb7RSbZI7n/z0iQ8IBVlWJA6xBw2OwmrkqFf
 1E37ir2EjLshfnUVt2CisGUO7Z8m9ZXkSyV7QRI2keo6Kj5YxDhCjwu4kQa3zv+YOqMg
 VuroPruz0jb1mjn8X4LYVqiOiiYPQkhC/I4IQw69uX6qv/B9il77g4EEJTBokQ356evj
 oYE/l5fK0uww1q6KcCcCGSWzctkbc2tYrdrwUuDTWio1/YsD2w6MkRnOzsN/+af2Bwn6
 iXPYRKqR0Hx56y7wBatvBhEUViWAg2WfoDBaZXfRcMap1nBGBdcGhyzNbCyBTS3A8YWQ
 Q9ZQ==
X-Gm-Message-State: AOAM530ceg4uZEXkb0IJd8ZvwkCH9v/a8SkjEHnK7+FtCylvn7PSdmi7
 wKgiAW+MKdR2+WWiKUhpMEeYV2VZMg==
X-Google-Smtp-Source: ABdhPJzmfe6xuhnb21hy8AM/h3XzDFm6oGuf3rxxPOA0K4txwqSNxF0l8aXDu8NZZ8L0OV75xjneug==
X-Received: by 2002:a05:6830:1204:: with SMTP id
 r4mr45833918otp.34.1638199837059; 
 Mon, 29 Nov 2021 07:30:37 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id m5sm3007643oim.45.2021.11.29.07.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 07:30:36 -0800 (PST)
Received: (nullmailer pid 123615 invoked by uid 1000);
 Mon, 29 Nov 2021 15:30:31 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
In-Reply-To: <1638179932-3353-2-git-send-email-srivasam@codeaurora.org>
References: <1638179932-3353-1-git-send-email-srivasam@codeaurora.org>
 <1638179932-3353-2-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: pinctrl: qcom: Update lpass lpi file
 name to SoC specific
Date: Mon, 29 Nov 2021 09:30:31 -0600
Message-Id: <1638199831.124829.123614.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com,
 Venkata Prasad Potturu <potturu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, tiwai@suse.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-gpio@vger.kernel.org,
 agross@kernel.org, bjorn.andersson@linaro.org, broonie@kernel.org,
 rohitkr@codeaurora.org, swboyd@chromium.org, judyhsiao@chromium.org,
 plai@codeaurora.org
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

On Mon, 29 Nov 2021 15:28:48 +0530, Srinivasa Rao Mandadapu wrote:
> Change generic lpass lpi pincotrol bindings file to SoC specific file,
> to distinguish and accomadate other SoC specific dt bindings.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>  .../bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml   | 130 ---------------------
>  .../pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml     | 130 +++++++++++++++++++++
>  2 files changed, 130 insertions(+), 130 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1561071

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


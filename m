Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21607461AEF
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 16:32:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2CF7194A;
	Mon, 29 Nov 2021 16:31:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2CF7194A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638199928;
	bh=nnQF+mGalxDaRTF5BHBjXRzRIbEe6hkdehe0vL+cj4c=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fb7IiqjwIsSTCE/l4ukU0iyvW1924aNo4d9Pvc9N/ipXKHp+hKNKTAuoF05DC1Ds3
	 1EgkdDUN38/V+SG4oZhl9/H9fv/kPwp1+wxhCkV8uwEUS9G2xpestWqXUQ2WX0125X
	 1hbUQLBnZwrZGVWa9eJxQHmd98JQ8FQwYHWl+UmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12E6DF80246;
	Mon, 29 Nov 2021 16:30:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 211D8F800EE; Mon, 29 Nov 2021 16:30:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BACF0F800EE
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 16:30:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BACF0F800EE
Received: by mail-oi1-f174.google.com with SMTP id m6so35321716oim.2
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 07:30:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=6THXcIGoLp6QwGKfw0cyj8oia8wwhQE6ljHde1y7tgU=;
 b=rmheOTpxLLXx5qUdFS9WdZFjPxGaxhZ/4/wDfG9gB2zNAfN1odp3VTvSJaZFgk7yN1
 5eEJkmL9aWEzcH/X2doHdLJg01a7pK+IIMEDfIJnNVu3DEnFYZllLuO7u4K4IvLcQ0dW
 njXo/Rl+ubannyi33/jbikIzUOy2LLEi4Sdbc0M40ZppMWgvyQ2nq/vL6x3y/1d5qnnM
 XKYfmmjpS4EjXqeW3CYR1gpNwspY2OPGpvILfN7A9/1LStgazhde8D9VOhprBr6ueDPD
 2968KX+kh4nkSZSMU5Xak2MlnMuUDqCjpgJS3Ka8EUXCYIXd1bzQ9bP+uE6X9qcmoC9I
 xeaw==
X-Gm-Message-State: AOAM5308YIlETVMZD4DrlL2zqaQIx0ktwIUneggHaUkGrO2ShWH12Z1A
 CDn78jvwu8znIjnCJtwtog==
X-Google-Smtp-Source: ABdhPJzSL0gcqzaakshHOOyWn+i3lg8/UoCkqqvEtyH87CsQRjyrYnvjJR22ShYlDpIIpvfFrqxLDw==
X-Received: by 2002:a05:6808:1185:: with SMTP id
 j5mr41185468oil.16.1638199839402; 
 Mon, 29 Nov 2021 07:30:39 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id ay40sm3107794oib.1.2021.11.29.07.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 07:30:38 -0800 (PST)
Received: (nullmailer pid 123617 invoked by uid 1000);
 Mon, 29 Nov 2021 15:30:31 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
In-Reply-To: <1638179932-3353-3-git-send-email-srivasam@codeaurora.org>
References: <1638179932-3353-1-git-send-email-srivasam@codeaurora.org>
 <1638179932-3353-3-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: pinctrl: qcom: Add sc7280 lpass lpi
 pinctrl bindings
Date: Mon, 29 Nov 2021 09:30:31 -0600
Message-Id: <1638199831.132589.123616.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <potturu@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, agross@kernel.org, broonie@kernel.org,
 plai@codeaurora.org, rohitkr@codeaurora.org, bjorn.andersson@linaro.org,
 judyhsiao@chromium.org, Linus Walleij <linus.walleij@linaro.org>
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

On Mon, 29 Nov 2021 15:28:49 +0530, Srinivasa Rao Mandadapu wrote:
> Add device tree binding Documentation details for Qualcomm SC7280
> LPASS LPI pinctrl driver.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>  .../pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml     | 115 +++++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml: duplicate '$id' value 'http://devicetree.org/schemas/pinctrl/qcom,lpass-lpi-pinctrl.yaml#'

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1561073

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


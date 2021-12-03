Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CA74680AA
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 00:36:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FE2A2521;
	Sat,  4 Dec 2021 00:36:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FE2A2521
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638574619;
	bh=aiAhelb0zzp7qFgjO1pITW58ljNnENs1CeCMg2Z/wvc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I1BGaOiz8OWMnGS0tVgvebzZyy+M9QG3KlLKDxuBWVPluR1JuhlV79dyuTbraT8fm
	 aIB73csc9vsMOsNQZmkRvDknOreUB7K5m5rkYoDFwCjEfGrzTyR/15tzd77ZAyqjYY
	 QSSCXtF1o2oiG3a2Zw4RhKrQKfOZUY5LxXbl/bEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47F5CF804F2;
	Sat,  4 Dec 2021 00:34:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECE83F80246; Sat,  4 Dec 2021 00:34:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1700DF80085
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 00:34:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1700DF80085
Received: by mail-ot1-f54.google.com with SMTP id
 n17-20020a9d64d1000000b00579cf677301so5366605otl.8
 for <alsa-devel@alsa-project.org>; Fri, 03 Dec 2021 15:34:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=iC865KFxTLPcMpjh7ZOt0xoZbvZ+6a6MRjUFIn4wKjE=;
 b=FbqYkMLYFfpHKSpQdrogKb5cpcP4j3T6eyiEhRyl1a6e/9k10pzgs2Jo7xiEfDBsL9
 kFoCryCHf3beMtAwWYsd/dq4fyz60+5HGdNbWo3jdhwW6NOsW8KlfcOwl8zZzSzMjmlO
 FkpJofrpbPcWPByzVCxeNgZStsHbg6n80wjiRFkHFOnsqm3Mx31dR9qtiSo2k/vGyjnw
 Xg2g6cLG/1TDY4Gp/8pCQY3YO1zJejrg72obodJs4cbmZn4Y1LKltV3xgmGpm1wqHn89
 ps0Ua6ESF5xxDZSRLRjiDQIIP9V0JEarsxqDNGM0Ny5VKOp/MDiccwv1x56stxr50GFl
 l2UA==
X-Gm-Message-State: AOAM530ifbIBu0hhxhiH1A/Z8sREDtEk28oXVWOF2ou0DP94GHt/GDyx
 ZVQne3qVgiP4QgurOnM7Vg==
X-Google-Smtp-Source: ABdhPJw9SZBJilhMiAFCEuqmdNCHQzZc2/FYmICpgHv78bkjKjYOPiDzcdolwABRd3lABaKDyJ5BFQ==
X-Received: by 2002:a9d:4d08:: with SMTP id n8mr18258991otf.368.1638574463756; 
 Fri, 03 Dec 2021 15:34:23 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w71sm939507oiw.6.2021.12.03.15.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 15:34:23 -0800 (PST)
Received: (nullmailer pid 1043003 invoked by uid 1000);
 Fri, 03 Dec 2021 23:34:15 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.com>
In-Reply-To: <1638531140-25899-2-git-send-email-srivasam@codeaurora.com>
References: <1638531140-25899-1-git-send-email-srivasam@codeaurora.com>
 <1638531140-25899-2-git-send-email-srivasam@codeaurora.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: pinctrl: qcom: Update lpass lpi file
 name to SoC specific
Date: Fri, 03 Dec 2021 17:34:15 -0600
Message-Id: <1638574455.221589.1043002.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com,
 Venkata Prasad Potturu <potturu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 plai@codeaurora.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, swboyd@chromium.org, linux-gpio@vger.kernel.org,
 broonie@kernel.org, agross@kernel.org, rohitkr@codeaurora.org,
 bjorn.andersson@linaro.org, judyhsiao@chromium.org,
 Linus Walleij <linus.walleij@linaro.org>
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

On Fri, 03 Dec 2021 17:02:16 +0530, Srinivasa Rao Mandadapu wrote:
> Change generic lpass lpi pincotrol bindings file to SoC specific file,
> to distinguish and accomadate other SoC specific dt bindings.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.com>
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

See https://patchwork.ozlabs.org/patch/1563181

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


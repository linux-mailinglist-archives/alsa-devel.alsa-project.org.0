Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7BA4680A6
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 00:35:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0AD72494;
	Sat,  4 Dec 2021 00:34:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0AD72494
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638574547;
	bh=cQE7Qz0CiIXa7NMI9pfGvxQ7W1IoP7B3R4sw+rRhM2A=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sH2tSBhp5wNM6hxRvM175nGatK/vyX3YdO8lQPtWOZHULuF5IoeVBBLTNxOasHTYU
	 uWuvPXWaZ/PQJkMZbDPtbTsM2qX3Ch4VLENPMOvfnIFqJs5aWyw8X7+ARmWvnz58dP
	 ejy7UB3ReDLegEkIqxRU87CWkb43NKgUfqSca/a0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EBE3F80249;
	Sat,  4 Dec 2021 00:34:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46D14F800A7; Sat,  4 Dec 2021 00:34:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43C5CF800A7
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 00:34:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43C5CF800A7
Received: by mail-oi1-f169.google.com with SMTP id o4so8774529oia.10
 for <alsa-devel@alsa-project.org>; Fri, 03 Dec 2021 15:34:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=dXD3ujoJ+Ol1hRij1M2TL8mmDFnoEkO7pukqJulGr+k=;
 b=FI5gohQRNOHeFmjhMNHzz0Sv0awW/RKxAh+dbXs9+8v1wlpLvQ+iSE61g73jyAsvrq
 w/KFaAx4cJHKQO3L9uYhgYRkwIvz/oxKAC5C+OEj/nz0LQrjYdGxAkGgzPtlv17vNHSF
 eWnr+e1WFuZDmO+Q3OoVUkjilIHYUyWglfIuU5vK0nteApP9aOyPjkLNG5E996Kz3lAj
 TIZBJTWEcFVq8hv2YP316427h6vV3aZ1KoDGvemATLbJvbNishvY8Mr0n6Jhjji65ra4
 4AtAzzB6FtS82iqNOWcUiemL2QYQGSxoOKNkzO0fGLOjB310scRcg0m3mm7t0xJ/9ZjJ
 GJvg==
X-Gm-Message-State: AOAM533ZFnQ14RX0mMIUUGaPRK+Kp2Qgo23QsiJqJw388ddn9mrqyVS9
 15PrtICQO5B1wCm/FJRowA==
X-Google-Smtp-Source: ABdhPJw6QS6fsJGv+QpL9azlCRNikWE+y330z+sQRPDPP5v6tmPL6FFgkXT+M0qnV60ohRJj21X+IQ==
X-Received: by 2002:a05:6808:10ce:: with SMTP id
 s14mr11965670ois.137.1638574458626; 
 Fri, 03 Dec 2021 15:34:18 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id b22sm945076oib.41.2021.12.03.15.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 15:34:17 -0800 (PST)
Received: (nullmailer pid 1043005 invoked by uid 1000);
 Fri, 03 Dec 2021 23:34:15 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.com>
In-Reply-To: <1638531140-25899-3-git-send-email-srivasam@codeaurora.com>
References: <1638531140-25899-1-git-send-email-srivasam@codeaurora.com>
 <1638531140-25899-3-git-send-email-srivasam@codeaurora.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: pinctrl: qcom: Add sc7280 lpass lpi
 pinctrl bindings
Date: Fri, 03 Dec 2021 17:34:15 -0600
Message-Id: <1638574455.236196.1043004.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 lgirdwood@gmail.com, Venkata Prasad Potturu <potturu@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 agross@kernel.org, swboyd@chromium.org, bjorn.andersson@linaro.org,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org, rohitkr@codeaurora.org,
 broonie@kernel.org, judyhsiao@chromium.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
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

On Fri, 03 Dec 2021 17:02:17 +0530, Srinivasa Rao Mandadapu wrote:
> From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> 
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
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml: duplicate '$id' value 'http://devicetree.org/schemas/pinctrl/qcom,lpass-lpi-pinctrl.yaml#'

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1563187

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


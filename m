Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B29544BC4E0
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Feb 2022 03:33:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 379F61734;
	Sat, 19 Feb 2022 03:32:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 379F61734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645238024;
	bh=GMyd0+sXMi4cIFzcL0iJI6zscXkgFMDHcUknF9cxQis=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dOQLW+GLrkRiVyypVVpigG3jVGuT3oaqDxednuMIU65a+vDL+yNxSQkzun/8VJVsj
	 bJ87NM8USwa7erqzwMA0f4FU7ZPtoKr849HOzo8n2hALgRjDldzFOyPFXLZtDI02/z
	 PwD71Q9J//utxFy8CTQsAcHuUuNNxgYjrWZ9ifaI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 574C3F8016B;
	Sat, 19 Feb 2022 03:32:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AFBEF8016A; Sat, 19 Feb 2022 03:32:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 510F0F800AB
 for <alsa-devel@alsa-project.org>; Sat, 19 Feb 2022 03:32:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 510F0F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="i1BaGO+F"
Received: by mail-oi1-x22d.google.com with SMTP id a6so5048074oid.9
 for <alsa-devel@alsa-project.org>; Fri, 18 Feb 2022 18:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=GMyd0+sXMi4cIFzcL0iJI6zscXkgFMDHcUknF9cxQis=;
 b=i1BaGO+F9XGzIZMSKGhY8yTuyr89G7+EJfFqOOAHde+lwE4P4HgSbb5JUP0L1xQG3q
 xWVV24YMKR1/KeN6qa7KKstzzQZmkIBIDVx6wdPP+CvgNlYQFcigM1AlOqA5VWaGtDtt
 DXkpIN5IlLhK182wst1HI3hS6xIv+B42mKRio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=GMyd0+sXMi4cIFzcL0iJI6zscXkgFMDHcUknF9cxQis=;
 b=wPWXFO9T31hJRGs55/KviAgPtQUqBalxV1KYxGdZntfNqezyoMdQ2Bp61lVLRRIcY/
 a5v1a0l3D6wP2jopeOqAkdcHtfwUpP9CVlE9K0BPCHuZfrP0uL5woQcN/D99YDsIQuQo
 DESukdpS/I7bHdodq/k3XPoCWnBXSooSLI/Uoxt9ZHK1U1AORl29sW3gcRM+Y04nUk9R
 qtYUowglQPWpUY21M7p4uTy/tn8c8bfdfVC2ru5QYJH2FCKPNvoTaY8cNQiyS2vXH6RC
 HBeglrW7WdgH0Lnlw6LVCiXjCeBRpwb6cPEGPmlK1PjGAfhBVhk4PD9dzya3jIjVqx5M
 IxDA==
X-Gm-Message-State: AOAM532cFpu0TL9U0ByN3wlFbxFejozC5k8Si79ru6UJC2iBaxoWbV0z
 BWgaAvnab3bFZOkA1TNTZeWggC34wK4yvV8kfwb1dw==
X-Google-Smtp-Source: ABdhPJw34gCloewSbJ7M6JQB0jN6jKAkR9GAZpyAcVGrzLxrbEqMsFWVYuzOyI1NGQWi4ffTFeIXjyjw0kRA2nfyoa8=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr6296170oig.40.1645237948132; Fri, 18
 Feb 2022 18:32:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 18:32:27 -0800
MIME-Version: 1.0
In-Reply-To: <1644851994-22732-2-git-send-email-quic_srivasam@quicinc.com>
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
 <1644851994-22732-2-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 18 Feb 2022 18:32:27 -0800
Message-ID: <CAE-0n52Ksur6aSuB69h49LjDFU2LXBh-b3HRTK+uYTU4fcQhDA@mail.gmail.com>
Subject: Re: [PATCH v6 1/7] dt-bindings: pinctrl: qcom: Update lpass lpi file
 name to SoC specific
To: Linus Walleij <linus.walleij@linaro.org>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, quic_plai@quicinc.com, 
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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

Quoting Srinivasa Rao Mandadapu (2022-02-14 07:19:48)
> Change generic lpass lpi pincotrol bindings file to SoC specific file,
> to distinguish and accomadate other SoC specific dt bindings.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

If you generate the patch with git format-patch -M -C does it detect
this is largely a copy? I tried myself and it looks like it is.

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
index 5c5542f1627c..06efb1382876 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/qcom,lpass-lpi-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#

 title: Qualcomm Technologies, Inc. Low Power Audio SubSystem (LPASS)


Please generate with -M and -C in the future.

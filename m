Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A91484BAD07
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Feb 2022 00:05:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F30A187D;
	Fri, 18 Feb 2022 00:04:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F30A187D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645139103;
	bh=OO5QeJBeIhbkKQUPmn7/Wwe7hFTDM/XNfT9aU6O2tYI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bj05uPeZpv+g5xn+AeQ0fYLEmot0IpPoaAchE3BH6U4sCXciYAJI/+jTZvsWHwnXA
	 ELy69Zts+krMTerewgfz0M+4M+zA3YWo7+dR7h8qkr3Xjq0ap4vUkhKTZ7TxMU3U0I
	 ws0JsGo5Wk0U9wd0Ir6kcfofhcYsZfeZb+n1nKCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A99BCF80246;
	Fri, 18 Feb 2022 00:03:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E01EEF80240; Fri, 18 Feb 2022 00:03:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0866F800C0
 for <alsa-devel@alsa-project.org>; Fri, 18 Feb 2022 00:03:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0866F800C0
Received: by mail-io1-f51.google.com with SMTP id w7so5564823ioj.5
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 15:03:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a90pTChAYnDmwk/LBPu/23Ywkd3tKQPqdNOZmAKI93Q=;
 b=kW/T+y6cJtjzyHrqDYimE56seKDQRJAwHO1bKUBi9NxnRO6sCgj1XWByd7Rv2tuxGO
 MkUVcrTdK1jk8iiyI7//oo3xZP5ph9hLh21UcRLKdAfOvu3qbaz/WTupUuMPxwk5veRi
 1DNRXGL5NvgO9J9nBzuqm2dQdyG83T7m/htmeRj4KzxrSqXDo1Ou9tObHlP7ZQjWGXUD
 o5SYLunXc8XSIxJ/+Djv1wVD93Qw4KdceJz7GFHNCpMnUQeQNvsF9Pzi8pkb4+7Hj9U9
 G7dOP4lAIaKYg0GAABdQNJU+QRFNYebiNOYNaIKsojUmTAsA3a3LlXb6QEK9icnFjAyg
 hcKQ==
X-Gm-Message-State: AOAM5330jI46MUdlB7o46BxldmCA8OU9sHY6O8DBuIQnndBFvZ/X0KKX
 zw9ltyhDQL6OKrXtripzAw==
X-Google-Smtp-Source: ABdhPJwBNOHhOTwNdVsdNbEO922dnDGVriqBho+EVOye2+ET06i6szcEIK8HwmqntGDDgPD3BpC68A==
X-Received: by 2002:a05:6602:1652:b0:611:56a8:8aae with SMTP id
 y18-20020a056602165200b0061156a88aaemr3410597iow.101.1645139026697; 
 Thu, 17 Feb 2022 15:03:46 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id w15sm268284iou.44.2022.02.17.15.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 15:03:45 -0800 (PST)
Received: (nullmailer pid 3935833 invoked by uid 1000);
 Thu, 17 Feb 2022 23:03:43 -0000
Date: Thu, 17 Feb 2022 17:03:43 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v6 1/7] dt-bindings: pinctrl: qcom: Update lpass lpi file
 name to SoC specific
Message-ID: <Yg7UT5eZbmMF+SyN@robh.at.kernel.org>
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
 <1644851994-22732-2-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644851994-22732-2-git-send-email-quic_srivasam@quicinc.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, tiwai@suse.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, linux-gpio@vger.kernel.org,
 srinivas.kandagatla@linaro.org, broonie@kernel.org, rohitkr@codeaurora.org,
 agross@kernel.org, quic_plai@quicinc.com, swboyd@chromium.org,
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, judyhsiao@chromium.org,
 linux-kernel@vger.kernel.org
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

On Mon, 14 Feb 2022 20:49:48 +0530, Srinivasa Rao Mandadapu wrote:
> Change generic lpass lpi pincotrol bindings file to SoC specific file,
> to distinguish and accomadate other SoC specific dt bindings.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  .../bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml   | 133 ---------------------
>  .../pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml     | 133 +++++++++++++++++++++
>  2 files changed, 133 insertions(+), 133 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.


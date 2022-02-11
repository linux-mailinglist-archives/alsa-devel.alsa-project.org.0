Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6534B2560
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Feb 2022 13:14:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B7E7192B;
	Fri, 11 Feb 2022 13:13:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B7E7192B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644581657;
	bh=E1EmZRPmz9zCH5C8E2vwYvc1f9Bit4GPxAuWE1SRMXk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pMZmsw3Nlp6CPIpu3wPB5OCX9mDu6qrjrP0zgyDmtExg88DaWPqllFeFRRCe9EGXB
	 idxJcbNU9XfZ39oOE0ExWgtCi7vDWx1492+sBdjFD9/WoAWfsvDzwFfe/nsUAOQQkP
	 1ToLN2Nag8t8PFp0J0nUd4mbpYWYklld242UTB+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11F14F8013D;
	Fri, 11 Feb 2022 13:13:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86ADAF80054; Fri, 11 Feb 2022 13:13:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FD22F80054
 for <alsa-devel@alsa-project.org>; Fri, 11 Feb 2022 13:13:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FD22F80054
Received: by mail-oi1-f169.google.com with SMTP id r27so9309218oiw.4
 for <alsa-devel@alsa-project.org>; Fri, 11 Feb 2022 04:13:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=cuBlIjJY4vaAWQT/4C6Ak9m1WRcqNbkYIsxGyvkT4rk=;
 b=o/QgV5HipN8e1X2hIINQuFWLIhtGii+z/JY6pYaCupN/W17pScZnEmpcgTB8w0kxJ8
 WWbr+yZIM36+vSGFpUJDLKZL9fwODEjyr3eQ9ySkyZr8FI+haiMKYSINVt0eT495/zEd
 eAlDA7qPSHPU5waGV0ydrpkm9SkIkZDHO3OAERT/vswYD/cz5S554TOtxBpnJglYQe0U
 YMXbOlOq3kg0mcp84PmgoKcvEVCuSgoVP6KHvFRV4eets3JZfX8WvwKZnq3sKq67uCDh
 uBcB97eXnFUlSx7HlMSiEqupiGwEXtcan4XQLDcGDm0lt6bBKA/ewsKjOtjnswnL9wki
 n1vw==
X-Gm-Message-State: AOAM5330JRTPkj1SHetgm75RkwOYT98uWVPkY8ZG6bkjSQL4Uo8kByPq
 6yUGVw15xRU/O6/WiRvcpw==
X-Google-Smtp-Source: ABdhPJwC68NbqlKCoT6iGNdOcPryVMllb8uhD4nbb/rVM94vLoxVJPFWGXcXeY9hjrenDtePrHtmxQ==
X-Received: by 2002:a05:6808:2026:: with SMTP id
 q38mr16779oiw.243.1644581582414; 
 Fri, 11 Feb 2022 04:13:02 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20d4:10b7:69a2:33cd:1782:fb47])
 by smtp.gmail.com with ESMTPSA id
 bx41sm6384628oib.7.2022.02.11.04.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:13:01 -0800 (PST)
Received: (nullmailer pid 141879 invoked by uid 1000);
 Fri, 11 Feb 2022 12:12:43 -0000
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
In-Reply-To: <20220211103818.8266-12-jiaxin.yu@mediatek.com>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
 <20220211103818.8266-12-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 11/15] dt-bindings: mediatek: mt8186: add audio afe
 document
Date: Fri, 11 Feb 2022 06:12:43 -0600
Message-Id: <1644581563.497957.141878.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 geert+renesas@glider.be, broonie@kernel.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com, zhangqilong3@huawei.com,
 linux-arm-kernel@lists.infradead.org
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

On Fri, 11 Feb 2022 18:38:14 +0800, Jiaxin Yu wrote:
> This patch adds mt8186 audio afe document.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../bindings/sound/mt8186-afe-pcm.yaml        | 175 ++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml:10:4: [warning] wrong indentation: expected 2 but found 3 (indentation)
./Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml:14:7: [warning] wrong indentation: expected 4 but found 6 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1591561

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


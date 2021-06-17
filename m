Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E94BF3ABE03
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 23:28:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 712341793;
	Thu, 17 Jun 2021 23:27:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 712341793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623965284;
	bh=cUSZZJkJrJaVQ5o+mXRxC0e8eGW5FCGrbAYb3qp4EEA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aTymPLViPP3/9/5dGdK3PVimIjCtnImLZVRxXLl/y8gSF+kIRQGfx7toq6RjrUfHg
	 kESWfSegndoOdZSbuYT8y/gJrbQ1kulk6yaKPdJ3AtiF9U4yXf11HfiIYn1aYieegn
	 KsFrEiK1SOirZs/j8vNJOeI0+5OsMEFUPxi+5Q+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF735F8025E;
	Thu, 17 Jun 2021 23:26:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92732F8025A; Thu, 17 Jun 2021 23:26:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86CDFF80148
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 23:26:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86CDFF80148
Received: by mail-il1-f173.google.com with SMTP id z1so6710571ils.0
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 14:26:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=p45NMbcaVp4H9evUR08HW/+ZfqRoQVKi3z17BKOdh6c=;
 b=H3zqOytB75kCj9F6R4Kmhb0SMuNpInXFwGb/2PkJq6TvSozAqiZJIMqo7eJ/BEj1XQ
 eNY5Gn3n0Wsp/9uYiVSQz61V48e6odDxiiiD+zqt1vXqqpGaqCa8v7xEbXPSpFss8aqz
 TGSlCpAnZ+BUXKllfmtQdayIVC5X53WBW3PJY5MdmXfgscG7J2chBuTx/wAh7mGMDkfB
 E5Cdh93xg7TMK2w6F/5t+JAHjBjwd3X6wc7Ei1u2GxdLzwBe1Z+iA/rP9BvITnnl7Ph9
 aZ6s960KNv5XHJiCjMVAYW7v7mq36Tm4GHVPC5DhSYAJzBS1USX2ZLPZwa0TID1G8gia
 nITQ==
X-Gm-Message-State: AOAM530cMh43yhw5qSqCNeu0oCcB7beoYeIhTS3GCMybRK7jJ6djWUGD
 hXNTfVQcOV7rvajl3g79Ng==
X-Google-Smtp-Source: ABdhPJwm3AS35eq/yoc+fK1o+R4mYlC3E5uJ1Rfsjp9EPZNVptpaddPf4yldQ69E3tTW7CyCyzsmPA==
X-Received: by 2002:a92:260b:: with SMTP id n11mr4925314ile.134.1623965187706; 
 Thu, 17 Jun 2021 14:26:27 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id q19sm82124ilc.70.2021.06.17.14.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 14:26:27 -0700 (PDT)
Received: (nullmailer pid 3336113 invoked by uid 1000);
 Thu, 17 Jun 2021 21:26:24 -0000
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
In-Reply-To: <20210617054740.8081-7-trevor.wu@mediatek.com>
References: <20210617054740.8081-1-trevor.wu@mediatek.com>
 <20210617054740.8081-7-trevor.wu@mediatek.com>
Subject: Re: [PATCH 6/8] dt-bindings: mediatek: mt8195: add audio afe document
Date: Thu, 17 Jun 2021 15:26:24 -0600
Message-Id: <1623965184.501241.3336112.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, bicycle.tsai@mediatek.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, tiwai@suse.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, jiaxin.yu@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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

On Thu, 17 Jun 2021 13:47:37 +0800, Trevor Wu wrote:
> This patch adds mt8195 audio afe document.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mt8195-afe-pcm.yaml        | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml:10:4: [warning] wrong indentation: expected 2 but found 3 (indentation)
./Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml:14:7: [warning] wrong indentation: expected 4 but found 6 (indentation)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sound/mt8195-afe-pcm.example.dts:19:18: fatal error: dt-bindings/clock/mt8195-clk.h: No such file or directory
   19 |         #include <dt-bindings/clock/mt8195-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/sound/mt8195-afe-pcm.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1493197

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


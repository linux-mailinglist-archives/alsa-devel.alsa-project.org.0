Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B0C563B4B
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 22:55:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AE521687;
	Fri,  1 Jul 2022 22:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AE521687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656708956;
	bh=79tqSxViAoC56X9CjYk+Obn8usRTKZy5lbn+53L/JlM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XKkR8KSrT3eNqZsmjyGLIWhOqxy3ixvR1LGMe82e1rP6pWkDenbluwKl3YYPqJzEi
	 f+yuSYz6C8uiQpVpQdoEakDn5TLdpJv6RUmXl3h52o/YLFoitMmtN8arG92jUiGLXN
	 rIbB4zJjJ7PurtWLbcuvMgJ0xtvPEBGVTxno+phE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA479F80256;
	Fri,  1 Jul 2022 22:54:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22A7FF80155; Fri,  1 Jul 2022 22:54:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9D94F8014E
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 22:54:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9D94F8014E
Received: by mail-il1-f174.google.com with SMTP id a7so2133820ilj.2
 for <alsa-devel@alsa-project.org>; Fri, 01 Jul 2022 13:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HrTG0yud13UmQCFPBZCzpXGEK9vy1R8RoOTRKyUValo=;
 b=euJA5mZgSQctjD2gMr1lIBgoRWqHYWVXHIyq+t87G8737kDT3O1OKObpKAdpUL75wt
 5RILAwHEx5Q0TJn4EzPJpQAUbVMkgWUYGLZw2yK/l1MRsGieahUChSkuNH0pS0kOFnFU
 lGfJyTf2nJwPmHOtr6tI9v9BN1/ZZ0fp+HcwGHoWUkCCqWnnmrIvVxzYclcSvej57bXh
 kEI+bFAwoobArrelgnh8ozo0BUABL4c+cWOl4giU4EcTixHZ3Cfv4w9/jrC0zs4Lhikk
 1XlDft1CJirjUW2f8p/zD0li8rXLPlCdIDN29I2Vu9tm/HQlGo/oNmMYQaz+vyesBX2+
 ywag==
X-Gm-Message-State: AJIora9IBYdqujMN44jAGYOkZrdPHunGuZaTH2V6/rmXrZLieExolWYN
 n46wGGkEXodrd/AlEhUZDA==
X-Google-Smtp-Source: AGRyM1tN03ajV9JtjOBB9YmRsmAfhh0DZ3pRb8uoazawRe++MW5uDTrgKNun8JIBUIZsI2Usu7M1NQ==
X-Received: by 2002:a92:ddd1:0:b0:2d5:4877:65c8 with SMTP id
 d17-20020a92ddd1000000b002d5487765c8mr9847783ilr.267.1656708886842; 
 Fri, 01 Jul 2022 13:54:46 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 f65-20020a0284c7000000b00339ddd8adddsm10257382jai.98.2022.07.01.13.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 13:54:46 -0700 (PDT)
Received: (nullmailer pid 1511267 invoked by uid 1000);
 Fri, 01 Jul 2022 20:54:44 -0000
Date: Fri, 1 Jul 2022 14:54:44 -0600
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 5/6] ASoC: dt-bindings: fsl_spdif: Add two PLL clock
 source
Message-ID: <20220701205444.GA1511232-robh@kernel.org>
References: <1656667961-1799-1-git-send-email-shengjiu.wang@nxp.com>
 <1656667961-1799-6-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1656667961-1799-6-git-send-email-shengjiu.wang@nxp.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 tiwai@suse.com, nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com,
 krzk+dt@kernel.org, shengjiu.wang@gmail.com
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

On Fri, 01 Jul 2022 17:32:40 +0800, Shengjiu Wang wrote:
> Add two PLL clock source, they are the parent clocks of root clock
> one is for 8kHz series rates, another one is for 11kHz series rates.
> They are optional clocks, if there are such clocks, then driver
> can switch between them for supporting more accurate rates.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,spdif.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

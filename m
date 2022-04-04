Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2C94F1977
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Apr 2022 19:03:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 475B0169C;
	Mon,  4 Apr 2022 19:02:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 475B0169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649091811;
	bh=U64/6HeD5KKEWw/6DdZU+2gqxujD1nOH0dsk6xdcRBU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RHUKSr2VRwX1zBJn0JLSCXLQRFfXJWjZtSP1fPM7/Hg7Jss09pYnqfTc4trDztRRk
	 8LC4VkX+Nr9QHgrJygz7tgURrqlrJP7FhpBF0HoFcxjNqTKJTwoS+qblXjJ9TZXOMm
	 eG5NhXpiGMe/vUML8TyA3Wpo3dxUMzz84Ajq5DLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B60CDF801F7;
	Mon,  4 Apr 2022 19:02:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59CF7F80162; Mon,  4 Apr 2022 19:02:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 756ECF80100
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 19:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 756ECF80100
Received: by mail-oi1-f182.google.com with SMTP id t21so10677784oie.11
 for <alsa-devel@alsa-project.org>; Mon, 04 Apr 2022 10:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KnM/3DeRUkghGL3B228lv8tjJAJo66tZo/nzV6jVUL8=;
 b=w9Ux8aNKpMl0Y5tGhBVqyHCTGgakHp+WIZNwrfJhg5PU81FVe+ZSBlRQrjXKZ+ruF2
 gV+AtPFBky+m5hQ9NCGvJ1/TUwez/CcikgklXrPTlzWJ/SbPzF6S+NjVxcKl71p1x6VZ
 D8yuNLNFzt3OXIoodvIbNPnZNGykrjPVAESUWWyzQVeJoONJ7F3ujSq2VOMBjXN9w3PR
 yukNrKH5cOR/9e/1F7E9exZ5Pvi5ZFbzmmgQj3HYbzESo9NAhoK2qHQSJeDF/wsBFAA/
 VLfitWU4r7JfDKaBvNKG9o7iNLqjFmgiVWUs2Tx5JsIo0aeF92bfNuyo1CmIQ3zEjiU6
 SvNg==
X-Gm-Message-State: AOAM53361JcqwTIjA8wXGOsHiAgGslPVQYe1hxvYwEFw/ps1Sf9j3oBO
 d9LGLrM0oyJzGT2VToD9BA==
X-Google-Smtp-Source: ABdhPJwjAxbJ3KU0l9+VXRjxGhhRZm4agoSKxhMj4f9qcCrMs2dDJ+nBsX6ziJpkXNEm3ZrMKCAzUA==
X-Received: by 2002:a05:6808:2008:b0:2da:5b12:83ff with SMTP id
 q8-20020a056808200800b002da5b1283ffmr47508oiw.216.1649091740535; 
 Mon, 04 Apr 2022 10:02:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t3-20020a05680800c300b002f935a7daa9sm4403437oic.19.2022.04.04.10.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 10:02:19 -0700 (PDT)
Received: (nullmailer pid 1527750 invoked by uid 1000);
 Mon, 04 Apr 2022 17:02:19 -0000
Date: Mon, 4 Apr 2022 12:02:19 -0500
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix 'enum' lists with duplicate entries
Message-ID: <Ykskm27aWyHMGk5v@robh.at.kernel.org>
References: <20220401141247.2993925-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401141247.2993925-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-pm@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, - <patches@opensource.cirrus.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Sebastian Reichel <sre@kernel.org>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
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

On Fri, 01 Apr 2022 09:12:47 -0500, Rob Herring wrote:
> There's no reason to list the same value twice in an 'enum'. Fix all the
> occurrences in the tree. A meta-schema change will catch future ones.
> 
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> Cc: - <patches@opensource.cirrus.com>
> Cc: linux-media@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> There's also one other occurrence in snps,dwmac.yaml I didn't fix as
> there's a patch[1] for it which prompted this patch.
> 
> Rob
> 
> [1] https://lore.kernel.org/r/20220401030847epcms1p8cf7a8e1d8cd7d325dacf30f78da36328@epcms1p8
> 
>  .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml        |  1 -
>  Documentation/devicetree/bindings/bus/ti-sysc.yaml    |  1 -
>  .../bindings/media/mediatek,vcodec-encoder.yaml       |  1 -
>  .../devicetree/bindings/pinctrl/cirrus,madera.yaml    | 11 +++++------
>  .../devicetree/bindings/power/supply/bq2415x.yaml     |  1 -
>  5 files changed, 5 insertions(+), 10 deletions(-)
> 

Applied, thanks!

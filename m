Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 202224AFF07
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 22:14:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B613718D9;
	Wed,  9 Feb 2022 22:13:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B613718D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644441266;
	bh=XQqjVMTjU+azDUa5c5ffJJ/Z4GextooWfbUKw/FJYhU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=flfb+B7ShCzwpB82I9ejyYxGF0FwvZAcZVuhiF1RU2MwZqGwHcTZL+SWRuzVvhCi9
	 CkXeijn0zSWcu4URMnAqyVGVQWZNKSVtfL+qaVJ3wbrzHrAjfvZ4NVQXdmo2oXlF+5
	 jtlOwkAcb+FMge5XZN/kLjmTvEEmReTCleRQA6q0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CBC3F800A7;
	Wed,  9 Feb 2022 22:13:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0342F8016A; Wed,  9 Feb 2022 22:13:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77187F800ED
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 22:13:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77187F800ED
Received: by mail-oo1-f51.google.com with SMTP id
 p190-20020a4a2fc7000000b0031820de484aso3952067oop.9
 for <alsa-devel@alsa-project.org>; Wed, 09 Feb 2022 13:13:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2d9uknkMXF1hP9/kz6yWKEZgfCAsCNW/6xcg2yf69Ks=;
 b=WBlDm/0NnjfOXPJ3mAiIdkyrfDn+3Cfp6lIOaE4cA6X0YDHbYdoy755vLB2c/JgCBx
 LIrCjkIDNnTu+LRsqcLFXWeExeWe9UPSnG7qIzPMFJTmDy/Jv07qITe7zxnrdPDTp/+/
 aUWoL8krBoPezvgAab5VIK0w6OfFAeSBoDJyjN5YA0XQUW+Suj+rue0829ybPR1wwWYJ
 tLF3r6Uyf/SIxesUqo5eqKVlHsvgN6aDFbI6fyhdx94ozMvum7SqG3RvCCMuTBuTfQEP
 eUNLzuI3uhI72SpjyC00eah8aekesQWE7bPyiTJsOAZmOulX3ERxK3iYL9rvOAsemxhO
 YTZw==
X-Gm-Message-State: AOAM530kxwL8cb5/t0P3VJaHTDlCcoIe3aFYLWSimvZC2DG+1dPwlrE1
 TdlyfSivQnOfiwRLRSZvjfGMWcHb3w==
X-Google-Smtp-Source: ABdhPJzaGPmfsdC4kTq9wcUQ8tghT7p5Au4l30tbl0kHd/2db1AL7QxTpJNzhEi3x80IVLemA2gNCA==
X-Received: by 2002:a05:6870:6288:: with SMTP id
 s8mr1403442oan.269.1644441188101; 
 Wed, 09 Feb 2022 13:13:08 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t21sm7066345otj.26.2022.02.09.13.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 13:13:07 -0800 (PST)
Received: (nullmailer pid 923087 invoked by uid 1000);
 Wed, 09 Feb 2022 21:13:06 -0000
Date: Wed, 9 Feb 2022 15:13:06 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-bindings: samsung,tm2: convert to dtschema
Message-ID: <YgQuYoJai+fYuBtL@robh.at.kernel.org>
References: <20220129122357.45545-1-krzysztof.kozlowski@canonical.com>
 <20220129122430.45694-5-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220129122430.45694-5-krzysztof.kozlowski@canonical.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Bakker <xc-racer2@live.ca>
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

On Sat, 29 Jan 2022 13:24:30 +0100, Krzysztof Kozlowski wrote:
> Convert the audio complex on Samsung TM2 boards with Samsung Exynos SoC
> to DT schema format.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/sound/samsung,tm2-audio.txt      | 42 ----------
>  .../bindings/sound/samsung,tm2.yaml           | 80 +++++++++++++++++++
>  2 files changed, 80 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

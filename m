Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2D84AFED1
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 22:00:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9169418BD;
	Wed,  9 Feb 2022 21:59:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9169418BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644440409;
	bh=aisUSl4UVX2dmfJP2WwBRsoip1XpzAoGprKMgsfuntc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CwKyTwzORJoOwkAjYxgwVcZNuHE72MLioKjtAulZuAtxEU+faqWc8Xv6+a98nRa1R
	 GhYWCeN+eOLJnJMME7BVds0zdWkBIW2KfH9WVEaFN1fNeb4qlF4e1Mca0Ej98zcCsO
	 UXuU/Twp7gkwWj+s+oantOzjUSoia589Zkxhn/8c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C821F80518;
	Wed,  9 Feb 2022 21:59:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E3DFF80517; Wed,  9 Feb 2022 21:59:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34932F80511
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 21:58:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34932F80511
Received: by mail-oo1-f50.google.com with SMTP id
 p190-20020a4a2fc7000000b0031820de484aso3908544oop.9
 for <alsa-devel@alsa-project.org>; Wed, 09 Feb 2022 12:58:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fu+WPKnKvH/YrQ0Pc+0sueowaG4ZFv+jBBVUspqnCJ0=;
 b=7BmX89SCxJwBqdANrhNCcaj+yLuXtq5U/lgvPunkNDArngDXA06/6ei8LvU0dIVCo2
 S4EkVAca8v/Ga2UzatTMUqQJGgKV8CX7Jzy8UdsZNFhtbiCMMSKKp14VBLsNGRxv02C0
 399WdOrGVyj5fAjOk5JhtfCW6sjznZwK27/4NTBg5J6wbrrm/8aj7uM/iF8BU5dWG0KY
 M21TVI8SWGoN173q37ZRwAfUNiXrWIobgVwF15kxMqCVEZTUlLanUtfaS+EYGr0NCRiy
 luNFZCQU1e0WbpPg7IYhRUKyC3AUabGCh+/gNU9iUTK1RHzVl6OjpF5/trhmpmpOd0+H
 iQYQ==
X-Gm-Message-State: AOAM533HMgGDxjOp26p9ve6ZUF2M19aARM2DaOM8WXla2HVUYSURxded
 T3vQOFgltuLVXxWxZ9wssw==
X-Google-Smtp-Source: ABdhPJyhzLC/Hx1k7zcA8ZuuF1/zA7kovLAhGq/6WJJUVSOUk20OkhdGNpYdCUPuQeWWYyq2vJXejw==
X-Received: by 2002:a05:6820:514:: with SMTP id
 m20mr1681984ooj.28.1644440335643; 
 Wed, 09 Feb 2022 12:58:55 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id m5sm7052127otk.78.2022.02.09.12.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 12:58:54 -0800 (PST)
Received: (nullmailer pid 898525 invoked by uid 1000);
 Wed, 09 Feb 2022 20:58:54 -0000
Date: Wed, 9 Feb 2022 14:58:54 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v2 3/6] ASoC: dt-bindings: samsung,arndale: document
 ALC5631
Message-ID: <YgQrDi/gwyEYEZZ5@robh.at.kernel.org>
References: <20220129122357.45545-1-krzysztof.kozlowski@canonical.com>
 <20220129122430.45694-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220129122430.45694-2-krzysztof.kozlowski@canonical.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Jonathan Bakker <xc-racer2@live.ca>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
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

On Sat, 29 Jan 2022 13:24:27 +0100, Krzysztof Kozlowski wrote:
> The Arndale audio complex might come with ALC5631 which is compatible
> with RT5631.  Document the compatible since it is used in Linux kernel
> sources.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  Documentation/devicetree/bindings/sound/samsung,arndale.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

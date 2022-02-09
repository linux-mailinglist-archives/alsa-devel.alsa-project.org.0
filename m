Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4194AFED0
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 22:00:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC05818A9;
	Wed,  9 Feb 2022 21:59:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC05818A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644440404;
	bh=Y4xGkFotBAbMNqqlJctVDxyzg60JAbrqGPpfwOSf1p0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZvQH1h/IkZH88oW0HEpnNgdeo2wftUTiGQSO6KWl9zyheFRw2ta3WdT6HI1ADPKk/
	 e2Cr7D9VXVSPDs/0Ylxhcf/jxCetoXxeMhCQ4MmQDngFjHNQjO2Fiy+quHIm8JWpdl
	 9gwuOoTnnTGGolAfB63PnglvjZ+/YesiTs5tTWfk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8437BF804AA;
	Wed,  9 Feb 2022 21:58:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A192BF800ED; Wed,  9 Feb 2022 21:58:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D3B1F800ED
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 21:58:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D3B1F800ED
Received: by mail-oo1-f47.google.com with SMTP id
 189-20020a4a03c6000000b003179d7b30d8so3948221ooi.2
 for <alsa-devel@alsa-project.org>; Wed, 09 Feb 2022 12:58:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zPbMVchSBzMb3DRU50KOh4bvFIb2tylymt9Rn0zR0Yw=;
 b=4xJxG5IKYmRA9afW4WEpFud+V+/0T/UWM3bYG9sqW9TTuco0B6tU72lPDdJvjLG+oJ
 mzx4Jwu3Ag1FYh5l5q2NhYb7bi+tI39ILdMpfh4fy7CrEsPLXa8q0ApxsxNzX73A1I/8
 6T3G7enMTNmG+srnvaJwPKMx6e3lasTdjT74EsajzABMVWCIoI2rs66F9ylSzZEHn/wr
 gDIY7fHuZAphKj1OvkU16gYVKbNmjpk+QICCvCGlh3V3YebYbGEDgcOm8ekM9CQVSzZF
 /Hu6JPTfzzWYwk8EelfHpPfTcWdfDTJhsre1nSyZs9awAWRfPck+i1luN15l7WSwMuaK
 QY0g==
X-Gm-Message-State: AOAM530ixrVXjTEqURnWoQwBrHmVwCqkEh4uxT4DLMhezuxSnpk2tUnK
 U34GJ3shnLsW/nuHwabsJw==
X-Google-Smtp-Source: ABdhPJySP7RiAIkhAP/NMcvNB/khUFigoTNlZRS5IuvUSWT+5WXsS6bvdAC+if5jHaAddbDHc8XLPA==
X-Received: by 2002:a05:6870:d384:: with SMTP id
 k4mr1551501oag.276.1644440316444; 
 Wed, 09 Feb 2022 12:58:36 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 23sm5053278oan.6.2022.02.09.12.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 12:58:35 -0800 (PST)
Received: (nullmailer pid 897934 invoked by uid 1000);
 Wed, 09 Feb 2022 20:58:34 -0000
Date: Wed, 9 Feb 2022 14:58:34 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v2 2/6] ASoC: dt-bindings: samsung,arndale: convert to
 dtschema
Message-ID: <YgQq+gmRk4SRznSY@robh.at.kernel.org>
References: <20220129122357.45545-1-krzysztof.kozlowski@canonical.com>
 <20220129122430.45694-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220129122430.45694-1-krzysztof.kozlowski@canonical.com>
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

On Sat, 29 Jan 2022 13:24:26 +0100, Krzysztof Kozlowski wrote:
> Convert the audio complex on Arndale boards with Samsung Exynos SoC to
> DT schema format.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../devicetree/bindings/sound/arndale.txt     | 25 -----------
>  .../bindings/sound/samsung,arndale.yaml       | 44 +++++++++++++++++++
>  2 files changed, 44 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/arndale.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,arndale.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

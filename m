Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECFB4B85BF
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 11:31:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4E751A40;
	Wed, 16 Feb 2022 11:30:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4E751A40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645007469;
	bh=DsvB6mFJIKVZgfT0X5bUSDEpIt6em55Gc6WUFVr0NZI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LpgiR+xaTdSL1Ldf2OI179BD0+qFSupyY+xXQWTisySidCFUAdq9Co6cEzJYo1Y0n
	 svBfKQIV7QbjTUocnM2WmFjzrId1vOGKOfj3y8xj6Qvw7bo0d6y5NTZnwbV760fJmR
	 F4/2H5MqkNcs9uOJTSMWUNg10GtJ2kwZC9tXu/QU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B67AF8012E;
	Wed, 16 Feb 2022 11:30:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E943CF80128; Wed, 16 Feb 2022 11:29:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC40AF800D8
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 11:29:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC40AF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="qSAvNyBm"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 698F83F328
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 10:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645007388;
 bh=8Ae2IyDPIYtSDwfICZYtX6NpzxBQNSp7pmdTk/Ww12w=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=qSAvNyBmI6VMwGxZEohN/GJocZjYDQvs1IYOk8wTJn6z8vm5Af3PAbsGAcMliXdQk
 TKR/C8DIIQoPpXzRH533o0DyFjstEzYIHoSG1nwPcqOWOPErUKLEMzg1e5R60vqDHe
 Cdn6bJFq5gbPaC/gLUUpfIXRAuUj0zbaxW4GmQcCxJqVk9EpLlVED3D44asI2y9NBv
 NWhOxZmZ1jocBZz+EzLvMN837mpZNioWd8qAhoOPBMgbmMCrkCL/x5kDqGBirNeI7g
 46urYFi3vpEYsT6mPc8NAToOGNgAX3DkKatNO8we83PeRMALcVgqJ5n23qeayyMsFL
 kOm0gAJJHgSKg==
Received: by mail-ej1-f69.google.com with SMTP id
 hc39-20020a17090716a700b006ce88cf89dfso627768ejc.10
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 02:29:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8Ae2IyDPIYtSDwfICZYtX6NpzxBQNSp7pmdTk/Ww12w=;
 b=kRTm07502viNZFngZfpR5fb0ebZzU0y0yYZlGre1sfM/rHpoBth+EbHtM+pzVO8CLE
 ygTBz2BgNLFcjcnDxLuaxGRHLOgZ0CcynFyjfoMgXy0IpaSvY+iZQ5YGX/E3ui0KnnRH
 Mv/Gw8xrAACwfn14KiHfzsXQ+niNfVD+A310FXOhnoJpni1SMmd5SXiUfV97rGh2khI0
 RzScfygBiDOuuySR+mfECLfYcy1EMKDGXnAD6UtlyBuQZezWtA7x//RgNQd/X0NWRQX5
 8WTPscgpMyCrYrRJj92/6KWkc5335iTkANxVu5xTxJQpryDxvQms5HHtB9Xk/TO+oIul
 YHJg==
X-Gm-Message-State: AOAM5312TuTMpl5dtle+XIScP4vWvSY57jIDnJlqjkHPmIJCrT8vSncf
 EaqqrtlVLeH4QZIP1oy+4+xQkyzVD7EdTaF8s+ct9K1iUY5yqbwcH3BNC2NJfvUbonhNdIovNIA
 Kqa8xFvu7Br6arvlVOGpKDdkHeTY35iqsSBp+MJbZ
X-Received: by 2002:a17:907:70c1:b0:6ce:78ff:bad4 with SMTP id
 yk1-20020a17090770c100b006ce78ffbad4mr1757698ejb.68.1645007388012; 
 Wed, 16 Feb 2022 02:29:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyB8SV5fiPCVTykaHtbYxxGP3rr/oFhGzeVD5CLSmaDY/7MY+BRd9s2Om9TXV6Oz9hnD0yY4A==
X-Received: by 2002:a17:907:70c1:b0:6ce:78ff:bad4 with SMTP id
 yk1-20020a17090770c100b006ce78ffbad4mr1757676ejb.68.1645007387804; 
 Wed, 16 Feb 2022 02:29:47 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id p25sm5037598ejn.33.2022.02.16.02.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 02:29:47 -0800 (PST)
Message-ID: <2249cf46-5c54-2e59-f247-5a22f2e6e5b9@canonical.com>
Date: Wed, 16 Feb 2022 11:29:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 5/6] dt-bindings: Document Tegra234 HDA support
Content-Language: en-US
To: Mohan Kumar <mkumard@nvidia.com>, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 tiwai@suse.com, jonathanh@nvidia.com, spujar@nvidia.com
References: <20220216092240.26464-1-mkumard@nvidia.com>
 <20220216092240.26464-6-mkumard@nvidia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220216092240.26464-6-mkumard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On 16/02/2022 10:22, Mohan Kumar wrote:
> Update binding document for HDA support on Tegra234 chip.
> 
> Tegra234 has max of 2 clocks and 2 resets which requires to add
> minItems and maxItems for clocks and resets as Tegra chips can
> now have minimum of 2 and maximum of 3 clocks and reset support.
> 
> Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
> ---
>  .../devicetree/bindings/sound/nvidia,tegra30-hda.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
> index 2c913aa44fee..12c31b4b99e1 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
> @@ -23,6 +23,7 @@ properties:
>        - const: nvidia,tegra30-hda
>        - items:
>            - enum:
> +              - nvidia,tegra234-hda

Why putting it in non-alphabetical order? Although someone put
nvidia,tegra124-hda already at the end of list... having things ordered
is helpful to avoid conflicts and makes code easier to read.


Best regards,
Krzysztof

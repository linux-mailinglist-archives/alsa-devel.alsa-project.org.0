Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B68E753EE47
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 21:02:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19C571ADB;
	Mon,  6 Jun 2022 21:01:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19C571ADB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654542146;
	bh=i8+80QGfWjjZHHUHa6WEsqTCkZm/nyh6W7ko1BgNvd4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eKE57NGDXLhj0DsUNKJ474ZN1U5RoFURs4XC9rOmW4dMbs8kbaHqoqwMarQ0kD+Wo
	 TPNmaRMD2BLjVwZqQ7Qq4WsKRFGs+H3WB/7IeZTDp8XpJ//zWrROE+hczPCVGE4epj
	 E5bn07yHtEFtLgWnCE3nDskB+Ixd3J44utRR2Tik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86ACEF80310;
	Mon,  6 Jun 2022 21:01:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 725C2F80089; Mon,  6 Jun 2022 21:01:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8335F80089
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 21:01:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8335F80089
Received: by mail-il1-f178.google.com with SMTP id y16so12588042ili.13
 for <alsa-devel@alsa-project.org>; Mon, 06 Jun 2022 12:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TKZQYNrDOxXCRBlNMtzBiVV2S8AIodJot0qZ8ycf9Ok=;
 b=md6rqhUnSdufzbAKvn8uLruJq7dIMGoYHs9J/+UVzuW7QxeP151ZA7OqTmRlQ4sxY5
 eG0auymO+siobHGFB0PgTDH90Okd/Kffzh4EWkXnp8MZairoY0IbNldYrTD7/DpHE8UY
 mQh04lIx9lIOTjquu3hdHnTQ5ywRDZah5k9KU3+wkERTMHL2rNedRzk8bmiByR3Z7dxv
 QjSK7ZQ9nSv0gAkQJPUBVhOQwj1PPU8z6CLsCjlT7HyI7MykTMUON8ZqA3fim7WKIjcv
 /v+0Qg8dRGs669kNILemcoAqpMNbHS6i/iFYz3esMFwWaMmRIZhqrg2kQLVoSImqEPCr
 jDrQ==
X-Gm-Message-State: AOAM5314K8+42yeKrwb5TgMSP3m7FMA+t7GGEUbNsAH2mlZkZkm0DnSZ
 RfP38RANvM8IiJtuAKuHGQ==
X-Google-Smtp-Source: ABdhPJzpQz/1nOM9wT3g7ZzbcxPJegjARM+cjtT8oUV8k03IpH0rsSgzLs5/60arlMg4vsoy9b9Jwg==
X-Received: by 2002:a05:6e02:1905:b0:2d3:d327:6c7b with SMTP id
 w5-20020a056e02190500b002d3d3276c7bmr14518421ilu.101.1654542081325; 
 Mon, 06 Jun 2022 12:01:21 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a02a005000000b0032e9bf3b973sm5926757jah.5.2022.06.06.12.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 12:01:21 -0700 (PDT)
Received: (nullmailer pid 1083302 invoked by uid 1000);
 Mon, 06 Jun 2022 19:01:19 -0000
Date: Mon, 6 Jun 2022 14:01:19 -0500
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 22/23] ASoC: wm8731: update wlf,wm8731.yaml reference
Message-ID: <20220606190119.GA1083268-robh@kernel.org>
References: <cover.1654529011.git.mchehab@kernel.org>
 <e56e54fe0ebb1b6e8dd2e245c398190016eb0a34.1654529011.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e56e54fe0ebb1b6e8dd2e245c398190016eb0a34.1654529011.git.mchehab@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
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

On Mon, 06 Jun 2022 16:25:44 +0100, Mauro Carvalho Chehab wrote:
> Changeset 0e336eeaf467 ("ASoC: wm8731: Convert DT bindings to YAML format")
> renamed: Documentation/devicetree/bindings/sound/wm8731.txt
> to: Documentation/devicetree/bindings/sound/wlf,wm8731.yaml.
> 
> Update its cross-reference accordingly.
> 
> Fixes: 0e336eeaf467 ("ASoC: wm8731: Convert DT bindings to YAML format")
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1654529011.git.mchehab@kernel.org/
> 
>  .../devicetree/bindings/sound/atmel-sam9x5-wm8731-audio.txt     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

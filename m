Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60882620010
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 22:02:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F23371D7;
	Mon,  7 Nov 2022 22:01:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F23371D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667854935;
	bh=SHmQ5NQz1NSr1VRJ2FxesCy4mh0NxNZmI0F+iesicYs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q670/v6N9eA9dOXqG7Dq0lpooAQbGvOBau202IZy5fG3zeVzX89+9LI2IkqyG5//G
	 TdvhHVcX0y1yqkKlWNFpd4+6IIQODk4D5hCEVdJbNzX5f1yC6KQNSKRZlcERyqdTUa
	 eFKOKsu32CH5X9U8g/gWsFyLitVy9bfA/GYto8Tc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F4DCF80116;
	Mon,  7 Nov 2022 22:01:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5254F8024C; Mon,  7 Nov 2022 22:01:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B170F80116
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 22:01:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B170F80116
Received: by mail-oi1-f173.google.com with SMTP id s206so13534788oie.3
 for <alsa-devel@alsa-project.org>; Mon, 07 Nov 2022 13:01:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQJDvR/aVT3/i6J9YEM4LGBFn16slEkUg/5PDIelLHs=;
 b=pLHf52c+yE/8uQ2AbO3ph5ZVWlMStXaWTycNJthdEoA1lakBB2QL8X1H9bXJ5LhTTh
 wiuoMgslS04XQk3bU8fs+bkzjPx4O/E8ec4Gi6SYdnG2uxC0yVoAd+qhYqNb6+b4Gihu
 rKds0NLwIGm2YyceSf371l0789i9pHNxxiKHQHRn+81FG3U57DSbGNlpog1/qp4d00eU
 QolOAdbqWLF3ocEV/6ED8pnnD7iUPcMp99jZlqljZSV8AsKfmX8TaqPK3sPfE3H/bjT8
 1DT916Y/nTb7zkZnEhNc0qGhhQuApYQhW9b2keQ06Z8Ovoy3Staas52SOwiYbbwIW5J2
 dnyQ==
X-Gm-Message-State: ANoB5pkp/CXFZx8m3vEPWcKrLDsWKx3d+KYZRffPdVJOBzS7fRU9vi1C
 AwfVfDJv6zQqTNhbL0mTRQ==
X-Google-Smtp-Source: AA0mqf4rQ8f6FL3BJt9OJI6h0Li9h8V2atSK1dIzcawYtKV/YzRpOW7TpzCktUaODJr4XJJWkGZHRQ==
X-Received: by 2002:aca:240b:0:b0:35a:8b57:a081 with SMTP id
 n11-20020aca240b000000b0035a8b57a081mr3616118oic.206.1667854870292; 
 Mon, 07 Nov 2022 13:01:10 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 p5-20020acabf05000000b00359b83e3df1sm2832628oif.9.2022.11.07.13.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 13:01:09 -0800 (PST)
Received: (nullmailer pid 1621911 invoked by uid 1000);
 Mon, 07 Nov 2022 21:01:11 -0000
Date: Mon, 7 Nov 2022 15:01:11 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: fsl-sai: Sort main section
 properties
Message-ID: <166785485834.1621531.34159853934723663.robh@kernel.org>
References: <20221104160315.213836-1-marex@denx.de>
 <20221104160315.213836-3-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104160315.213836-3-marex@denx.de>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
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


On Fri, 04 Nov 2022 17:03:15 +0100, Marek Vasut wrote:
> Sort main section properties, no functional change.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Nicolin Chen <nicoleotsuka@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Xiubo Li <Xiubo.Lee@gmail.com>
> Cc: alsa-devel@alsa-project.org
> To: devicetree@vger.kernel.org
> ---
>  .../devicetree/bindings/sound/fsl,sai.yaml    | 72 +++++++++----------
>  1 file changed, 36 insertions(+), 36 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

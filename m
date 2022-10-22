Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EC9608E9C
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Oct 2022 18:41:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A0E8B3EA;
	Sat, 22 Oct 2022 18:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A0E8B3EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666456866;
	bh=e1f5948dAMP7s/vppgGMXxsckSX49SKXx56P1Bb8fUQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WR/wRVU0ad14MtLWpSBGKvR5uexywCgx5O+4O6UquXI063S87kKg8hn1TD8Yy2EzQ
	 6m7CaxF+s15TLOO5qHk9ptWm71nH4C5bMxSmUjQIZSSgNd5J9R6sy2mrC3EUkIqaNK
	 aQ6GSH5AAQcKt3k1u5xhyq+P/HZZhlJnIQlhArxo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD5C8F80134;
	Sat, 22 Oct 2022 18:40:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60C58F80246; Sat, 22 Oct 2022 18:40:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 167A5F80134
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 18:40:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 167A5F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="p+u1HMt1"
Received: by mail-oo1-xc33.google.com with SMTP id
 g10-20020a4ab4ca000000b00481082808cbso618058ooo.10
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 09:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=545rw8ScXkRjDM5w17g+rHUKHirulTTV6OR0mlcZkMs=;
 b=p+u1HMt1MNKQryUWQThPkAqfoWTsH6KmsVL86mKRXhiNbd4KYLYPNB0hITHRvsRwHd
 IzyR+zs/k4J1jE3/73NH7BNwkqjMeqBkbUwUWNeX3r0x9AhIYFWRT18rQ8egR+JYtQlm
 CYZtZNpi2/fY0NRcNBaXILQT++KyzeZOC1hSAZJbEOILAN05eCqvX8VPU7VJwqow+RNF
 n6C7bRH8NrUgu18S0Co7xxLWzfbLaDKYbfIZlIxs/fxHa+SBYh2Alj0L3CE0TjZ5IQ1a
 c+7CuO8asdutbJ/33v8k6WhBNNYbe2ZEF42iqdFl7tUVH2f/Nv8NhWT0RSgBsMAdjX2c
 Fa3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=545rw8ScXkRjDM5w17g+rHUKHirulTTV6OR0mlcZkMs=;
 b=K71FMhQ22WcrWEalln2gjvAkeFipyVWhydesnCljIRIMb56LOs3pu9RODnf+45L98T
 kDP+aLe+1+ENHDDP2SPtRRWUwTFeMGrdGAXUDQYGxqkYfx5pvd3ZB6MFCT+nca+gt/AV
 5BSDWP1S/qlmM//Qh/Ps+j/awUfVQjTHsUINt4k34qt/kDWle1q3ztJrDvtnFryocyuM
 JiRTUgvPkpTZGHxugmRzHpV55nz21EU6qD+8ockjLiewCYn/lEOtTwZURCcHTMovJhi/
 sQIZk6VYGBCnmYyIwN3zw7uh26sQX1zLlqm1Zm7raSdAbf54DO3Gf/22Jw+p796osgf4
 0lrQ==
X-Gm-Message-State: ACrzQf3b7TZM6vpB+54Pe4PLim6hklWJcp0y6V+90YvtwryRgz3nnJ2f
 fE/u0/kg1L+4RF3bS9sebmCX7g==
X-Google-Smtp-Source: AMsMyM6eeoBGEQ7JBoltsek43vEM0SoXcCAlJEyNNtk9IE/VktMJh0yypxZafDKXkKPpq5EWdnbosQ==
X-Received: by 2002:a05:6820:1608:b0:480:fa39:568b with SMTP id
 bb8-20020a056820160800b00480fa39568bmr5753643oob.43.1666456802183; 
 Sat, 22 Oct 2022 09:40:02 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
 by smtp.gmail.com with ESMTPSA id
 d6-20020aca3606000000b0034d14c6ce3dsm2306957oia.16.2022.10.22.09.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Oct 2022 09:40:00 -0700 (PDT)
Message-ID: <ae460461-5c20-9180-456c-8c01a4b1a7f1@linaro.org>
Date: Sat, 22 Oct 2022 12:39:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: realtek,rt5682s: Add AVDD and
 MICVDD supplies
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
References: <20221021190908.1502026-1-nfraprado@collabora.com>
 <20221021190908.1502026-3-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021190908.1502026-3-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Derek Fang <derek.fang@realtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On 21/10/2022 15:09, Nícolas F. R. A. Prado wrote:
> The rt5682s codec can have two supplies: AVDD and MICVDD. Add properties
> for them.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> 
>  Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
> index ea53a55015c4..ca1037e76f96 100644
> --- a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
> +++ b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
> @@ -90,6 +90,10 @@ properties:
>    "#sound-dai-cells":
>      const: 0
>  
> +  AVDD-supply: true
> +
> +  MICVDD-supply: true
> +

How about keeping some order in the list of properties?


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


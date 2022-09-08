Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFCF5B2242
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 17:29:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC6AA171A;
	Thu,  8 Sep 2022 17:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC6AA171A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662650982;
	bh=1jWH1GqDmSBi9+pgRTSFswGldyZ4RRlLSFfSqJ6rDCE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GseldAaNBjcqveQOUPAHW4HL50oYj40qg4EBinKQ+QXVto3Jb1WqBFp15FxwafptA
	 8qzGuO0rtpci4NwGah2H+Kb2fMT/ygCiYFtRkgfwJNp1G0q58ToaAjvZAGdFaXlSJ1
	 p/3qVfM5WaZKeX47YfNrt97OMom7eKhDlD6/ygIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 387AFF8023B;
	Thu,  8 Sep 2022 17:28:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92989F80217; Thu,  8 Sep 2022 17:28:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE1F3F8016D
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 17:28:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE1F3F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zTRaEBM8"
Received: by mail-lf1-x12e.google.com with SMTP id k10so13721278lfm.4
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 08:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=4i5CLL5zXNm8xAxFuL3WcPaDXJBLZrrT7gdqgJWsssM=;
 b=zTRaEBM8h/AgHiP43wRrK2eOvAhRe/F6UVkH7Us0KM5pGBJwh6gnpMRabZsbFR1PpE
 l+2qclNxfjXdvhEoOaKViykvcrnPUncG4G2/sycriPDrfmeLDVaizgLHRxRGny2lwmr4
 1tKttNWHXT7q5d2Yfwq2a7MhRZmGgktP/YPGKBG38Ged+lIxQm82obdCnOlMF8mbR8zm
 iAz/SCLyLQBsD1kHVumD1hsB4xSdBxRPrgBEdbH1HOMLAAGzm9Pbu3+owyiszQSHPHme
 uJfepAr2Sq8RFVoSMQ3RrrxCRiZWZ/LNFSKidz2TMVXTjPf2QV7Pa1Zof9cXcMc27cAc
 HyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=4i5CLL5zXNm8xAxFuL3WcPaDXJBLZrrT7gdqgJWsssM=;
 b=ZICgBi5IAygaeYU0tmBP4hXqBKcICiYajfcua4eTdYiKihMJ5pFuoZRrRo0OVL/w/1
 N2SwBH2BGTjs7ZcvAekssFEIe7XtfEuYSXTDKeyixsH7qGbY9YsYkqmeFH/Gdzy74Ny3
 HpC9tD0Za27Qby/MMEFCtHiRlEcInpE0pOIgyetjpd+ZY6L2I6nWRsHUYsmQeHqK2I1v
 OVhY+PBcYICgyi1vlY84jExPvA/nUH3kWipJKuGyM7TvbK7/fgaIghTIzTYnRQqR8Rp5
 WABgeTJmZfBtjHzD5116D//+JrelnsP9WL9HpgmrZCgA9pnQhZXyodbC6qRr05QBYLXV
 /Q4w==
X-Gm-Message-State: ACgBeo0e1O7L3akmggdJAeYjgigUkvebZaCP04SfHR9PNqpd6QUhGuh1
 LaoHDIJhw0V9ZPX9sYWyLKVkgw==
X-Google-Smtp-Source: AA6agR5nuVkUg8vPgHt4g1SIgYv4bRvUoTVvbvAyY8N9q6d7yOOuKKJanXMI+72+uSgRSg908eTvBw==
X-Received: by 2002:a05:6512:a8c:b0:48b:3e1c:c3ad with SMTP id
 m12-20020a0565120a8c00b0048b3e1cc3admr2960257lfu.678.1662650910246; 
 Thu, 08 Sep 2022 08:28:30 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 x13-20020a056512078d00b0049759682c88sm1761246lfr.190.2022.09.08.08.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 08:28:29 -0700 (PDT)
Message-ID: <d1b0360d-f32c-6311-5078-370c36f40ad9@linaro.org>
Date: Thu, 8 Sep 2022 17:28:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/8] ASoC: rockchip: rk3308: add audio card bindings
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20220907142124.2532620-1-luca.ceresoli@bootlin.com>
 <20220907142124.2532620-3-luca.ceresoli@bootlin.com>
 <aeabc681-9416-d25d-693a-30ba99f1796d@linaro.org>
 <20220908172016.6e23df8c@booty>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220908172016.6e23df8c@booty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Chris Morgan <macromorgan@hotmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Johan Jonker <jbx6244@gmail.com>,
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

On 08/09/2022 17:20, Luca Ceresoli wrote:
> Hello Krzysztof,
> 
> thank you for reviewing my patches.
> 
> On Thu, 8 Sep 2022 13:49:34 +0200
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 07/09/2022 16:21, luca.ceresoli@bootlin.com wrote:
>>> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> [...]
> 
>>> +properties:
>>> +  compatible:
>>> +    const: rockchip,rk3308-audio-graph-card  
>>
>> Is "graph" part of device name or you just put it there because of other
>> schema?
> 
> Indeed this comes from the "audio-graph-card" compatible string.
> 
>> The compatible should reflect the device name, not some other
>> pieces in Linux or in bindings.
> 
> Would it be OK to rename it to rockchip,rk3308-audio-card (i.e. drop
> the "graph-" infix)?
> 
> Fixes for the other comments you made to this and the other patches are
> already queued for v2.

Yes, either rockchip,rk3308-audio-card or rockchip,rk3308-audio


Best regards,
Krzysztof

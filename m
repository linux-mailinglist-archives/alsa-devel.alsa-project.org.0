Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F19A630295
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Nov 2022 00:02:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB27E16D4;
	Sat, 19 Nov 2022 00:01:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB27E16D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668812537;
	bh=aVnOcZRo/lKq18VoXGyYbZctL9KKp/KChMjlIzFf+v0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GONkvZgtHOaGd+5/5u482Uds2jki0g+Xi1kX7q2We3WchVd8jjFQPr5C04MYfFfRo
	 MTMMjP5ahTCWpUMESQGidxalVP3ACMncvX1XHrYE36Z3ODsXClA+mfs4nkicu4qT8Z
	 qtvx90CFQbI/7XifQRww9mr9FH3wkb2xCW40YIy8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F10BF800FD;
	Sat, 19 Nov 2022 00:01:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5CC9F801D8; Sat, 19 Nov 2022 00:01:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1EC7F800FD
 for <alsa-devel@alsa-project.org>; Sat, 19 Nov 2022 00:01:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1EC7F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=flatmax-com.20210112.gappssmtp.com
 header.i=@flatmax-com.20210112.gappssmtp.com header.b="jCNJD4bx"
Received: by mail-pj1-x102d.google.com with SMTP id o7so5738425pjj.1
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 15:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flatmax-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jeg5OPbcU8Um2n3zzZ8ZeF9Qwca653OFnBoiSDNreoU=;
 b=jCNJD4bxBXoCXfG8DydsvITI5IlXvVpTpnrkGNFZawmCwvS2ZrwWB4Wf6zb+WDzMeX
 xcvnxHhjYt/XM0EvmLuFLhsQ4wJCuEQwA3QkYC4uCLRBWz6Yn0VakY0fSUUEu42Roovz
 FztGlZfDJjISJmGtoaknWeACdznB9bKZeNbo3W0+7eQmxPmSQszj+p9rVR1uuqamXj7x
 L2I6/5A8WKwo4LXOFXskapC6KygVCKGe7jLeANfnLKlTksH6JCmkuan0R3MHH9bJfTUE
 MHwl0hXqnvg0MetsN2GRsff/sQBkup8vsN3dGmx6oszthoWzPqi59uf6vvp1nvb5Rhw1
 tgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jeg5OPbcU8Um2n3zzZ8ZeF9Qwca653OFnBoiSDNreoU=;
 b=AH5LsBsv9gIVEsR+hl2yvwkjwOE56yl0nQTDxsU5/TlzjChgTkjDeVw/tSW89M0Q38
 j+wZpvch5iamZIMG0MWKsLVyam1tQ/KG5Gg9lJjlvhM//wB07YaUMPWPGt+weec+d8pu
 Ku/AqVavqKDy1UYOfWZtKRCgCan2y+9PPJxBoGBGt0mm5OhS2dkW+Jqi/mUnZs0FXsTg
 I0vF4SFzMiIO06O/dJLCqtm6qh8Y1i+mwBgtG4tTdQ7ztWIwPl+8DsdldS2pXDVq0YC5
 br5FYeCTL8MSgParM5p0mDEPNeawYN+dbKa5ayBmakHJYfT7LH/PMEB7vR9tpEQ7TYQr
 DEKw==
X-Gm-Message-State: ANoB5pmgqaiPbwtPkqAQ0E66PiwuZbuCi6gg4dem6d6yYQvdeJOX3mDr
 FGTgXPfgJOugfaW2VMtBlmOuUA==
X-Google-Smtp-Source: AA0mqf7ynBarcnD4LPeA+XPoRO3UNn4nstk3Sm2a7p0+99ICAzmWZ1OZ9laAvn2SyrvJ4EOFWN101g==
X-Received: by 2002:a17:90b:4d0b:b0:214:1329:dec7 with SMTP id
 mw11-20020a17090b4d0b00b002141329dec7mr15978573pjb.91.1668812472181; 
 Fri, 18 Nov 2022 15:01:12 -0800 (PST)
Received: from ?IPV6:2406:3400:213:70c0:9df6:7e57:88ce:1bea?
 ([2406:3400:213:70c0:9df6:7e57:88ce:1bea])
 by smtp.gmail.com with ESMTPSA id
 u71-20020a62794a000000b00562019b961asm3696850pfc.188.2022.11.18.15.01.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 15:01:11 -0800 (PST)
Message-ID: <6f431abb-356c-b057-2784-6b5f165a2a2d@flatmax.com>
Date: Sat, 19 Nov 2022 10:01:07 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 603/606] ASoC: codecs: src4xxx-i2c: Convert to i2c's
 .probe_new()
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
 Mark Brown <broonie@kernel.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-604-uwe@kleine-koenig.org>
Content-Language: en-AU
From: Matt Flax <flatmax@flatmax.com>
In-Reply-To: <20221118224540.619276-604-uwe@kleine-koenig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-i2c@vger.kernel.org,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org
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

Reviewed-by: Matt Flax <flatmax@flatmax.com>

On 19/11/22 09:45, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   sound/soc/codecs/src4xxx-i2c.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/codecs/src4xxx-i2c.c b/sound/soc/codecs/src4xxx-i2c.c
> index 43daa9dc8ab5..27026030704a 100644
> --- a/sound/soc/codecs/src4xxx-i2c.c
> +++ b/sound/soc/codecs/src4xxx-i2c.c
> @@ -12,8 +12,7 @@
>   
>   #include "src4xxx.h"
>   
> -static int src4xxx_i2c_probe(struct i2c_client *i2c,
> -			const struct i2c_device_id *id)
> +static int src4xxx_i2c_probe(struct i2c_client *i2c)
>   {
>   	return src4xxx_probe(&i2c->dev,
>   		devm_regmap_init_i2c(i2c, &src4xxx_regmap_config), NULL);
> @@ -37,7 +36,7 @@ static struct i2c_driver src4xxx_i2c_driver = {
>   		.name = "src4xxx",
>   		.of_match_table = of_match_ptr(src4xxx_of_match),
>   	},
> -	.probe = src4xxx_i2c_probe,
> +	.probe_new = src4xxx_i2c_probe,
>   	.id_table = src4xxx_i2c_ids,
>   };
>   module_i2c_driver(src4xxx_i2c_driver);

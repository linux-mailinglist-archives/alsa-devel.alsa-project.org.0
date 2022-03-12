Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BA44D6E3C
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Mar 2022 11:42:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82E3817C9;
	Sat, 12 Mar 2022 11:41:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82E3817C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647081730;
	bh=Isz1GyATbLyazrHz0YTja+Kx1pqv6PiBTCeGShOGZKw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gkIKTeX81rrz7OoDZYsEKBTUflyq4VZCA2Bm8pe3IifIhEbSHcmYpmvhBpKWKLKNo
	 m76ZEpr300CzaeDyojyGDD7J/lmBoGATcbdOeOlQH2MEg7MFrgMUcMSbPg7hwEixbY
	 UYgtdlfpW+INd7WUu/hz9Tz5ezcRYVYzVQY4fyoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB9A7F8025C;
	Sat, 12 Mar 2022 11:41:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71E54F801D5; Sat, 12 Mar 2022 11:41:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36F01F800D2
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 11:40:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36F01F800D2
Received: by mail-ej1-f44.google.com with SMTP id d10so24049822eje.10
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 02:40:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mFsSD1c4g3l2OYCc1c3FtLKI1mcqNVpSXz15ZyAFhMs=;
 b=Fz9QrHeBL3gOttz+Ixju/rY+oOvnj9LIPorD87Sd9ujngkgwkyeh6IyyQNXUK+vKWk
 RmeD5rIAtDf6XDTQ8ePoV2HcT+hwbUOJCtRrwB/RoUkgynsDm9d/EA8wqZXsKqQAdyex
 EVRFMDFSBko7EiUVDX7pXzYESlkSS6QHQVFTOmo9hvYf5NCjaZhYLKFDm2BLcQTiUYFw
 nspwqxViDZA5UPSl0R4pD88ryaJAgVW/DLa08jytC2ViQ1RodGKOcMwB6h7EcC95SZAN
 TlQcgvE8kk4EnFBGP1Gd0qMx8UAQ6uEi+62+G7YzYvyDs/1Cf49aSU7GjLJwy64ijFBH
 dn+Q==
X-Gm-Message-State: AOAM531lAxpMwh5RywNBsywzptEoIgLNXPK63JWlZuK6vrH67Igmvaoo
 t6wvK5mzSs+pIxIJADiShOY=
X-Google-Smtp-Source: ABdhPJw2r+b07GDBmNizv28JrCenfc8xH5nTSLjewggU0Rjby4EVRC8RAW5bFSoCkM+7t8zT2bgsiw==
X-Received: by 2002:a17:906:b052:b0:6ce:88a5:e42a with SMTP id
 bj18-20020a170906b05200b006ce88a5e42amr11963926ejb.237.1647081658122; 
 Sat, 12 Mar 2022 02:40:58 -0800 (PST)
Received: from [192.168.0.148] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.googlemail.com with ESMTPSA id
 e9-20020a170906c00900b006d4a45869basm4167533ejz.199.2022.03.12.02.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 02:40:57 -0800 (PST)
Message-ID: <009acb4c-d59c-c1ad-60b0-cc85fe7ad73d@kernel.org>
Date: Sat, 12 Mar 2022 11:40:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RESEND V2] ASoC: max98390: Add reset gpio control
Content-Language: en-US
To: Steve Lee <steve.lee.analog@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, geert@linux-m68k.org,
 rf@opensource.wolfsonmicro.com, shumingf@realtek.com,
 srinivas.kandagatla@linaro.org, jack.yu@realtek.com, nuno.sa@analog.com,
 ryans.lee@maximintegrated.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20220312002429.16175-1-steve.lee.analog@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220312002429.16175-1-steve.lee.analog@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 12/03/2022 01:24, Steve Lee wrote:
>  Add reset gpio control to support RESET PIN connected to gpio.
> 
> Signed-off-by: Steve Lee <steve.lee.analog@gmail.com>
> ---
>  sound/soc/codecs/max98390.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
> index 40fd6f363f35..9a9299e5cc5a 100644
> --- a/sound/soc/codecs/max98390.c
> +++ b/sound/soc/codecs/max98390.c
> @@ -1022,6 +1022,7 @@ static int max98390_i2c_probe(struct i2c_client *i2c,
>  
>  	struct max98390_priv *max98390 = NULL;
>  	struct i2c_adapter *adapter = i2c->adapter;
> +	struct gpio_desc *reset_gpio;
>  
>  	ret = i2c_check_functionality(adapter,
>  		I2C_FUNC_SMBUS_BYTE
> @@ -1073,6 +1074,17 @@ static int max98390_i2c_probe(struct i2c_client *i2c,
>  		return ret;
>  	}
>  
> +	reset_gpio = devm_gpiod_get_optional(&i2c->dev,
> +					     "maxim,reset-gpios", GPIOD_OUT_LOW);
> +

I don't know why did you CC me, but since I am looking at this - you
have to update bindings.

Do not add random properties to drivers without updating bindings.

Best regards,
Krzysztof

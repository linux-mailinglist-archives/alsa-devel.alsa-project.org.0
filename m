Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CF55F21E1
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Oct 2022 10:09:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9847F2A20;
	Sun,  2 Oct 2022 10:08:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9847F2A20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664698169;
	bh=fctstMAmk2W5ZoZTkqiiXMkgt/pInsEW01vMsB74o/4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=twzYLChd4c9geLLuJwsZFRj6irxYuY3RdRr3FaCsjwhPk/aD1T9eecr4El+6U3OKf
	 M0nE8xgHVzUnng8vbK99EbORNZSue6xbr5LApeogmrO6SbiU/eQQSvGLYwbHlFwD2D
	 SZep7/ul7p15XvHj+36Tqi0LMLdH02LkJIET62U8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0019DF802DB;
	Sun,  2 Oct 2022 10:08:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 009F3F8013D; Sun,  2 Oct 2022 10:08:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF75DF80087
 for <alsa-devel@alsa-project.org>; Sun,  2 Oct 2022 10:08:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF75DF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Xg8w105m"
Received: by mail-lf1-x12d.google.com with SMTP id 25so2405088lft.9
 for <alsa-devel@alsa-project.org>; Sun, 02 Oct 2022 01:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=O3qGf0Qhm8BJZuYtDeuLoDoOuwVahGZ598SBGYRTnMY=;
 b=Xg8w105m1rnL+ruXK42WqhCPvp9EDE2N5PW346GAg1e64pEab7F45DAA1rbvB/irlv
 ++ZcsrKysLtMdSqR5oCulmiin3h6ziA4ueN4MfXgUeJ69XRHqyZGQPjpwjmr5dliPhgx
 44C30RKhlYzuFxDa/AG0DDhv6v5/eU1k1T+JFFYmeVpUDCYpzDnLJnbWs8fmJsOMcaZj
 mQkd06zK2g+M+QONAGHWpwjj793wcF4UNV9BWS9JlShlIE/gdagRZRf4kOwhF/aYlL3C
 lmjzaFtcyExcqHE0tMGJez+4XFm7eAAKkpq3jZciv3Xj6zQZLGx9AkqfZfKpxvB2vsDa
 ewBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=O3qGf0Qhm8BJZuYtDeuLoDoOuwVahGZ598SBGYRTnMY=;
 b=ApNyA17jdpFtwaaqmHv4d7uHt3hRiXgUbSteCUxVEoYu1XrzIb4VHsTBFmQtfZILwo
 4kmQmSALhS7nJ7c/I0kxlhgWx5d7v8Q4YCrscIClV6nsdEyXrGZqjmzz4k74Zu9Rmvax
 ALyjZOFZ2TvW1H6ZQLhQWHeQDzFxuh/eVeQlzrquI4fXbE/kuq17tteDHQpGML79RpcU
 LcMTaCrD+mo0DSX82nq9ve8fm/vw4aiAWUq4Qws7k7S9HQr3jy9OsFCtY2H4EcerkdI+
 HmcVEmCYG7vbqbWFe/8eZWirCc+Vc32JttdaLiYz/cGZqZekiGU73ntkkVB583ljpg1X
 Co8Q==
X-Gm-Message-State: ACrzQf3x1sGqC+j8RJj74c756RRRL+cfUj4yLDjaZx2BkY1M1a4PfSQk
 aj2dosxtUjzAauZe3p3k9vNySA==
X-Google-Smtp-Source: AMsMyM76sHuJFoOrGeSwIUeBoMg3REG8ihVa0O3oL2n75PD0oSahxr5nDq+t38k/wfilvQ95ptGBeA==
X-Received: by 2002:a05:6512:15a0:b0:49b:1eba:89d4 with SMTP id
 bp32-20020a05651215a000b0049b1eba89d4mr5226436lfb.188.1664698101072; 
 Sun, 02 Oct 2022 01:08:21 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 bd6-20020a05651c168600b0026bf04aafb5sm588339ljb.6.2022.10.02.01.08.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Oct 2022 01:08:20 -0700 (PDT)
Message-ID: <990c66cc-8cb3-a0bc-f4ee-0908f34f3c38@linaro.org>
Date: Sun, 2 Oct 2022 10:08:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/2] ASoC: wm8961: add support for devicetree
Content-Language: en-US
To: Doug Brown <doug@schmorgal.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20221001200039.21049-1-doug@schmorgal.com>
 <20221001200039.21049-3-doug@schmorgal.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221001200039.21049-3-doug@schmorgal.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

On 01/10/2022 22:00, Doug Brown wrote:
> This adds support for devicetree to the WM8961 driver so it can be used

Do not use "This commit/patch adds ...".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

Just "Add support for ..."


> with modern DT-based kernels.
> 
> Signed-off-by: Doug Brown <doug@schmorgal.com>
> ---
>  sound/soc/codecs/Kconfig  | 2 +-
>  sound/soc/codecs/wm8961.c | 6 ++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index e3b90c425faf..2b5787ee8d31 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -1929,7 +1929,7 @@ config SND_SOC_WM8960
>  	depends on I2C
>  
>  config SND_SOC_WM8961
> -	tristate
> +	tristate "Wolfson Microelectronics WM8961 CODEC"

This is independent change. Please split to separate commit.

>  	depends on I2C
>  
>  config SND_SOC_WM8962
> diff --git a/sound/soc/codecs/wm8961.c b/sound/soc/codecs/wm8961.c
> index 7dc6aaf65576..539096184eda 100644
> --- a/sound/soc/codecs/wm8961.c
> +++ b/sound/soc/codecs/wm8961.c
> @@ -971,6 +971,12 @@ static const struct i2c_device_id wm8961_i2c_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, wm8961_i2c_id);
>  
> +static const struct of_device_id wm8961_of_match[] = {
> +	{ .compatible = "wlf,wm8961", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, wm8961_of_match);

Compile-test with W=1 and without CONFIG_OF. Is there a warning here?

Best regards,
Krzysztof


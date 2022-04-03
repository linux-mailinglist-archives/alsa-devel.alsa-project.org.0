Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1464F07F9
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Apr 2022 07:52:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDAE2171E;
	Sun,  3 Apr 2022 07:52:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDAE2171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648965178;
	bh=FoQaaRpcp1JAicdGBuWpjWNBGGxyIm5q1C/xkje+4hU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a6ACdlbN2P7BZK1lkBJ58D4MsUZxzHAMiyzclQ0qJnYKV/hDC/kBf9hVppnzMklNI
	 RExTUd3RGFAm9fX18EkNfoNMi2AYg8bV/h0XVtTQB3zEJv6763/38Aqrp9OC6LgsIC
	 9iSD9vzL/Jr9weJZ38bu0j3bEYdN3H7bCWI2jxrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5547AF8028B;
	Sun,  3 Apr 2022 07:51:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4056BF80248; Sun,  3 Apr 2022 07:51:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 RCVD_IN_BL_SPAMCOP_NET,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr
 [80.12.242.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E9CFF80100
 for <alsa-devel@alsa-project.org>; Sun,  3 Apr 2022 07:51:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E9CFF80100
Received: from [192.168.1.18] ([90.126.236.122]) by smtp.orange.fr with ESMTPA
 id at9JnoLlRN7Ccat9JnMpFF; Sun, 03 Apr 2022 07:51:43 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 03 Apr 2022 07:51:43 +0200
X-ME-IP: 90.126.236.122
Message-ID: <93751991-30ce-93a0-0f33-105f99b8dfe3@wanadoo.fr>
Date: Sun, 3 Apr 2022 07:51:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ASoC: msm8916-wcd-digital: Fix missing
 clk_disable_unprepare() in msm8916_wcd_digital_probe
Content-Language: fr
To: Miaoqian Lin <linmq006@gmail.com>
References: <20220307084523.28687-1-linmq006@gmail.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220307084523.28687-1-linmq006@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Le 07/03/2022 à 09:45, Miaoqian Lin a écrit :
> Fix the missing clk_disable_unprepare() before return
> from msm8916_wcd_digital_probe in the error handling case.
> 
> Fixes: 150db8c5afa1 ("ASoC: codecs: Add msm8916-wcd digital codec")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>   sound/soc/codecs/msm8916-wcd-digital.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/msm8916-wcd-digital.c b/sound/soc/codecs/msm8916-wcd-digital.c
> index fcc10c8bc625..9ad7fc0baf07 100644
> --- a/sound/soc/codecs/msm8916-wcd-digital.c
> +++ b/sound/soc/codecs/msm8916-wcd-digital.c
> @@ -1201,7 +1201,7 @@ static int msm8916_wcd_digital_probe(struct platform_device *pdev)
>   	ret = clk_prepare_enable(priv->mclk);
>   	if (ret < 0) {
>   		dev_err(dev, "failed to enable mclk %d\n", ret);
> -		return ret;
> +		goto err_clk;
>   	}
>   
>   	dev_set_drvdata(dev, priv);
> @@ -1209,6 +1209,9 @@ static int msm8916_wcd_digital_probe(struct platform_device *pdev)
>   	return devm_snd_soc_register_component(dev, &msm8916_wcd_digital,
>   				      msm8916_wcd_digital_dai,
>   				      ARRAY_SIZE(msm8916_wcd_digital_dai));
> +err_clk:
> +	clk_disable_unprepare(priv->ahbclk);
> +	return ret;
>   }
>   
>   static int msm8916_wcd_digital_remove(struct platform_device *pdev)

Hi,
I think that the same should be done for 'priv->mclk' if 
devm_snd_soc_register_component() returns an error.

Can you give it a look?

CJ

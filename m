Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF844F080E
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Apr 2022 08:18:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45AE81733;
	Sun,  3 Apr 2022 08:17:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45AE81733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648966715;
	bh=F2hfV62RdpPCOHN+Xi99IhVJ6t77AVvW+6KKG7TTmLU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZQ3/1dxxyDuf7dJwEUyrXPPXf232wUpoebWUwdCkQHdnbb0Oql4NDlDXNLXmhNNs5
	 ru+lDAbVFeMx9hezBnudUwT8C5Tw3T1zbW8T3W1hOahR2B+PkpGkytIW5IPfzhA2RV
	 KNKBVnUXyDgbYmHC+ovyqxdExqXDPeVABDLeDHaA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F10F9F80100;
	Sun,  3 Apr 2022 08:17:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB31FF80248; Sun,  3 Apr 2022 08:17:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 RCVD_IN_BL_SPAMCOP_NET,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr
 [80.12.242.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22F9FF80100
 for <alsa-devel@alsa-project.org>; Sun,  3 Apr 2022 08:17:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22F9FF80100
Received: from [192.168.1.18] ([90.126.236.122]) by smtp.orange.fr with ESMTPA
 id atY9noVWvN7CcatY9nMrxT; Sun, 03 Apr 2022 08:17:22 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 03 Apr 2022 08:17:22 +0200
X-ME-IP: 90.126.236.122
Message-ID: <7dc70fe2-a418-9842-c9ad-e78216ec1d13@wanadoo.fr>
Date: Sun, 3 Apr 2022 08:17:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ASoC: codecs: Fix an error handling path in
 va_macro_probe()
Content-Language: fr
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
References: <6d08311472e272fdc1a184f019ec98ade6e9dc46.1648966195.git.christophe.jaillet@wanadoo.fr>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <6d08311472e272fdc1a184f019ec98ade6e9dc46.1648966195.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

Le 03/04/2022 à 08:10, Christophe JAILLET a écrit :
> After a successful lpass_macro_pds_init() call, lpass_macro_pds_exit() must
> be called.
> 
> Add the missing call in the error handling path of the probe function and
> use it.
> 
> Fixes: 9e3d83c52844 ("ASoC: codecs: Add power domains support in digital macro codecs")

I'll send a V2. The same issue is also in lpass-tx-macro.c and 
lpass-rx-macro.c.

CJ

> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   sound/soc/codecs/lpass-va-macro.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index f3cb596058e0..d18b56e60433 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -1434,8 +1434,10 @@ static int va_macro_probe(struct platform_device *pdev)
>   		va->dmic_clk_div = VA_MACRO_CLK_DIV_2;
>   	} else {
>   		ret = va_macro_validate_dmic_sample_rate(sample_rate, va);
> -		if (!ret)
> -			return -EINVAL;
> +		if (!ret) {
> +			ret = -EINVAL;
> +			goto err;
> +		}
>   	}
>   
>   	base = devm_platform_ioremap_resource(pdev, 0);
> @@ -1492,6 +1494,8 @@ static int va_macro_probe(struct platform_device *pdev)
>   err_dcodec:
>   	clk_disable_unprepare(va->macro);
>   err:
> +	lpass_macro_pds_exit(va->pds);
> +
>   	return ret;
>   }
>   


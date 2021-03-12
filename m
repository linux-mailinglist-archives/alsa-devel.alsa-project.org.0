Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D522F3396F1
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 19:52:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7626317B9;
	Fri, 12 Mar 2021 19:51:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7626317B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615575147;
	bh=tpTdv7ggGBKmNIRl5VdIJQnUrxQ5NIZ3S1pajvfQcWg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E2be7QYQ2rCyzXhLI2+e5AUQMeBXnNZSkCd29rUpSb0NnJaeG9tRzQr1g9Uf249Dq
	 k68zdnoU9AkfHGDlmNg97w9piAquENLWfO085zlEpVtqsmSzK4KU3uap2OfIEHbMpT
	 qnxfMzGuSf8yKZhla/j5M7HoSdDpES9HKm6UUnm8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C92D0F800BF;
	Fri, 12 Mar 2021 19:50:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA0C9F801D8; Fri, 12 Mar 2021 19:50:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85820F8012A
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 19:50:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85820F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="KxVppLCr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=TdTtswT/PYcJEl/JzQ4ecMAuE2v89YlefBd6JtAA4+I=; b=KxVppLCrBWFGZEKJ5YFPr920pD
 05fVY7ucuEkqXCeKYR9rKIolOweN4OXJ0yPbxVdsOIAvC/zGrHzeLtKqUlWhwoX1SjzBHVi55aHfY
 lIRkePTw/HOQV3iy97ony7U7HJrYKu4gP+T7mFc771XTfL54S5q6tFmcX2sd6TpbZNDM8Zo5IA2I2
 45fmUdkxsHHmxOxeITCQ2dFH7PzuKkNYLTQ21+i+zk7mbBY9wm4yk7MchTWSlbsosDmattRckJV+2
 zn8L+qRSHPzwPk0pUt/fkCQHUACTdguvRQQ6FaTO5U0CI/7zdGHLhndkJXVTonsFxMTDTvtX2g2vB
 Pa6bkGmg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1lKmrz-0001kK-OJ; Fri, 12 Mar 2021 19:50:43 +0100
Received: from [2001:a61:2aea:a901:9e5c:8eff:fe01:8578]
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1lKmrz-000Phz-Hd; Fri, 12 Mar 2021 19:50:43 +0100
Subject: Re: [PATCH 02/23] ASoC: ad1836: remove useless return
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
 <20210312182246.5153-3-pierre-louis.bossart@linux.intel.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <477d649a-81bd-a858-a6be-0cabdb88163e@metafoo.de>
Date: Fri, 12 Mar 2021 19:50:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312182246.5153-3-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26106/Fri Mar 12 13:03:16 2021)
Cc: tiwai@suse.de, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>
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

On 3/12/21 7:22 PM, Pierre-Louis Bossart wrote:
> Cppcheck warning:
>
> sound/soc/codecs/ad1836.c:311:9: warning: Identical condition and return expression 'ret', return value is always 0 [identicalConditionAfterEarlyExit]
>   return ret;
>          ^
> sound/soc/codecs/ad1836.c:308:6: note: If condition 'ret' is true, the function will return/exit
>   if (ret)
>       ^
> sound/soc/codecs/ad1836.c:311:9: note: Returning identical expression 'ret'
>   return ret;
>          ^
>
> Likely copy/paste between adc and dac cases.
>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   sound/soc/codecs/ad1836.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/sound/soc/codecs/ad1836.c b/sound/soc/codecs/ad1836.c
> index a46152560294..08a5651bed9f 100644
> --- a/sound/soc/codecs/ad1836.c
> +++ b/sound/soc/codecs/ad1836.c
> @@ -305,8 +305,6 @@ static int ad1836_probe(struct snd_soc_component *component)
>   		return ret;
>   
>   	ret = snd_soc_dapm_add_routes(dapm, ad183x_adc_routes, num_adcs);
> -	if (ret)
> -		return ret;
>   
>   	return ret;
>   }

We could even go one step further and do

return snd_soc_dapm_add_routes(dapm, ad183x_adc_routes, num_adcs);

But either is fine. Thanks for cleaning this up


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E11465E6EAE
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 23:41:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8353982C;
	Thu, 22 Sep 2022 23:40:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8353982C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663882888;
	bh=J9hwEtt/+BLqUBKa+PcYTL4Nu9lISa83XQ21Xx4VlPQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RNZXraz1lQmp1qt0OgBOZAY4K97G5TY80f2eBzWeZCTSo9DVmVBLA+Wf96/Bmtk9k
	 gb8kcVWtnP5DnT7uzzNUrnmmGsCnCudm4uaZIIq8ee4vpFSv61uqbuUCYd5e0BRqEN
	 QxC95OlH5cIdU0MfY7crytVKY2SMO2PR8I3cKcfA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A0E0F80548;
	Thu, 22 Sep 2022 23:39:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CCC2F80548; Thu, 22 Sep 2022 23:39:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11029F8012A
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 23:39:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11029F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LUdmXEY4"
Received: by mail-wr1-x432.google.com with SMTP id z6so17618369wrq.1
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 14:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=3YdjZ7VPUxdfC5sRfXwx/0L+V0iZ1cHHxou9pXPTrn0=;
 b=LUdmXEY4WTCLFE96EnTufspOZgwzO9if4fnR/Ki/tDw4TDslehPs9KXAWqVQ90eX74
 wr7N61D+a97NJnOs7WG5uEVR7FTjtHhiHo4C2F6126LiApGKN514zaeKrrwJnsP/zvq1
 42Ii9hLAq4vPR27IJRA/ByOyomv5u5UI22rWwwivAzOPq5Z9/wo/h5H+5E5zxQewEhQM
 0PYhr27vPRBTi1cbAJbZg6Uw2P37N7fKziMhHn1/AAbgWNQl2bMjevEOE+2qsA2fp87g
 uHA6cmo+ElyOcEEobYbt8FerYREw8vDcewHJG7mCrLGH5AinoqvTG9iP7zAuB3GRXqTg
 OlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=3YdjZ7VPUxdfC5sRfXwx/0L+V0iZ1cHHxou9pXPTrn0=;
 b=ihEaL9Ii+4JJJEzM4WU2P27RixWTwP4suAjF9I1p1DV8WlakL9mMU5lMaHPnkKUsSA
 iu6A1oKzY125LzfMk/ptEWn0v0zBqhHZ4tWd14tfVXClorWbM6mjIx/Ax/agY4aBX8T/
 l6dYBpmX/rpUgQqRFTyGlxSwObQCC/nXYP6p/GAibp2cwc8vtcsFG+lKeTWS6+QaRwxC
 ke27vDiUUhLcSRbO4o4H+H9N2nhsW+lGhAdcAic9wTjh++Vj5uTRpD/IXfM5j5Rpib9p
 Mp7zV0CwBCfTdvzKkLLfO819Y1RVc7EYeV+VIFhBWHmfupIXZ7PjfQ0hPDz7LD20om2w
 r1iw==
X-Gm-Message-State: ACrzQf1IatznujolhTokM5fp+YiMENC5X73/lXNhd+FM6eyRx+2FikVi
 E6Gf7fqa64YNbYSS46m+XCY5ww==
X-Google-Smtp-Source: AMsMyM7fIC1LBj6rLVhG2ZRjxhF1HjOWZH+eirIbrbnBVm0ST+5hrcXDL3kJ2ojgS88jH1nJ1qF0qA==
X-Received: by 2002:adf:fa81:0:b0:224:f260:2523 with SMTP id
 h1-20020adffa81000000b00224f2602523mr3238333wrr.26.1663882739290; 
 Thu, 22 Sep 2022 14:38:59 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 g14-20020a05600c4ece00b003b477532e66sm11907506wmq.2.2022.09.22.14.38.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 14:38:57 -0700 (PDT)
Message-ID: <f6d0df7f-de0d-75b8-57a7-8a3f5c93194a@linaro.org>
Date: Thu, 22 Sep 2022 22:38:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] ASoC: wcd934x: fix order of Slimbus unprepare/disable
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20220921145354.1683791-1-krzysztof.kozlowski@linaro.org>
 <20220921145354.1683791-2-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220921145354.1683791-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: stable@vger.kernel.org
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



On 21/09/2022 15:53, Krzysztof Kozlowski wrote:
> Slimbus streams are first prepared and then enabled, so the cleanup path
> should reverse it.  The unprepare sets stream->num_ports to 0 and frees
> the stream->ports.  Calling disable after unprepare was not really
> effective (channels was not deactivated) and could lead to further
> issues due to making transfers on unprepared stream.
> 
> Fixes: a61f3b4f476e ("ASoC: wcd934x: add support to wcd9340/wcd9341 codec")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


>   sound/soc/codecs/wcd934x.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
> index f56907d0942d..28175c746b9a 100644
> --- a/sound/soc/codecs/wcd934x.c
> +++ b/sound/soc/codecs/wcd934x.c
> @@ -1913,8 +1913,8 @@ static int wcd934x_trigger(struct snd_pcm_substream *substream, int cmd,
>   	case SNDRV_PCM_TRIGGER_STOP:
>   	case SNDRV_PCM_TRIGGER_SUSPEND:
>   	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> -		slim_stream_unprepare(dai_data->sruntime);
>   		slim_stream_disable(dai_data->sruntime);
> +		slim_stream_unprepare(dai_data->sruntime);
>   		break;
>   	default:
>   		break;

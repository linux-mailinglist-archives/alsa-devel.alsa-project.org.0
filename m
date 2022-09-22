Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D505E6EAB
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 23:41:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A92E1E2;
	Thu, 22 Sep 2022 23:40:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A92E1E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663882865;
	bh=OFwUofDzQ9FdUllnFkGNAT+UYMqgq+1JJylkCG/XVMs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fCtASxE0FyOs8b9sQ/M77SrxD5xEOqwuzRCHFF2uy3pjZb20BOkOdFGb54/SvXLik
	 0i1whNgDHElS8kXikms+1aDJ4+UcwE3EsJBj4IIIvBxCbT4ss6DC39JvVZxochfIsA
	 p4XrbZ4D+1r09AkwgmhxtQDZU6pkWNqPYisBw0r4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A7E6F8030F;
	Thu, 22 Sep 2022 23:38:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 917CEF8012A; Thu, 22 Sep 2022 23:38:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0B8DF804FE
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 23:38:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0B8DF804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="AjEKNitG"
Received: by mail-wr1-x42f.google.com with SMTP id n12so17531187wrx.9
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 14:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=rE4qkoQWFMK80vrDxYXRfq6e/ZoyI2F/bN7ZyOFnWvk=;
 b=AjEKNitGnBVVvUIhiBOOIz384XMAwt2GfXvy5+08/YqD4eDCPYNZVPX2NeU6XqysoS
 IkNDeCWYZTXuA0ePbraD+WK6JEvEptSZw0mDM/KZhl4i7ZEEebKGysFOUKn3iQYybmIF
 0mGzx7X1bTpfnm+s4oSJ51J8jLHhxCtoZCM3bcyLWR5g2kAa84ndQQBtj7F44biRhEO0
 vkpvfaKbpmG9W8CJ722xEeVjpiHSEHoJwKmkPficS5NTXNjrFXu3ugYFcmDHX6Yh9mHV
 PVq64ZARu8HlsBseE6KOtz2ASQGN9Yy7OpOWdLsLOhB/HgnYmZWCOhJZsqp0JXaoYpq+
 Jtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=rE4qkoQWFMK80vrDxYXRfq6e/ZoyI2F/bN7ZyOFnWvk=;
 b=lHg+6cdkOjwBx7hc1Y4XB7mauTQFKxQ2BN1AibZxc7LybfRLDNcqSYaFBtWWUosnuy
 6j39q/GnOtv5pK9j5K1NqZRUkeAFdkvrlcQYv1XEiBE55UdrwkSyhDjvjm6JugPdUina
 CKEuBtsZryg6aeV1HX2yK2hFlfgjO4bg9aSCoc1WT64k4qRiDaecRuHGDvlBrtnr/agu
 1nSFAFhr4uO9wWi+BgsnZ586dlQY8eW3KSzN7qzJf8t/7Q0OSl8WJQLiZFU1OgxhPnm3
 sarNOHYMftIGcqVpH+08na6M9n8RXgddY3aOIUfIvJSkUPKYZ9jOa803/CevRhuiTfp3
 kROQ==
X-Gm-Message-State: ACrzQf06GwN3PEc19eVuu/ayjiFTmOunrr3cqBSRM7MNL9UoQS6Nfqsy
 8eLvcZcIe3Hy2ovjb8hiCTIHLQ==
X-Google-Smtp-Source: AMsMyM5kgUiRLL5Xx+qtmKQlyMn1l0m6sz2JT4ou1vq2rC1rwLKpsQC6l0ZaDdfHYwKvvtU4qDXTTA==
X-Received: by 2002:adf:f2c9:0:b0:228:63f6:73c2 with SMTP id
 d9-20020adff2c9000000b0022863f673c2mr3282652wrp.554.1663882722308; 
 Thu, 22 Sep 2022 14:38:42 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 n42-20020a05600c3baa00b003a319b67f64sm10953764wms.0.2022.09.22.14.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 14:38:41 -0700 (PDT)
Message-ID: <15b6bf59-9a76-8a97-cb92-701277a2f80d@linaro.org>
Date: Thu, 22 Sep 2022 22:38:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] ASoC: wcd9335: fix order of Slimbus unprepare/disable
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20220921145354.1683791-1-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220921145354.1683791-1-krzysztof.kozlowski@linaro.org>
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

Thanks Krzysztof

On 21/09/2022 15:53, Krzysztof Kozlowski wrote:
> Slimbus streams are first prepared and then enabled, so the cleanup path
> should reverse it.  The unprepare sets stream->num_ports to 0 and frees
> the stream->ports.  Calling disable after unprepare was not really
> effective (channels was not deactivated) and could lead to further
> issues due to making transfers on unprepared stream.
> 
> Fixes: 20aedafdf492 ("ASoC: wcd9335: add support to wcd9335 codec")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Nice catch,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

>   sound/soc/codecs/wcd9335.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
> index 06c6adbe5920..d2548fdf9ae5 100644
> --- a/sound/soc/codecs/wcd9335.c
> +++ b/sound/soc/codecs/wcd9335.c
> @@ -1972,8 +1972,8 @@ static int wcd9335_trigger(struct snd_pcm_substream *substream, int cmd,
>   	case SNDRV_PCM_TRIGGER_STOP:
>   	case SNDRV_PCM_TRIGGER_SUSPEND:
>   	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> -		slim_stream_unprepare(dai_data->sruntime);
>   		slim_stream_disable(dai_data->sruntime);
> +		slim_stream_unprepare(dai_data->sruntime);
>   		break;
>   	default:
>   		break;

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E09F37285C7
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 18:50:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CFF11D7;
	Thu,  8 Jun 2023 18:49:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CFF11D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686243018;
	bh=FxNW1tDHgmkiELl9PfEw1sWGYD0Wy5hET4x+qZvi4Po=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QgNQFlg/HF6NR5/c4JranxvYsQyMQEJvxw02SBBInSomzP+dhINJIwNZEYMeaDcjX
	 NaiB2VO5HPKTmW66R3fO7LWr315uyp0/pxRpcBV9HRRfiw/u89HGcFUJDqt7lGGjmO
	 dX/HcHlzTfaNTQycBE9Kp9gx2tiZUNpU+DfuFlLQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8D62F80558; Thu,  8 Jun 2023 18:48:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 502F8F804DA;
	Thu,  8 Jun 2023 18:48:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A376F80549; Thu,  8 Jun 2023 18:48:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1C6BF804DA
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 18:48:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1C6BF804DA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=ZqrukFB0
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f7ff69824dso3879575e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Jun 2023 09:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686242922; x=1688834922;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZAGoNRFxCpaYHU/hquZQMckGJK1MycTqKrmK0fBxG7E=;
        b=ZqrukFB0x02Ksu9A21nKCNgSxXKaIv9A4zm/KLh/PMSC6np4/9in+rhXslNpvhpnDa
         mXx4kn1KXbG6FSaClpEds24iF1+bcl1u/x0bcbcDFpqe4uAzAeXbOERgwu23isjyfm4g
         2MNqP8USNkwMwr9ONSjKJo8/09+P4Cu9VSF3W6+vmzxbiXlJazMZzQr82kSCL9lKTay9
         SI9lj60WTnw5RKJVVaBfCV+mKL3HAts1LDNlZocCq/K7fN0jrHKt1XOnMexp55JvMXCE
         5gl0OaZcQw8VBuFoWbT1Q5EDl6cbLP51m+RlWMP1yNMTYATsz/kYq7F/IqsCMsYvUCGI
         BMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686242922; x=1688834922;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAGoNRFxCpaYHU/hquZQMckGJK1MycTqKrmK0fBxG7E=;
        b=XM1gv/6XtQcE4JmI/SI1RdEL463X3D4FocwXO0WIiJ/ecP+/GN6lTekxR5Mp1vU7Cm
         Yne7fh00HdGaYue0c7CAtcMPDd9jXKvM5eknYhJglHa6QX9CXSt45PHhpACAG3jQRqW1
         OQlWpDK0Lvu5PAGxtNsvi/R3nKShP8yoQ2X/j+VJ5qgVqsvXXM3zzDhGtXl8xiZVjHmD
         Q5enZA92AUnnXu0kuLHHGwBM7ShN1KvUU9Vniu+6/imUmnCxbwR6pDHY4IiJJswMkD/7
         2fNvF7Y/uJ2MH927ONv3vGKe+xV9QrVQ8RdZlQSu4Wbry9RVqtjzDLFzBeI4qqVnDin5
         eiDQ==
X-Gm-Message-State: AC+VfDx3OR1mToNF+jn0nBZRDna5nNemmYfTn538GoSZxY9A8r8VXk3T
	i/xidZIP0MhCzOc92ZGJyug=
X-Google-Smtp-Source: 
 ACHHUZ4Coiru7soNPzfL2Fy+8KRA7k2eYiCZIxlKiMz3t/+/D2WokBnXoIyuNOcVlVJvpJI5pbwL3g==
X-Received: by 2002:a05:600c:2216:b0:3f7:e7a2:25f6 with SMTP id
 z22-20020a05600c221600b003f7e7a225f6mr1679174wml.17.1686242922204;
        Thu, 08 Jun 2023 09:48:42 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id
 q12-20020a05600000cc00b002ff2c39d072sm2043313wrx.104.2023.06.08.09.48.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 09:48:41 -0700 (PDT)
Message-ID: <e548940b-cda3-05e6-2c31-80c286d5025c@gmail.com>
Date: Thu, 8 Jun 2023 18:48:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/5] ASoC: mediatek: mt8188-mt6359: clean up a return in
 codec_init
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, amergnat@baylibre.com, dan.carpenter@linaro.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
 <20230608084727.74403-3-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230608084727.74403-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GSQFZLKG4EQTMHBXG4GYYTX3KMELYOT4
X-Message-ID-Hash: GSQFZLKG4EQTMHBXG4GYYTX3KMELYOT4
X-MailFrom: matthias.bgg@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GSQFZLKG4EQTMHBXG4GYYTX3KMELYOT4/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 08/06/2023 10:47, AngeloGioacchino Del Regno wrote:
> From: Dan Carpenter <dan.carpenter@linaro.org>
> 
> This code triggers a Smatch static checker warning and does sort of
> look like an error path.
> 
> sound/soc/mediatek/mt8188/mt8188-mt6359.c:597 mt8188_max98390_codec_init() warn: missing error code? 'ret'
> 
> However, returning 0 is intentional.  Make that explicit.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> index 643a7a12a96b..b2735496d140 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> @@ -594,7 +594,7 @@ static int mt8188_max98390_codec_init(struct snd_soc_pcm_runtime *rtd)
>   	}
>   
>   	if (rtd->dai_link->num_codecs <= 2)
> -		return ret;
> +		return 0;
>   
>   	/* add widgets/controls/dapm for rear speakers */
>   	ret = snd_soc_dapm_new_controls(&card->dapm, mt8188_rear_spk_widgets,

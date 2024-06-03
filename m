Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE438D825B
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2024 14:35:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02982850;
	Mon,  3 Jun 2024 14:35:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02982850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717418131;
	bh=yI5u5wUiXcIr1CXdNjn8aKUwswP4fbQVdrpLyFYQ0tw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DonGkhxS4opXzdMZRcRF9mGWWhC/CsG7MjF1dCa5yaZYQwPFJYu12EYefbgq9m7W1
	 Z3ME2bbNnDCRtEKqqzT013muSTT7mKur4D+Lx3gps/ev0uLo87TwJUduNa04A94L29
	 7aVSjrivLCyt4pLX2EY6RtAb2bc/wQ9mqzEXzS9w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FE52F80588; Mon,  3 Jun 2024 14:34:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 999A1F800AC;
	Mon,  3 Jun 2024 14:34:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5093F80236; Mon,  3 Jun 2024 14:34:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02C86F800AC
	for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2024 14:34:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02C86F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xDGeSvpF
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-35dceef4227so3041966f8f.0
        for <alsa-devel@alsa-project.org>;
 Mon, 03 Jun 2024 05:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717418092; x=1718022892;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AYnk7Jhk5XQEe5qdju2BLibwhg+AiDV6NTuQ4IZI3jM=;
        b=xDGeSvpF2+OZaXB3w0vXVDC38/vcj+yXY0VHBm+wXpJfcjR/X3DiBVEZz3OASM9VsU
         WJbqrWlNnoxb5oKB/RLsABXnOw9zI0fp1TLtKGtu6zXnJNY6QrdX/m6TVN5E+Z4OKnSz
         iMt6fvT1FvHl6F2DCsUHZx8IKfseKpXMQsriNAEPNZXLm9NPyVAyKfwNIp068lRRbKDa
         sUBvjf2rgb6Q++3g9CJOZke9j5Bq+WrNxNrPbWyr582gd71YI3D3xko7BN8upjff7LTi
         pmGtWUzIOsuS4IjCe1kJrBtL3LuUuCxYtOBIJee4f5lgqrL62ez2hZIQVbkAeOgZhLJj
         CaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717418092; x=1718022892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AYnk7Jhk5XQEe5qdju2BLibwhg+AiDV6NTuQ4IZI3jM=;
        b=gJygKaaxu1bQJBp6qndWdd492Fqa/h3xQ/SjmN/0aXNPy6vahoGHjx8Q5D4dd71m04
         v8t8PkkqcEfoCVl/2L1nMizJFTL3lcCT3iBwT6jznblK9FGSN4/Jos+J7+BVu0iA8tnf
         nKSiQznqMqh1Mpwm2u1krpwI5xCfRTXugDwlsMpiB1OyN/3ZMIaQCpL/sUSFJX+vexmG
         uMgHrFxbrhS3Pj46xtmIrzIjGaNte+hyR25IBKLHFf9DnhqGqbKFmlVhGtahWpe8bSLl
         mnOpSlIBHumqmUzh7v2848/xanPLy2y6q1cPQjAvS/f6qgEnbQgRW3If8vv8U2/NKMHE
         8wow==
X-Gm-Message-State: AOJu0YyBOe1nMu/RQo+d1s8BLl30OlWuTBrv7HZR8E60fP/8a28lPoT9
	gpmLVw+odniLHnVil1BlxJzpVJYnTBLrczD3ysh9OaIoPq4jvTCsDCE6N7lc4d4=
X-Google-Smtp-Source: 
 AGHT+IEwm+dY0qO4BpWxOUL58zZV+cnU+QzHw3FR6bdQ3WmbzIoTUPKI6tqs4tXJauEY94kgkadNCQ==
X-Received: by 2002:a5d:4210:0:b0:354:fbc2:5cf6 with SMTP id
 ffacd0b85a97d-35e0f28854dmr5869925f8f.30.1717418092035;
        Mon, 03 Jun 2024 05:34:52 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-35dd04c090esm8938768f8f.6.2024.06.03.05.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 05:34:51 -0700 (PDT)
Message-ID: <39405408-97d3-49b5-b797-e9363471adf6@linaro.org>
Date: Mon, 3 Jun 2024 13:34:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: codecs: lpass-rx-macro: remove unused struct
 'rx_macro_reg_mask_val'
To: linux@treblig.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240601225446.183505-1-linux@treblig.org>
 <20240601225446.183505-2-linux@treblig.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240601225446.183505-2-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6S3HWOT63OGM4QBOKLSWSJSLZCLCYQGF
X-Message-ID-Hash: 6S3HWOT63OGM4QBOKLSWSJSLZCLCYQGF
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6S3HWOT63OGM4QBOKLSWSJSLZCLCYQGF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 01/06/2024 23:54, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> 'rx_macro_reg_mask_val' is unused since the original
> commit af3d54b99764 ("ASoC: codecs: lpass-rx-macro: add support for
> lpass rx macro").
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---

thanks for the patch,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
>   sound/soc/codecs/lpass-rx-macro.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index f35187d69cac..dfb7e4c69683 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -463,12 +463,6 @@ static const struct comp_coeff_val comp_coeff_table[HPH_MODE_MAX][COMP_MAX_COEFF
>   	},
>   };
>   
> -struct rx_macro_reg_mask_val {
> -	u16 reg;
> -	u8 mask;
> -	u8 val;
> -};
> -
>   enum {
>   	INTERP_HPHL,
>   	INTERP_HPHR,

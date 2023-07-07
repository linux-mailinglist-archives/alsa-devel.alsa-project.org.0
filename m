Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8DF74B157
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jul 2023 14:55:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2EEB3E7;
	Fri,  7 Jul 2023 14:54:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2EEB3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688734534;
	bh=Dr7vKdaNpybDygI57av+mXnZuShPhbAga0KctU+k1EI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mBAH6fppBiKIe0c52e6DCetlDhr0s5Cxz7omXwQAwis7YLYIJiMxrI8MlcQkRL0pk
	 HJ4CUK0UmXr4PfxAiB7Cc4qhGPvcAwxw5F6UBgQER8PcG/DfGzdc+V6YXg0POv5NX5
	 S7ussyCPnHJYgkiap2EvPrtRbbJJPGPpiMwTQMyw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C641F80125; Fri,  7 Jul 2023 14:54:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EB66F80104;
	Fri,  7 Jul 2023 14:54:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1E96F80125; Fri,  7 Jul 2023 14:54:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 222BBF80093
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 14:54:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 222BBF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DBvyiGaQ
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3142ee41fd2so1884758f8f.3
        for <alsa-devel@alsa-project.org>;
 Fri, 07 Jul 2023 05:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688734473; x=1691326473;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=//HmX2rwH4kNsgH83nKEdamx6qwz4xhPHaVhwq5zDNc=;
        b=DBvyiGaQWXVlWzt3CvPY5sxFRQUw8nXRMtQDxRwIJ8zj+XJcDEUxOsujGhtXBFOAHy
         bW/s+9ngfwoVnD6g88h9hsuy9gr99f2jPN+O297guVAHuQPErDCGYTDADGtOYTyVc7Gs
         C4JkzA3Dj7TiJIGjwmoivhD7WyOXafTc+8dc6thUy81uVSbBp9ovMbjatMjGf9ClDvKU
         pFHQ7vbDXfIKALy+bOg+AUIo+H50bYpUhrvAzuF8tXXmuKpKV+unxfgmy1tAs4BCOVjz
         MiYxO14J3KUhqj2gtNtwZJaFw2Lc4auomOApRyGPLPWIEo7bSdmoddL8p8y7sYlTTrmL
         l1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688734473; x=1691326473;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=//HmX2rwH4kNsgH83nKEdamx6qwz4xhPHaVhwq5zDNc=;
        b=dbpsK0a4uup8Sp4PeVBLS9+QUuQAZTvmxIHGWMNbSu46vAuoRiEWK7DDY1xRNJqW8G
         Y8E9oXU4Us1psiwhc7dxw6NKq4HnyUW19loTcUgAGG8jbiLfowusrBhIL2UQE+EfO2gL
         wZuWkRsJEBYX620pSWHRuz9RAuE/pFZGmsQbQb7mtoPryVFgqiugS1Thvjz+a+iS9fb9
         6d/MU/kmf3NtjUPOsEcxHLqWd4UBeZGFrqoWk9XeqZIEafZCx7soNduVL8aYEQF73oNJ
         0VaKdBhF9xCgmbmr09O5qVNZT/hBYloN2TU824i5LkSSgC0ieikNtbJW5jOsZcXDTax3
         PxHw==
X-Gm-Message-State: ABy/qLZfbqugl2s0IrCMLVl1+7TAwfIjv4VvKFeEBYbj7Bt5iBMabnE/
	iyEVwe6BJ7IS08EbuNvUbj95UQ==
X-Google-Smtp-Source: 
 APBJJlHvsrINvPQT0ac2eHj3X1qsLxYz25VEg3MHYtCOHGh7p/6C1edZJp6JGL5VpbqsaehK1vgDTA==
X-Received: by 2002:a05:6000:150:b0:306:46c4:d313 with SMTP id
 r16-20020a056000015000b0030646c4d313mr3928132wrx.28.1688734472847;
        Fri, 07 Jul 2023 05:54:32 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 k15-20020a056000004f00b003140fff4f75sm4436162wrx.17.2023.07.07.05.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 05:54:32 -0700 (PDT)
Message-ID: <efaf5960-bcc5-6d52-5552-e1505a13b635@linaro.org>
Date: Fri, 7 Jul 2023 13:54:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: codecs: wcd938x: fix dB range for HPHL and HPHR
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org
References: <20230705125723.40464-1-srinivas.kandagatla@linaro.org>
 <ZKfAUOOcGoBanHHu@hovoldconsulting.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <ZKfAUOOcGoBanHHu@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LK3FQBIPYUOWPMNXIL6URTYFTJ46XTDV
X-Message-ID-Hash: LK3FQBIPYUOWPMNXIL6URTYFTJ46XTDV
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LK3FQBIPYUOWPMNXIL6URTYFTJ46XTDV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 07/07/2023 08:35, Johan Hovold wrote:
> On Wed, Jul 05, 2023 at 01:57:23PM +0100, Srinivas Kandagatla wrote:
>> dB range for HPHL and HPHR gains are from +6dB to -30dB in steps of
>> 1.5dB with register values range from 0 to 24.
>>
>> Current code maps these dB ranges incorrectly, fix them to allow proper
>> volume setting.
>>
>> Fixes: e8ba1e05bdc0("ASoC: codecs: wcd938x: add basic controls")
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/codecs/wcd938x.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
>> index faa15a5ed2c8..3a3360711f8f 100644
>> --- a/sound/soc/codecs/wcd938x.c
>> +++ b/sound/soc/codecs/wcd938x.c
>> @@ -210,7 +210,7 @@ struct wcd938x_priv {
>>   };
>>   
>>   static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(ear_pa_gain, 600, -1800);
>> -static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(line_gain, 600, -3000);
>> +static const DECLARE_TLV_DB_SCALE(line_gain, -3000, 150, -3000);
> 
> This looks wrong, and indeed that forth argument appears to be a mute
> flag. I guess that one should have been 0 (false) here?

yes, this should be true instead of a mute dB value.

> 
> Headphone output also appears to be way too loud by default with this
> patch (alone) applied. Perhaps it's just the default mixer settings need
> to be updated to match?
> 
> It looks like you're inverting the scale above. Perhaps that's intended,

yes, the highest value corresponds to lowest dB which is why its inverted.

> but some more details in the commit message as to what was wrong and
> what you intended to do would have been good.

HPHR/HPHL Volume control is broken on this codec.
current UCM uses digital volume control for x13s which needs to be moved 
to Analog volume control.
I have this change https://termbin.com/mpp9 in UCM which I plan to send 
out once I test and fix other paths as well.

--srini
> 
> Johan

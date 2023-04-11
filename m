Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B6F6DDC16
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 15:31:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B598F02;
	Tue, 11 Apr 2023 15:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B598F02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681219901;
	bh=oz19ebo6RzSt12hM+zkOcQM5r98An6EzVQH+MFxC0io=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UqlpMAazNxqDhG6TPcMEmisze+Ij3t0uHfezmTU+vHntD5622mM73VQUoSa/ucRed
	 xQen2+asA9IVu5ILzTxYNMEOiG8MYYGMRIZ7nhpXChpq24UcVoJU8QbRqCQvOpTZae
	 EkUdyIF91VspZtDkf6S0FyLxbXc8a39ZW5xOyarg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0F8DF8025E;
	Tue, 11 Apr 2023 15:30:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0329FF8032B; Tue, 11 Apr 2023 15:30:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C009FF80149
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 15:30:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C009FF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gcMAXMGh
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-94a356c7419so194595666b.2
        for <alsa-devel@alsa-project.org>;
 Tue, 11 Apr 2023 06:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681219838;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gO2BTkJ++4qTrFAxR5g0p2pWZdBPYvq38Dgem4/uZdA=;
        b=gcMAXMGhw2SS8c+rNdp3D5J4cwxSIVFrv6OyO1uj6eQICcXc133bZLFg+xvp/JgnT0
         uU4VIv2Spb7+wPox1KSk7oz853N+fej7SRwJQClfyCvRGe/+1e1BuV0BqcE7attVv7Nw
         blE5XUhJzFsR9w3vqdvF4T0l5trF/WK6yHbz1zYUq6D6B5ynsZjkz4+tRcitVr0BhWik
         cfPFtwzM/uw2F+sLNOA5AyRm1JuBVmCQ/aGK/yRaXOQiPIrlLjcg24YRNF6IHxFp46+C
         xIW7B9BDOqIGsq5WUPYjo/XJ8lU5/koYXiK9zMR2cG6GQlCyRQnEzO25P/eKyCgZMexJ
         8Q1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681219838;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gO2BTkJ++4qTrFAxR5g0p2pWZdBPYvq38Dgem4/uZdA=;
        b=HBLqkQ5qp3NaOg+bEueYGW8fRSITTLevRRFRTpn6on+rrElJEdp2XiMj9XOvnt/exr
         5Nzu/o6AIdqj/GG8Em6UlfZeAWBGJeKQqoTggKzQwAlzVHjvbXpM5eqUw1uhaW+BPH+0
         qHAw3nLpibXAA/qbExcWAlEjaFQvbUyOwxs44Pdnx0EFhHmN/kKIkmOy/nIUYdZV3vHn
         xlX5UJa7BcUyNWgXCWzrpcBneoBMbZjVHgX6Ywew2wm5r1wqcbuGA6uqpew4TFwR1gCk
         QaU0y7UjNh0S2etvcWLe3kAcmfEwZun4+s2EbrC8tx/LuSb6jcaw+7OdH7cL7Op+RBEK
         N0Dg==
X-Gm-Message-State: AAQBX9eJEfmeep4mMl8vjNzhQ7vOmlT9pI/RNGFNOMy3TU84jEEPPxd8
	W69szRnbOF1daWTcAmhk3aNgMQ==
X-Google-Smtp-Source: 
 AKy350bapoxh14R/6n3+7EJ8biqLy3ACVSR7SGlD2+rApnKehuhP1+1eyysnkJF3GYv6k1aT0xlHpQ==
X-Received: by 2002:aa7:ce15:0:b0:4fe:9374:30d0 with SMTP id
 d21-20020aa7ce15000000b004fe937430d0mr8787658edv.39.1681219837758;
        Tue, 11 Apr 2023 06:30:37 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 o5-20020a509b05000000b005049b063736sm2602057edi.27.2023.04.11.06.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 06:30:37 -0700 (PDT)
Message-ID: <7af7475e-e8d3-6cf0-d879-4f9599bd1cfd@linaro.org>
Date: Tue, 11 Apr 2023 14:30:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: soc-compress: set pcm nonatomic flag from dai_link
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
References: <20230411110831.813-1-srinivas.kandagatla@linaro.org>
 <14976031-7d63-4069-8647-3cee41064215@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <14976031-7d63-4069-8647-3cee41064215@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PUMFLHJCG6VT66I6R7QICJZPNGQFUVS7
X-Message-ID-Hash: PUMFLHJCG6VT66I6R7QICJZPNGQFUVS7
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PUMFLHJCG6VT66I6R7QICJZPNGQFUVS7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 11/04/2023 14:25, Pierre-Louis Bossart wrote:
> 
> 
> On 4/11/23 06:08, Srinivas Kandagatla wrote:
>> In compress offload case we never set nonatomic flag on a new pcm. This triggers
>> below configuration error with DPCM on Qualcomm setup where dai_links are marked
>> as nonatomic.
>>
>> "FE is atomic but BE is nonatomic, invalid configuration"
>>
>> Fix this by Updating the pcm nonatomic flag correcly from the respective dai_link.
>>
>> CC: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/soc-compress.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
>> index 554c329ec87f..a8d70274cab8 100644
>> --- a/sound/soc/soc-compress.c
>> +++ b/sound/soc/soc-compress.c
>> @@ -615,6 +615,7 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
>>   			return ret;
>>   		}
>>   
>> +		be_pcm->nonatomic = rtd->dai_link->nonatomic;
>>   		rtd->pcm = be_pcm;
>>   		rtd->fe_compr = 1;
>>   		if (rtd->dai_link->dpcm_playback)
> 
> isn't this fixed already? Daniel Baluta sent a patch for this, already
> applied by Mark:
> 

Thanks for pointing this, Yes, It is fixed in sound-next.. my branch was 
a week+ old so did not spot it :-)

--srini
> https://lore.kernel.org/alsa-devel/20230324124019.30826-1-daniel.baluta@oss.nxp.com/

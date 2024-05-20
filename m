Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 543648C9E79
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 15:58:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF196E94;
	Mon, 20 May 2024 15:58:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF196E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716213491;
	bh=hz1NbHsnS8VM83jZDGbfce0Y04Ax0FINz964pXTrpYI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SYN85wM6qmmTlQkCn6PIGoUj9Ap8OEOKOKnInZWGMOxsSSTRzcHA/mwRhRoh7x5k+
	 X8YhR+XkAbreyC3vuhUxA8MtuoX7x7IKjqj78GYgaV11jM6hEWwVv4lpCsega++H2j
	 DAnZmVi9yRqwD+/x3lRCqI9FFL/byYITqkrQfDMA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3728F805B3; Mon, 20 May 2024 15:57:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7251F80589;
	Mon, 20 May 2024 15:57:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F299F8028B; Mon, 20 May 2024 15:57:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFFC8F8016B
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 15:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFFC8F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FKWUPkYf
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a620a28e95cso35422866b.3
        for <alsa-devel@alsa-project.org>;
 Mon, 20 May 2024 06:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716213458; x=1716818258;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QRamhVuVMRjdbf0PqzgKHE62r/5JU7p/yeFWq/4P6B8=;
        b=FKWUPkYfk8EUN5T0qdJ3FphrCprzXHwUk1mCvfSRt4oayN8obneg4o7SqTvC/4LQR8
         2bYFQL3+kqNFQMLv0JgK8Mf/iaP02XBekiRLYiyAYG0MuIF7GcFNlpVcLRfisul72y48
         ZZg/NuzX1D8sOma8iJLaCBmDoBmkVjs1bZWt4TDVRmTa9WndjkkLGL91oQor7tAQlbmV
         K4cMnL4Scq4Vb1EufVXe5sB6lK1942eXSwZdRgtk5ijbXs94h2p7gOZ5OHVzhzH/jCPc
         kzRFbHwsEcVqlRJfzkPEVvIJxmc9IdDnik3SQ0N7nBgsmTEBoiJtE3byavIfWs6jCkS6
         PYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716213458; x=1716818258;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRamhVuVMRjdbf0PqzgKHE62r/5JU7p/yeFWq/4P6B8=;
        b=PMjJ9/Yo3gDHLOHfh5l+YCMfQAPgiTpTWG63uWtMihzPq2jTVw1w0MavfAuzrdfYGK
         5t+UXfsq6k4Wpjgb3eBNQSbLBz84nu2hM/82wkZyPKZX5/mSw8wm46q2rAbQ97LsFQBO
         0QvGxMSsQI3UfyuofFx/Dq4b6MrMIuGXG86vMOyibcWu1cUWvH8pg8jICAuMwAoMfdF4
         8rtsaJXZOV+BWKutuUMd0FB2XnHMkngAdkBUdrYcvdpnKydEZVZ6aVOOIXy3fjYB2KED
         EBu3MhFgco4xJ0T8HenUevI9bDx/pyh9S5p1ndJg/pPuLXuoZJn5TA7YVGdBkqo03vb7
         rb6A==
X-Gm-Message-State: AOJu0YzVg4visVO5tiEFWdP+aqKtnjHa0P7C/Vtzq8Uw3wh9SsBj2Db6
	gSBMEvOTe7qb6zSlDPD8Ii7XDwZxEPkvE5W7ysrTg9eHlrA6vS/kIinnl9k+cN0=
X-Google-Smtp-Source: 
 AGHT+IHJ4TjOsch17ekDhKwGOmXGwBjMLnonRjbcmiUS/hMsvvp7nSgXL34tLdwpY+FNeQ7sGb2ZSw==
X-Received: by 2002:a17:906:1d05:b0:a59:c9b1:cb68 with SMTP id
 a640c23a62f3a-a5a2d55a759mr2047316166b.7.1716213458224;
        Mon, 20 May 2024 06:57:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7da8sm1469644366b.99.2024.05.20.06.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 06:57:37 -0700 (PDT)
Message-ID: <7b9d66a9-22b4-4fdc-a6a5-dda737a4f932@linaro.org>
Date: Mon, 20 May 2024 15:57:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] ASoC: qcom: qdsp6: Set channel mapping instead of
 fixed defaults
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Banajit Goswami <bgoswami@quicinc.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: 
 <20240509-asoc-x1e80100-4-channel-mapping-v3-0-6f874552d7b2@linaro.org>
 <20240509-asoc-x1e80100-4-channel-mapping-v3-3-6f874552d7b2@linaro.org>
 <d3c78e43-44a9-4ef2-8e64-00f39b32172c@linaro.org>
 <aa8509c9-7475-40b3-82cb-9bfc1e33b202@linaro.org>
 <adde3972-f055-464b-83ac-8d8a2d874e29@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <adde3972-f055-464b-83ac-8d8a2d874e29@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UQDCM4XEYOUMANDEWKZE6GVIZIPAHVSR
X-Message-ID-Hash: UQDCM4XEYOUMANDEWKZE6GVIZIPAHVSR
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UQDCM4XEYOUMANDEWKZE6GVIZIPAHVSR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/05/2024 17:39, Srinivas Kandagatla wrote:
> 
> 
> On 09/05/2024 12:43, Krzysztof Kozlowski wrote:
>> On 09/05/2024 11:17, Srinivas Kandagatla wrote:
>>>> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
>>>> index eb9306280988..208b74e50445 100644
>>>> --- a/sound/soc/qcom/qdsp6/audioreach.h
>>>> +++ b/sound/soc/qcom/qdsp6/audioreach.h
>>>> @@ -766,6 +766,7 @@ struct audioreach_module_config {
>>>>    /* Packet Allocation routines */
>>>>    void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t
>>>>    				    token);
>>>> +void audioreach_set_channel_mapping(u8 *ch_map, int num_channels);
>>>>    void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
>>>>    			       uint32_t token, uint32_t src_port,
>>>>    			       uint32_t dest_port);
>>>> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
>>>> index 00bbd291be5c..8ab55869e8a2 100644
>>>> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
>>>> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
>>>> @@ -243,6 +243,7 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
>>>>    	cfg.num_channels = runtime->channels;
>>>>    	cfg.bit_width = prtd->bits_per_sample;
>>>>    	cfg.fmt = SND_AUDIOCODEC_PCM;
>>>> +	audioreach_set_channel_mapping(cfg.channel_map, runtime->channels);
>>>>    
>>>
>>> Prepare can be called multiple times.. so we have channels overwritten here.
>>
>> Which is expected - just like we overwrite number of channels.
> This will work in q6apm-dai.c case as there is no set_channel_map callback.
> 
> lgtm.
> 
> Can you rename audioreach_set_channel_mapping to 
> audioreach_set_default_channel_mapping which makes it more obvious that 
> we are setting a default channel mappings.

Ack.

Best regards,
Krzysztof


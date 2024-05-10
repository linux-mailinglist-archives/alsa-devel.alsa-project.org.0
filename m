Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6888C2801
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2024 17:40:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 551A3E9D;
	Fri, 10 May 2024 17:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 551A3E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715355604;
	bh=ACx1uvyWtWuXvtWHFMekx8GERUUvgaoNeVkzE29kgyE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iiipYJEbnbr0Rd+QXyHWkqgRpHj8cnv8brJfydY6/2SrjAWBJ9HrzkL8mHv2XWjwM
	 Wtvwv832rViWQyUkNLYgugCFdhS6KsXja/uJNGu4wLRmxOAsX8BM4Ph+KuzlUvSzxI
	 eK6nkzoJujcWbi6dDrsPYz1id7plgM4vCOrc5uXQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2BAAF80579; Fri, 10 May 2024 17:39:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AFC7F800E2;
	Fri, 10 May 2024 17:39:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46455F8049C; Fri, 10 May 2024 17:39:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D824F8024C
	for <alsa-devel@alsa-project.org>; Fri, 10 May 2024 17:39:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D824F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=is1L9LdV
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2e0a34b2899so31893351fa.3
        for <alsa-devel@alsa-project.org>;
 Fri, 10 May 2024 08:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715355560; x=1715960360;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zCGimXM0s95/gK/0gBrT6bfMmBtbTT9QqvxRV5ToZt8=;
        b=is1L9LdVyrUSYGOlFBYUNwKGP2D07LsSgT/HNmTBgIt8St0v6LTITgB3EF2mEIWKc9
         GeUngDWofaQNyzMZdCJ0BZK5GopdWh12NbQsqQwC5CIiZ+d00WqtOQhj0FYVjHtYOqUR
         RgckdZtbtvt7zHFV0rT7Td4suI/KVjgJ4Cyg5Xi5X7BJckCarsKYxDxQ/81WgsNN0mzU
         suM3XbD/ZiX60+0tM2K106H0vLI5zmGiPe+b8i1kWih6J4chrMhxQCHHZNAuCey+ghtj
         DW9zci0g0kR9TWojWtxvLsK87eP72UYrjqvUAaQC2M7HzkZFxu0vdE3GRVyXK+CEgztW
         jipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715355560; x=1715960360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zCGimXM0s95/gK/0gBrT6bfMmBtbTT9QqvxRV5ToZt8=;
        b=PEC+eBR0UcgTCoW1LhcQQC1lrjJvVq9r2dImlODUlcXuBE1hJp/GV7zPbbqiBlEvqw
         L1LKG6iwyECVTX2qj5UYgcScIeK8GLbR3dv4SRDcJO4GlLPtOp8lWDNg076cMGwzPSH9
         ISttqOl/VgG3VcNIEnVeQ5Mkya1PtioqKn5IBM4AzjTLHmpBj58UxspttVqdjs/BijCg
         R+/4hnM9ZbTRAmySPoaEmZsA+CUGgfAUIByWkIPtTKk5/LTkNa9qv3RXl0jMMUUnCrqx
         cnwj5VHWgyLJxcqvWluKGOWun7L2SyhcC1WRWylRtUaX8QXwjx8wB86OtcwuEvn9QXl6
         UNQQ==
X-Gm-Message-State: AOJu0YzYn20gRiXEw4XzhQ2P2seqTHRYz4fFDE+HrCPZG7J/mX7g/XDf
	f9SZrmfXqC6uLQiOLPLVsuHiD22Q6QopFUeYVjSiSiFNNMiSROX3LzBZJ7HjuW8=
X-Google-Smtp-Source: 
 AGHT+IF7TN741mMkhPYgttssExz8B4IDN3HPogI6xNSBiOv89abZm4bMmHO6ARPMs21agKthCxa3lw==
X-Received: by 2002:a2e:7d09:0:b0:2e2:1647:f671 with SMTP id
 38308e7fff4ca-2e5205c817emr25268691fa.47.1715355559934;
        Fri, 10 May 2024 08:39:19 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-41ff7a840d2sm27051475e9.39.2024.05.10.08.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 08:39:19 -0700 (PDT)
Message-ID: <adde3972-f055-464b-83ac-8d8a2d874e29@linaro.org>
Date: Fri, 10 May 2024 16:39:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] ASoC: qcom: qdsp6: Set channel mapping instead of
 fixed defaults
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <aa8509c9-7475-40b3-82cb-9bfc1e33b202@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HVG5UMVXTPR35M62GL4E3H3VR4RXMG4W
X-Message-ID-Hash: HVG5UMVXTPR35M62GL4E3H3VR4RXMG4W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVG5UMVXTPR35M62GL4E3H3VR4RXMG4W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 09/05/2024 12:43, Krzysztof Kozlowski wrote:
> On 09/05/2024 11:17, Srinivas Kandagatla wrote:
>>> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
>>> index eb9306280988..208b74e50445 100644
>>> --- a/sound/soc/qcom/qdsp6/audioreach.h
>>> +++ b/sound/soc/qcom/qdsp6/audioreach.h
>>> @@ -766,6 +766,7 @@ struct audioreach_module_config {
>>>    /* Packet Allocation routines */
>>>    void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t
>>>    				    token);
>>> +void audioreach_set_channel_mapping(u8 *ch_map, int num_channels);
>>>    void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
>>>    			       uint32_t token, uint32_t src_port,
>>>    			       uint32_t dest_port);
>>> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
>>> index 00bbd291be5c..8ab55869e8a2 100644
>>> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
>>> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
>>> @@ -243,6 +243,7 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
>>>    	cfg.num_channels = runtime->channels;
>>>    	cfg.bit_width = prtd->bits_per_sample;
>>>    	cfg.fmt = SND_AUDIOCODEC_PCM;
>>> +	audioreach_set_channel_mapping(cfg.channel_map, runtime->channels);
>>>    
>>
>> Prepare can be called multiple times.. so we have channels overwritten here.
> 
> Which is expected - just like we overwrite number of channels.
This will work in q6apm-dai.c case as there is no set_channel_map callback.

lgtm.

Can you rename audioreach_set_channel_mapping to 
audioreach_set_default_channel_mapping which makes it more obvious that 
we are setting a default channel mappings.


--srini
> 
> Best regards,
> Krzysztof
> 

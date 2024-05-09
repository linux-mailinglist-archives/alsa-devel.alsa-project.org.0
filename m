Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E98AD8C0D08
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 11:04:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 319A6DEE;
	Thu,  9 May 2024 11:04:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 319A6DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715245466;
	bh=6tEP5W7E5rNrTuVQkJNbh1NgFDLzBuXP4UK9b2HnLcQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=okCEnE99AsWuB1v/fus5Ahemg4Lfaz/ylZMri8xaeTxiTWsDPYxmgpG1ktNsX7H+M
	 ldWKWK2cHs5+vg9MPKhHejZrKX/FUQR+hDSdBxCxdazpg4K/x3iqQhwsgvMKOeem/F
	 J/JHvkc73Awop0bBtBqwy0fjdz6G4FH9ds5GpQN4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18F66F80570; Thu,  9 May 2024 11:03:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54370F800E2;
	Thu,  9 May 2024 11:03:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94CDDF8049C; Thu,  9 May 2024 10:59:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F4014F800E2
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 10:59:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F4014F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VhDIq+fd
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41c7ac6f635so3948895e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 09 May 2024 01:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715245182; x=1715849982;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3RC6fstJDXsghafNDD46lbDOhml+R8Iq6EzCaj20EYo=;
        b=VhDIq+fdsRvqb7YF0ZKkYET/LUd6T5mxuw9fQGRYwuu4S5PpvHXJgrOOpy72sAgObu
         Wqzp9Qi9PDEQkgRir0FrQBWxZRYufNHM1260Vvhvnvsys3XFOB4EtXETRWzrFaAq3Ujx
         6mU6V4Eh2yZ8AaBKtvWYkVkjgSrzE6OGQqhfJHsNVoUlmiIX0ZpmmyoKLrzZTbU/9Zdj
         siogWOVQlVk3UpKwX+se7Piih7og7FpyOo7qqoUapCUx4PvE9omyCIhYrSn6Vnm9vykI
         dZ5ifVfAsW2cDk1rFgO9P7YFxdpi7jsO212EBd8UnZbYpjpAIPZd+t68lKznyD92tLYU
         bUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715245182; x=1715849982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3RC6fstJDXsghafNDD46lbDOhml+R8Iq6EzCaj20EYo=;
        b=KaJu25O2ClG40QXBZPK3krIvKZhkfrR6UIyYhwEY0aaoMT/Ry46jeQbWmGF5n4lz7/
         wCep/rMVZaFHSZgL+M8I8K6rJ6azdfEw52V1z7O2XZkulzk41DZCAg1Oc6MplAddTK3N
         yUKz+VDm+jbgXcNqjc1sr6c9cgUkotiqSRTBeMOWsYfcXbdjkWJZL2JL2dqQLlxYf2lh
         ygVKaiFqPnlu3GJzE8k5YE90iSUXYvhUT4QscgR52xS6FL5q/AmtPcYLX7m9ieMODyQp
         cbhybxQSHg3t4Eipa1XpBK5A0s6qpO8+fqe2Lg1IxuPCt/+A+8hmA/mheLqEfRCVCa7P
         l86A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIJcsLGdPywh8iaL+f4I6BpGvgo/JeyXsaE4TCGVs7KAymm40kjVb7klLH5863LBlpTZE6yVCPez3lJEEm7xFHCoBJzbrnro5rceI=
X-Gm-Message-State: AOJu0YwvMDUHyqxdnmmOywf8uHygZQoONFoSWDzDOac1A4699x8P0BLm
	511iQX/tN1HHVJoRploNxL1BwARCPJt3J59hGFYmBOSNqSgu0uSxfovfP5VLYs4=
X-Google-Smtp-Source: 
 AGHT+IFGM+zedQ3XccNEQmdxXTeGO/UYm0MlRcoX4lJrzzJEQVjrWdPX/UOeEIf8JIQxHSLjdaIf3w==
X-Received: by 2002:a05:600c:4755:b0:41b:9e4f:d2b2 with SMTP id
 5b1f17b1804b1-41f71cc1c66mr50020535e9.2.1715245181948;
        Thu, 09 May 2024 01:59:41 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-41f87c235b4sm52614135e9.11.2024.05.09.01.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 01:59:41 -0700 (PDT)
Message-ID: <a980d7a5-0d80-4ff1-93e1-b5f5806980c3@linaro.org>
Date: Thu, 9 May 2024 09:59:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ASoC: qcom: common: add Display port Jack function
To: Johan Hovold <johan@kernel.org>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
 <20240422134354.89291-3-srinivas.kandagatla@linaro.org>
 <ZiejT5yddioQ8upR@hovoldconsulting.com>
 <b9d0e2fd-069c-439c-a85f-1e99bf9018c3@linaro.org>
 <Zi-0kSU6TMcev05r@hovoldconsulting.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <Zi-0kSU6TMcev05r@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: V6GSTKFJ74L2YEB33TCFHTLVWBEI5C6P
X-Message-ID-Hash: V6GSTKFJ74L2YEB33TCFHTLVWBEI5C6P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V6GSTKFJ74L2YEB33TCFHTLVWBEI5C6P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 29/04/2024 15:54, Johan Hovold wrote:
> On Tue, Apr 23, 2024 at 04:55:32PM +0100, Srinivas Kandagatla wrote:
>> On 23/04/2024 13:02, Johan Hovold wrote:
>>> On Mon, Apr 22, 2024 at 02:43:52PM +0100, Srinivas Kandagatla wrote:
>>>    
>>>>    static const struct snd_soc_dapm_widget qcom_jack_snd_widgets[] = {
>>>>    	SND_SOC_DAPM_HP("Headphone Jack", NULL),
>>>>    	SND_SOC_DAPM_MIC("Mic Jack", NULL),
>>>> +	SND_SOC_DAPM_SPK("HDMI/DP0 Jack", NULL),
>>>> +	SND_SOC_DAPM_SPK("HDMI/DP1 Jack", NULL),
>>>> +	SND_SOC_DAPM_SPK("HDMI/DP2 Jack", NULL),
>>>
>>> Shouldn't these be split in dedicated HDMI and DP jacks too? What if you
>>> have a machine with HDMI and DP jacks which would otherwise both claim
>>> "HDMI/DP0"?
>>
>> These map to the Jack's added as part of qcom_snd_dp_jack_setup and
>> belong to DISPLAY_PORT_RX_0, DISPLAY_PORT_RX_1, DISPLAY_PORT_RX_2.
>>
>> If its going via USB-C DP controller it will be either DP or an HDMI ?
> 
> It will always be DP out of the machine even if an adapter can convert
> to HDMI internally.
> 
> The DRM ports are called "DP-1" and "DP-2" so it seems we should match
> that.
> 
>> This is the most common naming for the USB-C DP/HDMI jack events.
> 
> It looks like some Intel machines use names like "HDMI/DP, pcm=%d Jack"
> (with a pcm device number), but we also have "DP Jack". Not sure which
> are are used with USB-C, though. (Or if the former actually support HDMI
> altmode.)

I checked this on my machine which has usb-c and I can confirm using 
HDMI/DP naming for these jack.

Either way I don't mind having any names, but my point here is to be 
more consistent across.


--srini
> 
>> Qualcomm LPASS in some older SoCs had a dedicated HDMI interface which
>> is different to this one.
>>
>> Usual Other ways to connect HDMI is via external HDMI Bridge using I2S
>> interface which totally different to this DP interface.
> 
> Sure, but if there's ever a design with such a port then it will be
> called "HDMI Jack" and then the "HDMI in "HDMI/DP0 Jack" is unnecessary
> and confusing when it is always DP out.
> 
> Johan

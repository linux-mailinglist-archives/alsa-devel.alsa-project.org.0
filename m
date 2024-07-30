Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7385940BFE
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 10:42:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11C6684C;
	Tue, 30 Jul 2024 10:42:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11C6684C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722328971;
	bh=H9qkp20YNNay2aj1xO33U6q5QN/JCm1MkKShfQTyIxw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KVf3kyDqNHJoLc6GhrM5GqPNzVdwNGc/7oOWClsS51MJqk6O2vGGX9vYyS3WzxzLz
	 x3Udg8UEsiv2oSnl4plh6Aw1gtwAUUHsYBprCFvHKXL6Bu/GR1/utg73GoyEMaQViI
	 yC5sBPhiU5HUDeXbu1wFb70gZPV1fxHwB4ThX7YU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53B4FF80579; Tue, 30 Jul 2024 10:42:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCC0FF805AF;
	Tue, 30 Jul 2024 10:42:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DF91F802DB; Tue, 30 Jul 2024 10:28:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,TIME_LIMIT_EXCEEDED,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09C3AF800C9
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 10:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09C3AF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KxEykxyg
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3684eb5be64so2111970f8f.3
        for <alsa-devel@alsa-project.org>;
 Tue, 30 Jul 2024 01:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722327787; x=1722932587;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S0c7sMypLzXHl9r0GfvI5laataVFNaI4Z5VsTchwD6g=;
        b=KxEykxyg+39K00Hg0Bk5TRT22eaQVKlFNUeuLcIyXKEMerrBzh6Tm++XhYoyy5ZhWF
         I3f9odbwvO4/+DEpqGuTrroN1DjU9DgvQdbtEdbvM2JDqf1kWzj7M+lbmpl/m4g1LwwB
         au0oAeZUjm0dvOQeqz2JlQkavZLu53i9YgEHDxX6eqPDUVdZxgCfjOq58crW8nIcMvHc
         pX/9SKuvXJCvylaS1c/Lo1zK58VPe6b64mUEDZDgytX2jie9UfcJVh8zOO3UCcg9z/Sx
         deWn0Oyrk8I9SBIi5GIUfHi2FeI+D/gvZfqEqRYW53l20KcL1rhs8nGKuy7XoBByvLyO
         hQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722327787; x=1722932587;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0c7sMypLzXHl9r0GfvI5laataVFNaI4Z5VsTchwD6g=;
        b=Xt2Z+tRuco4j7KMrsH8i/eCPOB9gLIQRrW7rMMP+4MDntB/WYGQV+Z3boB1KMwczJy
         L6/F7h7UwhU9TQeK0V8jUIyW7GApRbaJcIlcbXEcmDhDTyYTodXoOYEdPzDJYNuiD2la
         0rPatNCWdUXVPN98X5kdc/EoW/W+faRQzikPq6KOMNK1/qvXe20Q3nH9LG7Yj9AM5QV9
         DI9VGPYlbv15sK3h2VwFkrYM2mozOmsxmod/SlRIhyU6jQqJ+50lz8lyydWP5spjTj8y
         iIthGWK5ftAEpa+YnxGqOAuODEGqdYmjs1KnVyijgfwrmra/Zfw9MteWls7XfiEvORB5
         68/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlZt/mG8y85E9uJXvN46nkJGctbcE8RCHPmH8K3aIJgZCwOzx6n5mSI6oCjzrmd/sBT1s9bkvEcAgD1vs8ENs2+d7Dhjixv6Maub8=
X-Gm-Message-State: AOJu0YyFusivLB/rb1pGvoJDPWe/eNy9UQW5T33dgPlG6hqH9XxKGNyS
	PetJRt85aOla7/NhtxT8ShzXKUMmiB+HoDFRf6VoDSOVphNqKkoysHas3ahVMZc=
X-Google-Smtp-Source: 
 AGHT+IGkUDfX2Q9x+dHmZW8xxvfM4QT/m2po2AeYIhouOrYs8BJqn/COJsa1nHEHSePaxKTMebnq3w==
X-Received: by 2002:adf:ec45:0:b0:368:5a32:f5bc with SMTP id
 ffacd0b85a97d-36b5d08a846mr6246758f8f.38.1722327786771;
        Tue, 30 Jul 2024 01:23:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b368706c2sm14005179f8f.117.2024.07.30.01.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 01:23:06 -0700 (PDT)
Message-ID: <22b20ad7-8a25-4cb2-a24e-d6841b219977@linaro.org>
Date: Tue, 30 Jul 2024 10:23:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: stream: fix programming slave ports for
 non-continous port maps
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Shreyas NC <shreyas.nc@intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20240729140157.326450-1-krzysztof.kozlowski@linaro.org>
 <095d7119-8221-450a-9616-2df6a0df4c77@linux.intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <095d7119-8221-450a-9616-2df6a0df4c77@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ID6XAXDS6ONGG2RNFUSCQS23LGDZU7FD
X-Message-ID-Hash: ID6XAXDS6ONGG2RNFUSCQS23LGDZU7FD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ID6XAXDS6ONGG2RNFUSCQS23LGDZU7FD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/07/2024 16:25, Pierre-Louis Bossart wrote:
> 
> 
> On 7/29/24 16:01, Krzysztof Kozlowski wrote:
>> Two bitmasks in 'struct sdw_slave_prop' - 'source_ports' and
>> 'sink_ports' - define which ports to program in
>> sdw_program_slave_port_params().  The masks are used to get the
>> appropriate data port properties ('struct sdw_get_slave_dpn_prop') from
>> an array.
>>
>> Bitmasks can be non-continuous or can start from index different than 0,
>> thus when looking for matching port property for given port, we must
>> iterate over mask bits, not from 0 up to number of ports.
>>
>> This fixes allocation and programming slave ports, when a source or sink
>> masks start from further index.
>>
>> Fixes: f8101c74aa54 ("soundwire: Add Master and Slave port programming")
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> This is a valid change to optimize how the port are accessed.
> 
> But the commit message is not completely clear, the allocation in
> mipi_disco.c is not modified and I don't think there's anything that
> would crash. If there are non-contiguous ports, we will still allocate
> space that will not be initialized/used.
> 
> 	/* Allocate memory for set bits in port lists */
> 	nval = hweight32(prop->source_ports);
> 	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
> 					  sizeof(*prop->src_dpn_prop),
> 					  GFP_KERNEL);
> 	if (!prop->src_dpn_prop)
> 		return -ENOMEM;
> 
> 	/* Read dpn properties for source port(s) */
> 	sdw_slave_read_dpn(slave, prop->src_dpn_prop, nval,
> 			   prop->source_ports, "source");
> 
> IOW, this is a valid change, but it's an optimization, not a fix in the
> usual sense of 'kernel oops otherwise'.
> 
> Am I missing something?
> 
> BTW, the notion of DPn is that n > 0. DP0 is a special case with
> different properties, BIT(0) cannot be set for either of the sink/source
> port bitmask.

I think we speak about two different things. port num > 1, that's
correct. But index for src_dpn_prop array is something different. Look
at mipi-disco sdw_slave_read_dpn():

173         u32 bit, i = 0;
...
178         addr = ports;
179         /* valid ports are 1 to 14 so apply mask */
180         addr &= GENMASK(14, 1);
181
182         for_each_set_bit(bit, &addr, 32) {
...
186                 dpn[i].num = bit;


so dpn[0..i] = 1..n
where i is also the bit in the mask.

Similar implementation was done in Qualcomm wsa and wcd codecs like:
array indexed from 0:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/codecs/wcd938x-sdw.c?h=v6.11-rc1#n51

genmask from 0, with a mistake:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/codecs/wcd938x-sdw.c?h=v6.11-rc1#n1255

The mistake I corrected here:
https://lore.kernel.org/all/20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org/

To summarize, the mask does not denote port numbers (1...14) but indices
of the dpn array which are from 0..whatever (usually -1 from port number).


Best regards,
Krzysztof


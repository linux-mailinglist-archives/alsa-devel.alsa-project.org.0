Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EED5B940D6F
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 11:27:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 569F8A4B;
	Tue, 30 Jul 2024 11:27:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 569F8A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722331656;
	bh=KDzaNaqrAn1n9ujgeV97I37YCEBTMWgTsNjpyBzWfu4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u5DBVfz9dpE05mbF7hDOjlABFZcPlfh/oNfO9flgCaeZsimwTJkf06iXl9LneW446
	 FixRHXQh8Hj1biVr/o5969hubRhV7DY5qL70KNrdJ1JoPLLwq6fireKoogM4wM31Pj
	 1KS2wCDg/MSdwgEBgBc+nWC7na0cNQKH/AdT0zKQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2D4FF805AB; Tue, 30 Jul 2024 11:27:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6140F805A8;
	Tue, 30 Jul 2024 11:27:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0756F802DB; Tue, 30 Jul 2024 11:21:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D9A4F800C9
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 11:19:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D9A4F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PQqdYVLI
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3685b3dbcdcso2273545f8f.3
        for <alsa-devel@alsa-project.org>;
 Tue, 30 Jul 2024 02:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722331153; x=1722935953;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S088lJjgnH/0TxsA8y/tDHIdAXTl0lFmJ+nczD1rhuw=;
        b=PQqdYVLIAPYvNkYQuo+p3UJVo9LNhtrGhf1BcVmSTzcHU6UhZZ/PlU9l94A+uiIY83
         j9AG79hGJPFZN72DCa4DyIPbArrIwswodgymKMKq3x4qjekxFgYSc1DtYC24TCbYlBVz
         PhEilhH3kUFK7NactFX8RLP5QUPK3diFQoD3yc2peDKPMMr93xD+dqb3bq0ZD249SCCu
         rGtrN3Jo1V8VvYt4HaFnMI5SbNUgRAivbDHjML/cvlw3nkazX6Wirc811dahl0Qpk8O+
         HevC6oRUGVEsSQChX9CasAVSoMm0XHkYqsLZp0VxDktGn1y3wFYUmjHlZlTGsI7orLIv
         LHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722331153; x=1722935953;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S088lJjgnH/0TxsA8y/tDHIdAXTl0lFmJ+nczD1rhuw=;
        b=Gsh4SCxeEJ/n0LPb21TNdyfQQSgkVmjXzpi4iwXgrbJ5L+we2SdXq3g72+1sfQTe7k
         6NvBlePiygzpPcc6FO3KUKn6I5BlkYNR22KeirxceJWBiawY9YafSxa07D5R56bcJibX
         McW7+KgOhvcTDvhZ5e7bm/h2uK2cTD8JbMUR4Idl05IEffZgSFgBbjS19UY4NBJYbOCM
         opTJXW9bkPivJckZdDQJIaA2c2h2FJbk0zhQUcohWGNmiMpB4vGEWmB9dxfTX+IpLvv/
         5vS/Le4z/qSe6sff6QSmzOR5yQm1j+stB+ZoRlhtM4DoYh+e8hzts3U7lfftPn29RT4U
         2PVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr4wXvnTypDwRYQ/XffbfXeqdPKJuxBUFKNlpsb0RX413404/HShIR6QgdgduLZkfRsiKKw8nxTE0Yiyt6XUdJkzQMPlohpXSpY6o=
X-Gm-Message-State: AOJu0YwX2ScjEZrNaXTamkVSuOhVpJ+EzbBP6JU1nK9fqwXgMmE7k6Rp
	1TRLjLGJWFfkiBPAtqUy/mBEKwl/nyoSui7dVr4O0T79wHHyfIVcesfHejN6Ml8=
X-Google-Smtp-Source: 
 AGHT+IHusXzEXHvix+kVwRU3G7ctA2PyD+/THo+fXxyQC0ZWkfD5ao7nBrcNtisZd1bxiL6LO8ElRw==
X-Received: by 2002:a5d:64a1:0:b0:36b:555a:e966 with SMTP id
 ffacd0b85a97d-36b5d2c9cfemr8890486f8f.35.1722331153322;
        Tue, 30 Jul 2024 02:19:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367c0338sm14380851f8f.1.2024.07.30.02.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 02:19:12 -0700 (PDT)
Message-ID: <7171817f-e8c6-4828-8423-0929644ff2df@linaro.org>
Date: Tue, 30 Jul 2024 11:19:11 +0200
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
 <22b20ad7-8a25-4cb2-a24e-d6841b219977@linaro.org>
 <dc66cd0d-6807-4613-89a8-296ce5dd2daf@linaro.org>
 <62280458-3e74-43b0-b9a1-84df09abd30e@linux.intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <62280458-3e74-43b0-b9a1-84df09abd30e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: INUFHMU2V2AKRBMBC2PJY3GY5SOX4VPY
X-Message-ID-Hash: INUFHMU2V2AKRBMBC2PJY3GY5SOX4VPY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/INUFHMU2V2AKRBMBC2PJY3GY5SOX4VPY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 30/07/2024 10:59, Pierre-Louis Bossart wrote:
>>>>
>>>> 	/* Read dpn properties for source port(s) */
>>>> 	sdw_slave_read_dpn(slave, prop->src_dpn_prop, nval,
>>>> 			   prop->source_ports, "source");
>>>>
>>>> IOW, this is a valid change, but it's an optimization, not a fix in the
>>>> usual sense of 'kernel oops otherwise'.
>>>>
>>>> Am I missing something?
>>>>
>>>> BTW, the notion of DPn is that n > 0. DP0 is a special case with
>>>> different properties, BIT(0) cannot be set for either of the sink/source
>>>> port bitmask.
>>>
>>> I think we speak about two different things. port num > 1, that's
>>> correct. But index for src_dpn_prop array is something different. Look
>>> at mipi-disco sdw_slave_read_dpn():
>>>
>>> 173         u32 bit, i = 0;
>>> ...
>>> 178         addr = ports;
>>> 179         /* valid ports are 1 to 14 so apply mask */
>>> 180         addr &= GENMASK(14, 1);
>>> 181
>>> 182         for_each_set_bit(bit, &addr, 32) {
>>> ...
>>> 186                 dpn[i].num = bit;
>>>
>>>
>>> so dpn[0..i] = 1..n
>>> where i is also the bit in the mask.
> 
> yes, agreed on the indexing.
> 
> But are we in agreement that the case of non-contiguous ports would not
> create any issues? the existing code is not efficient but it wouldn't
> crash, would it?
> 
> There are multiple cases of non-contiguous ports, I am not aware of any
> issues...
> 
> rt700-sdw.c:    prop->source_ports = 0x14; /* BITMAP: 00010100 */
> rt711-sdca-sdw.c:       prop->source_ports = 0x14; /* BITMAP: 00010100
> rt712-sdca-sdw.c:       prop->source_ports = BIT(8) | BIT(4);
> rt715-sdca-sdw.c:       prop->source_ports = 0x50;/* BITMAP: 01010000 */
> rt722-sdca-sdw.c:       prop->source_ports = BIT(6) | BIT(2); /* BITMAP:
> 01000100 */
> 
> same for sinks:
> 
> rt712-sdca-sdw.c:       prop->sink_ports = BIT(3) | BIT(1); /* BITMAP:
> 00001010 */
> rt722-sdca-sdw.c:       prop->sink_ports = BIT(3) | BIT(1); /* BITMAP:
> 00001010 */

All these work because they have separate source and sink dpn_prop
arrays. Separate arrays, separate number of ports, separate masks - all
this is good. Now going to my code...

> 
>>> Similar implementation was done in Qualcomm wsa and wcd codecs like:
>>> array indexed from 0:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/codecs/wcd938x-sdw.c?h=v6.11-rc1#n51
>>>
>>> genmask from 0, with a mistake:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/codecs/wcd938x-sdw.c?h=v6.11-rc1#n1255
>>>
>>> The mistake I corrected here:
>>> https://lore.kernel.org/all/20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org/
>>>
>>> To summarize, the mask does not denote port numbers (1...14) but indices
>>> of the dpn array which are from 0..whatever (usually -1 from port number).
>>>
>>
>> Let me also complete this with a real life example of my work in
>> progress. I want to use same dpn_prop array for sink and source ports
>> and use different masks. The code in progress is:
>>
>> https://git.codelinaro.org/krzysztof.kozlowski/linux/-/commit/ef709a0e8ab2498751305367e945df18d7a05c78#6f965d7b74e712a5cfcbc1cca407b85443a66bac_2147_2157
>>
>> Without this patch, I get -EINVAL from sdw_get_slave_dpn_prop():
>>   soundwire sdw-master-1-0: Program transport params failed: -2
> 
> Not following, sorry. The sink and source masks are separate on purpose,
> to allow for bi-directional ports. The SoundWire spec allows a port to
> be configured at run-time either as source or sink. In practice I've
> never seen this happen, all existing hardware relies on ports where the
> direction is hard-coded/fixed, but still we want to follow the spec.

The ports are indeed hard-coded/fixed.

> 
> So if ports can be either source or sink, I am not sure how the
> properties could be shared with a single array?

Because I could, just easier to code. :) Are you saying the code is not
correct? If I understand the concept of source/sink dpn port mask, it
should be correct. I have some array with source and sink ports. I pass
it to Soundwire with a mask saying which ports are source and which are
sink.

> 
> Those two lines aren't clear to me at all:
> 
> 	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
> 	pdev->prop.src_dpn_prop = wsa884x_sink_dpn_prop;

I could do: s/wsa884x_sink_dpn_prop/wsa884x_dpn_prop/ and expect the
code to be correct.

Best regards,
Krzysztof


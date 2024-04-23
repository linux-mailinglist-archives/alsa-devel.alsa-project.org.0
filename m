Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A9F8AE65E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 14:39:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74D0015FA;
	Tue, 23 Apr 2024 14:39:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74D0015FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713875964;
	bh=J/tw8yRBYo/0EgSy+tQkCdevIsk8fSb0kvRYZM3GDFs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C2hObD06xtf5Ghvjx7uHUa4xxyfUGxb1bD6u4IBDOUMtFNKJuuBEckufFhpMC5318
	 E0oDIl/GFuLVEzurpexGzbXFxUua587DgOcfsndQcpDXZeHBecb2ssgIv5oiOLBl/J
	 o4P8r2am/xZT+1A6ypbFn2fq5IDY2HorpeZ9L9OA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEA31F805AC; Tue, 23 Apr 2024 14:38:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D190F805A0;
	Tue, 23 Apr 2024 14:38:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FB41F80423; Tue, 23 Apr 2024 14:38:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EFCFF801C0
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 14:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EFCFF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Bpmx1pTK
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41a5b68ed85so12036465e9.1
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Apr 2024 05:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713875899; x=1714480699;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TIW/4kaIcgQ3dsiNOn7qNP3zsB635HzMYPtbd1p9/VE=;
        b=Bpmx1pTKDHchkO+BB9wtf/YSip3dCRr7PLwCCRCQbr67VjY5qq/z1GxXAG4kLg5j3m
         Qo+rDqZNRnU9Jis+MHK9WX6Jb1MeYiQMgFSSGZUW4+yFd/UTjr5HGV08yAkhqkERn8x8
         me4GJOUpERiaROZMl4fkv0iCKhEysWBntwNbKfkTEQlbjJ3FlL+633kmWWYINmESYGdU
         +Aldpz/zZ8d9FQBQw4JuMBrM5WAXAN8jU0sI2okGsHjsT75inJmbrlHNZczUtpYn4Yyn
         XEPub8Ax4EVlvbG3GsZeAFx+emoNs+QAhbdPEKP7veuI7oj9LE2Gnw32p7qoSan+KPUt
         nbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713875899; x=1714480699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TIW/4kaIcgQ3dsiNOn7qNP3zsB635HzMYPtbd1p9/VE=;
        b=J9r8dnt0UaHbnV16Glsjyfh4heG6EJYta4xaJfHbrOWVGXAu7xOuM++sbnt92zaprs
         6Xf7+xtBWfOF/yJvNjaNhTeCZxTRbQU1puFdX7Dw39wpj1fwwVPxkpKlonGuNFQ+FOvv
         NUgIrNIddeMcOClpwfnX45l8Sx5GYhHpsEhcA1uXb6OYwKaZRGAZJA0SJvB5xK0RLulm
         DCf95UICckcO2vjqgszWkpq8sRGq2cQTeEY7vzbhtfTDTbNPOasdCijiclNXy4V6eEHZ
         eyFt8JSfSge/CH+AGe0LU8K28hh6x4SaOTrccTNaIY1c2XMYmlIcYqmDITYXMsv7Hl4m
         Lnwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqcfeVnWlzBmdVRmwvx04ztvKGoiV+OxjlhvxbatJ6XHYwz9TxnhRGgNCUBKQ5iiKK8MAXXQOEiUmCeCMQDLDth62nXyZcVOSO5UM=
X-Gm-Message-State: AOJu0Yy+e8eI1J5/Lacofb8EF81lTk8zxkDyABuHD51bLq3IrS05KWAy
	p0w6OL5S4AIuA5doCTaDy50A1TOU8WUocrHMY6DWgyBD2/CTxAI3wi93xXKthXU=
X-Google-Smtp-Source: 
 AGHT+IHZPOUNNlHUfJ4UIDp40yrSx/o6yztNYiaRDe88l58PFdLYTv00xpM4C5Wj4nVQ3nuIAT5XVw==
X-Received: by 2002:a05:600c:3b9c:b0:418:7ec1:7bdb with SMTP id
 n28-20020a05600c3b9c00b004187ec17bdbmr1874101wms.5.1713875899466;
        Tue, 23 Apr 2024 05:38:19 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 s7-20020a05600c45c700b0041aa570bcd3sm3029800wmo.35.2024.04.23.05.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 05:38:18 -0700 (PDT)
Message-ID: <92b02fd3-5eba-42a7-a166-21b14724b10c@linaro.org>
Date: Tue, 23 Apr 2024 13:38:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] ASoC: qcom: display port changes
To: Johan Hovold <johan@kernel.org>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
 <ZieihZRKe7OtP-nV@hovoldconsulting.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <ZieihZRKe7OtP-nV@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AJ74ORT2CRLY4EVQOC3AUMAKC4UOQFET
X-Message-ID-Hash: AJ74ORT2CRLY4EVQOC3AUMAKC4UOQFET
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AJ74ORT2CRLY4EVQOC3AUMAKC4UOQFET/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 23/04/2024 12:59, Johan Hovold wrote:
> On Mon, Apr 22, 2024 at 02:43:50PM +0100, Srinivas Kandagatla wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> This patchset adds support for.
>> 	1. parse Display Port module tokens from ASoC topology
>> 	2. add support to DP/HDMI Jack events.
>> 	3. fixes a typo in function name in sm8250
>>
>> Verified these patches on X13s along with changes to tplg in
>> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
>> and ucm changes from https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
> 
> It looks like your UCM changes are still muxing the speaker and *each*
> displayport output so that you can only use one device at a time (i.e.
> only Speaker or DP1 or DP2 can be used).
that is true.

What is the use-case to use more than one audio sink devices at the same 
time for a laptops?

How do you test it? I never tested anything like that on a full desktop 
setup.

May be some manual setup in Wireplumber, but not 100% sure about 
multiple stream handling.

> 
> As we discussed off list last week, this seems unnecessarily limited and
> as far as I understood is mostly needed to work around some
> implementation details (not sure why DP1 and DP2 can't be used in
> parallel either).

It is absolutely possible to run all the streams in parallel from the 
Audio hardware and DSP point of view.

One thing to note is, On Qualcomm DP IP, we can not read/write registers 
if the DP port is not connected, which means that we can not send data 
in such cases.

This makes it challenging to work with sound-servers like pipewire or 
pulseaudio as they tend to send silence data at very early stages in the 
full system boot up, ignoring state of the Jack events.

> 
> Can you please describe the problem here so that we can discuss this
> before merging an unnecessarily restricted solution which may later be
> harder to change (e.g. as kernel, topology and ucm may again need to be
> updated in lock step).
> 
>  From what I could tell after a quick look, this series does not
> necessarily depend on muxing things this way, but please confirm that
> too.

These patches have nothing to do with how we model the muxing in UCM or 
in tplg.

so these can go as it is irrespective of how we want to model the DP 
sinks in the UCM or tplg.


--srini
> 
> Johan

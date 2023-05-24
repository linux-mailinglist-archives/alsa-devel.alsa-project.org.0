Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BE870F341
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 11:43:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FFA01E8;
	Wed, 24 May 2023 11:43:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FFA01E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684921434;
	bh=iwLpGvHrPRWXYYhcRln9e7g7XgUoM4cJdXRc2jUbpG0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fhH/Xt/DrWsNzv3HiCaJMG+A6tRh1ovClqimdJ+asUFiaAmO/6lPNQahNktbE5XOS
	 7VWTHm5ETXsp7zjFHjvK0JUwCbUeXr+oiHk22yoMrDeC4MfKfCVge4sL2/Uwpbb0t3
	 CmwEQ24eIyELfti5hSdcMvNW3Uh0ff/ZAvHj4W7Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33E0EF8024E; Wed, 24 May 2023 11:42:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29240F80249;
	Wed, 24 May 2023 11:42:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E675F8024E; Wed, 24 May 2023 11:42:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBBE9F8016A
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 11:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBBE9F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tbd5wy+z
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-30948709b3cso360496f8f.3
        for <alsa-devel@alsa-project.org>;
 Wed, 24 May 2023 02:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684921343; x=1687513343;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uquqzdaQrX19mRcDaISNYnvybT61v+KWR57K049I3LE=;
        b=tbd5wy+zY49KmvFoEOTGhwI2WTzhH/ZG4gdY0YXn0J7AOdR19LraPxtn2dqPjSxQeB
         cttppn4t0lhjRfAkzCCrcq0WUr5A/h6TuY9/Zh4DFLCKKACzshfQRClpz8NaeOPl8+0m
         ahH0OhDr5Fzkxh2oofpYDe4BL2e0abA1TVJPgsijUA2OP03c1TFmfkb9R74XpvAmXMfa
         BiDEi7lKfX9y5Urud29LjwHRJ4vfEoLqjiztM0SERfh8mOarXjC2G37GzI5TTft5bg7X
         x/4PYVGtOzk5SQ2tlFGpusKI4RuyaWt9D3LUllKMSKW2ygm0Pm4A4LdpnZH0C0IwXS1+
         4jqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684921343; x=1687513343;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uquqzdaQrX19mRcDaISNYnvybT61v+KWR57K049I3LE=;
        b=LJlSrO5NSG5ZdLcqa+1X4U3i0Ffe/dAJ7RaU/AOnWeYzh1cf9YaAllVR5R3mJQIKeg
         skMPltn3gqnUWVbi+zG80qlKAeB2Emje7oXHT/l0hy3iPb6NDi+uuG1CpK6GCRlF1D4v
         PinanCFSSs1P2Hqu3if5ncGMbo3cw2ijGVwuVP8hgR9atOT27PVWZOyfF8N/EJoVFVEd
         lzIWqLX6SlajjlDKHVHlxBBfdxPZAX/eIjdSbmLTD74cNfiDg64difrlMu90kK4Vtdk4
         ug3yR2rSPN616XBeOWT7iowHOCCc56khunQ4aiox9Yz7cjERmZaPHfVwmQyxGHYp3VeA
         oY8Q==
X-Gm-Message-State: AC+VfDzFDSs3RShnXtJdcw01JGAyjGflHhRp6KODnJaqYLFYurZyQgDI
	iYcfQdePvqZkdW67PjAYkCSPkQ==
X-Google-Smtp-Source: 
 ACHHUZ43MZZ5VeJjBY2a3hiOrD3vVjpcAeqRjxRgjQJAYQB8sz7zPSthTGL6T8eT1JMOWEOGzu5Xdg==
X-Received: by 2002:a5d:4650:0:b0:307:8e1b:6cc7 with SMTP id
 j16-20020a5d4650000000b003078e1b6cc7mr13307619wrs.67.1684921343466;
        Wed, 24 May 2023 02:42:23 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 f5-20020a5d4dc5000000b0030644bdefd8sm13900529wru.52.2023.05.24.02.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 02:42:22 -0700 (PDT)
Message-ID: <af7b7d4f-d7ab-b5ef-e639-9a8b13de54ee@linaro.org>
Date: Wed, 24 May 2023 10:42:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] ASoC: codecs: wsa883x: do not set can_multi_write
 flag
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org
References: <20230523154605.4284-1-srinivas.kandagatla@linaro.org>
 <00283665-e44f-457b-b2c9-1acf59d1cbd8@sirena.org.uk>
 <c37b88ae-7f54-3c07-666f-010a5fd84bd1@linaro.org>
 <d94e734c-e816-4b3f-9fb3-a6589063c05a@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <d94e734c-e816-4b3f-9fb3-a6589063c05a@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: X77CCQ3TER2CXVLIOBJLOUTZPZGHKRFM
X-Message-ID-Hash: X77CCQ3TER2CXVLIOBJLOUTZPZGHKRFM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X77CCQ3TER2CXVLIOBJLOUTZPZGHKRFM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 24/05/2023 09:57, Mark Brown wrote:
> On Wed, May 24, 2023 at 09:51:00AM +0100, Srinivas Kandagatla wrote:
>> On 23/05/2023 17:55, Mark Brown wrote:
> 
>>> Does the CODEC support mulitple writes?  If so it seems better to leave
> 
>> No, the codec itself does not support multi-write. All the codec register
>> level interface is via SoundWire Bus. which also does not support with the
>> existing code.
> 
> I'm unclear, is this a limitation of the hardware or of the current
> Soundwire code?

Its both.

Codec itself does not have any private write callback to support this 
and AFAIU Qualcomm Soundwire controller does not have any such hw 
facility to program multi-registers for device at one shot.


Also to note, the current state of code soundwire regmap write callback 
assumes that the request to write will always have base address at the 
start followed by register values. This is not true for multi-register 
writes which comes in address-value-padding pairs.


Am confused on the multi_write feature and looking at regmap bus level 
write callback.

Is write callback used for both Bulk writes and multi-writes?

Is multi-write feature of regmap bus or device?



--srini

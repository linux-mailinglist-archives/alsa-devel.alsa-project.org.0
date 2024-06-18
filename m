Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF6890C411
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 08:52:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D358D8;
	Tue, 18 Jun 2024 08:52:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D358D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718693564;
	bh=xKaJ6dKNtWZaK9H4e8mU6mP2R0VF0IsBskc+vUNlBKA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dnYx2mc9sqIVevuB5GWE9ya6/hRpVGdk2wcNAPZ1IEc6outaM8t02E21asW5e5vta
	 9u/qsjatHZMh3HjVfirNPFAYoIud8TxpdXcOPZnqWA++l0hrt39eq9O/IAHJpZXOCt
	 xjtoPtuPOdn3XwEv0hTuUHOxnAtsyS7PHjVlH/m0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D731F805AC; Tue, 18 Jun 2024 08:52:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B82FEF805AE;
	Tue, 18 Jun 2024 08:52:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B22C1F8023A; Tue, 18 Jun 2024 08:28:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1563F8016E
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 08:28:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1563F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xcUFTERg
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-421a1b834acso43345695e9.3
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jun 2024 23:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718692105; x=1719296905;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4c3+weL12K+KVxFEFQDkRTc7QlOq6MrqK1Le6NMexDo=;
        b=xcUFTERguO1pcmrFoFnMITiZj/bXTk9EYpN4VGwq3fuI33SfeoWMXjA0sX65Qzvf6y
         /icBYrR5JAO45otD3g0qo62obtEACzVfA0WFriVVMckU1wq3uPdsKMArDXyW2xWSTnym
         otTiPDSiJR/owkOXDoXwKG6RNVf8VnnFP7cMB64stHhqBV5wswWsfjVIO9kpiJS4vPm1
         pIZRFVVopifPN9zImAbmzkZPlNK+cRs+TFJUzmfMwV22oeYG7D2aJEAa+9C3f3T9B8f1
         yfTyvEMaoEKm08iKocnt5FuA+NRj8XFeS116+C/id5r1D4yHwpd1AmoLkDi3mMb6t2Ty
         uIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718692105; x=1719296905;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4c3+weL12K+KVxFEFQDkRTc7QlOq6MrqK1Le6NMexDo=;
        b=YMj+V7A9boPdKlUTtlFLUlH5v/YfNTEGrUInEZZSiHB/UTjIPdTYcGvVPVjvyGgV4Y
         PzseDTDI330WbcY8qTfnfexqkkkhlNojV+i4nwTkUI+jmMqr1empofEBlRTyFH1QjIBF
         oG0K5Dt8z1Ax8Kh6RVnu0f1bKLrkj+JAOv0p6dX8thbXyH5narGGr0e5phTbKLihkTD6
         dg9T20HOKPFrHE0ge8XOjFO1EtHH9/GhPiMlrxJAb6ybwewFalp6FN+NbImFc8Z+LKTh
         UtW9WY1QHiQV/Pk47mfI7RSONeRr+hfDvNZ5+EW6XioWmj/Dlu6dasAeu5bTvIE4flJJ
         djUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgWfa2e9OANnexjkTfFiH9lm3Ym+BcJViXeMy1ax3V5HtpJSGlYaylkKkMjRWwmMXruSqGNbMOHNYKthytQxbLW1JHauU622f+OUU=
X-Gm-Message-State: AOJu0YzMHDLjjxEjOmZUFdlY1MCWYpZ3vcTKI+dTX7Czo0uKY6tEHUxX
	Jo1EcbTLuzk/GWwYopGJ3hzRiI+adEJJLaILpFXjNI0Z7cjInGLToLvjI+WLGPA=
X-Google-Smtp-Source: 
 AGHT+IH3AuWbwGf+VeVP+mPpME7M931DgDcUY0XUjN04LZnV8GrFtGWyhjMHdwjzYfcVdFyVBpy+XQ==
X-Received: by 2002:a05:600c:1f8d:b0:421:7f4d:5240 with SMTP id
 5b1f17b1804b1-42304831c0emr84154825e9.24.1718692105131;
        Mon, 17 Jun 2024 23:28:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42286fe9263sm215207365e9.15.2024.06.17.23.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 23:28:24 -0700 (PDT)
Message-ID: <4c517744-87eb-49c0-a2b6-5cb4c7133829@linaro.org>
Date: Tue, 18 Jun 2024 08:28:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] ASoC: Few constifications (mostly arguments)
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org
References: 
 <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
 <c170d555-068a-4927-b997-df74cc88386f@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <c170d555-068a-4927-b997-df74cc88386f@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 63GOF46LOB4BSTTUWH6V5TJ6TLPMGGDA
X-Message-ID-Hash: 63GOF46LOB4BSTTUWH6V5TJ6TLPMGGDA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/63GOF46LOB4BSTTUWH6V5TJ6TLPMGGDA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17/06/2024 17:11, Mark Brown wrote:
> On Mon, Jun 17, 2024 at 03:03:18PM +0200, Krzysztof Kozlowski wrote:
>> Make few pointers in ASoC functions as pointers to const, so the code is
>> clearer to read, a bit safer and allows further constifications (e.g.
>> placing some data as rodata).
>>
>> Best regards,
>> Krzysztof
>>
>> ---
>> Krzysztof Kozlowski (6):
>>       ASoC: Constify of_phandle_args in snd_soc_dai_driver
>>       ASoC: Constify of_phandle_args in snd_soc_dai_link_component
>>       ASoC: Constify passed data to core function
>>       ASoC: Constify DAI passed to get_channel_map
>>       ASoC: Constify return of snd_soc_dai_get_pcm_stream()
>>       ALSA: Cleanup trailing white-spaces
> 
> Why is this random ALSA patch which seems off topic for the rest of the
> series mixed in here?

While checking all possible references around ASoC PCM, I apparently
ended up there and spotted things to improve. No dependencies, I should
sent it separately.

Best regards,
Krzysztof


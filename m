Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB278CE527
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2024 14:20:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4361B950;
	Fri, 24 May 2024 14:20:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4361B950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716553213;
	bh=Q0YYgomuZ7a/Ey+Ex03pRVCfua6lfh9KBm3qhFwLyAg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bR6y7pTFSaY/3MORk28h/lYSVicBxZfIgeu3yUddWeIJ34CTTo2QjlWALRs8XNTcw
	 fBUCBWNEzHaa3TvOa9vQdZQwWX+abyYcRjhA6IuRNja8xIJ1oDdiiuoowJzl+6NgH2
	 gkGfJce5DW52c1ECi3BeR8mD6njYrXn0JcYPL8po=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44C50F80697; Fri, 24 May 2024 14:18:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59DB4F80698;
	Fri, 24 May 2024 14:18:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A424CF8026A; Wed, 22 May 2024 18:20:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B6BFF8016B
	for <alsa-devel@alsa-project.org>; Wed, 22 May 2024 18:20:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B6BFF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KQ9j883D
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56e56ee8d5cso11798082a12.2
        for <alsa-devel@alsa-project.org>;
 Wed, 22 May 2024 09:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716394817; x=1716999617;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rAmYmReX6PJbiPANH3CQQN4HAh3/OEfTwrGvBy42nz0=;
        b=KQ9j883DL8DK+ZE94y8l1gbTOQPqaXXvapSjyPvXhn4YyD75OX6T1lnTpn0bmOevHL
         VMD/pCqp0mP84ZGlBBLsClO08+OJE6jZIdSMuConM0TFo2YU4UfnOQkWV/SMPFAyxFZM
         u5wCXZXROAGuVqJkfVhJCHNTB+WatHutHoDWH5O23ob/UCMuG8a61I+CJQaG3SD869oq
         UKBLcBL7luG3FW2+A0gZna+ONQ5i2w7nA5b6vthoo2/pTfhqb/aXgvGig0Mk/0PKDKmL
         kwn91qUJPAh/ASSTzLiVZgKHDO/ml/IM2AVYURrwF9nkM9877yEU0QEfPUlTuuODAYuk
         DG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716394817; x=1716999617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rAmYmReX6PJbiPANH3CQQN4HAh3/OEfTwrGvBy42nz0=;
        b=oYMeQYHyj84bXbA3+ulRConl7XvW74bL2hdIFh1gAqGRQO9hHH4ysvLv02ahzB5SfW
         hjLh+fyExuoV/L6iCfZSJin1tdOB0omwT7A5jqs7RG+00+s56Npu1IJxp9pmmfcnkcJu
         lmHKQFJWuX7zKxgFw99+AVvngBlECY2Qg/V0FsXHNhoPLUHv9DT7IyQQTu9Sxgi+yLMY
         twWzOhYr3eD31PAup5tK4mVGKqRIIEVCeVhqIgvEnD+X/lUH7hHr2WecCBqv+7xY9Oru
         Telu4c/vZGL9kYxOoel7IUx0n2f2z+pJO9ZjwA92YEL+eSf8VVvZsJGioWxRirY59ekL
         X2hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVITEqcOxGjRF3XKeUwzRSUdl1EYFCq03nTZ8hFKPAZnL24Xllwfe4XBEOk/lg40P1YU2cP4BXAPW4BUoV0ie4u8Zes7cGEFmp5jW0=
X-Gm-Message-State: AOJu0Yyt7cZscbwFIDN2jDx4pOMjuzIFYrQ8hGY8TBdy3qrl2uHsrM4i
	U6u+bjjCgOuIVJSgUEnbPxw73K5FmR/q4B/ZGGegDNGq54DViRym
X-Google-Smtp-Source: 
 AGHT+IHX16TQSndzssQgcqAzfbd1WNux9/z8SsMd1HxgJsKinbW/Bh1wbsuSCjyy29FD+JAs7+9gIQ==
X-Received: by 2002:a17:906:f80e:b0:a5c:f73d:67b3 with SMTP id
 a640c23a62f3a-a6228153fe5mr162987766b.63.1716394816651;
        Wed, 22 May 2024 09:20:16 -0700 (PDT)
Received: from [192.168.50.244] (83.8.125.62.ipv4.supernova.orange.pl.
 [83.8.125.62])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7dd4sm1798467266b.139.2024.05.22.09.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 09:20:16 -0700 (PDT)
Message-ID: <52428c0d-4b18-4707-9cda-4e6a11e256bc@gmail.com>
Date: Wed, 22 May 2024 18:20:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] ASoC: samsung: midas_wm1811: Add headset mic bias
 supply support
To: Mark Brown <broonie@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
 <20240519-midas-wm1811-gpio-jack-v3-3-0c1736144c0e@gmail.com>
 <1aed24a7-ab2a-4c2b-a3bc-2b907e091624@sirena.org.uk>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <1aed24a7-ab2a-4c2b-a3bc-2b907e091624@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DKYGRMDK3Q52MGCBESSE3S4OJ3BKRX7W
X-Message-ID-Hash: DKYGRMDK3Q52MGCBESSE3S4OJ3BKRX7W
X-Mailman-Approved-At: Fri, 24 May 2024 12:17:27 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DKYGRMDK3Q52MGCBESSE3S4OJ3BKRX7W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20.05.2024 16:35, Mark Brown wrote:
> On Sun, May 19, 2024 at 10:17:49AM +0200, Artur Weber wrote:
> 
>> +static int midas_headset_mic_bias(struct snd_soc_dapm_widget *w,
>> +			     struct snd_kcontrol *kcontrol, int event)
>> +{
>> +	struct snd_soc_card *card = w->dapm->card;
>> +	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
>> +
>> +	if (!priv->reg_headset_mic_bias)
>> +		return 0;
>> +
>> +	switch (event) {
>> +	case SND_SOC_DAPM_PRE_PMU:
>> +		return regulator_enable(priv->reg_headset_mic_bias);
>> +	case SND_SOC_DAPM_POST_PMD:
>> +		return regulator_disable(priv->reg_headset_mic_bias);
>> +	}
> 
> We have SND_SOC_DAPM_REGULATOR_SUPPLY?

This is pretty much copied from the implementation of the mic bias
and sub mic bias regulator handling in the same driver; they all use
SND_SOC_DAPM_MIC combined with an enable/disable function like this one.

What would be the correct thing to do here - add a secondary DAPM widget
of type REGULATOR_SUPPLY and connect it to the MIC widget via audio-
routing, or replace the entire MIC widget with a REGULATOR_SUPPLY (or
something else entirely)?
And should this be done with the Main Mic and Sub Mic as well?

Best regards
Artur

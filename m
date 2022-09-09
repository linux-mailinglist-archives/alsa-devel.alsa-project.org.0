Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 425BA5B3C0D
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 17:34:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97923168D;
	Fri,  9 Sep 2022 17:33:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97923168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662737655;
	bh=sfuvwpaoG6onrC3c9vr2pyaSnXLkvZu081aAbAzDylo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SVDA5AN+mlt61/xifuA6qMc9Jxt9vqizkGjkvW9ewtZ5PmulKigfct9YRdr68wkie
	 lWmgN/0ZISBbFCk54aYOMmAaPI/gFRSAr5QAKtKMJZoW7tfGlHy/4nKoR9KW6YRJeq
	 Zb+KlDgKze/50B8yNMLAonWPsxVFBFX4IQoaUQ6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F252CF8032B;
	Fri,  9 Sep 2022 17:33:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98068F8023A; Fri,  9 Sep 2022 17:33:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CB5DF8011C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 17:33:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CB5DF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="twITONxY"
Received: by mail-lj1-x235.google.com with SMTP id y29so2277669ljq.7
 for <alsa-devel@alsa-project.org>; Fri, 09 Sep 2022 08:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=lP9I9C231dArXcMlyocTl/qVE0j3Pv37aaLeqVQ7UZU=;
 b=twITONxYLgPP9PxkRf8UDAvKbnLUZmH56aq6q+qd7igqBv9W6NMmSitWjOGWFf4it3
 LCQhRxyuGz4oj/8i+t3bY/DBVlHmyqeJ0czsSq2tS1agOxqtYqcs5Ig3ltIpR6JSGpaG
 rAHgebTzPRAZdHLod8VnLOin5og/nVCVDoRaWHZDhDN7SxfzFnushm2QkPMUEdyI31pC
 gFoixmPBfD30PnD+gsGvzQ5X4e+hbsCfU3XyyEGO6r6UMEdTPcZ0IlKDhU6bF/gGWecW
 BD7jLpreMkNBMcqA7so5sDsOkQ2C+OoxBscwm81lyVy7/1FNFUJ+YfZu3FCexn4K2KWu
 VWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=lP9I9C231dArXcMlyocTl/qVE0j3Pv37aaLeqVQ7UZU=;
 b=RVXNBKMVCWlQ87TNoU0XwKK9I7ptGQgoRw+80ziHytJXeOK0fMGtS9Wzh3n3HxhP3e
 cY2SBeGa+bce5HrK9gx1YXJ1iBVd+mD/KaqxgGZ1C1L3ad/3i3nQTqcaEdXJKC9TEZsD
 4dqUZjhes7M8EEbf+PlvZj30TRbRI6AYeS7BdWxiv8kL4Iy29UYUozTP1LNehRbB9Gn3
 BLlBIIjtFE5nEOlfeujjZocGHaLxfnWnZl5I0HTNzSugcKWrbHeD4v0dh7HXYVX5hlMI
 G83VWiYzaRkMf18Xe/dGNNeMef/TVAuG+fxwcVBU1lPOoIwZ9Z3QaxWkVzEmO11/KXbm
 GGxw==
X-Gm-Message-State: ACgBeo2VE236X1pU4RlK9BQPW3z9jHb8tKBHTIHclT9EE4rHkA/mdhOZ
 e8yzh79aOpsuOh9XwNTlh4GWbg==
X-Google-Smtp-Source: AA6agR6CrTnN/jL30qM2oy1chzWlwWkFSKzElgaz5C6XKHdy3uLj5jrCJc6y5+wmuCf2/Doyz1zYhw==
X-Received: by 2002:a05:651c:511:b0:266:c941:67ca with SMTP id
 o17-20020a05651c051100b00266c94167camr3956347ljp.28.1662737588111; 
 Fri, 09 Sep 2022 08:33:08 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 u17-20020a2e8551000000b00261d6f45c2csm113367ljj.124.2022.09.09.08.33.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 08:33:07 -0700 (PDT)
Message-ID: <47eb92fc-f5ff-de82-aacd-91aa0fcc68cb@linaro.org>
Date: Fri, 9 Sep 2022 17:33:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 09/10] ASoC: cs42l83: Extend CS42L42 support to new part
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>
References: <20220909135334.98220-1-povik+lin@cutebit.org>
 <20220909135334.98220-10-povik+lin@cutebit.org>
 <541b11a1-6b5a-cae0-73d9-f1fe8c961a15@linaro.org>
 <822926B0-CF33-4FF0-B234-8EF644DCED21@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <822926B0-CF33-4FF0-B234-8EF644DCED21@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, devicetree@vger.kernel.org,
 - <patches@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, David Rhodes <david.rhodes@cirrus.com>,
 ChiYuan Huang <cy_huang@richtek.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 asahi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 James Schulman <james.schulman@cirrus.com>, Matt Flax <flatmax@flatmax.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 09/09/2022 17:10, Martin Povišer wrote:
>>> +};
>>> +MODULE_DEVICE_TABLE(of, cs42l83_of_match);
>>> +
>>> +static struct i2c_driver cs42l83_i2c_driver = {
>>> +	.driver = {
>>> +		.name = "cs42l83",
>>> +		.pm = &cs42l83_i2c_pm_ops,
>>> +		.of_match_table = of_match_ptr(cs42l83_of_match),
>>
>> This should complain with compile testing. Usually it comes with
>> __maybe_unused/
> 
> Which symbol? cs42l83_of_match has maybe_unused.
> 

Ah, I missed it completely. It's fine.


Best regards,
Krzysztof

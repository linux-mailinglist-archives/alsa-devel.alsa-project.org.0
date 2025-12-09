Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA09BCAF00A
	for <lists+alsa-devel@lfdr.de>; Tue, 09 Dec 2025 07:10:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F557601F1;
	Tue,  9 Dec 2025 07:10:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F557601F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765260651;
	bh=dvx5Kj6GjsQIgmbGMLZOiBl94WqVJBRgoTZ92Y5c8Y4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nhAKB96R2uAz3W1tOK07kWEZwbhKFXv2wfZ7cPkk3TBDdxysGvxO7S41Wv7ecXjgj
	 Xeei7wd+INUj5dUDnZ4Opx83jZ9Aiz7VE6E+bifOyyYTVIc45PzirNCs0aUxcNuWaE
	 8jCFW7R73O6vnVKOWOtY8Z6eM5GSSg/254+k6U+Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66C47F805D7; Tue,  9 Dec 2025 07:10:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1F1DF8028B;
	Tue,  9 Dec 2025 07:10:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B70AEF8028B; Tue,  9 Dec 2025 07:07:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E018DF800B8
	for <alsa-devel@alsa-project.org>; Tue,  9 Dec 2025 07:07:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E018DF800B8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lOG3hutS
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F292C40682;
	Tue,  9 Dec 2025 06:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96997C4CEF5;
	Tue,  9 Dec 2025 06:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765260462;
	bh=dvx5Kj6GjsQIgmbGMLZOiBl94WqVJBRgoTZ92Y5c8Y4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lOG3hutSOR4bsfptQAoA7NWEMwZbDv7XvtJls/Tvtj7ExgyXqhELLnWOcV/lHt8AG
	 CPCjSYk7wxJJRLlaV0D7ZFjjH9pl0gGDFnj//09xgdgGG2T0qRYP8w01nJy/4cUWU4
	 VvoNk6KcMm2tl9LrtAUMPag13ZhRY+s5M4Xa+cd/LFrejFd6DlkNJrxFvK8afxDCLU
	 WZUwhEgy3E7kbNH2QhLhrX2yXiigmGxs+zdHpXf+fPOh/j3gJEiC6v96pve9wdQ3sV
	 Pmcd/ZzWAovEsDpZGRgObwgJDIBV0BNK56W5rLEGfrqUrsYJaQCPqkYfrBWXEh48SW
	 ZMvoOl1LfwgEg==
Message-ID: <545e2353-c8f3-4e3b-82a6-92970a17b8d7@kernel.org>
Date: Tue, 9 Dec 2025 07:07:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] ASoC: rt5575: Add the codec driver for the ALC5575
To: Oder Chiou <oder_chiou@realtek.com>,
 "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: "perex@perex.cz" <perex@perex.cz>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "Flove(HsinFu)" <flove@realtek.com>, =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?=
 <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
References: <20251201105926.1714341-1-oder_chiou@realtek.com>
 <20251201105926.1714341-2-oder_chiou@realtek.com>
 <6c0639e2-dc59-4e0f-be42-224a98b37f75@kernel.org>
 <2202b463075f4219bffc636fbafb0684@realtek.com>
 <20065270-0d88-4463-9641-f92b4c9e4674@kernel.org>
 <4859e7819e264382be4b3b58cd348aa0@realtek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <4859e7819e264382be4b3b58cd348aa0@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SSOELUTGZOGDUPW76BC63PCTHYBTQQZS
X-Message-ID-Hash: SSOELUTGZOGDUPW76BC63PCTHYBTQQZS
X-MailFrom: krzk@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SSOELUTGZOGDUPW76BC63PCTHYBTQQZS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/12/2025 10:16, Oder Chiou wrote:
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Monday, December 8, 2025 4:02 PM
>> To: Oder Chiou <oder_chiou@realtek.com>; cezary.rojewski@intel.com;
>> broonie@kernel.org; lgirdwood@gmail.com; robh@kernel.org;
>> krzk+dt@kernel.org; conor+dt@kernel.org
>> Cc: perex@perex.cz; linux-sound@vger.kernel.org; devicetree@vger.kernel.org;
>> alsa-devel@alsa-project.org; Flove(HsinFu) <flove@realtek.com>; Shuming [范
>> 書銘] <shumingf@realtek.com>; Jack Yu <jack.yu@realtek.com>; Derek [方德
>> 義] <derek.fang@realtek.com>
>> Subject: Re: [PATCH v8 1/2] ASoC: rt5575: Add the codec driver for the
>> ALC5575
>>
>>
>> External mail : This email originated from outside the organization. Do not
>> reply, click links, or open attachments unless you recognize the sender and
>> know the content is safe.
>>
>>
>>
>> On 08/12/2025 08:29, Oder Chiou wrote:
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzk@kernel.org>
>>>> Sent: Monday, December 8, 2025 2:05 PM
>>>> To: Oder Chiou <oder_chiou@realtek.com>; cezary.rojewski@intel.com;
>>>> broonie@kernel.org; lgirdwood@gmail.com; robh@kernel.org;
>>>> krzk+dt@kernel.org; conor+dt@kernel.org
>>>> Cc: perex@perex.cz; linux-sound@vger.kernel.org;
>>>> devicetree@vger.kernel.org; alsa-devel@alsa-project.org;
>>>> Flove(HsinFu) <flove@realtek.com>; Shuming [范
>>>> 書銘] <shumingf@realtek.com>; Jack Yu <jack.yu@realtek.com>; Derek [方
>> 德
>>>> 義] <derek.fang@realtek.com>
>>>> Subject: Re: [PATCH v8 1/2] ASoC: rt5575: Add the codec driver for
>>>> the
>>>> ALC5575
>>>>
>>>>
>>>> External mail : This email originated from outside the organization.
>>>> Do not reply, click links, or open attachments unless you recognize
>>>> the sender and know the content is safe.
>>>>
>>>>
>>>>
>>>> On 01/12/2025 11:59, Oder Chiou wrote:
>>>>> +
>>>>> +static int rt5575_i2c_read(void *context, unsigned int reg,
>>>>> +unsigned int
>>>> *val)
>>>>> +{
>>>>> +     struct i2c_client *client = context;
>>>>> +     struct rt5575_priv *rt5575 = i2c_get_clientdata(client);
>>>>> +
>>>>> +     regmap_read(rt5575->dsp_regmap, reg | RT5575_DSP_MAPPING,
>>>> val);
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static int rt5575_i2c_write(void *context, unsigned int reg,
>>>>> +unsigned int val) {
>>>>> +     struct i2c_client *client = context;
>>>>> +     struct rt5575_priv *rt5575 = i2c_get_clientdata(client);
>>>>> +
>>>>> +     regmap_write(rt5575->dsp_regmap, reg | RT5575_DSP_MAPPING,
>>>> val);
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static const struct regmap_config rt5575_regmap = {
>>>>> +     .reg_bits = 16,
>>>>> +     .val_bits = 32,
>>>>> +     .reg_stride = 4,
>>>>> +     .max_register = 0xfffc,
>>>>> +     .readable_reg = rt5575_readable_register,
>>>>> +     .reg_read = rt5575_i2c_read,
>>>>> +     .reg_write = rt5575_i2c_write,
>>>>> +     .use_single_read = true,
>>>>> +     .use_single_write = true,
>>>>> +};
>>>>
>>>> OF device ID table goes around here - together with I2C.
>>> I will correct it.
>>>
>>>>> +
>>>>> +static const struct i2c_device_id rt5575_i2c_id[] = {
>>>>> +     { "rt5575" },
>>>>> +     { }
>>>>> +};
>>>>> +MODULE_DEVICE_TABLE(i2c, rt5575_i2c_id);
>>>>> +
>>>>> +static int rt5575_i2c_probe(struct i2c_client *i2c) {
>>>>> +     struct rt5575_priv *rt5575;
>>>>> +     struct device *dev = &i2c->dev;
>>>>> +     int ret, val;
>>>>> +
>>>>> +#if IS_ENABLED(CONFIG_SND_SOC_RT5575_SPI)
>>>>
>>>> No ifdefs in driver code.
>>>
>>> I am not understanding exactly.
>>> If the machine is without SPI interface and the codec with flash, the
>>> CONFIG_SND_SOC_RT5575_SPI can be disabled.
>>
>> But you still should not use #ifdef. Coding style gives you alternative, please
>> look at the doc.
>>
>>>
>>>>> +     if (!rt5575_spi && of_device_is_compatible(dev->of_node,
>>>> rt5575_of_match[1].compatible))
>>>>
>>>> No, use driver match data if ever, but this is just wrong. You said
>>>> it depends on SPI flash, not SPI interface.
>>>
>>> I will modify it to use the match data as following.
>>> static const struct of_device_id rt5575_of_match[] = {
>>>       { .compatible = "realtek,rt5575", .data = (void
>> *)RT5575_WITH_FLASH },
>>>       { .compatible = "realtek,rt5575-use-spi", .data = (void
>>> *)RT5575_WITHOUT_FLASH },
>>
>> What is still wrong is that why you defer probe if there is no flash. I really do
>> not get it...
> 
> If the codec has flash, the flash is connected to the codec's SPI host
> interface.
> 
> If the codec has no flash, the codec SPI driver should load the firmware
> from the codec's SPI slave interface. The I2C driver must wait until the
> SPI driver is ready to ensure the firmware is loaded correctly.
> 

Ah, so for that reason you created that singleton, exported it and you
wait for it? Singletons are pretty no-go anyway, how do you handle to
codecs in the system? Fragile design.

Best regards,
Krzysztof

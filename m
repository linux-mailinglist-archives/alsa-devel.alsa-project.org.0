Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 118517DBA20
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Oct 2023 13:48:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 694F6DF1;
	Mon, 30 Oct 2023 13:47:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 694F6DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698670088;
	bh=SMGRX2NvxTI+iCMJWe1EjLUo+4sOOdGlAurBMJQD49k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uEKFPfmT1bXFw2qKsHzqI0bgjLUPxHO9Npv3/pbVLdSpQ9B5J/CTMUBUF75PXvl1A
	 ChJGF/uBTqbYn/KEI8UFBu2dGCVUAuM7iMSz3ggB8ngSi8toG10CDpmsbR6v/9z0g2
	 IzoS01U5XqAJjekxbwkffS7NF/XPi1h+PvikYJqE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4A0DF80290; Mon, 30 Oct 2023 13:47:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BEC4F80166;
	Mon, 30 Oct 2023 13:47:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19A98F8016D; Mon, 30 Oct 2023 13:47:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F829F80152
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 13:46:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F829F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=puaKZTwh
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AE4DFCE1707;
	Mon, 30 Oct 2023 12:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29ADFC433C7;
	Mon, 30 Oct 2023 12:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698670009;
	bh=SMGRX2NvxTI+iCMJWe1EjLUo+4sOOdGlAurBMJQD49k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=puaKZTwhdbuDS1Pvgiz3T0YxP+unZ0PGGRaOsWTUq8ady6NFGA+IWri9GDEKZvMIz
	 eTqnnU1JW5AYvWA5o/mHU3PpqVJ2PzfqwL/IE8sV5AXlizILHodU/hdLlp/9nvLhUC
	 k23tPn4WT+WG7At4mlEg44MjBFNIZz/qI7P6NMlerP9ADMmRHMLtKfbeoX+egorwzu
	 71hhTXSV9sbWeHK5vek99gyKv3DEQ8jxwt3mKam75sgsWnlDyLwD3tMV4TbZyt1wUB
	 /+fgxCXmC7vnQnkQ82+llrOAm5jEmyBpzZRInuvNX5iIQ7QO+3CLvSpUNiC+qHZEFG
	 gUR/UkDdVYT0g==
Message-ID: <1d9b1c87-c3d6-45c4-9ebd-6545a5dd896b@kernel.org>
Date: Mon, 30 Oct 2023 13:46:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: Intel: avs: Add rt5514 machine board
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai
 <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@chromium.org>
References: <20231027110537.2103712-1-amadeuszx.slawinski@linux.intel.com>
 <20231027110537.2103712-2-amadeuszx.slawinski@linux.intel.com>
 <db8fb570-0532-45d2-b0dd-adfb8727f258@kernel.org>
 <f431a348-6e32-4e19-be56-1373f9e65aee@linux.intel.com>
 <4b6af85b-3d22-4f78-9db9-11cb463c0b2a@kernel.org>
 <087525de-588e-45f0-9d84-8d5bd83834ff@linux.intel.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <087525de-588e-45f0-9d84-8d5bd83834ff@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JXGHVOW2KO2NY2BOLMFIYHGDYF4HFJ7N
X-Message-ID-Hash: JXGHVOW2KO2NY2BOLMFIYHGDYF4HFJ7N
X-MailFrom: krzk@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JXGHVOW2KO2NY2BOLMFIYHGDYF4HFJ7N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 30/10/2023 13:15, Amadeusz Sławiński wrote:
>>>>> +static struct platform_driver avs_rt5514_driver = {
>>>>> +	.probe = avs_rt5514_probe,
>>>>> +	.driver = {
>>>>> +		.name = "avs_rt5514",
>>>>> +		.pm = &snd_soc_pm_ops,
>>>>> +	},
>>>>> +};
>>>>> +
>>>>> +module_platform_driver(avs_rt5514_driver);
>>>>> +
>>>>> +MODULE_LICENSE("GPL");
>>>>> +MODULE_ALIAS("platform:avs_rt5514");
>>>>
>>>> You should not need MODULE_ALIAS() in normal cases. If you need it,
>>>> usually it means your device ID table is wrong.
>>>>
>>>
>>> In theory yes, in practice it is a bit more complicated, as we use the
>>> driver alias in sound/soc/intel/avs/board_selection.c in
>>> snd_soc_acpi_mach and they should match.
>>>
>>> For example for rt286, there is:
>>> # modinfo
>>> /lib/modules/6.4.0-rc3+/kernel/sound/soc/intel/avs/boards/snd-soc-avs-rt286.ko
>>> | grep 286
>>> filename:
>>> /lib/modules/6.4.0-rc3+/kernel/sound/soc/intel/avs/boards/snd-soc-avs-rt286.ko
>>> alias:          platform:avs_rt286
>>> name:           snd_soc_avs_rt286
>>> as you can see platform_driver::driver::name is not matching the driver
>>> name.
>>>
>>> I've did quick test with removing alias and changing snd_soc_acpi_mach
>>> definition for one board and it didn't load.
>>
>> Sorry, but why do you talk about platform name? We talk about ID table!
>>
>>>
>>> Now that you pointed it out I also lean towards trying to remove
>>> MODULE_ALIAS() from board drivers, but it will probably require some
>>> more investigation if we really want to do it and implementing it properly.
>>
>> Ehm? We have been there. I've been dropping these useless aliases as
>> well. You miss DEVICE_TABLE and proper ID entries, not adding aliases.
>>
> 
> Ah, DEVICE_TABLE, that's what I was missing, so I just to confirm, 
> something like:
> 
> diff --git a/sound/soc/intel/avs/boards/rt274.c 
> b/sound/soc/intel/avs/boards/rt274.c
> index dd613aa15e80..659e10b1dcad 100644
> --- a/sound/soc/intel/avs/boards/rt274.c
> +++ b/sound/soc/intel/avs/boards/rt274.c
> @@ -257,6 +257,14 @@ static int avs_rt274_probe(struct platform_device 
> *pdev)
>          return devm_snd_soc_register_card(dev, card);
>   }
> 
> +static const struct platform_device_id avs_rt274_driver_ids[] = {
> +        {
> +                .name           = "avs_rt274",
> +        },
> +        {},
> +};
> +MODULE_DEVICE_TABLE(platform, avs_rt274_driver_ids);

Yes, this is the basic method of probing all devices and auto-loading
modules. I wrote at beginning that your ID table is wrong, but I was not
aware that it is missing completely.

Best regards,
Krzysztof


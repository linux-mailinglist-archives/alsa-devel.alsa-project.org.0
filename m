Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F3F7D9DB3
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 17:58:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6315DED;
	Fri, 27 Oct 2023 17:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6315DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698422335;
	bh=5aHvOf/tPDGqmnSNEmdIU3zX9wqQNMOGtumjnNW/4ho=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fljuwKa7kyi41tuNiI32QsPgio7MM6MTaUxcFIXbC/cjl9SdB9MzATCxZugbV8ppk
	 aCymEBz1mq1eKWaT868M9oLmICSXgi+kZ3jJZufdEtHKDfhfJo7p8ONW6/sCwNUXhK
	 PMzRe6t3JAX69YbiOAsB237AEUkTF4BFE6n89UK4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 585C5F80537; Fri, 27 Oct 2023 17:57:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7942EF80165;
	Fri, 27 Oct 2023 17:57:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3089AF8019B; Fri, 27 Oct 2023 17:57:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C5EFF8014B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 17:57:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C5EFF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gFHt6fdO
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 34656CE3DA7;
	Fri, 27 Oct 2023 15:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F7DC433C7;
	Fri, 27 Oct 2023 15:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698422253;
	bh=5aHvOf/tPDGqmnSNEmdIU3zX9wqQNMOGtumjnNW/4ho=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gFHt6fdOWWMG2TsxZ3ZP6RfUP+obHXohj5L35F+DACm6plNeJUbrW5WWhtr2vcWb/
	 Bo81e6lCaBK64uOYIDNNqPRZJ8vSiNrOmKuneRymRqYg6kZID32g5qRdiwj1r2jNit
	 RlJkYSHIGfc+4kHqbCJXBQ24B8A4I9WImOgIoObpEEGeBe3hP8G8sUNB8tSTQ7/9HG
	 7w4XIhIQLa2RwQDGKApwMng72Q6ufhRzAiX5t8EBEt6NaAE+4bbTdgu3d0c1SCDvy4
	 2enM6cMM/iaRjS5L5NS4TKB7Zb+A94kOxukyvLIrdSqLJwQf4lWTMFxypxk9dY7GpT
	 ehIqH3WGbHGcw==
Message-ID: <db468c1c-fec9-46e7-b01f-413b539664fa@kernel.org>
Date: Fri, 27 Oct 2023 17:57:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] ASoC: amd: acp: add machine driver support for pdm
 use case
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 arungopal.kondaveeti@amd.com, mastan.katragadda@amd.com,
 juan.martinez@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Marian Postevca <posteuca@mutex.one>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Gaosheng Cui <cuigaosheng1@huawei.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20231021145110.478744-1-Syed.SabaKareem@amd.com>
 <20231021145110.478744-9-Syed.SabaKareem@amd.com>
 <4d5a4c67-2f4b-4111-b98b-ef575543fa6e@kernel.org>
 <3ec97548-1f91-49d0-adfb-4f8051ca9a97@amd.com>
 <f8f8017c-4e76-4d70-918f-d7cb45186184@kernel.org>
 <c0ea139c-9861-4ea1-b547-6e3c380301b3@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <c0ea139c-9861-4ea1-b547-6e3c380301b3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2A2QCCKGDPIYJZH6COIFYATXPJ253ENS
X-Message-ID-Hash: 2A2QCCKGDPIYJZH6COIFYATXPJ253ENS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2A2QCCKGDPIYJZH6COIFYATXPJ253ENS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27/10/2023 17:54, Mario Limonciello wrote:
> On 10/27/2023 10:51, Krzysztof Kozlowski wrote:
>> On 27/10/2023 17:28, Mario Limonciello wrote:
>>> On 10/27/2023 03:49, Krzysztof Kozlowski wrote:
>>>> On 21/10/2023 16:50, Syed Saba Kareem wrote:
>>>>> add pdm use case machine driver support
>>>>>
>>>>> Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
>>>>> ---
>>>>
>>>>
>>>>>    	dmi_id = dmi_first_match(acp_quirk_table);
>>>>>    	if (dmi_id && dmi_id->driver_data)
>>>>> @@ -214,6 +221,10 @@ static const struct platform_device_id board_ids[] = {
>>>>>    		.name = "rmb-rt5682s-rt1019",
>>>>>    		.driver_data = (kernel_ulong_t)&rt5682s_rt1019_rmb_data,
>>>>>    	},
>>>>> +	{
>>>>> +		.name = "acp-pdm-mach",
>>>>> +		.driver_data = (kernel_ulong_t)&acp_dmic_data,
>>>>> +	},
>>>>>    	{ }
>>>>>    };
>>>>>    static struct platform_driver acp_asoc_audio = {
>>>>> @@ -235,4 +246,5 @@ MODULE_ALIAS("platform:acp3xalc5682s1019");
>>>>>    MODULE_ALIAS("platform:acp3x-es83xx");
>>>>>    MODULE_ALIAS("platform:rmb-nau8825-max");
>>>>>    MODULE_ALIAS("platform:rmb-rt5682s-rt1019");
>>>>> +MODULE_ALIAS("platform:acp-pdm-mach");
>>>>
>>>> Please stop growing the aliases. Module alias is not a substitute for
>>>> missing MODULE_DEVICE_TABLE.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>>
>>> I thought the way that this works is that top level ACP driver (IE
>>> acp-pci.c) will have MODULE_DEVICE_TABLE.  This is how that module gets
>>> loaded.
>>>
>>> Then it creates platform devices based on the detected needs for the
>>> situation and the creation of those platform devices triggers a uevent
>>> which due to MODULE_ALIAS will get appropriate other platform drivers
>>> like this one loaded.
>>
>> And why you cannot use MODULE_DEVICE_TABLE here? IOW, why do you need to
>> manually duplicate entire table and re-invent MODULE_DEVICE_TABLE with
>> MODULE_ALIAS?
> 
> What would actually go into MODULE_DEVICE_TABLE?

The table you have few lines above aliases.

> 
> The platform devices created are contingent upon what was found during 
> the top level ACP driver probe.  You don't want all the "child" platform 
> drivers to load unless they're needed.

How static alias differs here from static device ID table? Both are
built into the module and always there. I don't even understand what
does it mean by "loading child platform drivers". Why would unneeded
driver be loaded?

Best regards,
Krzysztof


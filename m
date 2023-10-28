Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D11D97DA612
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Oct 2023 11:15:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10F12AE8;
	Sat, 28 Oct 2023 11:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10F12AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698484515;
	bh=x3+XeerKXC1QYo+48ZmmukiyMroE2wqwCTAK/8GxCMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OV9BIbwebpkoZ3pB+ITka3566F8E8TpSGajRYlPHodlPYboc+hOVelkVsvxpoiQiF
	 rpvB0icVlVGl0he6X4wonYllBVcM0B6v8P/NDE7Vgiaw5rNaxlpUzmXlNxvaX8itQ/
	 YINJMscNuzmufBEA9Ll86VFCWX0wNmANE5kFUgOY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88A0FF80558; Sat, 28 Oct 2023 11:14:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CCB3F80165;
	Sat, 28 Oct 2023 11:14:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7135F8019B; Sat, 28 Oct 2023 11:14:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94F67F80152
	for <alsa-devel@alsa-project.org>; Sat, 28 Oct 2023 11:14:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94F67F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GFAUtHdY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2FA80B81625;
	Sat, 28 Oct 2023 09:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14347C433C8;
	Sat, 28 Oct 2023 09:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698484453;
	bh=x3+XeerKXC1QYo+48ZmmukiyMroE2wqwCTAK/8GxCMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GFAUtHdY0P6pdWUbQ+fD26QW1py6tjIXWVZLvuPA0opTjD0MnjYoLucK9kODr6nk9
	 iJa+8k5qa0z6dxAA8XPhiT65tF0HHxgamdvh1wkDos01Ol5yEzK0f4Lem2a2QXmLdh
	 YqJElx1SKaXZ1//NgYI9zSZb0wtx6Z6FuVgdKijBUeFTAU9QzTwXLCcGKt7xwm78uZ
	 5vwh8Cqgeudn+wz2Wwy7Dna/YvTGb+/JnNjazce12LcJi0k1sMJgXP0f6pK7DMmi9m
	 lscavt2AqEz3GPADK3O1hbscNNuxVrmUBZ3KfEJnfyXGgtMOmUJH7nPzJ7UEHiiUin
	 1u2Uh1hfihkhw==
Message-ID: <8d2d61b1-a273-4a7b-815b-9611a9823145@kernel.org>
Date: Sat, 28 Oct 2023 11:14:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] ASoC: amd: acp: add machine driver support for pdm
 use case
Content-Language: en-US
To: syed saba kareem <ssabakar@amd.com>, Mark Brown <broonie@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Syed Saba Kareem <Syed.SabaKareem@amd.com>, alsa-devel@alsa-project.org,
 Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
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
 <ZTvkCAYsrS62/82u@finisterre.sirena.org.uk>
 <1f2943e2-f1f0-449d-a1f2-937bae6a0af9@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <1f2943e2-f1f0-449d-a1f2-937bae6a0af9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: IWHFIOGMFAKHNPDOAAWTJ3SKMND6V226
X-Message-ID-Hash: IWHFIOGMFAKHNPDOAAWTJ3SKMND6V226
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IWHFIOGMFAKHNPDOAAWTJ3SKMND6V226/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27/10/2023 19:32, syed saba kareem wrote:
> 
> On 10/27/23 21:53, Mark Brown wrote:
>> On Fri, Oct 27, 2023 at 10:54:47AM -0500, Mario Limonciello wrote:
>>
>>> What would actually go into MODULE_DEVICE_TABLE?
>>> The platform devices created are contingent upon what was found during the
>>> top level ACP driver probe.  You don't want all the "child" platform drivers
>>> to load unless they're needed.
>> You want
>>
>> 	MODULE_DEVICE_TABLE(platform, board_ids);
>>
>> which is effectively the same as all the MODULE_ALIAS items you have
>> there (which can be removed).
> 
> @krzk:as Mark Brown explained we can use platform device id table
> 
> instead of MODULE_ALIAS. As effectively there is no difference between
> 
> using platform device id table and MODULE_ALIAS.

There is a difference. MODULE_DEVICE_TABLE solves the problem and you do
not need to spread aliases all over. This code is not equivalent. What's
more, DEVICE_TABLE could be used for other purposes like dependency
detection or ordering or whatever. ALIAS not.

> 
> If you are still expecting us to use platform id table instead of 
> MODULE_ALIAS

Yes, I asked this first time.

> 
> we will provide the changes as an incremental patch.

Fix existing driver before adding new aliases. Then don't add ALIAS, how
I asked already two times before.

Best regards,
Krzysztof


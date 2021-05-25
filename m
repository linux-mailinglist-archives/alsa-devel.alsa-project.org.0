Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 138C3390699
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 18:26:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9549E1767;
	Tue, 25 May 2021 18:25:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9549E1767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621959976;
	bh=wJ6P14BSf28gEteq3TlqF++vo5VP0fXaRoNEIJlz1xI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KiTUV3Cl7ae2dwH5wQcNC/Ayd3OSZ3WWLKCWaW8f7nNuhQLjO7cL7PFbWfcUioNSf
	 OZaNExtd3VXxLQg8xd4TDJjhOZ8nSrXzHe8ww2zTT7anNOPT/rrdOAZPUGuGXBB+E9
	 lNVABwGQ4Ab82TvkD0s5x7Oilw4vbt7gZUJnykbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D771F800B6;
	Tue, 25 May 2021 18:24:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08C9CF800B6; Tue, 25 May 2021 18:24:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BEB7F800B6
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 18:24:40 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id AB630A0042;
 Tue, 25 May 2021 18:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz AB630A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1621959879; bh=5vd1CosdGZ1x0kCQ03wCTU9ikNz4E8e+MwaijpSD2AU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=U+4Cziiuz2bRm/D2OIanNWyLaonXS/fppqUXq/nDrPNOJy+PZh76rC/R5gxCZ6Qam
 cgc3U5f8cLGD+9p4nkvPlVp0lOHsA6wkNQDNmv7M2AN21eMz/x449mQOO/rRoPf4mJ
 ySKj4Db3H8iQM1q8nvXWqvB0czYnpIkrUlIBKI5w=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 25 May 2021 18:24:28 +0200 (CEST)
Subject: Re: [PATCH v3 4/4] ASoC: tegra: Specify components string for Nexus 7
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Ion Agorria <ion@agorria.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>
References: <20210523234437.25077-1-digetx@gmail.com>
 <20210523234437.25077-5-digetx@gmail.com>
 <ec2098e0-7918-8488-cf7c-a07e5aa6908c@perex.cz>
 <99ef3d77-c626-c632-bbd2-92eb15acad20@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <bc99da2b-1eb2-8f73-9e92-184cf172ef6f@perex.cz>
Date: Tue, 25 May 2021 18:24:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <99ef3d77-c626-c632-bbd2-92eb15acad20@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On 24. 05. 21 16:00, Dmitry Osipenko wrote:
> 24.05.2021 13:54, Jaroslav Kysela пишет:
>> Dne 24. 05. 21 v 1:44 Dmitry Osipenko napsal(a):
>>> Specify components string for Nexus 7 using the Intel BayTrail components
>>> format. This may allow us to create a more generic UCM for RT5640 codec.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  sound/soc/tegra/tegra_asoc_machine.c | 19 +++++++++++++++++++
>>>  1 file changed, 19 insertions(+)
>>>
>>> diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
>>> index a81f2ebfc00c..87e0a47040a5 100644
>>> --- a/sound/soc/tegra/tegra_asoc_machine.c
>>> +++ b/sound/soc/tegra/tegra_asoc_machine.c
>>> @@ -671,6 +671,24 @@ static const struct tegra_asoc_data tegra_rt5640_data = {
>>>  	.add_hp_jack = true,
>>>  };
>>>  
>>> +/*
>>> + * Speaker: Connected to SPO L/R P/N pins, stereo.
>>> + * Internal Microphone: Digital, connected to DMIC1_DAT IN2P/N pins.
>>> + * Headphones: Connected to HPOL/R pins.
>>> + * Headset Microphone: Unconnected.
>>> + *
>>> + * IF2_DAC/ADC are unpopulated.
>>> + */
>>> +static const struct tegra_asoc_data tegra_rt5640_grouper_data = {
>>> +	.components = "codec:rt5640 cfg-spk:2 cfg-mic:dmic1 aif:1",
>>
>> Perhaps, it may be better to handle this string via the DT config (create new
>> function like snd_soc_of_parse_card_name()).
>>
>> The "codec:rt5640" should be set in the driver (it's fixed), but the
>> "cfg-spk:2 cfg-mic:dmic1 aif:1" part is suitable for the DT config.
> 
> Not sure that this is possible. The DT is an ABI, while components
> string has no specification. Any changes to the components string will
> require DT update.
> 
> I think it's much more feasible to have a database of components within
> kernel driver, like Intel sound driver does it for ACPI devices.

There is no other possibility for ACPI. And while the components string is
part of the ALSA ABI, it should not be changed in an incompatible way. Only
new information should be added. The DT solution seems more flexible to me.
For example the stereo/mono speaker or the AIF number can be set without the
driver modification for rt5640.

					Jaroslav


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA3935A3C6
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 18:44:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEA9B1692;
	Fri,  9 Apr 2021 18:43:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEA9B1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617986688;
	bh=BiOXH+g+20Fe3qNQAXy9jNWfYHV7Z2sps/Kvlg6ZFXk=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f0Hvmj0n1NcgAin2pnI51s2JPIbpATs9u14+l2IIK2YNTnzOIyEvPw+cyLvwVbavG
	 CGTnwPgGDh8Mg29YuuHKYMs+T72DpV/jjdv2GhWQBhH5w0Zln22kYGTzJBZ4Qu9Yzz
	 fSzz5b8+qkXhvcAPLdgV9/ditgRUCgh2Vf9qmkxo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ED8AF800EE;
	Fri,  9 Apr 2021 18:43:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DC31F8016A; Fri,  9 Apr 2021 18:43:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03AA3F800EE
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 18:43:10 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id EA0BBA003F;
 Fri,  9 Apr 2021 18:43:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz EA0BBA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1617986590; bh=6NTB7IQRuMyk8sMUyGAiLT0U+o9x2tik8NXAYAr+NtE=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=oTWXlICPeHB3DszVZOFwddgFcd2IxXfutGXAoWWtIRTWANB9hMMeP1OucCCn7B2Kt
 UjHjq26V576KwnnxNC1tuTxviqyHcq1SgwNYiL71lHC00NaIwjYuT3C7acyOFdkV4M
 rvaV0x9CfSrKhhPR+Uwv+uvC+R9CTg3oXuGV3sew=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  9 Apr 2021 18:43:03 +0200 (CEST)
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
From: Jaroslav Kysela <perex@perex.cz>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Curtis Malainey <cujomalainey@chromium.org>
References: <20210408094314.1322802-1-perex@perex.cz>
 <20210408103819.GA40407@workstation> <s5h35w182a5.wl-tiwai@suse.de>
 <45acc908-3603-3479-9fb2-5206339a9ace@perex.cz>
 <20210408120502.GA4516@sirena.org.uk> <s5hpmz47w3i.wl-tiwai@suse.de>
 <56c874ae-e801-63df-19fa-a1325f6104ca@perex.cz>
 <3107db1d-f97d-539a-05db-6f880b762f00@linux.intel.com>
 <3b33595e-777c-90b2-6d65-346c9bf6e003@perex.cz>
 <b0258a67-79ca-50cd-e6c5-74514ba8a3c5@linux.intel.com>
 <73f65944-604e-1ca0-5ba3-dcbec0d9fcd7@perex.cz>
 <a8fa564f-4ab5-9847-d041-6c851e48acb4@linux.intel.com>
 <58aaed5e-9752-fe2a-f9ab-27842e0ffd5b@perex.cz>
Message-ID: <e37e4a43-9dc1-d9c8-f60a-8d8afccbbb3c@perex.cz>
Date: Fri, 9 Apr 2021 18:43:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <58aaed5e-9752-fe2a-f9ab-27842e0ffd5b@perex.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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

Dne 08. 04. 21 v 22:01 Jaroslav Kysela napsal(a):
> Dne 08. 04. 21 v 21:41 Pierre-Louis Bossart napsal(a):
>>
>>
>>
>>>>> Yes, I'm talking about rules which depends on the sound driver specific sysfs
>>>>> attributes (you can match the modified /sys/module/*/parameters here).
>>>>
>>>> you lost me with 'match the modified parameters' wording. who matches
>>>> and who modifies those parameters?
>>>
>>> You can probably add something like this to the sound-card.rules:
>>>
>>> SUBSYSTEMS=="pci",ATTR{device/driver/module}=="snd_soc_sof_sdw",
>>>    ATTR{device/driver/module/../snd_sof_pci/parameters/tplg_path}=="intel/sof-tplg/pdm1",
>>>    DO_SOMETHING_HERE
>>>
>>> DO_SOMETHING_HERE may be ATTR{longname}="My Long Name" for example when my change is accepted.
>>
>> Humm, not sure this can work due to dependencies.
>>
>> The machine device is neither an ACPI nor PCI one. It's a platform device.
>>
>> When the PCI device is detected, the PCI core will call the SOF driver 
>> probe, which will first try and boot the firmware, and then create the 
>> platform device. That results in the probe of the machine driver which 
>> creates the card, but that happens *after* booting the firmware.
>>
>> the DSP firmware is setup starting here:
>>
>> https://elixir.bootlin.com/linux/latest/source/sound/soc/sof/core.c#L138
>>
>> and the machine device is created almost last, after registering the 
>> ASoC components.
>>
>> https://elixir.bootlin.com/linux/latest/source/sound/soc/sof/core.c#L234
>>
>> when the card is created, it's too late to change the firmware path or 
>> any firmware-related parameters.
> 
> I just tried to describe the possible 2nd stage - modify the sysfs attributes
> when the card with the modified firmware is created (all modules are loaded
> and initialized). The 1st stage like from Curtis must be retained. It ensures
> to load the right fw.
> 
> SYSTEMS=="pci" checks also parents and card0 links to pci device: card0 ->
> ../../devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0 . You can modify
> this matching anyway - the goal is to run commands for the specific driver and
> module parameters when the card is loaded (avoid to change the card attributes
> for other hw).
> 
> I'm not an udev expert, so there may be a bug in my suggestion. I also think
> that the filter may be specified more elegantly (probably using the DRIVER
> match or so).

Another way to use two rules - use internal udev device environment variable
(it seems more straight):

PCI detection level:

SUBSYSTEM=="pci", ATTR{vendor}=="0x8086", ATTR{device}=="0xa0c8",
ATTR{class}=="0x040100",ATTRS{[dmi/id]board_name}=="Eldrid",
ENV{SOUND_SOF_PROFILE}="MyProfile",...module stuff...

Card instance level (sound-card.rules):

SUBSYSTEMS=="pci",ENV{SOUND_SOF_PROFILE}=="MyProfile",...attr setup...

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

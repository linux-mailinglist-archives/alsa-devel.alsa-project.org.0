Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D625358D79
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 21:27:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02D8B1669;
	Thu,  8 Apr 2021 21:26:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02D8B1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617910063;
	bh=/HWTxPTCgGlAK2hcXDLKz23VoOl2tNGFLWgkUoN1wEE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kig3SBp9FIDHJtdAw/FAs0OWAIYfJtFdFej+9cmJHkr8ei1VfFCDOtrN8wXaYBNL1
	 pJIDP/eQLt5DRDiwZyeBSSmuUpurQ3IKdkeYckOGkzjDrxis9c4RhsoRBxwTLS4SXd
	 QqXgRgBZgklnZOu09U5cXsGJlvstmvYK/Wg9MJv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 545F1F80246;
	Thu,  8 Apr 2021 21:26:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8D76F8020B; Thu,  8 Apr 2021 21:26:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7115DF800BD
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 21:26:02 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 19A21A003F;
 Thu,  8 Apr 2021 21:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 19A21A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1617909962; bh=+FrFhh6dvCqCFrRf0RWTdiQ9bSZE5KEjROE6UPItwXM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VynC7wIzhZdsX2U/RyQ69RPzblC2T4D3dG8An7/nPGp/tJjIzm7MNAycQeZFOM9ME
 GW3quH1m4adJinNxwarnCdLWjElcvCdWJlaBfFlEn8Pg7ECfNrpcWhG1Tnh3iTrk2Y
 JwSfS7mofPT9Y1iKBHXbHXeDet+9G9zHYpJs1vLk=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu,  8 Apr 2021 21:25:56 +0200 (CEST)
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20210408094314.1322802-1-perex@perex.cz>
 <20210408103819.GA40407@workstation> <s5h35w182a5.wl-tiwai@suse.de>
 <45acc908-3603-3479-9fb2-5206339a9ace@perex.cz>
 <20210408120502.GA4516@sirena.org.uk> <s5hpmz47w3i.wl-tiwai@suse.de>
 <56c874ae-e801-63df-19fa-a1325f6104ca@perex.cz>
 <3107db1d-f97d-539a-05db-6f880b762f00@linux.intel.com>
 <3b33595e-777c-90b2-6d65-346c9bf6e003@perex.cz>
 <b0258a67-79ca-50cd-e6c5-74514ba8a3c5@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <73f65944-604e-1ca0-5ba3-dcbec0d9fcd7@perex.cz>
Date: Thu, 8 Apr 2021 21:25:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <b0258a67-79ca-50cd-e6c5-74514ba8a3c5@linux.intel.com>
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

Dne 08. 04. 21 v 20:51 Pierre-Louis Bossart napsal(a):
> 
> 
>>>> When we have a common standard layer for the plug-and-play handling (udev), we
>>>> should concentrate to allow changing / refining of this information there.
>>>> Those strings are not used for anything else than the user space. So from my
>>>> view, there's no reason to create another mechanism to handle the overrides.
>>>> It should be a safe, fast, flexible and_optional_  solution. The udev can
>>>> alter the sysfs attributes directly without any hassle with the file
>>>> modifications or looking for another way to pass / store this information
>>>> somewhere.
>>>
>>> There's one part where I am lost.
>>>
>>> The initial idea of udev what to modify kernel parameters to pick a
>>> different path for firmware/topology before probing the PCI driver. At
>>
>> This may be a problematic point. The kernel cmdline cannot be modified from
>> udev (as far as I know). The module parameters can be set using modprobe's
>> config files or when loaded with sysfs attributes (/sys/module/*/parameters).
>> Eventually, you can call the modprobe command with custom module parameters
>> when the appropriate MODALIAS is probed.
>>
>> Perhaps, I'm missing something here, too. Some example udev rules may help.
> 
> see the example shared by Curtis
> 
> SUBSYSTEM=="pci", ATTR{vendor}=="0x8086", ATTR{device}=="0xa0c8", 
> ATTR{class}=="0x040100", ATTRS{[dmi/id]board_name}=="Eldrid", 
> RUN+="/sbin/modprobe snd_sof_pci tplg_path=intel/sof-tplg/pdm1"
> 
> Those 'path' parameters would have to be set prior to creating the card, 
> making them writable via sysfs would not work, the firmware and topology 
> are already loaded and changing the paths would have no effect.

Yes, it's something what I suggested. It's own modprobe call which modifies the module parameters.

>>> that point there is no card and no sysfs attributes just yet, they will
>>> be added at a later point during the probe itself.
>>>
>>> So are we talking about a second set of rules that would be applied when
>>> the card is created?
>>
>> Yes, I'm talking about rules which depends on the sound driver specific sysfs
>> attributes (you can match the modified /sys/module/*/parameters here).
> 
> you lost me with 'match the modified parameters' wording. who matches 
> and who modifies those parameters?

You can probably add something like this to the sound-card.rules:

SUBSYSTEMS=="pci",ATTR{device/driver/module}=="snd_soc_sof_sdw",
  ATTR{device/driver/module/../snd_sof_pci/parameters/tplg_path}=="intel/sof-tplg/pdm1",
  DO_SOMETHING_HERE

DO_SOMETHING_HERE may be ATTR{longname}="My Long Name" for example when my change is accepted.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

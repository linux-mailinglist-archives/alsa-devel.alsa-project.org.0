Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A673597FC
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 10:35:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91D0211C;
	Fri,  9 Apr 2021 10:35:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91D0211C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617957355;
	bh=Fj7CYm6bnnoKcEhSe9SH3oiT57c9lKg1z2owp7kHeww=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sFptdE398W6uBdQIOBSP1bPE0mKbq0c1DQw/s6l5v8LBzvKhlsRBfj8aRu5jenLF7
	 3zp52xPtEK6k0VufNp9Jhh6Jhox05vp6gcBSqBhS+Ls3QBJZM566oG6skTVQ2HBq6R
	 3ayqZguc7RoA7pCAoclcHqnzKzd2fX/H1PZf2MI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1628F8016D;
	Fri,  9 Apr 2021 10:34:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CDCFF8016A; Fri,  9 Apr 2021 10:34:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C316F800EE
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 10:34:09 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5952EA003F;
 Fri,  9 Apr 2021 10:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5952EA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1617957248; bh=HrWD+qU1b8XQT6lS9k++q0Cw+Z1R3q8cHTHdLw7ln4g=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=IUCDU6LdYJ78+6Dt1RQb7VQ4pLftncEF7X48iMfI5r5lM8iObYKgF40AzRxfdMXsp
 AZSO4A7XcSKpdcJNWcRvUdwSrahHmT8+AEq2VOiEoG86YFFXfW1G63nWARjg5tVr3U
 qWstL57NpaUVP45uHHWAsBU8OjPKHlfTT5j5f+0s=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  9 Apr 2021 10:34:03 +0200 (CEST)
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
To: Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20210408094314.1322802-1-perex@perex.cz>
 <20210408103819.GA40407@workstation> <s5h35w182a5.wl-tiwai@suse.de>
 <45acc908-3603-3479-9fb2-5206339a9ace@perex.cz>
 <20210408120502.GA4516@sirena.org.uk> <s5hpmz47w3i.wl-tiwai@suse.de>
 <56c874ae-e801-63df-19fa-a1325f6104ca@perex.cz>
 <3107db1d-f97d-539a-05db-6f880b762f00@linux.intel.com>
 <3b33595e-777c-90b2-6d65-346c9bf6e003@perex.cz>
 <b0258a67-79ca-50cd-e6c5-74514ba8a3c5@linux.intel.com>
 <s5hv98v6h5a.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <9195f83a-28c4-d028-8f1e-c3beaa88d891@perex.cz>
Date: Fri, 9 Apr 2021 10:34:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <s5hv98v6h5a.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
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

Dne 09. 04. 21 v 9:39 Takashi Iwai napsal(a):
> On Thu, 08 Apr 2021 20:51:41 +0200,
> Pierre-Louis Bossart wrote:
>>
>>
>>
>>>>> When we have a common standard layer for the plug-and-play handling (udev), we
>>>>> should concentrate to allow changing / refining of this information there.
>>>>> Those strings are not used for anything else than the user space. So from my
>>>>> view, there's no reason to create another mechanism to handle the overrides.
>>>>> It should be a safe, fast, flexible and_optional_  solution. The udev can
>>>>> alter the sysfs attributes directly without any hassle with the file
>>>>> modifications or looking for another way to pass / store this information
>>>>> somewhere.
>>>>
>>>> There's one part where I am lost.
>>>>
>>>> The initial idea of udev what to modify kernel parameters to pick a
>>>> different path for firmware/topology before probing the PCI driver. At
>>>
>>> This may be a problematic point. The kernel cmdline cannot be modified from
>>> udev (as far as I know). The module parameters can be set using modprobe's
>>> config files or when loaded with sysfs attributes (/sys/module/*/parameters).
>>> Eventually, you can call the modprobe command with custom module parameters
>>> when the appropriate MODALIAS is probed.
>>>
>>> Perhaps, I'm missing something here, too. Some example udev rules may help.
>>
>> see the example shared by Curtis
>>
>> SUBSYSTEM=="pci", ATTR{vendor}=="0x8086", ATTR{device}=="0xa0c8",
>> ATTR{class}=="0x040100", ATTRS{[dmi/id]board_name}=="Eldrid",
>> RUN+="/sbin/modprobe snd_sof_pci tplg_path=intel/sof-tplg/pdm1"
>>
>> Those 'path' parameters would have to be set prior to creating the
>> card, making them writable via sysfs would not work, the firmware and
>> topology are already loaded and changing the paths would have no
>> effect.
> 
> Couldn't the driver probe the firmware files with some device-specific
> string suffix at first?  e.g. the driver can issue request_firmware()
> with $base_file-$dmi_board at first, then falls back to the generic
> $base_file.  A similar method was already used in Broadcom WiFi
> driver.
> 
> Also, the driver may do request_firmware() with a fixed path for the
> custom firmware at first (e.g. "intel/sof-tplg-custom"); then a system
> integrator may set up a specific configuration even that doesn't match
> with DMI or whatever identifier.

And when we have two firmware files which differs just by functionality
requested by user? Although your method will work, I won't close the
possibility to configure everything in udev rather using a hard coded fw load
scheme only.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

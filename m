Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC5CE47D7
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 11:51:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AB6117A3;
	Fri, 25 Oct 2019 11:50:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AB6117A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571997099;
	bh=t5ztHQQutNQvxJ6fb7G/VcyjDKodLakQb3UM4adLbss=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IPkx80+lF5F+RKZOHs3R3bFlHrXTXG7GFZElT8WeUkElpouQvPIfCMgySLwZjLTps
	 QnypSGIkzxNuMnni28CtitIwpklFVP0H7LBJ1dNWBwq8rOYR3B82jYwvcb0V+YXWaE
	 7n6mQX8HpGS62sgWI2+Usm8vud0QC8vHkifVRzNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3222BF80112;
	Fri, 25 Oct 2019 11:49:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1521FF8036F; Fri, 25 Oct 2019 11:49:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_5,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3C48F80112
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 11:49:50 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D2261A0040;
 Fri, 25 Oct 2019 11:49:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D2261A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1571996989; bh=hgXCja1+6Os8JseQQH0Ew4SBc19oUiA2DVcz237b7QI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=V8YkW2y7PeuqmcLV+lLA4YvHVZjq93fGEh7olyVAYTmrK2IRIHIZ4dUG/97KAN4Sx
 WG5muxCz1YyO7h0WT/XTXs6toblI0bPzmLglse1r3r/sIJHtrttCImHezkX0RD9zDh
 9AwJ2F3aWAaUz/potY/8/u5aRPDrvfDKWzu3XErc=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 25 Oct 2019 11:49:46 +0200 (CEST)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20191022174313.29087-1-perex@perex.cz>
 <6d4e41fe-ba1e-3c89-582c-f8dc0964cf18@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <0036ad81-c383-ec91-5acb-fccf681b538c@perex.cz>
Date: Fri, 25 Oct 2019 11:49:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <6d4e41fe-ba1e-3c89-582c-f8dc0964cf18@linux.intel.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>
Subject: Re: [alsa-devel] [PATCH v5 1/2] ALSA: hda: add Intel DSP
 configuration / probe code
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 24. 10. 19 v 22:33 Pierre-Louis Bossart napsal(a):
> 
> 
> On 10/22/19 12:43 PM, Jaroslav Kysela wrote:
>> For distributions, we need one place where we can decide
>> which driver will be activated for the auto-configation of the
>> Intel's HDA hardware with DSP. Actually, we cover three drivers:
>>
>> * Legacy HDA
>> * Intel SST
>> * Intel Sound Open Firmware (SOF)
>>
>> All those drivers registers similar PCI IDs, so the first
>> driver probed from the PCI stack can win. But... it is not
>> guaranteed that the correct driver wins.
>>
>> This commit changes Intel's NHLT ACPI module to a common
>> DSP probe module for the Intel's hardware. All above sound
>> drivers calls this code. The user can force another behaviour
>> using the module parameter 'dsp_driver' located in
>> the 'snd-intel-dspcfg' module.
>>
>> This change allows to add specific dmi checks for the specific
>> systems. The examples are taken from the pull request:
>>
>>     https://github.com/thesofproject/linux/pull/927
>>
>> Tested on Lenovo Carbon X1 7th gen.
> 
> Jaroslav, I found a case where the logic doesn't seem to work as intended.
> 
> the code currently scans through the table looking for a PCI ID match,
> and a DMI match for quirks.
> 
> On a KBL NUC device with the DSP enabled, we go through the entire list
> without finding a match, which means we return the _ANY flag. so if we
> try to probe the snd-soc-skl driver, the checks will allow the driver to
> continue, despite this configuration not being supported.
> 
> It was my understanding that we would always load the legacy driver
> *unless* there is a match in the table? If yes, there we can change the
> default this way:
> 
> @@ -333,7 +355,7 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
>           /* find the configuration for the specific device */
>           cfg = snd_intel_dsp_find_config(pci, config_table,
> ARRAY_SIZE(config_table));
>           if (!cfg)
> -               return SND_INTEL_DSP_DRIVER_ANY;
> +               return SND_INTEL_DSP_DRIVER_LEGACY;
> 
> Or we need to add a case where we force the legacy in the table for each
> platform.

I would prefer to add another entry to the configuration table without .flags 
(or .flags = 0) with a comment, why the legacy driver is selected by default 
even if the DSP is present.

				Thanks,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

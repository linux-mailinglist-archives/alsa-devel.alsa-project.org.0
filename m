Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ED6609A6C
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 08:20:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 524CD83B3;
	Mon, 24 Oct 2022 08:19:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 524CD83B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666592446;
	bh=gHNLQKvcKlHnKk9sfe9rRCsSSCeNXiLjpit+Hqrz9oQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jaAD4K1+jT51ERb7V5z/QC2/1XtJJs1oKp9FM1k9NVM3anGOO6370dAw/cyQSENHw
	 gpAhSPOW5lNkY18ndJh5+hhDxDj2c5ECH3KOTK90r4z4764PpF0ZrhHaHtfQuPV6Qz
	 tQs9lXYdnIn8i0Fcm7pXhcUZj75/8wBl7l19zFYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1633F800E0;
	Mon, 24 Oct 2022 08:19:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7357BF80240; Mon, 24 Oct 2022 08:19:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_PASS,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E047F800E0
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 08:19:43 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 69829A003F;
 Mon, 24 Oct 2022 08:19:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 69829A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1666592383; bh=2JrSCCHSHguqiT5vchBcwO3V6xyZnsgax1BkiItaXk0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AbCAQWDuJIb+TDrICMnK8pMRyZPv8f1gSU6CHTBPyhBdhqNzf6sDyZ+ZBGYlOtiOb
 l51sE5/UVi6j3o8tdQpXN5ui/FQKAl1bvtmKA1Mx8p6IrR6TUltIVJotVbV65M75v0
 pHx4ZBt7GrRSgjCgVRLG2sxYkhWmgUAn7O5ntJtI=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 24 Oct 2022 08:19:40 +0200 (CEST)
Message-ID: <8d0ccf4a-a6d9-f914-70a9-c2ad55af3a04@perex.cz>
Date: Mon, 24 Oct 2022 08:19:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] ASoC: core: clarify the driver name initialization
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20220929143754.345144-1-perex@perex.cz>
 <eb7971c2-f5fe-afb5-9333-4b941b958355@linux.intel.com>
 <8d461c81-5d70-cfbb-4653-979764a6b5a6@perex.cz>
 <3770c782-d01c-37b6-73a5-2c45c869d541@linux.intel.com>
 <2285503b-b2cd-bca4-d491-cf4e8eaac92a@perex.cz>
 <5b94c9ef-a37b-9d71-ad05-5ce9ba103af0@linux.intel.com>
 <708583ba-ea20-cc46-7ca1-ee213586441a@perex.cz>
 <df4f3b77-887f-8894-3bd7-3dd386af58f1@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <df4f3b77-887f-8894-3bd7-3dd386af58f1@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On 21. 10. 22 16:36, Pierre-Louis Bossart wrote:
> 
> 
> On 10/21/22 01:37, Jaroslav Kysela wrote:
>> On 20. 10. 22 20:13, Pierre-Louis Bossart wrote:
>>> Hi Jaroslav,
>>>
>>>> Nope. It's just a short path for the non-driver field to not further
>>>> process the destination string (the name argument). The snprintf() call
>>>> sets all field types (it's before the condition). Just set the
>>>> driver_name field in the soc card structure and you will be fine.
>>>>
>>>> The UCM config must be updated to handle the new driver name. The fine
>>>> selection key should probably use the card name, because long name is
>>>> set from DMI:
>>>>
>>>> old:
>>>>
>>>> 1 [sofglkda7219max]: sof-glkda7219ma - sof-glkda7219max
>>>>                        Google-Phaser360-rev4
>>>>
>>>> new:
>>>>
>>>> 1 [sofglkda7219max]: SOF-Intel - sof-glkda7219max
>>>>                        Google-Phaser360-rev4
>>>>
>>>> UCM substitutions:
>>>>
>>>> 1 [${CardId}      ]: ${CardDriver} - ${CardName}
>>>>                        ${CardLongName}
>>>>
>>>> UCM conf:
>>>>
>>>> mkdir -p ucm2/conf.d/SOF-Intel
>>>> cat > ucm2/conf.d/SOF-Intel/SOF-Intel.conf <<EOF
>>>> Syntax 6
>>>> Include.0.File "/Intel/\${CardName}/\${CardName}.conf"
>>>> EOF
>>>
>>> I am not following any of this, sorry.
>>>
>>> The existing UCM configuration uses the card name, e.g.
>>> sof-glkda7219max. That works and needs zero extra work.
>>
>> Unfortunately, actually the wrapped driver names are used for the
>> primary lookups. The card name is not used at all in ucm2/conf.d.
> 
> ok, that's interesting because I've always used the card name with
> alsaucm :-)
> 
> 
> Usage: alsaucm <options> [command]
> 
> Available options:
>    -h,--help                  this help
>    -c,--card NAME             open card NAME
> 
> alsaucm -c sof-glkda7219max set _verb HiFi set _enadev Headphone
> 
> And if we move to use the driver name as the primary lookup then we'd
> still need the card name for alsaucm to work, so why use the driver name
> as a primary lookup?

The driver name is used for the lookups as defined in ucm2/ucm.conf. The 
driver/card name/card long name lookups are handled in the alsa-lib's code 
(converted to "hw:X" UCM card name). If you turn this fallback off (use 
"strict:sof-glkda7219max" UCM card name), things won't work.

> If we can report a less confusing driver name to the users, that's fine
> with me, but I don't get the idea of using the driver name as the first
> criterion to identify a setup, you'll also need the card name so why not
> use the card name as primary criterion?

It is not usable for the USB driver where every model has own name set from 
USB descriptors for example.

>>> If all the cards registered in sound/soc/intel/boards use the same
>>> "SOF-Intel" driver name, then the driver name cannot be used for any UCM
>>> selection.
>>
>> It can be used for the first level of the lookup. Eventually, we can add
>> ucm2/conf.d/${CardDriver}/${CardName}.conf search path to ucm2/ucm.conf
>> for the direct lookups to handle this case, but it's just an
>> optimization. I would start with the ${CardName} redirection as I
>> suggested. We can decide / make the ucm.conf change later.
>>
>>> What is the point of including all the cardName.conf files at a higher
>>> level that brings no obvious value beyond an indirection that we already
>>> have with the path ucm2/Intel ?
>>>
>>> What am I missing ??
>>
>> The goal is to fix the driver names (e.g. "sof-glkda7219ma",
>> "sof-mt8195_r101" etc.). If you like to keep the unique names, it's your
>> decision. I just prefer to have a string which is understandable to
>> users. UCM can handle the finer selection of the configuration at any
>> level now. Examples: sof-soundwire, USB-Audio
>> (ucm2/USB-Audio/USB-Audio.conf), SOF (ucm2/Intel/SOF/HiFi.conf).
> 
> I don't mind setting a common string, it's not going to be possible to
> capture all hardware variations in 15 characters.
> 
> What worries me is backwards compatibility with existing user setups. If
> someone updates their kernel and the change in driver name ends-up
> breaking audio that's a big no-no for me. That's a real issue for us in
> terms of support because we typically ask people reporting
> SOF/SoundWire/HDA/mic issues if they can installing with our development
> kernel.

We can use a similar mechanism as we did with 
CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES . The distributions can enable 
this when packages when UCM configs are updated. Also, new drivers should use 
new driver name scheme, it's only for the current drivers.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

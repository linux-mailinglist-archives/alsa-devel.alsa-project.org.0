Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CF560702B
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 08:38:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 038C2800D;
	Fri, 21 Oct 2022 08:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 038C2800D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666334330;
	bh=8pDF/FbIWIE7DyDoL/yaRVvS0OrjEpd57a9dB8C/qUc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=An4IsaH24c7rzbjKuT+V2Sf+r7TnhRF6UeErtAajePB/W69WB7/NRrhdJiY36xkjr
	 f7r+DLwIf4WFXqlCLzrK+YYSxAl39G/coXjmRPXaDePRTuSK81yu+W2LGq7YwXn8H+
	 WZMLBBTfa7ZnA0qoPcICOsjDPM9+pnfj76twkqmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 795B4F800B5;
	Fri, 21 Oct 2022 08:37:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F3DBF80118; Fri, 21 Oct 2022 08:37:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 965F8F80118
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 08:37:47 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E8897A003F;
 Fri, 21 Oct 2022 08:37:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E8897A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1666334266; bh=7bheVmjzS5vyXhQGrqj0IHaOc01J9HG+8xqe7yCTVvQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VIrhv2XjwU6CYD/x0hf6IEW7mNnX8mJ4bToIBGDc7GTm6dC0mPtzdzECQuGtg4269
 T0HaHW8LfrCQC3P/qDQMp7xrH29JwUA63baCQ8pJc4POCSNq/PW3ixEKpFsXLzSG1H
 LqghmKvl/DsXcA3JxMcipehv1x+BAQJsQ5kR/BLY=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 21 Oct 2022 08:37:43 +0200 (CEST)
Message-ID: <708583ba-ea20-cc46-7ca1-ee213586441a@perex.cz>
Date: Fri, 21 Oct 2022 08:37:43 +0200
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
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <5b94c9ef-a37b-9d71-ad05-5ce9ba103af0@linux.intel.com>
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

On 20. 10. 22 20:13, Pierre-Louis Bossart wrote:
> Hi Jaroslav,
> 
>> Nope. It's just a short path for the non-driver field to not further
>> process the destination string (the name argument). The snprintf() call
>> sets all field types (it's before the condition). Just set the
>> driver_name field in the soc card structure and you will be fine.
>>
>> The UCM config must be updated to handle the new driver name. The fine
>> selection key should probably use the card name, because long name is
>> set from DMI:
>>
>> old:
>>
>> 1 [sofglkda7219max]: sof-glkda7219ma - sof-glkda7219max
>>                       Google-Phaser360-rev4
>>
>> new:
>>
>> 1 [sofglkda7219max]: SOF-Intel - sof-glkda7219max
>>                       Google-Phaser360-rev4
>>
>> UCM substitutions:
>>
>> 1 [${CardId}      ]: ${CardDriver} - ${CardName}
>>                       ${CardLongName}
>>
>> UCM conf:
>>
>> mkdir -p ucm2/conf.d/SOF-Intel
>> cat > ucm2/conf.d/SOF-Intel/SOF-Intel.conf <<EOF
>> Syntax 6
>> Include.0.File "/Intel/\${CardName}/\${CardName}.conf"
>> EOF
> 
> I am not following any of this, sorry.
> 
> The existing UCM configuration uses the card name, e.g.
> sof-glkda7219max. That works and needs zero extra work.

Unfortunately, actually the wrapped driver names are used for the primary 
lookups. The card name is not used at all in ucm2/conf.d.

> If all the cards registered in sound/soc/intel/boards use the same
> "SOF-Intel" driver name, then the driver name cannot be used for any UCM
> selection.

It can be used for the first level of the lookup. Eventually, we can add
ucm2/conf.d/${CardDriver}/${CardName}.conf search path to ucm2/ucm.conf for 
the direct lookups to handle this case, but it's just an optimization. I would 
start with the ${CardName} redirection as I suggested. We can decide / make 
the ucm.conf change later.

> What is the point of including all the cardName.conf files at a higher
> level that brings no obvious value beyond an indirection that we already
> have with the path ucm2/Intel ?
> 
> What am I missing ??

The goal is to fix the driver names (e.g. "sof-glkda7219ma", "sof-mt8195_r101" 
etc.). If you like to keep the unique names, it's your decision. I just prefer 
to have a string which is understandable to users. UCM can handle the finer 
selection of the configuration at any level now. Examples: sof-soundwire, 
USB-Audio (ucm2/USB-Audio/USB-Audio.conf), SOF (ucm2/Intel/SOF/HiFi.conf).

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

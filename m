Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 508316079CD
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 16:40:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E26BAA943;
	Fri, 21 Oct 2022 16:40:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E26BAA943
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666363252;
	bh=VT+natpKcK/WA9h8HkTnzb1nIV20BiwLPcVNlsiWg1Y=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=heFi+DgUhrBaD7uzkXHxapluQEVvQ8wjn8zU4amYhPxL/f4aacuIrfVqchxk2GwUV
	 F8PD0xdPfjOmqzkOSamCOrkG+tJFzC4rUVd0kCf6vN+06IcZRmxptSxTqtwoxoSK2G
	 m867MyW3tB8dUvylCBIh3Cg/bdRiFdCHGgTE1r2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D763F80118;
	Fri, 21 Oct 2022 16:39:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C67EF8021D; Fri, 21 Oct 2022 16:39:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25D52F80118
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 16:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25D52F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CBItYXZH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666363192; x=1697899192;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VT+natpKcK/WA9h8HkTnzb1nIV20BiwLPcVNlsiWg1Y=;
 b=CBItYXZHi5+8FxSD9shEL0Kg0ofj1kpUCmFI/f5JqLd1e1sU18cFd3eL
 4yX6A3C/VygenN7IdAJUuj/ivST769OLmZHMkWcxsrLjiJ0TZwztcd+mz
 ts3zLMflcETLbN1UFS0lUF0DalJfdr560N4+SaCcbRkJOO8ksVR/B+qwC
 DZtbwoSJ+TgEuM9tkHltgY/ji+t1cyGH4njyylqiyv5r6tBXUzBcIditN
 J3PgPZ4QU9HtjbLYmi8JjWBKPQkNZpQVay7A1GzBXGS41IBiqRQuBbE2M
 rIUuIWRXkZ9yl477Cr2WNbbRYaq2tPvRZndP34zwOk+y+jHcDDSrDnZC5 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="369063057"
X-IronPort-AV: E=Sophos;i="5.95,202,1661842800"; d="scan'208";a="369063057"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 07:39:46 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="663770667"
X-IronPort-AV: E=Sophos;i="5.95,202,1661842800"; d="scan'208";a="663770667"
Received: from legomezl-mobl1.amr.corp.intel.com (HELO [10.213.170.111])
 ([10.213.170.111])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 07:39:46 -0700
Message-ID: <df4f3b77-887f-8894-3bd7-3dd386af58f1@linux.intel.com>
Date: Fri, 21 Oct 2022 09:36:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH v2] ASoC: core: clarify the driver name initialization
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20220929143754.345144-1-perex@perex.cz>
 <eb7971c2-f5fe-afb5-9333-4b941b958355@linux.intel.com>
 <8d461c81-5d70-cfbb-4653-979764a6b5a6@perex.cz>
 <3770c782-d01c-37b6-73a5-2c45c869d541@linux.intel.com>
 <2285503b-b2cd-bca4-d491-cf4e8eaac92a@perex.cz>
 <5b94c9ef-a37b-9d71-ad05-5ce9ba103af0@linux.intel.com>
 <708583ba-ea20-cc46-7ca1-ee213586441a@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <708583ba-ea20-cc46-7ca1-ee213586441a@perex.cz>
Content-Type: text/plain; charset=UTF-8
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



On 10/21/22 01:37, Jaroslav Kysela wrote:
> On 20. 10. 22 20:13, Pierre-Louis Bossart wrote:
>> Hi Jaroslav,
>>
>>> Nope. It's just a short path for the non-driver field to not further
>>> process the destination string (the name argument). The snprintf() call
>>> sets all field types (it's before the condition). Just set the
>>> driver_name field in the soc card structure and you will be fine.
>>>
>>> The UCM config must be updated to handle the new driver name. The fine
>>> selection key should probably use the card name, because long name is
>>> set from DMI:
>>>
>>> old:
>>>
>>> 1 [sofglkda7219max]: sof-glkda7219ma - sof-glkda7219max
>>>                       Google-Phaser360-rev4
>>>
>>> new:
>>>
>>> 1 [sofglkda7219max]: SOF-Intel - sof-glkda7219max
>>>                       Google-Phaser360-rev4
>>>
>>> UCM substitutions:
>>>
>>> 1 [${CardId}      ]: ${CardDriver} - ${CardName}
>>>                       ${CardLongName}
>>>
>>> UCM conf:
>>>
>>> mkdir -p ucm2/conf.d/SOF-Intel
>>> cat > ucm2/conf.d/SOF-Intel/SOF-Intel.conf <<EOF
>>> Syntax 6
>>> Include.0.File "/Intel/\${CardName}/\${CardName}.conf"
>>> EOF
>>
>> I am not following any of this, sorry.
>>
>> The existing UCM configuration uses the card name, e.g.
>> sof-glkda7219max. That works and needs zero extra work.
> 
> Unfortunately, actually the wrapped driver names are used for the
> primary lookups. The card name is not used at all in ucm2/conf.d.

ok, that's interesting because I've always used the card name with
alsaucm :-)


Usage: alsaucm <options> [command]

Available options:
  -h,--help                  this help
  -c,--card NAME             open card NAME

alsaucm -c sof-glkda7219max set _verb HiFi set _enadev Headphone

And if we move to use the driver name as the primary lookup then we'd
still need the card name for alsaucm to work, so why use the driver name
as a primary lookup?

If we can report a less confusing driver name to the users, that's fine
with me, but I don't get the idea of using the driver name as the first
criterion to identify a setup, you'll also need the card name so why not
use the card name as primary criterion?

>> If all the cards registered in sound/soc/intel/boards use the same
>> "SOF-Intel" driver name, then the driver name cannot be used for any UCM
>> selection.
> 
> It can be used for the first level of the lookup. Eventually, we can add
> ucm2/conf.d/${CardDriver}/${CardName}.conf search path to ucm2/ucm.conf
> for the direct lookups to handle this case, but it's just an
> optimization. I would start with the ${CardName} redirection as I
> suggested. We can decide / make the ucm.conf change later.
> 
>> What is the point of including all the cardName.conf files at a higher
>> level that brings no obvious value beyond an indirection that we already
>> have with the path ucm2/Intel ?
>>
>> What am I missing ??
> 
> The goal is to fix the driver names (e.g. "sof-glkda7219ma",
> "sof-mt8195_r101" etc.). If you like to keep the unique names, it's your
> decision. I just prefer to have a string which is understandable to
> users. UCM can handle the finer selection of the configuration at any
> level now. Examples: sof-soundwire, USB-Audio
> (ucm2/USB-Audio/USB-Audio.conf), SOF (ucm2/Intel/SOF/HiFi.conf).

I don't mind setting a common string, it's not going to be possible to
capture all hardware variations in 15 characters.

What worries me is backwards compatibility with existing user setups. If
someone updates their kernel and the change in driver name ends-up
breaking audio that's a big no-no for me. That's a real issue for us in
terms of support because we typically ask people reporting
SOF/SoundWire/HDA/mic issues if they can installing with our development
kernel.

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D0960AEBE
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 17:14:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E41807282;
	Mon, 24 Oct 2022 17:13:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E41807282
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666624460;
	bh=G+qt7Tdcoffqe97dW0PX/m/UuOw84Y7ucmaGvLa7FwI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o6QRWYTam42xBwBRA2Lj2CyJDj2S6FucRqMEw7qBLxvyKzaaCJplRspEwCW2T6Qo2
	 LwMzjYbD43D549GNrgfEYXfeRqfweC0tNKhpFvjhEyz4AZXALQevhDst13KSoqcG7E
	 VqRzYrD0kxmvoMQ5WBdrTQxkAsB9tOowrQvUVhcU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5017EF80431;
	Mon, 24 Oct 2022 17:13:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF372F8053D; Mon, 24 Oct 2022 17:13:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2524AF80506
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 17:13:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2524AF80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SDRNAqua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666624398; x=1698160398;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=G+qt7Tdcoffqe97dW0PX/m/UuOw84Y7ucmaGvLa7FwI=;
 b=SDRNAqua8gjRzFvtXfU5NtncxahRjyuvsI1cUdPsG5g72R65OwxmxDki
 9t2S/+ohgGWyjb3eZM9ciyoKcI/J7DQay5swwfmfhQQGB/1wi88K7mtsT
 0Lo/y6/zCMja5q/5PFbE6dieLy1FHLCkFuzwtqvnOcEbiYdjRIvQFGV2J
 JiD6WTzRpe9zkwkNL3+23UggVkvbHJd8dQgkQB+8/WfXGicBQKRb3+gsc
 Tnhe61CPN3pQsKgE4M0s9JM+LlQwkucbOSXomMKtWQ4L4Zc+nhc7rEw58
 qYz0xLyLxoN62D0wCuDUsB1wvfBWUhNpI2ceFv30etWGHhecLvPIm1Ahc Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="306174611"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="306174611"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 08:13:11 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="626099065"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="626099065"
Received: from lmforney-mobl1.amr.corp.intel.com (HELO [10.209.175.17])
 ([10.209.175.17])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 08:13:11 -0700
Message-ID: <e2da2a30-c3fa-acc1-8c9c-78476e6f2461@linux.intel.com>
Date: Mon, 24 Oct 2022 09:08:12 -0500
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
 <df4f3b77-887f-8894-3bd7-3dd386af58f1@linux.intel.com>
 <8d0ccf4a-a6d9-f914-70a9-c2ad55af3a04@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <8d0ccf4a-a6d9-f914-70a9-c2ad55af3a04@perex.cz>
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



On 10/24/22 01:19, Jaroslav Kysela wrote:
> On 21. 10. 22 16:36, Pierre-Louis Bossart wrote:
>>
>>
>> On 10/21/22 01:37, Jaroslav Kysela wrote:
>>> On 20. 10. 22 20:13, Pierre-Louis Bossart wrote:
>>>> Hi Jaroslav,
>>>>
>>>>> Nope. It's just a short path for the non-driver field to not further
>>>>> process the destination string (the name argument). The snprintf()
>>>>> call
>>>>> sets all field types (it's before the condition). Just set the
>>>>> driver_name field in the soc card structure and you will be fine.
>>>>>
>>>>> The UCM config must be updated to handle the new driver name. The fine
>>>>> selection key should probably use the card name, because long name is
>>>>> set from DMI:
>>>>>
>>>>> old:
>>>>>
>>>>> 1 [sofglkda7219max]: sof-glkda7219ma - sof-glkda7219max
>>>>>                        Google-Phaser360-rev4
>>>>>
>>>>> new:
>>>>>
>>>>> 1 [sofglkda7219max]: SOF-Intel - sof-glkda7219max
>>>>>                        Google-Phaser360-rev4
>>>>>
>>>>> UCM substitutions:
>>>>>
>>>>> 1 [${CardId}      ]: ${CardDriver} - ${CardName}
>>>>>                        ${CardLongName}
>>>>>
>>>>> UCM conf:
>>>>>
>>>>> mkdir -p ucm2/conf.d/SOF-Intel
>>>>> cat > ucm2/conf.d/SOF-Intel/SOF-Intel.conf <<EOF
>>>>> Syntax 6
>>>>> Include.0.File "/Intel/\${CardName}/\${CardName}.conf"
>>>>> EOF
>>>>
>>>> I am not following any of this, sorry.
>>>>
>>>> The existing UCM configuration uses the card name, e.g.
>>>> sof-glkda7219max. That works and needs zero extra work.
>>>
>>> Unfortunately, actually the wrapped driver names are used for the
>>> primary lookups. The card name is not used at all in ucm2/conf.d.
>>
>> ok, that's interesting because I've always used the card name with
>> alsaucm :-)
>>
>>
>> Usage: alsaucm <options> [command]
>>
>> Available options:
>>    -h,--help                  this help
>>    -c,--card NAME             open card NAME
>>
>> alsaucm -c sof-glkda7219max set _verb HiFi set _enadev Headphone
>>
>> And if we move to use the driver name as the primary lookup then we'd
>> still need the card name for alsaucm to work, so why use the driver name
>> as a primary lookup?
> 
> The driver name is used for the lookups as defined in ucm2/ucm.conf. The
> driver/card name/card long name lookups are handled in the alsa-lib's
> code (converted to "hw:X" UCM card name). If you turn this fallback off
> (use "strict:sof-glkda7219max" UCM card name), things won't work.

Fair enough, I wasn't even aware of the existence of this 'strict'
directive.

>> If we can report a less confusing driver name to the users, that's fine
>> with me, but I don't get the idea of using the driver name as the first
>> criterion to identify a setup, you'll also need the card name so why not
>> use the card name as primary criterion?
> 
> It is not usable for the USB driver where every model has own name set
> from USB descriptors for example.

How would you use UCM in that context, the use of a driver name would
lead to a lot of abstraction potentially, isn't there a risk of not
being able to detect specific skews that need variants?

>>>> If all the cards registered in sound/soc/intel/boards use the same
>>>> "SOF-Intel" driver name, then the driver name cannot be used for any
>>>> UCM
>>>> selection.
>>>
>>> It can be used for the first level of the lookup. Eventually, we can add
>>> ucm2/conf.d/${CardDriver}/${CardName}.conf search path to ucm2/ucm.conf
>>> for the direct lookups to handle this case, but it's just an
>>> optimization. I would start with the ${CardName} redirection as I
>>> suggested. We can decide / make the ucm.conf change later.
>>>
>>>> What is the point of including all the cardName.conf files at a higher
>>>> level that brings no obvious value beyond an indirection that we
>>>> already
>>>> have with the path ucm2/Intel ?
>>>>
>>>> What am I missing ??
>>>
>>> The goal is to fix the driver names (e.g. "sof-glkda7219ma",
>>> "sof-mt8195_r101" etc.). If you like to keep the unique names, it's your
>>> decision. I just prefer to have a string which is understandable to
>>> users. UCM can handle the finer selection of the configuration at any
>>> level now. Examples: sof-soundwire, USB-Audio
>>> (ucm2/USB-Audio/USB-Audio.conf), SOF (ucm2/Intel/SOF/HiFi.conf).
>>
>> I don't mind setting a common string, it's not going to be possible to
>> capture all hardware variations in 15 characters.
>>
>> What worries me is backwards compatibility with existing user setups. If
>> someone updates their kernel and the change in driver name ends-up
>> breaking audio that's a big no-no for me. That's a real issue for us in
>> terms of support because we typically ask people reporting
>> SOF/SoundWire/HDA/mic issues if they can installing with our development
>> kernel.
> 
> We can use a similar mechanism as we did with
> CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES . The distributions can
> enable this when packages when UCM configs are updated. Also, new
> drivers should use new driver name scheme, it's only for the current
> drivers.

That would be good indeed. FWIW, I reverted this patch in our
development tree to remove confusing error messages that make tests fail.

That would not be an Intel only option though, right? There are tons of
other ASoC machine drivers who don't set the driver name at all, so it
could take time to make that transition.

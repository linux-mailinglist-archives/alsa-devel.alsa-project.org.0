Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ACB8073D5
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 16:39:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AE5183E;
	Wed,  6 Dec 2023 16:39:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AE5183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701877198;
	bh=YB6s5WRRn7FCRx4YwCdh+nBPQpK5xD9HBUyp12kv2Yc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ri7uASWO8YLcKAfMOHKNyASgMJJ2qAww19/A75a2K7wPGj7Tvct+T8h+O/AOyn5TS
	 oMJTBjxJqxX8K/b8KRq61ICZKUndZaQK4OLBSJn392qJtBg9tBVMrmt2HsyrwvKgRy
	 YMCiP1XfJW/QHDicXo3HFzmU3IM5jWdJ76UcseOY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54BF7F8025A; Wed,  6 Dec 2023 16:39:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9B55F80578;
	Wed,  6 Dec 2023 16:39:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4A6EF8024E; Wed,  6 Dec 2023 16:39:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6E2FF800D2
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 16:39:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6E2FF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bMfTo08a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701877152; x=1733413152;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YB6s5WRRn7FCRx4YwCdh+nBPQpK5xD9HBUyp12kv2Yc=;
  b=bMfTo08aQ6wQrrb6IwAna2Qqx+shsvOo88aQSMfNshfElQ40omUMk4fc
   HZ3Ut8e6daGRKsgaHCSe7MR66P2zJQlvm9xrePZXKTjxW8UwEJz+M86jg
   nHGrPhiADWy9aFuDuCqIWUFLBQOUP267L5A1Q17oyM+eDY0Up/LZQ6TOj
   kn7XoV6s66YVMx+ixL0HevATXccfI7jMGNhElGPib57dP7eroD6E7OMh9
   dzyCP/j+/xWXfx6kwjU5O9oXU8Cts0BfuTKICplEZWDPLiNvslaUBnedW
   8Zu7UkfLde9QKgM1Zu7+oigFcKW7zkcf+AydXMTNmdTM/6JHsPKIFjU3k
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="393807147"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600";
   d="scan'208";a="393807147"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 07:39:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="775042114"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600";
   d="scan'208";a="775042114"
Received: from limalexa-mobl1.amr.corp.intel.com (HELO [10.209.11.6])
 ([10.209.11.6])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 07:39:07 -0800
Message-ID: <8f9f67b1-a58f-4163-beda-46ae259fa16f@linux.intel.com>
Date: Wed, 6 Dec 2023 09:39:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH alsa-ucm-conf 2/2] sof-soundwire: Add basic support for a
 4x cs35l56 configuration
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: perex@perex.cz, bard.liao@intel.com, mengdong.lin@intel.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org
References: <20231205142420.1256042-1-ckeepax@opensource.cirrus.com>
 <20231205142420.1256042-2-ckeepax@opensource.cirrus.com>
 <c14371e7-0974-4d97-b5b8-55937390b684@linux.intel.com>
 <20231205162838.GH14858@ediswmail.ad.cirrus.com>
 <8e3a9bc0-9f79-4419-a677-5f92f9bf04b7@linux.intel.com>
 <20231206094701.GI14858@ediswmail.ad.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231206094701.GI14858@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OZXJDARC3I2PVRGUKHTVZUGL5GCOG4T2
X-Message-ID-Hash: OZXJDARC3I2PVRGUKHTVZUGL5GCOG4T2
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OZXJDARC3I2PVRGUKHTVZUGL5GCOG4T2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




>>>>> +	EnableSequence [
>>>>> +		cset "name='AMP1 Speaker Switch' 1"
>>>>> +		cset "name='AMP2 Speaker Switch' 1"
>>>>> +		cset "name='AMP3 Speaker Switch' 1"
>>>>> +		cset "name='AMP4 Speaker Switch' 1"
>>>>> +	]
>>>>
>>>> If we only need an on/off switch, I wonder if this can be made
>>>> conditional, i.e. enable/disable a control if it exists. That would
>>>> scale to various numbers of amplifiers without a need to add a 2-amp, 6
>>>> or 8-amp configuration.
>>>
>>> I think that is possible, would you lean towards modifying
>>> HiFi.conf to only include a single file for cs35l56, or would you
>>> lean more towards having each cs35l56-x.conf file include a
>>> single base file?
>>
>> I wasn't referring to partitioning of files, rather the conditional UCM
>> syntax,
>>
>> Condition {
>> 	Type ControlExists
>> 	Control "name='AMP4 Speaker Switch'"
>> }
>>
> 
> I get that, but once you have added those you still have the
> issue HiFi.conf will load the speaker use-case as follows:
> 
> False.Include.spkdev.File "/sof-soundwire/${var:SpeakerCodec1}-${var:SpeakerAmps1}.conf"
> 
> Meaning the number of amps will be part of the file name
> requested. So my question was how you wanted to deal with that?
> Personally I would lean towards just having all the
> cs35l56-8.conf, cs35l56-6.conf etc. include a cs35l56-base.conf.
> Its slightly more files, but feels a bit less crufty than having
> a special case for cs35l56 to not include the number of amps in
> the filename.

Ah yes, I forgot that part...

I must admit I don't recall either what we were trying to achieve in UCM
with the number of amplifiers and speakers both added to the components
string: "cfg-spk:%d cfg-amp:%d"

Probably best to go with your solution and see what can be optimized
later...


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E73D8FB6B6
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 17:13:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47778E66;
	Tue,  4 Jun 2024 17:13:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47778E66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717514000;
	bh=hSqtnWWeq83bRrdJrf3MfAQNHnxLuRaoyE2ioCIEo0M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VId6jwCloUxJtSkHXtF4K8ATsgpunS4IqXapmQZk5MypWhYayxgWiFGy4PRf2rb0x
	 ETlYh4Xv4KQTSHAU9pHTnh3jXXAPPN6km48XxOoqukU2bg2zT4OU17IjMvLdrwOmrq
	 zIjPilEPdxcWff1pcpFg/FNomUia0DCgxQ7szr5A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33D63F805CB; Tue,  4 Jun 2024 17:12:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D92C8F805C8;
	Tue,  4 Jun 2024 17:12:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6E9BF802DB; Tue,  4 Jun 2024 17:12:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE8EBF8003A
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 17:12:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE8EBF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dZeHVCgT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717513949; x=1749049949;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hSqtnWWeq83bRrdJrf3MfAQNHnxLuRaoyE2ioCIEo0M=;
  b=dZeHVCgTx8DToee3hokfCey/Gsw+6topOQaikk6wRW+i7ZG+7lCgF3BK
   AgB3qfeUw9wakEDKdHRN9jKFs8YW1EhUu5ghMD1N8ayp3CjyrSVD9fFhJ
   Fa5Q8ZrM6ovz44nh+kmiSrSwYPmb4ADerRtVW2icU0v+Bs5OFESkH3XHY
   WH1iPWDWlxa0X/v8OYkWtQGJr0z93aeOpdo14G/Ts6fiV/xE2+VmrCAWs
   jCIdjUolawzVFoyptvylVy1Xp7M9UL/V/TwH8hVFApWKYtXpZLrGfSr4A
   HzC2BRKO7pv3qCIXyL+z19fCgwmYFzKWHjCmkgF5qRykSdtXAbP5NobWo
   w==;
X-CSE-ConnectionGUID: pYXj1fHMTO2reXizNuxwjQ==
X-CSE-MsgGUID: pNXpf7VDS5q2MlbbrkrO/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="31602500"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000";
   d="scan'208";a="31602500"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 08:12:09 -0700
X-CSE-ConnectionGUID: XIeU217HRTuXyOfBAck/OQ==
X-CSE-MsgGUID: Oe+hRJJRQT+iPoQlktO7RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000";
   d="scan'208";a="37139630"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.143])
 ([10.245.246.143])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 08:12:07 -0700
Message-ID: <0d15954f-0158-4a56-afef-f0d043135146@linux.intel.com>
Date: Tue, 4 Jun 2024 17:07:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] soundwire: bus: clean up probe warnings
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20240604075213.20815-1-johan+linaro@kernel.org>
 <20240604075213.20815-4-johan+linaro@kernel.org>
 <8dd7cadc-138c-4ef5-b06f-7177550b1215@linux.intel.com>
 <Zl7boEkMpQaELARP@hovoldconsulting.com>
 <970501b1-09ae-4f2c-a078-2b4f23fe460e@linux.intel.com>
 <Zl8iUmOfrjw3gWVX@hovoldconsulting.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Zl8iUmOfrjw3gWVX@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VYP6IJ4DYUXQQVD7HBSVTTQDZ5PQEWBK
X-Message-ID-Hash: VYP6IJ4DYUXQQVD7HBSVTTQDZ5PQEWBK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VYP6IJ4DYUXQQVD7HBSVTTQDZ5PQEWBK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

\
>>>>> @@ -123,7 +123,7 @@ static int sdw_drv_probe(struct device *dev)
>>>>>  	/* init the dynamic sysfs attributes we need */
>>>>>  	ret = sdw_slave_sysfs_dpn_init(slave);
>>>>>  	if (ret < 0)
>>>>> -		dev_warn(dev, "Slave sysfs init failed:%d\n", ret);
>>>>> +		dev_warn(dev, "failed to initialise sysfs: %d\n", ret);
>>>>>  
>>>>>  	/*
>>>>>  	 * Check for valid clk_stop_timeout, use DisCo worst case value of
>>>>> @@ -147,7 +147,7 @@ static int sdw_drv_probe(struct device *dev)
>>>>>  	if (drv->ops && drv->ops->update_status) {
>>>>>  		ret = drv->ops->update_status(slave, slave->status);
>>>>>  		if (ret < 0)
>>>>> -			dev_warn(dev, "%s: update_status failed with status %d\n", __func__, ret);
>>>>> +			dev_warn(dev, "failed to update status: %d\n", ret);
>>>>
>>>> the __func__ does help IMHO, 'failed to update status' is way too general...
>>>
>>> Error messages printed with dev_warn will include the device and driver
>>> names so this message will be quite specific still.
>>
>> The goal isn't to be 'quite specific' but rather 'completely
>> straightforward'. Everyone can lookup a function name in a xref tool and
>>  quickly find out what happened. Doing 'git grep' on message logs isn't
>> great really, and over time logs tend to be copy-pasted. Just look at
>> the number of patches where we had to revisit the dev_err logs to make
>> then really unique/useful.
> 
> Error message should be self-contained and give user's some idea of what
> went wrong and not leak implementation details like function names (and
> be greppable, which "%s:" is not).

"Failed to update status" doesn't sound terribly self-contained to me.

It's actually a great example of making the logs less clear with good
intentions. How many people know that the SoundWire bus exposes an
'update_status' callback, and that callback can be invoked from two
completely different places (probe or on device attachment)?

/* Ensure driver knows that peripheral unattached */
ret = sdw_update_slave_status(slave, status[i]);
if (ret < 0)
	dev_warn(&slave->dev, "Update Slave status failed:%d\n", ret);

You absolutely want to know which of these two cases failed, but with
your changes they now look rather identical except for the order of
words. one would be 'failed to update status' and the other 'update
status failed'.

What is much better is to know WHEN this failure happens, then folks
looking at logs to fix a problem don't need to worry about precise
wording or word order.

It's a constant battle to get meaningful messages that are useful for
validation/integration folks, and my take is that it's a
windmill-fighting endeavor. The function name is actually more useful,
it's not an implementation detail, it's what you're looking for when
reverse-engineering problematic sequences from a series of CI logs.

>>>> Replacing 'with status' by ":" is fine, but do we really care about 10
>>>> chars in a log?
>>>
>>> It's not primarily about the numbers of characters but about consistency.
>>
>> I am advocating for inclusion of __func__ everywhere...It's simpler for
>> remote support and bug chasing.

I meant everywhere in SoundWire. Other subsystems may have different
views and different observability tools, that's fine.

> A quick grep seems to suggest you're in a small minority here with some
> 5k of 65k dev_err() including __func__.
> 
> [ And there's only 55 out of 750 dev_err() like that in
> drivers/soundwire, which is inconsistent at best. ]

As you mentioned yourself, the asynchronous nature of the SoundWire
probe/attachment/interrupts makes it difficult to reverse-engineer, and
we want to err on the side of MORE information.

Also not all dev_err() are equal, most are part of paranoid checks and
never used. An example above is the sysfs log, we've never seen it happen.

That's different to changes that impact probe and interrupts which will
fail at some point on new platforms. It's not an academic statement,
I've spent most of my day chasing two such issues.

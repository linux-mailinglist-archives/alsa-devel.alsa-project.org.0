Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBBF8FD2A9
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2024 18:17:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C645DEC;
	Wed,  5 Jun 2024 18:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C645DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717604240;
	bh=yCiYjdLP/0ggbp3f8crR43qIT/LJ5VLH3f5mgkoJ3BY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BZSbqpAZKqnK5+EVFIQwCopMTvttfS5RY1BIujZHXk/S4DDT7+d3GmGumLzwuCzRe
	 BwByfkAIHACCJi1zfhTfPA20Wwid3E30F+QjAN+H98s0lAOs1GQpo+ddjUvjalTNjU
	 6QbY+MyqFumsQgSe3yGEjXayhLWdVG9m8rLZAGHE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65E09F805A1; Wed,  5 Jun 2024 18:16:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8579FF805A0;
	Wed,  5 Jun 2024 18:16:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95BD3F802DB; Wed,  5 Jun 2024 18:16:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6D3CF8003A
	for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2024 18:16:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6D3CF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XkPYHjLS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717604169; x=1749140169;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yCiYjdLP/0ggbp3f8crR43qIT/LJ5VLH3f5mgkoJ3BY=;
  b=XkPYHjLSYtqri48AP0S4U3a8WnBUgTLgyCskxD6tvqlozbZW/HFGbYOg
   n4qJW7pB8N6m8mZposeeIYf+VUnWXmVUgFf1L3fJBA1sPXXFGT9tcoluF
   JRGC1GrhVB2nnPjpK5ZuvPWjs84gitfYZ/z3YJhruu14Aod6ocYp3BjDM
   eRBb2kC6rho9bLBwmbvWJIDM/rBvzRigQ0KL7B0BKha8eZTSJKoKAqb+q
   WiNyMq8QW3YgfEgxgV/tcz8jY9Ymy1vLXtbmar8kPTi0Oo+bRj4bH5wmd
   F5+H3a7c5DaMT5BlKnM7XKYOZCS7w8zLt0F4x7D875DHC8Ta3jDWRQC6w
   A==;
X-CSE-ConnectionGUID: GzvL9oqLQfGv5nuiP3qSkA==
X-CSE-MsgGUID: 8EHGUSYaSXmcBuBMCGKeAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="36759660"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000";
   d="scan'208";a="36759660"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 09:16:04 -0700
X-CSE-ConnectionGUID: TYOkIvKMQjeY7IHK4Kbjww==
X-CSE-MsgGUID: XONLBmVrSfehJOBlMRjncg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000";
   d="scan'208";a="37575909"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.246.201])
 ([10.245.246.201])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 09:16:01 -0700
Message-ID: <25ff111f-039d-4280-b604-ad3d2b9933fb@linux.intel.com>
Date: Wed, 5 Jun 2024 18:15:58 +0200
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
 <0d15954f-0158-4a56-afef-f0d043135146@linux.intel.com>
 <ZmBWBrJDRjPn6TpA@hovoldconsulting.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZmBWBrJDRjPn6TpA@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3UNUXRFMEM56OYP6UWUGHFHIZQKPR73M
X-Message-ID-Hash: 3UNUXRFMEM56OYP6UWUGHFHIZQKPR73M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3UNUXRFMEM56OYP6UWUGHFHIZQKPR73M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/5/24 14:11, Johan Hovold wrote:
> On Tue, Jun 04, 2024 at 05:07:39PM +0200, Pierre-Louis Bossart wrote:
>> \
>>>>>>> @@ -123,7 +123,7 @@ static int sdw_drv_probe(struct device *dev)
>>>>>>>  	/* init the dynamic sysfs attributes we need */
>>>>>>>  	ret = sdw_slave_sysfs_dpn_init(slave);
>>>>>>>  	if (ret < 0)
>>>>>>> -		dev_warn(dev, "Slave sysfs init failed:%d\n", ret);
>>>>>>> +		dev_warn(dev, "failed to initialise sysfs: %d\n", ret);
>>>>>>>  
>>>>>>>  	/*
>>>>>>>  	 * Check for valid clk_stop_timeout, use DisCo worst case value of
>>>>>>> @@ -147,7 +147,7 @@ static int sdw_drv_probe(struct device *dev)
>>>>>>>  	if (drv->ops && drv->ops->update_status) {
>>>>>>>  		ret = drv->ops->update_status(slave, slave->status);
>>>>>>>  		if (ret < 0)
>>>>>>> -			dev_warn(dev, "%s: update_status failed with status %d\n", __func__, ret);
>>>>>>> +			dev_warn(dev, "failed to update status: %d\n", ret);
>>>>>>
>>>>>> the __func__ does help IMHO, 'failed to update status' is way too general...
>>>>>
>>>>> Error messages printed with dev_warn will include the device and driver
>>>>> names so this message will be quite specific still.
>>>>
>>>> The goal isn't to be 'quite specific' but rather 'completely
>>>> straightforward'. Everyone can lookup a function name in a xref tool and
>>>>  quickly find out what happened. Doing 'git grep' on message logs isn't
>>>> great really, and over time logs tend to be copy-pasted. Just look at
>>>> the number of patches where we had to revisit the dev_err logs to make
>>>> then really unique/useful.
>>>
>>> Error message should be self-contained and give user's some idea of what
>>> went wrong and not leak implementation details like function names (and
>>> be greppable, which "%s:" is not).
>>
>> "Failed to update status" doesn't sound terribly self-contained to me.
>>
>> It's actually a great example of making the logs less clear with good
>> intentions. How many people know that the SoundWire bus exposes an
>> 'update_status' callback, and that callback can be invoked from two
>> completely different places (probe or on device attachment)?
>>
>> /* Ensure driver knows that peripheral unattached */
>> ret = sdw_update_slave_status(slave, status[i]);
>> if (ret < 0)
>> 	dev_warn(&slave->dev, "Update Slave status failed:%d\n", ret);
>>
>> You absolutely want to know which of these two cases failed, but with
>> your changes they now look rather identical except for the order of
>> words. one would be 'failed to update status' and the other 'update
>> status failed'.
>>
>> What is much better is to know WHEN this failure happens, then folks
>> looking at logs to fix a problem don't need to worry about precise
>> wording or word order.
>>
>> It's a constant battle to get meaningful messages that are useful for
>> validation/integration folks, and my take is that it's a
>> windmill-fighting endeavor. The function name is actually more useful,
>> it's not an implementation detail, it's what you're looking for when
>> reverse-engineering problematic sequences from a series of CI logs.
> 
> Just add "at probe" to differentiate the two cases if you really think
> this is an issue:
> 
> 	dev_warn(dev, "failed to update status at probe: %d\n", ret);

__func__ would provide equivalent functionality, only more precise...
I guess it's time for Vinod and Bard to chime in.

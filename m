Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 679EB76D372
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 18:12:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ED5BDE;
	Wed,  2 Aug 2023 18:11:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ED5BDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690992725;
	bh=aRvPKihYU01ClMmJrv3NjPtCS5U5U3Y4gLPnfM64+LI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ypv4E2adyjSKfINcAr1FDYGXeVmrCmdt1RVjTcyE85/f77wJ8LIGyzwJUPwwaZmpn
	 1pdXx210gmXlxXC4nSvwRTJL70WNNF9/jeC8pqIRntiXhsiz54fifa9Q1Yy9VrX1Ts
	 mN6C/s6Mm+AX65nFipT7KTWzZZaB4Vgu3PIakoqk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99952F802BE; Wed,  2 Aug 2023 18:11:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58B46F80149;
	Wed,  2 Aug 2023 18:11:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F959F8025A; Wed,  2 Aug 2023 18:11:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0AA6F80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 18:10:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0AA6F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kajTOsZO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690992666; x=1722528666;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aRvPKihYU01ClMmJrv3NjPtCS5U5U3Y4gLPnfM64+LI=;
  b=kajTOsZOQIWtEXhbPM1w5dsnAm+3PXUXd/jF9UIbxsm5RwZ+97O053jM
   qXy+cTQOTUsnJ0NTOXhZu8WHZQ+9YEkf1DIH0+4VZvfbne2w5Obt2nx5W
   ogokKmcZWB2KEhJpeaCLo6y63ZwcgG3OXo4633yCs+QPxHO6MLMkHB2MZ
   xzu4VzboB9xqqCdQIrcyxKYhScb73oLUqWht3hPgXQTz2zrmZbLM8wZIF
   u3QwSWEr2orvIn4XHc0ZLWFF9VmU97socAeC95KCX3GjMTJApSI7OA8Ie
   YtrL/UVJVFIQC9epP+QYhu80Mt6vyRXU2MNQP43Pnn+yph1htu5vPYGGV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="359663604"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="359663604"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 09:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="706226139"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="706226139"
Received: from rickylop-mobl1.amr.corp.intel.com (HELO [10.212.125.114])
 ([10.212.125.114])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 09:07:36 -0700
Message-ID: <206f5a15-29f0-ec7c-1b85-50ace8ae7c2f@linux.intel.com>
Date: Wed, 2 Aug 2023 11:07:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH 1/5] PCI: add ArrowLake-S PCI ID for Intel HDAudio
 subsystem.
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Bjorn Helgaas <helgaas@kernel.org>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20230802150105.24604-2-pierre-louis.bossart@linux.intel.com>
 <20230802155226.GA59821@bhelgaas> <87fs51cu86.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87fs51cu86.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AKAHZHUPLVN32BCPX65JZOFTLAP5YODS
X-Message-ID-Hash: AKAHZHUPLVN32BCPX65JZOFTLAP5YODS
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AKAHZHUPLVN32BCPX65JZOFTLAP5YODS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/2/23 10:57, Takashi Iwai wrote:
> On Wed, 02 Aug 2023 17:52:26 +0200,
> Bjorn Helgaas wrote:
>>
>> On Wed, Aug 02, 2023 at 10:01:01AM -0500, Pierre-Louis Bossart wrote:
>>> Add part ID to common include file
>>
>> Please drop period at end of subject and add one at the end of the
>> commit log.
>>
>> Also mention the drivers that will use this new #define; looks like
>> hda_intel.c and ...
>>
>> Well, actually, I only see that one use, which means we probably
>> shouldn't add this #define to pci_ids.h, per the comment at the top of
>> the file.  If there's only one use, use the hex ID in the driver (or
>> add a #define in the driver itself).
> 
> Judging from the previous patterns, the same ID could be required for
> ASoC SOF driver, too, which isn't included in this patch set.  In
> that case, it's worth to put to pci_ids.h.
> (OTOH, it can be done at a later stage, too.)

I am not following. we just agreed a couple of weeks ago to record ALL
Intel/HDaudio PCI IDs in the same pci_ids.h include file.

ArrowLake-S is the first addition to first file after the work done by
Cezary/Amadeusz. Yes it's required to be added since it'll be used in
other parts later on. But even if there was ONE use of this PCI ID, why
would we not add it for consistency to the global pci_ids.h file?
Takashi's hda_intel.c file would look really bad if we have a mix of
single-use PCIs and shared ones...

Oh and heads-up that I have a change for LunarLake that will require
Mark to pull the branch from Takashi :-)

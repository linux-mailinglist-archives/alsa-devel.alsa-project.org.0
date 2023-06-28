Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E07467415E7
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 17:59:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4429B7F8;
	Wed, 28 Jun 2023 17:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4429B7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687967966;
	bh=K5zT2FY0Az4cbHZonZ/hBNeNzPWJNFzal6qbbQFy0DU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oDtfZTXAGOvXd5nu/Nx89PLWGPjeyLAOzd0rcND65TPg41nCU3sHOXuD87j5vl3ee
	 ED+yth8idKKL7LtYJqvCFj4kUGZinKSh3yzbh0s8cqkDMzgA0Id9PP4Y0bj1ofGDYR
	 l4VftKpzpEBo/BKARi9FSSsej558S1SYVA5g09vs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F944F80124; Wed, 28 Jun 2023 17:58:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A928DF80212;
	Wed, 28 Jun 2023 17:58:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F03CF80246; Wed, 28 Jun 2023 17:58:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2ED3FF80093
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 17:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ED3FF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=W7PUPRPf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687967887; x=1719503887;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=K5zT2FY0Az4cbHZonZ/hBNeNzPWJNFzal6qbbQFy0DU=;
  b=W7PUPRPfNTQfBaw43z7wxJ5Ge9KYpb2pZh5PJZy4xnCcuHDJnajEEHCQ
   QVADkpUsJrsoEQQluSyeIALFYEM368mfgwkZ1WH2CRfH243lO44EiV/w0
   ucbPzxarreo7cCPAAAduD5jUI0OSj1B2BMYCsq4uQN2lk/520GOTBukbR
   WmpW3ip2Zmi6W8G9X8ExOSHxp1Nb33q5JDyfJsG2yPPCq5Xo5eVdqhtVA
   iL+81koH5mRHmGJOU14CqgvV9fZZtx0TrwiNoKj5F7P7a2Bo4CYB79rQJ
   o2R6LeZvAb/MWj5TDuBWT5GBbw4RR+IsjMCEDvzRqStYYHcm5IiDdTpE1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="448269763"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="448269763"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 08:58:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="841122398"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="841122398"
Received: from sdiskin-mobl.ger.corp.intel.com (HELO [10.251.217.207])
 ([10.251.217.207])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 08:57:59 -0700
Message-ID: <bbe9f772-e049-4ad3-18aa-cca0b793439f@linux.intel.com>
Date: Wed, 28 Jun 2023 17:57:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [RFC PATCH 0/8] PCI: Define Intel PCI IDs and use them in drivers
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
 <ZJxIZGV4+5Al0CpW@smile.fi.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZJxIZGV4+5Al0CpW@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YOPAZ5JKVF33OIMWNGVJ7HKPYPM6EKPZ
X-Message-ID-Hash: YOPAZ5JKVF33OIMWNGVJ7HKPYPM6EKPZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YOPAZ5JKVF33OIMWNGVJ7HKPYPM6EKPZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/28/23 16:49, Andy Shevchenko wrote:
> On Wed, Jun 28, 2023 at 10:51:27PM +0200, Amadeusz Sławiński wrote:
>> PCI IDs for Intel HDA are duplicated across quite a few drivers, due to
>> various configurations and historical reasons. Currently almost all uses
>> of HDA PCI IDs have corresponding comment telling which platform it is.
>> Additionally there are some inconsistencies between drivers about which
>> ID corresponds to which device.
>>
>> Simplify things, by adding PCI IDs to global header and make use of them
>> in drivers. This allows for removal of comments by having IDs themselves
>> being self explanatory. Additionally it allows for removal of existing
>> inconsistencies by having one source of truth.
> 
> I'm in favour of this series. It allows to use PCI_DEVICE_DATA() in many places.
> With that said, I think you can also add some more definitions to PCI IDs header
> for the sake of being able to use that macro.

I don't have any objections on the change.

The big open is how we add new definitions without a 3-way deadlock
between PCI, sound and ASoC trees, and how those definitions can be
added to the -stable trees.

This isn't an hypothetical case, we have 2 pending submissions for
LunarLake [1] and ArrowLake [2] which will be provided as soon as the
merge window closes.

It's not clear to me if Bjorn is ok to let those audio-specific PCI IDs
go the audio trees, and how things would work between Mark and Takashi.

[1] https://github.com/thesofproject/linux/pull/4425
[2] https://github.com/thesofproject/linux/pull/4437

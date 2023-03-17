Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE9E6BEB8A
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 15:41:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52685ED7;
	Fri, 17 Mar 2023 15:40:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52685ED7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679064095;
	bh=gYikGmjqXd8yRH3n31ijvSNc3r4gAamacT5gAoDTbZ8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rcomcJKjhA99XUoqvsc5P116X8CYudAWn/dWmLF8RE8K1NKu7c5DaUdUCVemLkOMg
	 ZqtlcGOcFlbc0Er5vamAuSz0P7wp6/sicmA15tBgBtCURFHT8pkJCIiEUqAPdbhYDb
	 8hpK2mtYwc+9OO3nc3/P9kxwuzjUjIdNt6yQjhkU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15EB0F8032D;
	Fri, 17 Mar 2023 15:40:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18D03F80423; Fri, 17 Mar 2023 15:40:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AD95F80272
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 15:40:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AD95F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jzDBzIdF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679064034; x=1710600034;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gYikGmjqXd8yRH3n31ijvSNc3r4gAamacT5gAoDTbZ8=;
  b=jzDBzIdF1oerhjO3HBCO6aazCA/6G4cLEl0ejjYRSs/wEr/H72l3AYos
   uWkUWeU0rWMJKI6aiPJDFkbi9kSKwAT/6guxxMtKL0kDk6U9Ra5Eac2/1
   dYznKSPvOEqUEMp1SJJV2A/uIytQ/Cm/LWPPyQCcdx6VBmxodVr/IPxpI
   ep1Movw5nhdD9q5DGva79lndjjRLRvyyQ4FmFovpyRECebMD2ApNN44rG
   Kc//ZCmRW0bEKh22k8JldKJChVmTAi45J/cPDiE7zbYKmbNZa3VoZIJ1T
   SyiWQjQJ3LYDWVxCaAVMD0w93wFJvTBt2rn+1vNVnpPwWkJzWGxV6ROdU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="336973492"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400";
   d="scan'208";a="336973492"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 07:40:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="712777754"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400";
   d="scan'208";a="712777754"
Received: from subhraka-mobl2.amr.corp.intel.com (HELO [10.255.39.136])
 ([10.255.39.136])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 07:40:30 -0700
Message-ID: <2ca6aa55-c367-8d5e-702a-9fb1a518310a@linux.intel.com>
Date: Fri, 17 Mar 2023 09:29:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] soundwire: bus: Update sdw_nread/nwrite_no_pm to
 handle page boundaries
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20230316155734.3191577-1-ckeepax@opensource.cirrus.com>
 <20230316155734.3191577-2-ckeepax@opensource.cirrus.com>
 <447cac77-4cc7-b2a3-23e7-978e1641a401@linux.intel.com>
 <20230317140807.GI68926@ediswmail.ad.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230317140807.GI68926@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SGLJKRNW652AOBFXHO3MUWNVYRTFPXVY
X-Message-ID-Hash: SGLJKRNW652AOBFXHO3MUWNVYRTFPXVY
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SGLJKRNW652AOBFXHO3MUWNVYRTFPXVY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/17/23 09:08, Charles Keepax wrote:
> On Thu, Mar 16, 2023 at 01:46:57PM -0500, Pierre-Louis Bossart wrote:
>>
>>
>> On 3/16/23 10:57, Charles Keepax wrote:
>>> Currently issuing a sdw_nread/nwrite_no_pm across a page boundary
>>> will silently fail to write correctly as nothing updates the page
>>> registers, meaning the same page of the chip will get rewritten
>>> with each successive page of data.
>>>
>>> As the sdw_msg structure contains page information it seems
>>> reasonable that a single sdw_msg should always be within one
>>> page. It is also mostly simpler to handle the paging at the
>>> bus level rather than each master having to handle it in their
>>> xfer_msg callback.
>>>
>>> As such add handling to the bus code to split up a transfer into
>>> multiple sdw_msg's when they go across page boundaries.
>>
>> This sounds good but we need to clarify that the multiple sdw_msg's will
>> not necessarily be sent one after the other, the msg_lock is held in the
>> sdw_transfer() function, so there should be no expectation that e.g. one
>> big chunk of firmware code can be sent without interruption.
>>
> 
> I will update the kdoc for nread/nwrite to specify that
> transactions that cross a page boundry are not expected to be
> atomic.

Sounds good.

>> I also wonder if we should have a lower bar than the page to avoid
>> hogging the bus with large read/write transactions. If there are
>> multiple devices on the same link and one of them signals an alert
>> status while a large transfer is on-going, the alert handling will
>> mechanically be delayed by up to a page - that's 32k reads/writes, isn't it?
>>
> 
> I think its 16k, but I would be inclined to say this is a
> separate fix. The current code will tie up the bus for longer
> than my fix does, since it only calls sdw_transfer once, and it
> will write the wrong registers whilst doing it. Also to be clear
> this wasn't found with super large transfers just medium sized
> ones that happened to cross a page boundry.
> 
> If we want to add some transaction size capping that is really
> a new feature, this patch a bug fix. I would also be inclined
> to say if we are going to add transaction size capping, we
> probably want some property to specify what we are capping to.

Yes indeed, this would be a new feature. I think this should be a
manager property, depending on which peripherals are integrated and what
latencies are expected.

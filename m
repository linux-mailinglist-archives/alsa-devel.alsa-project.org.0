Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D756F696DCD
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 20:25:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 177CBDF5;
	Tue, 14 Feb 2023 20:24:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 177CBDF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676402714;
	bh=YaJ0/vzyPE93lfO9brhHqKXTla+RNyrMuB6BfPzFkHk=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WXk9R9P+NMP3rKX8XMu7Lqy5ytz4URjwVYfIz2Fre8P3S1l52hjuD0ZMPYZDib5Fb
	 rYlSBfowJ2DltDGqfaDha4FEgvH47zVpSbndt7T+FB0QNaBQtl4lpc7776U3Xwdt31
	 Vnml7s5rpMx2O6iOeTkXY1s4DqIoj1UR1NJqSQq4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91ED2F80548;
	Tue, 14 Feb 2023 20:23:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D701F804B2; Tue, 14 Feb 2023 20:23:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09F13F8047C
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 20:22:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09F13F8047C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jaaxU4I0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676402581; x=1707938581;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YaJ0/vzyPE93lfO9brhHqKXTla+RNyrMuB6BfPzFkHk=;
  b=jaaxU4I0a/i2JNIUumh+fC+tx8UkIHRPcE89Z5fdWIhg969tMIVeZvfj
   ouu5hMjvgVcEbKR133M1HWNKBvpfoNdDQOg5Qw+OXUJi+aP3eN2NQm03l
   bwS1++WBUM3mOobjHkbq8JEFtV0x59tt4bxi6+EoEZD1DNxFy9h47HjZA
   gJR2nZq3H1ZbOGCPgyqk7I1QCuXArQKbB3jhALIM1S+nUBz7nXEKJyLTi
   MMsmFGQC4hz7wzlIjV6pTZ96oPTMXWJfKj231RIcuNUT8/t38NkHNHWFE
   p7qj53fOMBcNmLamFWhJJlwBK8YgrMiY8yjLb8xwOATw0UOsbOX9n0eDl
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="314893726"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000";
   d="scan'208";a="314893726"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 11:22:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="778485245"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000";
   d="scan'208";a="778485245"
Received: from parthgup-mobl2.amr.corp.intel.com (HELO [10.209.175.23])
 ([10.209.175.23])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 11:22:53 -0800
Message-ID: <e32e9508-9c91-b8ab-c862-b861aca8c02c@linux.intel.com>
Date: Tue, 14 Feb 2023 07:35:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH V2 7/8] soundwire: amd: handle soundwire wake enable
 interrupt
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, vkoul@kernel.org
References: <20230213094031.2231058-1-Vijendar.Mukunda@amd.com>
 <20230213094031.2231058-8-Vijendar.Mukunda@amd.com>
 <cd70a91c-231e-1bca-b0ac-4041cba0daad@linux.intel.com>
 <586a9f58-f660-1ac0-0506-91362b25f75d@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <586a9f58-f660-1ac0-0506-91362b25f75d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BZ7MOVEPVZ445NAEFWPVGAJCJKPBD6VZ
X-Message-ID-Hash: BZ7MOVEPVZ445NAEFWPVGAJCJKPBD6VZ
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: amadeuszx.slawinski@linux.intel.com, Mario.Limonciello@amd.com,
 Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 "moderated list:SOUNDWIRE SUBSYSTEM" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BZ7MOVEPVZ445NAEFWPVGAJCJKPBD6VZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



>>>  static void amd_sdw_irq_thread(struct work_struct *work)
>>>  {
>>>  	struct amd_sdw_manager *amd_manager =
>>> @@ -945,6 +952,9 @@ static void amd_sdw_irq_thread(struct work_struct *work)
>>>  	status_change_0to7 = acp_reg_readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
>>>  	dev_dbg(amd_manager->dev, "%s [SDW%d] SDW INT: 0to7=0x%x, 8to11=0x%x\n",
>>>  		__func__, amd_manager->instance, status_change_0to7, status_change_8to11);
>>> +	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK)
>>> +		return amd_sdw_process_wake_event(amd_manager);
>>> +
>> it's not clear what 8to11 might have to do with the wake enable?
>>
>> Can't you have a wake for devices 1..7?
> It can wake any device from 1..11 .
> SoundWire Wake interrupt status bit is part of 8to11 register.

You probably want to explain what status_change_0to7 and
status_change_8to11 actually control, it's not very intuitive for me to
see device 1 interrupt being handled in status_change_8to11?

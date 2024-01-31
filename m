Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5D284511C
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Feb 2024 07:02:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D83E79F6;
	Thu,  1 Feb 2024 07:02:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D83E79F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706767369;
	bh=MNDj5IWjo3jJNGSHHfjkIbLwbF2Xv1SZe6qfPAyjhiM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U+3FxpWdetj/SERLJbE4ZBcsbjsoaYw5WF7RR/O33gcfVmp6NVTfQt/+h2q67ub/1
	 LToj1bI4CokpBGAMmvpK3JxftJFHa2CgqeRw9k+E96Ik2i7JcMjGHi1y/NAdKR7kpw
	 FLkReaJcKcs6uxsMTRExdnr2tHnImaUZ2SUnM3q8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43A89F80580; Thu,  1 Feb 2024 07:02:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A22EF805A9;
	Thu,  1 Feb 2024 07:02:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0DB0F8055C; Thu,  1 Feb 2024 06:58:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D5FCF804E7
	for <alsa-devel@alsa-project.org>; Thu,  1 Feb 2024 06:58:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D5FCF804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=U/izXkjm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706767114; x=1738303114;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MNDj5IWjo3jJNGSHHfjkIbLwbF2Xv1SZe6qfPAyjhiM=;
  b=U/izXkjmQtbMEOGtnC6IRIz+YPgEkWJ9KUuUli4/gFPJkKFl3NAt+dUi
   3s2MzmSZt1FM9dD/E0ZSw9C/Q3tjrTKykzQbWiL2GmzpR9ZNQgFfzF80u
   WeiDrUDAdD5Wro+3m/m/Ls0vOvd4oJXbunpKmxPDTb5AEjEqbyF6+uJq2
   aj/tE/sb4RDK0I8CaVD8PrL6fMYVPemWr10YLrys4LTR2X38cFOPzNxk+
   P0V8no6RR/Vxgv1pSGmOzggujypxRtqW/9ytxZ7oJMpmYsP+B/1CFMlWS
   sO9gjbkNwZ6A1+U43mj+MCK5QgTL0Xtn8VvavwotI3NYiyoqGKkXqXUWu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17350105"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400";
   d="scan'208";a="17350105"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 21:58:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400";
   d="scan'208";a="23014111"
Received: from tsecasiu-mobl1.amr.corp.intel.com (HELO [10.209.91.60])
 ([10.209.91.60])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 21:58:26 -0800
Message-ID: <e2756783-b279-71c2-f844-4c3a4128bad9@linux.intel.com>
Date: Wed, 31 Jan 2024 08:12:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 2/6] soundwire: sysfs: move sdw_slave_dev_attr_group into
 the existing list of groups
Content-Language: en-US
To: Dan Williams <dan.j.williams@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
References: <2024013025-spoiling-exact-ad20@gregkh>
 <2024013029-afternoon-suitably-cb59@gregkh>
 <65b9d883538fa_5a9dd2946a@dwillia2-mobl3.amr.corp.intel.com.notmuch>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <65b9d883538fa_5a9dd2946a@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XKUQXVJ36AZRPXYWRBGDY6IVVFHE5CPC
X-Message-ID-Hash: XKUQXVJ36AZRPXYWRBGDY6IVVFHE5CPC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XKUQXVJ36AZRPXYWRBGDY6IVVFHE5CPC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> Makes sense. I won't say "looks good" as this file has "slave" all over
> the place, but I checked and it entered the kernel just before the
> CodingStyle changed.

SoundWire 1.2.1 introduced the terms "Manager" and "Peripheral", I had a 
patchset to rename everything maybe two years ago already but it's been 
difficult to add without getting in the way of development and 
backports. Maybe a gradual replacement makes more sense, not sure how to 
go about this.


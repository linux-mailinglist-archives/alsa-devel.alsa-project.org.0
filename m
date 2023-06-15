Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 922F4731E26
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 18:48:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C94B583B;
	Thu, 15 Jun 2023 18:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C94B583B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686847695;
	bh=peYeLn9BGLKhNAB74de+wNh8KFc+idh7Mo+rg1C/Ax4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ROvU+TMSklRHpryBycYjsxbjQ8paRP4jXJVaMndmjdY12ywnaVxjIJlLR8/C68YPV
	 JZ+6iByt19lUFQv6M4iotvMrCb9u8FH/ZgXYCNqrfNiehlYOKl9uNT4EvrLGuOQHsO
	 piOv+YRuVxJo9h3jNk+znjQzQThAaabcT925jOO0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1496AF80093; Thu, 15 Jun 2023 18:46:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F21FF80548;
	Thu, 15 Jun 2023 18:46:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DB61F80149; Thu, 15 Jun 2023 18:46:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8E88F80093
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 18:46:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8E88F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=J42lBcu0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686847589; x=1718383589;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=peYeLn9BGLKhNAB74de+wNh8KFc+idh7Mo+rg1C/Ax4=;
  b=J42lBcu0Cai70e93G1ceQ/81PNLvH3wNrtPpCExf80fHGS0AT4Q/pNCk
   mCQ2pDFyAWfFFOkU14oTJqvuZuQ8wfYt4WPFxZAiqvVqunCnFrotltQBv
   pL0nKWMNuaTP14W+lEVq26OYjAm87PUMvqqn/JROl2qOq4hvUsk+32ULj
   yNOXGDuYHqKaMqL+HN2TjtuTns7oVn/gEikpYpodn4OxUdL8s2GEKlrg1
   RytemgZYVW6BtPOsFesqx/dr1V+6vZNYvpMozvSfxOOhXlQVkErRPdfni
   zLhlYgeKi8myNbRhsClW26ezIxI88gqce8J54BOAS8tP1mnsGRAyFWJqm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="387506771"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400";
   d="scan'208";a="387506771"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 09:46:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="857040464"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400";
   d="scan'208";a="857040464"
Received: from mrejmak-mobl.ger.corp.intel.com (HELO [10.252.36.104])
 ([10.252.36.104])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 09:46:26 -0700
Message-ID: <9eca7ccc-7955-43d3-178a-998d0f430a4c@linux.intel.com>
Date: Thu, 15 Jun 2023 18:46:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] soundwire: stream: Make master_list ordered to
 prevent deadlocks
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20230615141208.679011-1-rf@opensource.cirrus.com>
 <20230615141208.679011-2-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230615141208.679011-2-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: R2QLXRO6KWOZ4ISOJM77LOBFFVEMZZ7T
X-Message-ID-Hash: R2QLXRO6KWOZ4ISOJM77LOBFFVEMZZ7T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R2QLXRO6KWOZ4ISOJM77LOBFFVEMZZ7T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/15/23 16:12, Richard Fitzgerald wrote:
> Always add buses to the stream->master_list in a fixed order.
> The unique bus->id is used to order the adding of buses to the
> list.
> 
> This prevents lockdep asserts and possible deadlocks on streams
> that have multiple buses.
> 
> sdw_acquire_bus_lock() takes bus_lock in the order that buses
> are listed in stream->master_list. do_bank_switch() takes all
> the msg_lock in the same order.
> 
> To prevent a lockdep assert, and a possible real deadlock, the
> relative order of taking these mutexes must always be the same.
> 
> For example, if a stream takes the mutexes in the order
> (bus0, bus1) lockdep will assert if another stream takes them
> in the order (bus1, bus0).
> 
> More complex relative ordering will also assert, for example
> if two streams take (bus0, bus1) and (bus1, bus2), then a third
> stream takes (bus2, bus0).
> 
> Previously sdw_stream_add_master() simply added the given bus
> to the end of the list, requiring the caller to guarantee that
> buses are added in a fixed order. This isn't reasonable or
> necessary - it's an internal implementation detail that should
> not be exposed by the API. It doesn't really make sense when
> there could be multiple independent calling drivers, to say
> "you must add your buses in the same order as a different driver,
> that you don't know about, added them".

Makes sense to me. The other way to look at this is that the notion of
'stream' and dailink are virtually synonyms, and 'sdw_stream_add_master'
is called from each DAI of a dailink, hence in a fixed order. But
nothing really defines how dailinks include the dais, and in a
hypothetical case with multiple controllers, each with multiple links,
there would be an ambiguity anyways so using the ida-allocated bus->id
is a good solution indeed.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

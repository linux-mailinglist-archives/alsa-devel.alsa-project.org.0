Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E97C06B4DD1
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 17:59:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F30C518DA;
	Fri, 10 Mar 2023 17:58:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F30C518DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678467543;
	bh=i2ac7HdZrtUnY/gA1NCVmTfRzi9Lx/7d4lpHUaUwla0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cmLJNXNSq7f22iTu/gREsmbi/GmnHuI2A9mbofu3Q9VU961Kch0708OiKlAT8MPZl
	 X9axaIfY8jTnCeM5/j5mj81dsogGVGVhX+PCp0P/mXeHnDZ7kJi4e8jH+nKRJG2OUQ
	 FqJugqyz2OxdkqHYxuG8viJmEM5aXHuGrYS4ojwQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77623F804B1;
	Fri, 10 Mar 2023 17:57:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66BA8F80431; Fri, 10 Mar 2023 17:57:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CB17F80236
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 17:57:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CB17F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KtbaJ0u3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678467435; x=1710003435;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=i2ac7HdZrtUnY/gA1NCVmTfRzi9Lx/7d4lpHUaUwla0=;
  b=KtbaJ0u3PxwYdl3jjYbkTDXS/fuO1p4xBBU0QaObprOKxe+yaZ0raDmT
   myOVqEWbqUmZu3QnX8aCa4Om7PGedXd+Y0Ne6v3UACWJArBMoAibIIkPF
   xGl/YnmWtgMIiZb4qQc5GoN8rDFmZLt0zqZBhB3cuozN3M7j1PEstqvZI
   RykOVa0aVQsLNrjCBbE9DBl1XpHAgkjIWwlmWYFwdoyMTMpUSTybJ2Gzx
   lSOPUwjs1ME2m28vh2WNWyPToWDIZ9c9NDLAaaGkDHCuA/y7/VGw/hZzy
   /JRJzwF9tn7aq6mOtelCVJu9AsCKnp74t/i4cae9DqgRHD/w+4s0t9AJR
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="334249276"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400";
   d="scan'208";a="334249276"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 08:55:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="801660804"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400";
   d="scan'208";a="801660804"
Received: from ikably-mobl.amr.corp.intel.com (HELO [10.255.33.96])
 ([10.255.33.96])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 08:54:57 -0800
Message-ID: <235cf556-10a9-c461-e4bf-700ab8c32d51@linux.intel.com>
Date: Fri, 10 Mar 2023 10:45:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH V7 2/8] soundwire: amd: Add support for AMD Manager driver
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
References: <20230310162554.699766-1-Vijendar.Mukunda@amd.com>
 <20230310162554.699766-3-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230310162554.699766-3-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XCMQ5UL34UC47SMP3RTCLRX7YUKW4BAH
X-Message-ID-Hash: XCMQ5UL34UC47SMP3RTCLRX7YUKW4BAH
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com,
 amadeuszx.slawinski@linux.intel.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, claudiu.beznea@microchip.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XCMQ5UL34UC47SMP3RTCLRX7YUKW4BAH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/10/23 10:25, Vijendar Mukunda wrote:
> AMD ACP(v6.x) IP block has two SoundWire manager devices.
> Add support for
>   - Manager driver probe & remove sequence
>   - Helper functions to enable/disable interrupts,
>     Initialize sdw manager, enable sdw pads
>   - Manager driver sdw_master_ops & port_ops callbacks
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

Apart from debatable style issues in the way local variables are exposed
(inconsistent use of multiple variables/line, random variations to
reverse x-mas tree), this looks good enough to me for an initial
contribution.

Thanks for bearing with my feedback.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


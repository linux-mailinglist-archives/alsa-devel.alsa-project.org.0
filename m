Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B052D6A47A5
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Feb 2023 18:15:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A729828;
	Mon, 27 Feb 2023 18:14:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A729828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677518099;
	bh=LPgBiQJ8TCTE4vMyNZcNi9azz5E5qNaH/wYiASzPZZA=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=djN3u8fKJyMNl3t0iYOVKj85u+kM2ezt1pIHwboFo62pKOeIZLMaiABXZsWoZQzO1
	 v4DP/aw2mVrN5Zd7skk+RuOT5WPvV1p/N3KDbT9ZEAdyukz5294csNGe8wlRwYBfW2
	 qYcmD40Jx3axLrGyYpdXOdT24hbOslrJ8w3fC2EY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AEC8CF80527;
	Mon, 27 Feb 2023 18:13:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA166F8051B; Mon, 27 Feb 2023 18:13:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38EBAF8049C
	for <alsa-devel@alsa-project.org>; Mon, 27 Feb 2023 18:13:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38EBAF8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=c5HI6dVm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677517986; x=1709053986;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LPgBiQJ8TCTE4vMyNZcNi9azz5E5qNaH/wYiASzPZZA=;
  b=c5HI6dVmSBR1MIWH0kYh6DZO55R324uNSqcAr5uUFZPg6I5MlXcvrWRI
   7CwN1HAT0t+/w/cPoC62pe3EX/yT7w/T/G/RALprvEFdYgRvW4BDqrggW
   yRa8iBxZD+eYZlZbyKMydmw1IHOTa+RHsFTtZr9ZfKpkmriA6EZyGNYqv
   aohmOI8qYwqKghbY7xqtccADWX5IRHEBhA6fM9mwO4F3h9rBeOpAa6YNc
   vIlcp97Ea5cNR4nrk+FZErsu4shD/NJjSyJaGrFRGoEG1swTEw1y0jFJe
   A05E0WsgEiHz69J5crIb0c0+tqqRRdL3vI3STz5+WoRZfoZ0fc0sMx0LG
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="313583709"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400";
   d="scan'208";a="313583709"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 09:08:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="651302252"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400";
   d="scan'208";a="651302252"
Received: from jaidenno-mobl.amr.corp.intel.com (HELO [10.212.85.4])
 ([10.212.85.4])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 09:08:30 -0800
Message-ID: <7cbc9556-c0a3-91d7-effe-785b282eb160@linux.intel.com>
Date: Mon, 27 Feb 2023 11:38:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH V4 5/8] soundwire: amd: add SoundWire manager interrupt
 handling
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
References: <20230227154801.50319-1-Vijendar.Mukunda@amd.com>
 <20230227154801.50319-6-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230227154801.50319-6-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RZMWSLCRWRZYQV2BSUTIQS2ANDV7H67A
X-Message-ID-Hash: RZMWSLCRWRZYQV2BSUTIQS2ANDV7H67A
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
 Arungopal.kondaveeti@amd.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZMWSLCRWRZYQV2BSUTIQS2ANDV7H67A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/27/23 10:47, Vijendar Mukunda wrote:
> Add support for handling SoundWire manager interrupts.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Signed-off-by: Mastan Katragadda <Mastan.Katragadda@amd.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

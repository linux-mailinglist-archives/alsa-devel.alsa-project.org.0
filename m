Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9368958A74
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 16:59:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 665D97F8;
	Tue, 20 Aug 2024 16:59:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 665D97F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724165970;
	bh=3nlRWUUx0+APZmAWni+foivbTUtkLG+44ynTv/C+yYk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SH5ppJIjmYnmt/ejITFyTFpObNV7TiEGsy/HBwZauaHiEPBKSCOkpY54Qbg+Jk0D9
	 i1/sygMINef6wYRQk8tsrB6J6dKI122clTJ3MjkD5ZgGDlBEUfCqAZ4cWm7k06Mn8M
	 XlV+BVqtok1TVOFT+JtbIVnP+EmNK4kcCPYr3sOk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3986AF805AE; Tue, 20 Aug 2024 16:58:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AABA2F805AE;
	Tue, 20 Aug 2024 16:58:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C929DF80494; Tue, 20 Aug 2024 16:58:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC59BF8014C
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 16:58:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC59BF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZKQLkS/C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724165926; x=1755701926;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3nlRWUUx0+APZmAWni+foivbTUtkLG+44ynTv/C+yYk=;
  b=ZKQLkS/C40fovlmO6ilYRg6hihKLD7Olzd4/l37AFSYKpG939/7TKGXg
   o+JRB59+zr/eYSXIjbqL8F17KpbISul9yDsqQhzxuT0vQoFE/mnZYGmyV
   JMkljEYfHzncn7fYwbCQWTRIctAl6WccTNeDnzTWDXRWCUPCPNmFiHNPx
   wziSnFCNi1IE2LgTVcn2X4UvEPJxix6HfJoO213GmvTDKP6QlzmJnAYtC
   /EkAcRtEdEAmJqCImel9L0G42TYQDa3HdN/luPNv9NsNlpnKBxv6fudmJ
   g81wPH+TfC5cOqt232ew+sEKBbzTpaAoUKLm9ulgh52vAMMZ0M2IyyjLB
   g==;
X-CSE-ConnectionGUID: XF4g12VnSu6yIe2W+p7cKw==
X-CSE-MsgGUID: +a1tsv3oROaR15dwrmbeLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22328665"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600";
   d="scan'208";a="22328665"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 07:58:40 -0700
X-CSE-ConnectionGUID: 03bGcDz6TpGOHvi9j1Qmvw==
X-CSE-MsgGUID: 4U8UvY+bR0qIOucEK51hSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600";
   d="scan'208";a="61064699"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.176])
 ([10.245.246.176])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 07:58:33 -0700
Message-ID: <fe930297-a6f6-43cb-86cf-d49939dc5090@linux.intel.com>
Date: Tue, 20 Aug 2024 16:58:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 vinod.koul@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, srinivas.kandagatla@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 vijendar.mukunda@amd.com, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
 <be277abb-af6c-470f-8237-17f45bd990b8@linux.intel.com>
 <09a5b041-62a8-4c85-9885-045079db796f@sirena.org.uk>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <09a5b041-62a8-4c85-9885-045079db796f@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AYLH6N7VOYINQWKYNYF55IJYNPDJZ6IY
X-Message-ID-Hash: AYLH6N7VOYINQWKYNYF55IJYNPDJZ6IY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AYLH6N7VOYINQWKYNYF55IJYNPDJZ6IY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/20/24 13:53, Mark Brown wrote:
> On Tue, Aug 20, 2024 at 09:48:05AM +0200, Pierre-Louis Bossart wrote:
> 
>>> This feels a lot like it could map onto the regmap async interface, it
>>> would need a bit of a rework (mainly that currently they provide
>>> ordering guarantees with respect to both each other and sync I/O) but
>>> those could be removed with some care) but it's got the "here's a list
>>> of I/O, here's another call to ensure it's all actually happened" thing.
>>> It sounds very much like how I was thinking of the async API when I was
>>> writing it and the initial users.
> 
>>> It's this bit that really got me thinking it could fit well into regmap.
> 
>> Do I get this right that these async capabilities could be used to
>> enable this faster SoundWire protocol, but the regular regmap_write()
>> could still happen in parallel with these async transfers? This could be
>> useful if e.g. there's a jack detection while downloading firmware for
>> another function.
> 
> As far as the regmap core is concerned, yes - with SPI we do wind up
> with ordering but that's because the SPI sync API is a thin wrapper
> around the SPI async API rather than anything regmap does.

ok. I am struggling a bit to adjust the plumbing that was obviously
defined for SPI.

The regmap async_write() doesn't have any wait, but there's a notifier
that needs to be called by *something* that waits. I think the SPI layer
has a set of kthreads but in our case we could just rely on a a
workqueue after 1ms or something and do the wait then for the DMAs to
complete and finally call the notifier to wake-up the regmap stuff.

>> The only thing that would need to be extended is that we'd need
>> additional callbacks to check if the protocol is supported on a given
>> hardware/firmware platform, and if there's no audio stream. In these
>> cases the async writes would be demoted to regular writes. Otherwise the
>> bus would be locked to make sure no reconfiguration takes place while
>> the firmware download happens, and unlocked when the transfer ends.
> 
> Those callbacks seem reasonable.  We already do the demotion to sync for
> buses that don't have async, it'd just need to be made dynamic.

sounds good.


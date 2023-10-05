Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 302317B9CF5
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 14:26:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93F2ABC0;
	Thu,  5 Oct 2023 14:25:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93F2ABC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696508785;
	bh=Q31/LRmUHPnliZEY/I/TLopH3gR0VgvYKU2xCR9wHdI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H7ptDkv8sMt1rz92zWLBrDn/wr6m9gPw7QGouzphhPPJjIAxHWmeHSCbAKmMx+r2u
	 3pnptqhWKhdJfWkaOC0VbWR5nPZwBiL6kMOXhCbM6EFWryWD4FFMk5hFyeZSFNbcn3
	 oU3icd+3jYXTV4RCMVXmB3TvS5whZHuwRE3u/1vg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AFF9F80558; Thu,  5 Oct 2023 14:25:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84DF5F80310;
	Thu,  5 Oct 2023 14:25:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D89F4F8047D; Thu,  5 Oct 2023 14:25:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1804FF80166
	for <alsa-devel@alsa-project.org>; Thu,  5 Oct 2023 14:25:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1804FF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ev3tNwfG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696508723; x=1728044723;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=Q31/LRmUHPnliZEY/I/TLopH3gR0VgvYKU2xCR9wHdI=;
  b=ev3tNwfGhYbYmrr02yiKV5Pt6gh7q2HI6vzhclT14uibfEeyICR91SLz
   lG6q0oCr1L4OC1qlyrRGh1TkI4/1WiuyDwsAZaM+j9+VRBYSGigQNr6R9
   4nUJ2HmPL1ZCfRbCyCyUFxWRMCdQ2NWGxrAFD1294ik1jhOLyVYw1ryAV
   ec13Xxfxevn1LW5NN+CJ6QwBJ1/DjzAO1BJWgsxHv0KzmsbjFKTzxoGqC
   YRuIHk5LTMYcM3cmaxFu119C50vN6Ax1o2WkVyXRjuDOMlBfR+/xtzLji
   vyOg5OYX2sz2mvJtjtAQNU1aS6Vti0512iU1bqJY+ti89QyiWzD0xzAVj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="382347795"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200";
   d="scan'208";a="382347795"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 05:24:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="822089057"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200";
   d="scan'208";a="822089057"
Received: from akesselm-mobl.amr.corp.intel.com (HELO [10.212.122.181])
 ([10.212.122.181])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 05:24:40 -0700
Message-ID: <c7fb4ead-13af-438b-a199-c52105545047@linux.intel.com>
Date: Thu, 5 Oct 2023 08:24:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: fix initializing sysfs for same devices on
 different buses
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Philippe Ombredanne <pombredanne@nexb.com>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Mastan Katragadda <Mastan.Katragadda@amd.com>
References: <20231004130243.493617-1-krzysztof.kozlowski@linaro.org>
 <6628a5f6-ed22-4039-b5c2-2301c05c7e3e@linux.intel.com>
 <2023100453-perfected-palm-3503@gregkh>
 <624b044a-1f0f-4961-8b57-cb5346e7b0d3@linux.intel.com>
 <2023100452-craziness-unpopular-7d97@gregkh>
 <04c5911a-a894-44b3-9f0e-fe9e6de203f2@linux.intel.com>
 <d648c3d1-53ac-4021-ac7f-6a81f1a72dd3@sirena.org.uk>
 <bf4ee895-293f-4bc3-ac4b-30df6361e973@linux.intel.com>
Content-Language: en-US
In-Reply-To: <bf4ee895-293f-4bc3-ac4b-30df6361e973@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PPAA6HYTYIUVLOC7P2RWAIROEJAAMXO5
X-Message-ID-Hash: PPAA6HYTYIUVLOC7P2RWAIROEJAAMXO5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PPAA6HYTYIUVLOC7P2RWAIROEJAAMXO5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




> I think we keep circling on the differences between "Controller" and
> "link" (aka bus). A Controller can have one or more links. A system can
> have one or more controllers.
> 
> Intel platforms have one controller and 4 or more links.
> QCOM platforms have one or more controllers with one link each.
> 
> I am not sure how this IDA-generated bus_id helps deal with these two
> cases, since we can't really make any assumptions on how
> controllers/links will be started and probed.
> 
> What we are missing is a hierarchical controller/link definition, IOW a
> controller_id should be given to the master by a higher level instead of
> using an IDA.

Tentative patches to introduce a 'controller_id' that's not an IDA are
here: https://github.com/thesofproject/linux/pull/4616

Initial results are positive for Intel devices. it *should* work for
other devices but I can't test. If folks at Linaro/Qualcomm and AMD can
give it a try, that would be much appreciated.

Thanks.

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0F3690CD8
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 16:24:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64E56DEF;
	Thu,  9 Feb 2023 16:23:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64E56DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675956288;
	bh=u8Vb8/bYrBeWgw+p0XSQUULBRKZVvrASNP/roYXBOOM=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lsuwxi+Es2ggKwYba281WHfgruYQwik1vmOsVIR8vJBYrZDV7aYE/20pmj2aKAQWg
	 9wJsejM7cF0bKSTJ8BNuaaMtfV+3tXFgXk9hqyC4Md28opkqUmBdIuXJlWJHuocdjK
	 YyL8dhB7OpSALAwHHxlElme00cFKbT7oOoYNpfuM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E6D0F80094;
	Thu,  9 Feb 2023 16:23:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44577F800E4; Thu,  9 Feb 2023 16:23:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33CFEF80027
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 16:23:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33CFEF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DzwBx3LW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675956230; x=1707492230;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=u8Vb8/bYrBeWgw+p0XSQUULBRKZVvrASNP/roYXBOOM=;
  b=DzwBx3LWQeU6oWP/rhF9XIYZHRNK3C7L4ITBnlTcnSuQMVY3SBlqjlhV
   HE1cxzBwrF+JAhBIftZ5Y7QQXiKVooxqwkkMKw2u8GG5rIFdvuw53iXEI
   S3SfWszIo4d/6kfaUqo+0KLX6MVAG5bWfjaIBmCIDGqgJw6cCH7gEG4Uz
   prY7SiZf6Ut7Oq6sALZcrKTWklTlk2RdLiYI0FZq2QNdrZDtuk4uFTIMt
   qiffiDyobvyyYBI65kVy/k+Qv2mXvVh3VJE+XkvOjf1spmfHdUSjkccgr
   ZXTQf53aBZOa5lR3TJcoyyVkzW/49S+ik5hF7ouqMsSGxllcZ6YstLLKD
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="328771482"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000";
   d="scan'208";a="328771482"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 07:15:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="913156459"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000";
   d="scan'208";a="913156459"
Received: from fpastor-mobl4.amr.corp.intel.com (HELO [10.212.74.130])
 ([10.212.74.130])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 07:15:03 -0800
Message-ID: <f73477e9-b27a-8cc7-dfe9-7208b3522083@linux.intel.com>
Date: Thu, 9 Feb 2023 09:15:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH] ALSA: hda: remove redundant variable in
 snd_hdac_stream_start()
To: Mark Brown <broonie@kernel.org>, Zhang Yiqun <zhangyiqun@phytium.com.cn>
References: <20230209121723.14328-1-zhangyiqun@phytium.com.cn>
 <Y+UD4yg2cgsucnlZ@sirena.org.uk>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Y+UD4yg2cgsucnlZ@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: J3EFVKTV7FDKCCS4U2AY2VNFOT2KS524
X-Message-ID-Hash: J3EFVKTV7FDKCCS4U2AY2VNFOT2KS524
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 tiwai@suse.com, amadeuszx.slawinski@linux.intel.com,
 kuninori.morimoto.gx@renesas.com, ckeepax@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J3EFVKTV7FDKCCS4U2AY2VNFOT2KS524/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/9/23 08:32, Mark Brown wrote:
> On Thu, Feb 09, 2023 at 08:17:23PM +0800, Zhang Yiqun wrote:
>> This 2nd variables are all set as true in treewide. So I think
>> it can be removed for easy understanding.
> 
> Acked-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Btw there's another type of always-true parameter, we have a full_reset
parameter that's not used.

sound/soc/intel/skylake$ git grep  skl_init_chip
skl.c:static int skl_init_chip(struct hdac_bus *bus, bool full_reset)
skl.c:  skl_init_chip(bus, true);
skl.c:                          skl_init_chip(bus, true);
skl.c:  err = skl_init_chip(bus, true);

sound/soc/intel/avs$ git grep  init_chip
core.c:static bool avs_hdac_bus_init_chip(struct hdac_bus *bus, bool
full_reset)
core.c: ret = snd_hdac_bus_init_chip(bus, full_reset);
core.c:         avs_hdac_bus_init_chip(bus, true);
core.c: avs_hdac_bus_init_chip(bus, true);
core.c: avs_hdac_bus_init_chip(bus, true);

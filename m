Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F1A7645EF
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 07:43:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D836C83E;
	Thu, 27 Jul 2023 07:42:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D836C83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690436623;
	bh=HwAWVBPhPifYPtR9YPCU/MvGfTwewwbPzIRftArYbaE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m4K3DEe26/VBkmV9Qka29G+ILKBIhZTCEpr3nTuekskNSHu7CSvpHR1vqcjHUC5Qh
	 yPBi+W+Qic4xMuMCOmUjYqK03yksGWhZgbJrDRAxt5O3ClhR4TfQPf0fFoKLolc9QX
	 4EopGzdIlaEFCrkJEFxmbaCkBWcji5o22cr1NSrU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C8A5F80163; Thu, 27 Jul 2023 07:42:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2D35F80163;
	Thu, 27 Jul 2023 07:42:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D27CFF8019B; Thu, 27 Jul 2023 07:42:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4D19F80153
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 07:42:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4D19F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TcGdAKu2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690436526; x=1721972526;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HwAWVBPhPifYPtR9YPCU/MvGfTwewwbPzIRftArYbaE=;
  b=TcGdAKu2dqKWWN/APP0Az5/q95ftiQw8OQEflDPlppPLbahw05L5Qgno
   M9veQenHR00BjlPM92AQzlXL3PCHADdoFoKn8H2mLqYV7QUr/WNfEe65A
   BdDpCfh/gKw6bV4uedViexR/WMC8OW6Yb1kRQ2qt1IYNghWZcp/FVElSv
   IV2DMfMnPh6J9Y7MWEBRNqQ22Ilu51Oa3N9mvyR9YQhaNwoNgC3VXnGGr
   2kqSvFK0id4n7wqctkit70kgozYrupwf7djWRTjxYGChw3qM9iYqEDy38
   yZCITKiv7hnGpkcjcbobFVZds6s2xr/SpT4bZAzcJIEbYRxu+juANcZHw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="371821135"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200";
   d="scan'208";a="371821135"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 22:41:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="756522634"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200";
   d="scan'208";a="756522634"
Received: from mseillie-mobl.ger.corp.intel.com (HELO [10.249.37.247])
 ([10.249.37.247])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 22:41:55 -0700
Message-ID: <bbf9baf1-d55b-b846-740f-1ed8976b82b4@linux.intel.com>
Date: Thu, 27 Jul 2023 07:41:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] ASoC: Intel: maxim-common: get codec number from ACPI
To: "Liao, Bard" <yung-chuan.liao@linux.intel.com>,
 "Lu, Brent" <brent.lu@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Zhi, Yong" <yong.zhi@intel.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 "Bhat, Uday M" <uday.m.bhat@intel.com>, Terry Cheong
 <htcheong@chromium.org>, "Chiang, Mac" <mac.chiang@intel.com>,
 "R, Dharageswari" <dharageswari.r@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20230720092628.758834-1-brent.lu@intel.com>
 <20230720092628.758834-2-brent.lu@intel.com>
 <ff55e63f-1c17-12ef-57e6-144a5bea4480@linux.intel.com>
 <CY5PR11MB6257FF6D92D524D389B734C19701A@CY5PR11MB6257.namprd11.prod.outlook.com>
 <c1aadbcf-78ab-0566-84e5-8eaa7b418d50@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c1aadbcf-78ab-0566-84e5-8eaa7b418d50@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6YREDYJ65D6LHIZ42WQBBZVT6MFWVRDX
X-Message-ID-Hash: 6YREDYJ65D6LHIZ42WQBBZVT6MFWVRDX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6YREDYJ65D6LHIZ42WQBBZVT6MFWVRDX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/27/23 5:21 AM, Liao, Bard wrote:
> 
> On 7/27/2023 10:14 AM, Lu, Brent wrote:
>>>
>>> max_98390_components[] and max_98390_4spk_components[] are still used
>>>
>>> by sof_rt5682.c, we should remove them in the same patch.
>>>
>>> Maybe combine the 2 patches together?
>>>
>>>
>> I've got your point but these two patches are doing two things: one is 
>> refactor the
>> code and add a detection feature, the other one is removing the quirk. 
>> Not sure if
>> it's proper to merge them.
> 
> The point is that if you remove them and they are still used somewhere,
> 
> you will break the build. i.e. Kernel will not compile if we apply the
> 
> first patch only.

IOW git bisect is broken and that's a big no-no.


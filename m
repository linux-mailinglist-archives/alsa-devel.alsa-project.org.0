Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 787E5764446
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 05:22:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F22283B;
	Thu, 27 Jul 2023 05:22:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F22283B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690428171;
	bh=nPB2w9dSjqlHnzGsCdfKxPajMcJwjwbcBaw3wQ2gZzQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FegellDhWNZK7E3gjbbnZmrU/xcXwqO3rcFXksWhmMlR8kMWRBKWC5ZYgZ5umxKwM
	 zvm/ZHaNbcF9v0FClZ28dVsAPlw3HALaugjNbWRNeHvkIR79meol7vPEN5p6MSFtB4
	 oA3DtRr02UJuc491ExHAgRgE92lPUfCrF5yS277U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDFC2F8019B; Thu, 27 Jul 2023 05:22:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F066F80163;
	Thu, 27 Jul 2023 05:22:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36964F8019B; Thu, 27 Jul 2023 05:21:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4FA17F80153
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 05:21:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FA17F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JjrrTNc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690428112; x=1721964112;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nPB2w9dSjqlHnzGsCdfKxPajMcJwjwbcBaw3wQ2gZzQ=;
  b=JjrrTNc2/1kHHfc17at1ykuruvvmyKMwUe9Aeh698Kh+9UtdRl8UFrA2
   +iLxzUMmaU/TdSKR2NGmP/O7ykiQSq5hemlhhEVIHkD8RXFf4hV6mCCEB
   Xtw6Dc1iDB5lHYdguf/MHo2cqiKySMPbBCiiwnFnKg4dF5YdPQ9yy3xea
   d0Q7QOU7RG0CgvNuRBDa0RefU3LJPB0QS2tow1kUCjCwuHhBbXFE5NYAF
   u4XxEMZJ/UaXchYLt2aR7UDJ9SOlumHuWgIT7TxUZD+DeRyWrTYimo0Iq
   QLJRvhbbQ1xnNsNJ9MQHlUAgzO8dw80JmYBXgbQYjyRZAy/5ZsZk8a8lu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="353091846"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200";
   d="scan'208";a="353091846"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 20:21:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="900697655"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200";
   d="scan'208";a="900697655"
Received: from yungchua-mobl2.ccr.corp.intel.com (HELO [10.92.2.114])
 ([10.92.2.114])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 20:21:45 -0700
Message-ID: <c1aadbcf-78ab-0566-84e5-8eaa7b418d50@linux.intel.com>
Date: Thu, 27 Jul 2023 11:21:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] ASoC: Intel: maxim-common: get codec number from ACPI
To: "Lu, Brent" <brent.lu@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: 
 <CY5PR11MB6257FF6D92D524D389B734C19701A@CY5PR11MB6257.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2OEH22D53J446TT6NH6R6FIVS5ZD4TNW
X-Message-ID-Hash: 2OEH22D53J446TT6NH6R6FIVS5ZD4TNW
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2OEH22D53J446TT6NH6R6FIVS5ZD4TNW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 7/27/2023 10:14 AM, Lu, Brent wrote:
>>
>> max_98390_components[] and max_98390_4spk_components[] are still used
>>
>> by sof_rt5682.c, we should remove them in the same patch.
>>
>> Maybe combine the 2 patches together?
>>
>>
> I've got your point but these two patches are doing two things: one is refactor the
> code and add a detection feature, the other one is removing the quirk. Not sure if
> it's proper to merge them.

The point is that if you remove them and they are still used somewhere,

you will break the build. i.e. Kernel will not compile if we apply the

first patch only.


> Regards,
> Brent

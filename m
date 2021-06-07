Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAC339DF08
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 16:44:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DD7F846;
	Mon,  7 Jun 2021 16:44:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DD7F846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623077095;
	bh=BHn940bkEHf3Gh/VnyDkP7MEHwlUdkdAZioP6lNTSIg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u1oV4vfIkLIy/05Zbnyv/h+8gollgCZp5flWf/7vWw/vFFNUQvH4KH9jf4Elyekdj
	 WyZ4QuV3kfSE6HZLCKe5n6RiVDTJBRQl9/8/1sdiG+KI9kN8Mn6MTVgrJfd1zxF+rY
	 pCgL8DO/9jWUyIH8yifInsvgnE22M/6Mx3er1pgQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B23E8F8026C;
	Mon,  7 Jun 2021 16:43:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F22BEF80212; Mon,  7 Jun 2021 16:43:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03993F800AF
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 16:43:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03993F800AF
IronPort-SDR: WWFCLKVPfRXynJoYzFsKnv4GpY5FRwJZD96UPeO9gT7GOg3GsB9TWDBWeE0L81AwpR23t6qS5K
 Ww/oCAZfyMqQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="185003727"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="185003727"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 07:43:06 -0700
IronPort-SDR: CeHH2bAx8sbXJSgflxrJfs1CIzAPWJ5w8atWCRvUHRcBtt4VcLlUvP21ft1ZLtBUi0afvQkJbG
 ScBsXQMEP20g==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="447503469"
Received: from dsanc15x-mobl3.amr.corp.intel.com (HELO [10.251.138.253])
 ([10.251.138.253])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 07:43:04 -0700
Subject: Re: [PATCH 3/4] ASoC: intel: sof_cs42l42: add support for
 jsl_cs4242_mx98360a
To: "Lu, Brent" <brent.lu@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20210606004102.26190-1-brent.lu@intel.com>
 <20210606004102.26190-4-brent.lu@intel.com>
 <505c7e46-316c-9fa1-feaa-115f4561ed19@linux.intel.com>
 <DM6PR11MB36421AD935E4A2B8EBD0FE6197389@DM6PR11MB3642.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cb76f83c-e9d1-9726-ff8d-8d48a4de8e26@linux.intel.com>
Date: Mon, 7 Jun 2021 09:43:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <DM6PR11MB36421AD935E4A2B8EBD0FE6197389@DM6PR11MB3642.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "Nujella, Sathyanarayana" <sathyanarayana.nujella@intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, "R,
 Dharageswari" <dharageswari.r@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, "M,
 Naveen" <naveen.m@intel.com>, "Wang, Rander" <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Fred Oh <fred.oh@linux.intel.com>,
 "Gopal, Vamshi Krishna" <vamshi.krishna.gopal@intel.com>, "Zhi,
 Yong" <yong.zhi@intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 6/7/21 9:29 AM, Lu, Brent wrote:
>> On 6/5/21 7:41 PM, Brent Lu wrote:
>>> This patch adds driver data for jsl_cs4242_mx98360a which supports two
>>> max98360a speaker amplifiers on SSP1 and cs42l42 headphone codec on
>>> SSP0 running on JSL platform. DAI format is leveraged from sof_rt5682
>>> machine driver to reuse the topology.
>>
>> This also looks like we have two topologies configuring the same DAIs
>> differently on different platforms.
>>
>> Why can't we pick one configuration that would work in all cases?
>>
> 
> The comment just say we are reusing rt5685's sof-jsl-rt5682-mx98360a.tplg.
> This patch does not care about the dai sequence. Maybe I should reword the
> commit log.

I was referring to the bclk frequency, one case uses 2.4 and the other 
3.072MHz.

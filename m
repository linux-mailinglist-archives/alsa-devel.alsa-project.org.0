Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1751ADE6A
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 15:35:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9826C1665;
	Fri, 17 Apr 2020 15:34:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9826C1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587130534;
	bh=HZYM1xeu4202sy/TV4cZXQsJn5BeVcCynY3nxKmoKGM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=asNGC0hmJdgwpmb02BKAS34eltLEq/oHandH+YvT0dfRk1Pg5Rwt9OKZMNRCLtBv3
	 lzeqlndk+xMtvjmWO6De+jgs/fDatd3ccYqIchNxk8BPJPhUy4/3PvzlIH4iWh+Adr
	 szk2cPMctHJzn0Ar0GC8+oHqsafU08zCNOHqtILI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B541DF80229;
	Fri, 17 Apr 2020 15:33:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05FDBF80245; Fri, 17 Apr 2020 15:33:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8840FF800DE
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 15:33:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8840FF800DE
IronPort-SDR: MEU4f2nsjHdvQr1jVGliSnP12HJm9Ey7ot6rz1d0Ui7bvXWzdWx8SiL4EpsrnHCT2u2eazUEVm
 TDK96dEn+LVw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 06:33:40 -0700
IronPort-SDR: 8i6j3nEPlk0bXHPhT0/jUcxr4Mtp6sg0LT4GqD1WUm4FPS4NvEm4vaZxzy3YmR3OVYwB2shxCB
 7MyOgCC+RC9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,395,1580803200"; d="scan'208";a="278380256"
Received: from dsbrown-mobl.amr.corp.intel.com (HELO [10.251.128.242])
 ([10.251.128.242])
 by fmsmga004.fm.intel.com with ESMTP; 17 Apr 2020 06:33:38 -0700
Subject: Re: [PATCH v2] ASoC: bdw-rt5650: remove 3-channel capture support
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 "Lu, Brent" <brent.lu@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <1586766533-18557-1-git-send-email-brent.lu@intel.com>
 <9a484795-ea4a-e559-4ea9-3de24417ec9b@linux.intel.com>
 <BN6PR1101MB21320F655CFC1C271CCA9CE097DD0@BN6PR1101MB2132.namprd11.prod.outlook.com>
 <4b9455cb-d0d2-f5d8-f04c-df6e5abb4441@linux.intel.com>
 <BN6PR1101MB2132BBB45C6683D6BE1FBCD897D90@BN6PR1101MB2132.namprd11.prod.outlook.com>
 <95d0a64e-d2e9-7117-75c5-6c68b1426f93@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b402d107-9a8b-c4df-de13-f6bf61195442@linux.intel.com>
Date: Fri, 17 Apr 2020 08:33:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <95d0a64e-d2e9-7117-75c5-6c68b1426f93@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, "Chiang, Mac" <mac.chiang@intel.com>,
 Mark Brown <broonie@kernel.org>
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



On 4/17/20 2:59 AM, Cezary Rojewski wrote:
> On 2020-04-17 03:32, Lu, Brent wrote:
>>>
>>> It seems like a generic problem on all Broadwell devices so let's 
>>> solve with
>>> one a single patchset.
>>>
>>> Shouldn't we just add the 2ch constraints for broadwell.c and 
>>> bdw-rt5677.c,
>>> and the 2 or 4ch constraint for bdw-rt5650.c? Would this work for you?
>>>
>>> Thanks
>>> -Pierre
>>
>> Hi Pierre,
>>
>> Are you saying submitting a new patch to add constraints to all three 
>> broadwell.c,
>> bdw-rt5650.c, and bdw-rt5677.c?
>>
>>
>> Regards,
>> Brent
>>
> 
> What Pierre suggested is that you submit a series of patches instead - 
> one for each of BDW machine boards. If the same problem exists on all of 
> them, there is no reason to left other boards unattended.

Yes, a series of 3 patches with the same code pattern, the only 
variation being 4 ch allowed for bdw-rt5650.c in addition to the default 
2ch for all 3 boards.

Thanks
-Pierre

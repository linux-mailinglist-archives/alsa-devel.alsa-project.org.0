Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 396501A1DA6
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Apr 2020 10:53:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BCE31662;
	Wed,  8 Apr 2020 10:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BCE31662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586336005;
	bh=ySY+joU40yI+EghBT5irMpMuY/0ZXfrHbIXwSFKP9FA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XZBnfHMM5Z76kU0DaTRwozuqItVTJAjO+voh6rVE3C8rS2GSgpbMykcRGpl17nPWH
	 BdQGLWCWxmnU1G9qTxPcuBlyFSbPuapmMx6gczzbx6A1Q0u+Laxkg11VaszgYALJ1g
	 1wqwbnItFrw6LpvS1PDmGr21S9Z0KGCg5wpUFSkY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0B13F80105;
	Wed,  8 Apr 2020 10:51:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40433F80143; Wed,  8 Apr 2020 10:51:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EF47F80105
 for <alsa-devel@alsa-project.org>; Wed,  8 Apr 2020 10:51:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EF47F80105
IronPort-SDR: 4K6BBVN5oX1o3786bLcpMNGzM/PAsHJB+HFJ8dht/j5YTM6E0d8WkYCVbLxvz3zzxoaDI98omJ
 mu6lCZnac1Lw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 01:51:30 -0700
IronPort-SDR: VVVLq9DGjj84f69mSu0cDtZ6idWZulcyc6c/GumD4a167miInOd2idGL0+IH9PZCfZRxHm+iDt
 Jh8HyH1lh6jw==
X-IronPort-AV: E=Sophos;i="5.72,357,1580803200"; d="scan'208";a="398140142"
Received: from aslawinx-mobl1.ger.corp.intel.com (HELO [10.249.156.141])
 ([10.249.156.141])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 01:51:28 -0700
Subject: Re: [PATCH v2 0/6] ASoC: topology: Propagate error appropriately
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
References: <20200327204729.397-1-amadeuszx.slawinski@linux.intel.com>
 <e345ffe1-1593-49c0-32bd-4637bc1764da@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <a7b5e659-01c9-f966-2d26-cac8d10b96bb@linux.intel.com>
Date: Wed, 8 Apr 2020 10:51:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <e345ffe1-1593-49c0-32bd-4637bc1764da@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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



On 3/30/2020 6:38 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 3/27/20 3:47 PM, Amadeusz Sławiński wrote:
>> v1:
>>    Check if kstrdup succeeded.
>>
>> v2:
>>    Remove unneeded freeing, which is performed in another place by dobj
>>    handlers.
>>
>>    Additionally for functions which have return status which was ignored,
>>    perform success checks and handle failures in appropriate way.
>>
>> Amadeusz Sławiński (6):
>>    ASoC: topology: Add missing memory checks
>>    ASoC: topology: Check return value of soc_tplg_create_tlv
>>    ASoC: topology: Check return value of soc_tplg_*_create
>>    ASoC: topology: Check soc_tplg_add_route return value
>>    ASoC: topology: Check return value of pcm_new_ver
>>    ASoC: topology: Check return value of soc_tplg_dai_config
> 
> Looks good to me
> 
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> We probably want Ranjani to double-check this series though.
> 

Hi Ranjani, can you take another look, I would like for this to get 
merged before I forget about it ;)

>>
>>   sound/soc/soc-topology.c | 113 ++++++++++++++++++++++++++++++---------
>>   1 file changed, 88 insertions(+), 25 deletions(-)
>>


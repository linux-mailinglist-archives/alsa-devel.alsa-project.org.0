Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF1C2A291C
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 12:25:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AA6F16FD;
	Mon,  2 Nov 2020 12:25:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AA6F16FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604316358;
	bh=/dc6reLVdb4BHUpYxYqcuNgfbqa6l3GxYYJ9AEDZ25o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W4U5fB3MhVFJWwQTPyaLBOaQr55mRb58Vdz5If9WNh8bJvsofcM9REs0SOHHbirhw
	 U65wMVw9DSyYX8tQtMXFuSI0PlM/u1xl6p+4TsCGGQs+EvGG1mL3WjfDEAQOiWWpk9
	 uCc1a87+1MruPf2BWAkLCkIT76GBzNm+ivvY9SK4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49ECFF80234;
	Mon,  2 Nov 2020 12:24:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A3AAF80232; Mon,  2 Nov 2020 12:24:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66D4AF8015A
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 12:24:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66D4AF8015A
IronPort-SDR: mtQfXc+Lb2o4LoCfZeNOFWDP+ol/Gos0sZIhBT8QVbMCbEWCPabDabMwrAJd2U3oehzgqqmO2D
 vFXXGnakUPiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9792"; a="168085162"
X-IronPort-AV: E=Sophos;i="5.77,444,1596524400"; d="scan'208";a="168085162"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2020 03:24:15 -0800
IronPort-SDR: Ozni2Ml57Ai0WWrlKQlCgTmECTdQzzDiF7ucz/EF1B/ENBArFsSWwIWX5yZlAxx6ekeeOtWw9y
 5MOgjeoW3TwQ==
X-IronPort-AV: E=Sophos;i="5.77,444,1596524400"; d="scan'208";a="470341544"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.249.130.135])
 ([10.249.130.135])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2020 03:24:13 -0800
Subject: Re: [PATCH v3 0/7] ASoC: topology: Change to resource managed memory
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
References: <20201030145427.3497990-1-amadeuszx.slawinski@linux.intel.com>
 <3975a572394d4d8ca82778979c5e422f@intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <05834b5b-a9db-3612-37e9-193b05d56ba0@linux.intel.com>
Date: Mon, 2 Nov 2020 12:24:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3975a572394d4d8ca82778979c5e422f@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
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

On 10/30/2020 3:23 PM, Rojewski, Cezary wrote:
> On 2020-10-30 3:54 PM, Amadeusz Sławiński wrote:
>> Almost all other allocations in ASoC API are resource managed, the only
>> exception is soc-topology.c.
>>
>> This patchset clean ups few unnecessary functions in preparation for
>> change and then changes to devm_ functions for allocation.
>>
> 
> These address some of the long standing issues of resource allocation
> for topology, thanks for your work.
> Nitpick:
> *the 0/7* looks weird given that only 6 patches are actually part of the
> series.

Yes that was a copy&paste mistake, similarly to already mentioned v3. 
There is only 6 patches.

It is a problem caused by manually filling cover letter and copying 
title from old cover letter to new one.

I did some reading, and apparently if one operates on branches to 
prepare patch sets, they can do something like:
$ git branch --edit-description
$ git format-patch -6 --cover-letter --cover-from-description=subject
And git will automatically populate cover letter with text from branch 
description. I will try to remember to try it when sending another 
series. Hopefully this will allow me to avoid copy&paste mistakes, as 
filling cover letter title and description will be automated ;)

Mark, do let me know if you want me to resend.

> 
> For the series:
> 
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> 
> Thanks,
> Czarek
> 
>> Amadeusz Sławiński (6):
>>     ASoC: topology: Remove unused functions from topology API
>>     ASoC: topology: Remove multistep topology loading
>>     ASoC: topology: Unify all device references
>>     ASoC: topology: Change allocations to resource managed
>>     ASoC: topology: Remove empty functions
>>     ASoC: topology: Simplify remove_widget function
>>
>>    include/sound/soc-topology.h           |  13 +-
>>    sound/soc/intel/skylake/skl-topology.c |   9 +-
>>    sound/soc/soc-topology.c               | 302 +++++--------------------
>>    sound/soc/sof/pcm.c                    |   2 +-
>>    sound/soc/sof/topology.c               |   4 +-
>>    5 files changed, 57 insertions(+), 273 deletions(-)
>>


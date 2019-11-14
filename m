Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0669FC9AF
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 16:16:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31D891660;
	Thu, 14 Nov 2019 16:15:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31D891660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573744597;
	bh=CB7NwbXuIJXvfTKOjZTfedyQane+nzRxXVe1WGUgU0w=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LUR7btCRARWh5gCa6wjdrxlaw9zTsrnp8r68Ywh+sGye5bTPTWEgIg/j5uziB9zyL
	 a8Y/xFBw5ITAHMZeXpTOEpE6+uh0HSNeIqB0cXT2nUFvgGk1WCo5PSoXZtDL4Ruqr2
	 i+aR0gAgXF9O91pR2CvbJqyHjbxI/Ucj2ufh+tHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 642C4F800E9;
	Thu, 14 Nov 2019 16:14:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4433F800CF; Thu, 14 Nov 2019 16:14:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BF73F800CC
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 16:14:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BF73F800CC
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 07:14:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="207818988"
Received: from sparvath-mobl1.amr.corp.intel.com (HELO [10.251.9.216])
 ([10.251.9.216])
 by orsmga003.jf.intel.com with ESMTP; 14 Nov 2019 07:14:38 -0800
To: Vinod Koul <vkoul@kernel.org>
References: <20191023210657.32440-1-pierre-louis.bossart@linux.intel.com>
 <20191023210657.32440-2-pierre-louis.bossart@linux.intel.com>
 <20191103045604.GE2695@vkoul-mobl.Dlink>
 <f53b28bb-1ec7-a400-54ed-51fd55819ecd@linux.intel.com>
 <20191108042940.GW952516@vkoul-mobl>
 <e3e10c25-84dc-f4e7-e94b-d18493450021@linux.intel.com>
 <20191109111211.GB952516@vkoul-mobl>
 <5a2a40b3-5a3c-f80a-b2a4-33d821d5b0e6@linux.intel.com>
 <20191114115020.GU952516@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7ce77d48-e0fd-2c1c-978d-cd27820c8afa@linux.intel.com>
Date: Thu, 14 Nov 2019 09:14:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191114115020.GU952516@vkoul-mobl>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/4] soundwire: sdw_slave: add new fields
 to track probe status
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


>> At this point I am formally asking for your view and guidance on how we are
>> going to do the SoundWire/ASoC integration. It's now your time to make
>> suggestions on what the flow should be between you and Mark/Takashi. If you
>> don't want this initial change to the header files, then what is your
>> proposal?
> 
> It is going to be as it would be for any other subsystem. Please mention
> in the cover letter about required dependency. In case asoc needs this I
> will create a immutable tag and in reverse case Mark will do so.
> 
> It is not really an issue if we get the information ahead of time

I added a whole set of comments on the race conditions and ran them by 
people with limited knowledge of SoundWire to see if the explanations 
made sense and why those header files were changed. Will send this later 
today as a v3.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

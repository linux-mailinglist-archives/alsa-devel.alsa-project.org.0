Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE924F502C
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 16:50:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DCDB166A;
	Fri,  8 Nov 2019 16:49:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DCDB166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573228236;
	bh=rDSCkkz9ihW+UrmI2nOasJ9MlF/P2EqKO64lfwJp5Uo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tvp4WmwRSab0XAlzhYvO36QEtk2B41w2izN1rl42Z//qI8sXtw4TTNAD0KMFT9V3q
	 0D3GBgZG776tjLGqn0X5AdHcllzFpogTi/RZrGEp53dowscXhlLsoXndzLjdnLRkbj
	 lwAw92u3jTZKuSCXkXltycYuksPuGElwr0pzdSBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A601F805DF;
	Fri,  8 Nov 2019 16:48:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CB05F803D0; Fri,  8 Nov 2019 16:48:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_14,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68637F800F3
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 16:48:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68637F800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Nov 2019 07:47:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,281,1569308400"; d="scan'208";a="377794951"
Received: from nupoorko-mobl1.amr.corp.intel.com (HELO [10.251.157.201])
 ([10.251.157.201])
 by orsmga005.jf.intel.com with ESMTP; 08 Nov 2019 07:47:47 -0800
To: Vinod Koul <vkoul@kernel.org>
References: <20191023210657.32440-1-pierre-louis.bossart@linux.intel.com>
 <20191023210657.32440-2-pierre-louis.bossart@linux.intel.com>
 <20191103045604.GE2695@vkoul-mobl.Dlink>
 <f53b28bb-1ec7-a400-54ed-51fd55819ecd@linux.intel.com>
 <20191108042940.GW952516@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e3e10c25-84dc-f4e7-e94b-d18493450021@linux.intel.com>
Date: Fri, 8 Nov 2019 08:55:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191108042940.GW952516@vkoul-mobl>
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



On 11/7/19 10:29 PM, Vinod Koul wrote:
> On 04-11-19, 08:32, Pierre-Louis Bossart wrote:
>>
>>
>> On 11/2/19 11:56 PM, Vinod Koul wrote:
>>> On 23-10-19, 16:06, Pierre-Louis Bossart wrote:
>>>> Changes to the sdw_slave structure needed to solve race conditions on
>>>> driver probe.
>>>
>>> Can you please explain the race you have observed, it would be a very
>>> useful to document it as well
>>
>> the races are explained in the [PATCH 00/18] soundwire: code hardening and
>> suspend-resume support series.
> 
> It would make sense to explain it here as well to give details to
> reviewers, there is nothing wrong with too much detail!
> 
>>>>
>>>> The functionality is added in the next patch.
>>>
>>> which one..?
>>
>> [PATCH 00/18] soundwire: code hardening and suspend-resume support
> 
> Yeah great! let me play detective with 18 patch series. I asked for a
> patch and got a series!
> 
> Again, please help the maintainer to help you. We would love to see this
> merged as well, but please step up and give more details in cover
> letter and changelogs. I shouldn't need to do guesswork and scan through the
> inbox to find the context!

We are clearly not going anywhere.

I partitioned the patches to make your maintainer life easier and help 
the integration of SoundWire across two trees. All I get is negative 
feedback, grand-standing, and zero comments on actual changes.

For the record, I am mindful of reviewer/maintainer workload, and I did 
contact you in September to check your availability and provided a 
pointer to initial code changes. I did send a first version a week prior 
to your travel/vacation, I resend another version when you were back and 
waited yet another two weeks to resend a second version. I also 
contacted Takashi, Mark and you to suggest this code partition, and did 
not get any pushback. It's not like I am pushing stuff down your throat, 
I have been patient and considerate.

Please start with the patches "soundwire: code hardening and 
suspend-resume support" and come back to this interface description when 
you have reviewed these changes. It's not detective work, it's working 
around the consequences of having separate trees for Audio and SoundWire.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

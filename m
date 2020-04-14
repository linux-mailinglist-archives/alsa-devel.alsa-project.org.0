Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E211A8A4F
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 20:55:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C50581670;
	Tue, 14 Apr 2020 20:55:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C50581670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586890553;
	bh=O3lT0ueXXzESdOna9ezCjkho22IKbbK5FevaPxqvMFs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fnh0iv3OdqmQl5DEi5UheC0EnZ6luIrpLyTbFwiZYwx9dkT6aM6Grmyb89GKR9A7G
	 vLtxy6Mv5cud/8nzz4W2PZNCjcev2y+oEGENG1/5FK/JfHLfUAxTAaz4iV5rqiSpXY
	 6q9wjh3wATV/iQbYKzGa6S7wEYTzv21aI5PSnLgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFE41F800F5;
	Tue, 14 Apr 2020 20:54:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F46CF800F5; Tue, 14 Apr 2020 20:54:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73E28F800F5
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 20:54:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73E28F800F5
IronPort-SDR: JKJjVkLJvNDioZXzumgbZvqQFl1yYd08ydvCkoBLHxsJzVTFCBNy63WlHsEuca4GNxNVYVXHXE
 +thtNaS2clCQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 11:54:03 -0700
IronPort-SDR: hoN/JjJah2VUqWKnTwlrf7C3VPLIlSMNSn/PJq4GuJetvLLjSlJI+Hy1urbgwRtKxsxZSt2RKB
 y0j8foxGrwzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; d="scan'208";a="253280689"
Received: from svarahab-mobl.amr.corp.intel.com (HELO [10.212.190.40])
 ([10.212.190.40])
 by orsmga003.jf.intel.com with ESMTP; 14 Apr 2020 11:54:00 -0700
Subject: Re: [PATCH v2] ASoC: bdw-rt5650: remove 3-channel capture support
To: "Lu, Brent" <brent.lu@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <1586766533-18557-1-git-send-email-brent.lu@intel.com>
 <9a484795-ea4a-e559-4ea9-3de24417ec9b@linux.intel.com>
 <BN6PR1101MB21320F655CFC1C271CCA9CE097DD0@BN6PR1101MB2132.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4b9455cb-d0d2-f5d8-f04c-df6e5abb4441@linux.intel.com>
Date: Tue, 14 Apr 2020 13:53:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <BN6PR1101MB21320F655CFC1C271CCA9CE097DD0@BN6PR1101MB2132.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>,
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



On 4/13/20 9:29 AM, Lu, Brent wrote:
>>
>> That looks like an error caught by the ALSA conformance tool?
>>
>> What are the odds that we have a similar issue with the other broadwell
>> drivers which don't have a constraint on the number of channels either on
>> their 'System PCM' dailink?
>>
>> Thanks
>> -Pierre
>>
> 
> Yes. That's why I am sending patch for this old BDW platform...
> 
> So far as I know only 'buddy' supports 2/4-channel recording while other BDW
> Chrome products should support stereo recording only. Therefore, this defect
> should only be triggered by the ALSA conformance tool.
> 
> I am think about implementing the constraint in FE DAI's startup() callback
> instead of DAI Link's callback. Since the channels_max is 4 for the capture
> stream, ALSA conformance tool will always test 3-channel recording on any
> platforms using this driver. Does it make sense to you?

Looking back at previous threads, you indicated that the number of 
channels supported in propagated from BE to FE, so a similar patch to 
add 2ch constraints for bwd-rt5677 was dropped  ("ASoC: bdw-rt5677: 
channel constraint support")

Actually I am not sure it was dropped since later you submitted another 
patch ("ASoC: bdw-rt5677: enable runtime channel merge"), and my 
feedback was that it seemed simpler to add constraints on all machine 
drivers.

And now this patch only addresses bdw-rt5650.c but with the initial 
solution suggested for bdw-rt5677.c

It seems like a generic problem on all Broadwell devices so let's solve 
with one a single patchset.

Shouldn't we just add the 2ch constraints for broadwell.c and 
bdw-rt5677.c, and the 2 or 4ch constraint for bdw-rt5650.c? Would this 
work for you?

Thanks
-Pierre


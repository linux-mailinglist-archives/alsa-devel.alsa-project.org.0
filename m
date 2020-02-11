Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D59301597C9
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 19:10:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53C611657;
	Tue, 11 Feb 2020 19:09:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53C611657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581444634;
	bh=sgnN+7OhrQAI3IGzSOhzXoWnEeSLqimkRNqRSbob9YU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sntKYUiKJaejb+Ez9ZK5IGlIgSdG7qr8EHIob74tqMlM2ltwrJYi3DfkDU2QFc5Em
	 nYB1ivxJFr6TjTze3/bBU8WBabaSSwcW9Md8xPNWU9MRdG7WqFK4Nw5GmR/bdSl3C0
	 hJZKHezrQ3o/B7JNqok/Z6Rc63pbXSMOHCay70u8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68B58F80146;
	Tue, 11 Feb 2020 19:08:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F1CCF80145; Tue, 11 Feb 2020 19:08:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 747C0F800E7
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 19:08:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 747C0F800E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 10:08:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="222014389"
Received: from mahaling-mobl.amr.corp.intel.com (HELO [10.254.185.201])
 ([10.254.185.201])
 by orsmga007.jf.intel.com with ESMTP; 11 Feb 2020 10:08:34 -0800
To: "Lu, Brent" <brent.lu@intel.com>,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <1581322611-25695-1-git-send-email-brent.lu@intel.com>
 <AM6PR10MB2263F302A86B17C95B16361280190@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
 <SN6PR11MB26702B2E7E5F705425517F4897180@SN6PR11MB2670.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <855c88fb-4438-aefb-ac9b-a9a5a2dc8caa@linux.intel.com>
Date: Tue, 11 Feb 2020 10:30:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <SN6PR11MB26702B2E7E5F705425517F4897180@SN6PR11MB2670.namprd11.prod.outlook.com>
Content-Language: en-US
Cc: Support Opensource <Support.Opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, "Chiang, Mac" <mac.chiang@intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 "cychiang@google.com" <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: da7219: check SRM lock in trigger
 callback
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


>> Could ensure? This change seems specific to Intel DSP based systems, at
>> least from the description. Having looked through the core, the trigger code
>> for a codec is seemingly always called before the trigger for the CPU. How will
>> this work for other platforms, assuming their clocks are enabled in the CPU
>> DAI trigger function by default?
>>
>> Can we always guarantee the CPU side isn't going to send anything other
>> than 0s until after SRM has locked?

Not with the default mode for the SSP, all clocks are enabled at trigger 
time.
We can enable the MCLK and BCLK ahead of time (which would require a 
change in firmware). But if we want to enable the FSYNC (word-clock), 
then we have to trigger DMA transfers with pretend-buffers, this is a 
lot more invasive.

So just to be clear, which of the MCLK, BCLK, FSYNC do you need enabled?

> I think the patch is for those systems which enable I2S clocks in pcm_start instead
> of pcm_prepare. It has no effect on systems already be able to turn on clocks in
> supply widgets or set_bias_level() function.
> 
> If the trigger type in the DAI link is TRIGGER_PRE, then the trigger function of FE port
> (component or CPU DAI) will be called before codec driver's trigger function. In this
> case we will be able to turn on the clock in time. However, if the trigger type is
> TRIGGER_POST, then the patch does not help because just like what you said, codec
> driver's trigger function is called first.

IIRC we recently did a change to deal with underflows. Ranjani, can you 
remind us what the issue was?
Thanks
-Pierre
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

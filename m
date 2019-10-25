Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED41CE4A78
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 13:51:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 586DE17C8;
	Fri, 25 Oct 2019 13:50:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 586DE17C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572004295;
	bh=0jD+Zzsj0Lh8HxPee/QGYxHqzQp4KcT0Unopxe0K6is=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gl6s8XqCu/YmmFXzZBBen5pTIRdNYA79Pw8eEVyd+DvIg/dvA+CVxJl8V6w1GPhab
	 QzdPz1mbyn6D5EJnWxdemm0Qeyyi4ODLfnRVvo0yRx79mf6SSIkwqurVOlBizMkTEf
	 pCpjwGKcJ3C0SGBagTPPIeM4zcPF1TVFYUDNNRUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAF60F8036F;
	Fri, 25 Oct 2019 13:49:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7485EF8036F; Fri, 25 Oct 2019 13:49:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABCA6F802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 13:49:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABCA6F802A0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 04:49:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,228,1569308400"; d="scan'208";a="373535405"
Received: from mylly.fi.intel.com (HELO [10.237.72.180]) ([10.237.72.180])
 by orsmga005.jf.intel.com with ESMTP; 25 Oct 2019 04:49:38 -0700
To: Tzung-Bi Shih <tzungbi@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <CA+Px+wUAzwf1kYD8eMogE9Y6Euw4_-itc5EPWU19c_Sg6+ypQA@mail.gmail.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <226b1567-08bc-28f1-92e4-42ca04e42c9c@linux.intel.com>
Date: Fri, 25 Oct 2019 14:49:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CA+Px+wUAzwf1kYD8eMogE9Y6Euw4_-itc5EPWU19c_Sg6+ypQA@mail.gmail.com>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Dylan Reid <dgreid@google.com>, Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Benson Leung <bleung@google.com>, Hsin-yu Chao <hychao@google.com>
Subject: Re: [alsa-devel] Questions about max98090 codec driver
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

Hi

On 10/24/19 9:23 PM, Tzung-Bi Shih wrote:
> Hi,
> 
> I am studying an odd issue of max98090 codec on Baytrail-based
> chromebook.  The issue is: when user playback and capture
> simultaneously, it seems the PLL never get locked if msleep(10)
> between the SHDN off and on
> (https://elixir.bootlin.com/linux/v5.4-rc2/source/sound/soc/codecs/max98090.c#L2120).
> The playback stream becomes silent and the console keeps printing "PLL
> unlocked".  But, if comment out the msleep(10) between the SHDN off
> and on, the issue fixed.  I am trying to find the reason but facing
> further more questions and may need your inputs.
> 
My memory is vague but one thing came to my mind - is codec I2S master 
or slave in your setup? I think we were using codec in slave mode only. 
However don't know does PLL unlock issue occurs when codec is master.

> 1. The commit b8a3ee820f7b ("ASoC: max98090: Add recovery for PLL lock
> failure") enables ULK interrupts
> (https://elixir.bootlin.com/linux/v5.4-rc2/source/sound/soc/codecs/max98090.c#L2088)
> when PCM stream starting.  If max98090 claims its PLL is unlocked,
> max98090_pll_work() get scheduled to workaround it by SHDN off and on
> (https://elixir.bootlin.com/linux/v5.4-rc2/source/sound/soc/codecs/max98090.c#L2106).
> 
> I feel it is weird to sleep in max98090_pll_work().  Especially, at
> this line https://elixir.bootlin.com/linux/v5.4-rc2/source/sound/soc/codecs/max98090.c#L2125
> (it makes less sense to "wait" in another thread).  Note that, the
> threaded IRQF_ONESHOT handler and max98090_pll_work() are in 2
> different threads.
> 
> I guess the original intention is:
> - disable ULK interrupt in IRQ handler
> (https://elixir.bootlin.com/linux/v5.4-rc2/source/sound/soc/codecs/max98090.c#L2260)
> - schedule max98090_pll_work() to workaround it
> - wait 10ms to give PLL chance to lock
> - enable ULK interrupt again
> If max98090 claims its PLL is unlocked again, repeat the above by
> receiving another ULK interrupt.
> 
No ULK interrupt is disabled until max98090_pll_det_enable_work() 
enables it 10 ms after stream start.

If I remember correctly we were getting quite often or always PLL unlock 
interrupts shortly after stream start even PLL locked itself 
successfully. On those cases workaround was kind of needless and 
probably caused pop noise or similar.

So idea was to activate PLL unlock detection after 10 ms and do the 
workaround only if interrupt happens after that 10 ms "do not detect" 
period. Liam please correct if I remember wrong.

> Unfortunately, the odd issue seems not be fixed by my rough
> implementation of these.
> 
> 2. According to the datasheet page 164 table 90
> (https://datasheets.maximintegrated.com/en/ds/MAX98090.pdf), there are
> some registers should only be adjusted when SHDN==0.  But I fail to
> find max98090.c tries to set SHDN to 0 and restore it afterwards when
> writing to these registers.  For example,
> https://elixir.bootlin.com/linux/v5.4-rc2/source/sound/soc/codecs/max98090.c#L1897.
> I am wondering if it would bring any side effects because the
> datasheet states "Changing these settings during normal operation
> (SHDN=1) can compromise device stability and performance
> specifications."
> 
> 3. By searching some history data, I found a previous version did not
> have the msleep(10) between the SHDN off and on
> (https://crrev.com/c/191740, click the file name in the middle of the
> window to see the diff.  Pardon me, I do not find another public
> repository for this).  I am curious if anyone of you still remember
> why the upstream version contains the msleep(10).  I am also curious
> if anyone of your environment works well with the upstream version
> max98090.c.
> 
Yeah, that's looks like the one of the Liam's original workarounds for 
the issue. In that case looping 10 times. We were experimenting a lot 
around the issue and the commit b8a3ee820f7b ("ASoC: max98090: Add 
recovery for PLL lock failure") is the one combining our efforts 
together in the single commit.

Don't remember what incarnation brought these 10 ms sleeps between 
shutdown toggling and after. I'm guessing one for making sure codec 
reaches the shutdown and another perhaps for limiting that workaround is 
not run too soon again.

-- 
Jarkko
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5C3E3BFE
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 21:27:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9799172C;
	Thu, 24 Oct 2019 21:27:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9799172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571945270;
	bh=56+SDi7Yg88ImoEUS64doRKYQEU+7MJ0Wi+MD0VprK4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VW9zRB7EFxm4aWBs+w3VQPpvxtjh218HkOwL6hV2SbPY1zlvPOuzyLrmQ3tch4xLJ
	 bDAUGfw2cR3heOMRZr2e5TB165Tohi6GrBJ3VPOs0kkAYfZOlki55lNHG9TlR1Fr8P
	 PtRucj3AX+X/olv5YlFMxk6ow3UsdvpiNLOsaZsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A484F80367;
	Thu, 24 Oct 2019 21:26:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B73DF8036B; Thu, 24 Oct 2019 21:26:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E58DF80112
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 21:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E58DF80112
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Oct 2019 12:25:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,225,1569308400"; d="scan'208";a="398526596"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 24 Oct 2019 12:25:56 -0700
Received: from asahu-mobl1.amr.corp.intel.com (unknown [10.251.0.96])
 by linux.intel.com (Postfix) with ESMTP id AC9FB58029F;
 Thu, 24 Oct 2019 12:25:55 -0700 (PDT)
To: Tzung-Bi Shih <tzungbi@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 jarkko.nikula@linux.intel.com
References: <CA+Px+wUAzwf1kYD8eMogE9Y6Euw4_-itc5EPWU19c_Sg6+ypQA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1b7200ba-5347-0544-38f9-ae1204aa2329@linux.intel.com>
Date: Thu, 24 Oct 2019 14:25:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
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

On 10/24/19 1:23 PM, Tzung-Bi Shih wrote:
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

IIRC this PPL unlocked problem also affects Cherrytrail/Braswell 
Chromebooks with the same codec, but strangely with a lower probability 
of occurrence (maybe due to clocking differences?). My contribution was 
to make the dmesg log ratelimited, but I could never figure out either 
what the root cause was.

> 
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
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

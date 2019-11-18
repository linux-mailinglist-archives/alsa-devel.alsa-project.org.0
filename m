Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 755F410089B
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 16:47:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08C531689;
	Mon, 18 Nov 2019 16:46:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08C531689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574092033;
	bh=mUWPSKvnaj7ulCZjMAbi5Qi3Ih4TRmrnniwckClTZHM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XmO0e9xhsOLs5YfZ5lDAb6QXQrsfxvJUlScm80KXrvn/MA7J55OgY/jm2WivgOGqG
	 4KMc7FJAT+yVlMhk5Vek54KnD/2gLhgJSuYWpQxDskUHhLwFG23LY6VDxx1xVjnes5
	 m6306cbdes3mrlNRw0WQENGm+OdW7JYZl8Y3qF7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0740F8013F;
	Mon, 18 Nov 2019 16:45:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED9FEF8013B; Mon, 18 Nov 2019 16:45:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 211F7F800F1
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 16:45:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 211F7F800F1
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Nov 2019 07:45:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,320,1569308400"; d="scan'208";a="289292799"
Received: from nmdeliwa-mobl1.amr.corp.intel.com (HELO [10.251.155.92])
 ([10.251.155.92])
 by orsmga001.jf.intel.com with ESMTP; 18 Nov 2019 07:45:18 -0800
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87ftj23jph.wl-kuninori.morimoto.gx@renesas.com>
 <877e4e3jni.wl-kuninori.morimoto.gx@renesas.com>
 <8ed58ca1-0f9d-63e8-ba5d-28ee5209aee5@linux.intel.com>
 <87pnhx8xjl.wl-kuninori.morimoto.gx@renesas.com>
 <87o8xh8wyz.wl-kuninori.morimoto.gx@renesas.com>
 <87mud18ukk.wl-kuninori.morimoto.gx@renesas.com>
 <73feb970-bca5-b736-ce44-d44dacab02d1@linux.intel.com>
 <20191112190326.GJ5195@sirena.co.uk>
 <ce011d55-b1b2-7bd9-9de3-48fb616703f0@linux.intel.com>
 <87lfsk4cit.wl-kuninori.morimoto.gx@renesas.com>
 <3e4b8289-8e59-d8fe-635b-d55d2b20de5d@linux.intel.com>
 <87a78zia3n.wl-kuninori.morimoto.gx@renesas.com>
 <878soji808.wl-kuninori.morimoto.gx@renesas.com>
 <28d2c726-2a6c-08c2-3393-21c88dcfb03e@linux.intel.com>
 <87tv72xb6l.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c268ae1a-985f-55a3-8952-d322e6bb8d10@linux.intel.com>
Date: Mon, 18 Nov 2019 09:14:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <87tv72xb6l.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v3 06/19] ASoC: soc-core: add
 soc_unbind_dai_link()
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



On 11/17/19 6:47 PM, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis
> 
> Thank you for testing
> 
>>> But, these are just my guess.
>>> It works for me, but I can't re-produce the issue.
>>>
>>> Below is the patch for "testing".
>>
>> Morimoto-san, I haven't fully tested the logic and all the long
>> description, but the patch suggested seems to work on all the
>> platforms I tested on - and actually improves things on
>> Baytrail/Cherrytrail.
>>
>> I haven't seen any oopses in several hours now and no regression
>> reported by Intel CI https://github.com/thesofproject/linux/pull/1504
> 
> Wow !! Nice to know !!
> I'm very happy about that !!
> 
> OK, I will post the patch officially with your tested by.
> 
>> Let's see what others think or tested.

the only issue we found in additional testing is that we need to insert 
a ~20s delay after each of module insertion/removal sequences, or we get 
stuck in at some point. That is a likely sign of delayed work not 
properly canceled - it may however be a different topic altogether, I 
saw the same sighting with my initial patch which reverted the "ASoC: 
soc-core: add soc_unbind_dai_link()" patch.

Others at Intel redid my tests and also found that the module 
load/unload tests worked across the board on CI devices.

from the Intel side we're good.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4138C102987
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 17:38:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB4AC1687;
	Tue, 19 Nov 2019 17:37:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB4AC1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574181522;
	bh=tbtZW8d12N3EbVgQSVlXO9Xu1bL//IEGijRVa4NScvo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tJZscfcCXcL+XBC6ne8etbZZMOwEIa8BeFPgg1tDp5x5lXA+FhdaON1/2AvKKuzva
	 1uNbnhCQoi4WCJXL/IZUNiGqF7fKTWdtc5kdQDzYGmAhSilLtEdHNiRFujSlNT969n
	 NcpG3M1mhJ7MwjlPxvcSiDHNcL8MCPK2VPCJNF5c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2095F80137;
	Tue, 19 Nov 2019 17:36:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B6D7F80138; Tue, 19 Nov 2019 17:36:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C6FDF800FF
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 17:36:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C6FDF800FF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Nov 2019 08:36:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,218,1571727600"; d="scan'208";a="258776684"
Received: from mseibert-mobl1.amr.corp.intel.com ([10.251.134.253])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Nov 2019 08:36:47 -0800
Message-ID: <ce61828881dea0fffd2c26a92ad2571ab3565404.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Tue, 19 Nov 2019 08:36:46 -0800
In-Reply-To: <s5hv9rgxohq.wl-tiwai@suse.de>
References: <20191117085308.23915-1-tiwai@suse.de>
 <20191117085308.23915-8-tiwai@suse.de>
 <3b407a02-b791-52a4-2335-e21d8ab732dd@linux.intel.com>
 <s5hy2wdyq3t.wl-tiwai@suse.de>
 <CAFQqKeWgqHwrCSSbLrkuCHkBww2g4dsBcF93SDN_ZK_-KSe5tg@mail.gmail.com>
 <s5hpnhpyng6.wl-tiwai@suse.de>
 <CAFQqKeWPgPWpDgZUPvOqSFUY2Zq=8zW-=LhYimtg0S0Hqpc43A@mail.gmail.com>
 <s5hmucszzni.wl-tiwai@suse.de>
 <3fc820272992362a56881abf7230f1500fdfdd2a.camel@linux.intel.com>
 <s5hblt8z7ow.wl-tiwai@suse.de>
 <030249cd63d754bd70ce5de5c58e04784eecebff.camel@linux.intel.com>
 <s5hv9rgxohq.wl-tiwai@suse.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 7/8] ALSA: pcm: Add card sync_irq field
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 2019-11-19 at 09:24 +0100, Takashi Iwai wrote:
> On Tue, 19 Nov 2019 08:40:25 +0100,
> Ranjani Sridharan wrote:
> > 
> > > > 
> > > > Hi Takashi,
> > > > 
> > > > I just realized that In the SOF driver, we only set the
> > > > component
> > > > driver ops. The pcm ops are set when creating the new pcm. So,
> > > > should I
> > > > also add the sync_stop op in the component driver and set the
> > > > pcm
> > > > sync_stop op to point to the component sync_stop op? Just
> > > > wanted to
> > > > confirm if I am on the right track.
> > > 
> > > Yes, I didn't touch this yet, but that's the way to go I suppose.
> > > One caveat is that this ops is optional and needs NULL as
> > > default,
> > > hence you'd need to set only when defined, like copy_user, page
> > > or
> > > mmap ops, at least.
> > 
> > Hi Takashi,
> > 
> > This is what I tried in the SOF driver:
> > https://github.com/thesofproject/linux/pull/1513/commits
> > 
> > And it seems to cause the system to hang when I stop the stream and
> > I
> > have no meaningful logs to pinpoint to the problem. Could you
> > please
> > have a look at the 4 commits that I have added to your series and
> > let
> > me know what I could be missing? 
> 
> I couldn't find anything obvious.  Could you try without changing
> snd_sof_pcm_period_elapsed(), i.e. only adding the stuff and calling
> sync_stop, in order to see whether the additional stuff broke
> anything?
It is indeed the removal of snd_sof_pcm_period_elapsed() that makes the
device hang when the stream is stoppped. But that's a bit surprising
given that all I tried was using the snd_pcm_period_elapsed() directly
instead of scheduling the delayed work to call it.

Thanks,
Ranjani

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

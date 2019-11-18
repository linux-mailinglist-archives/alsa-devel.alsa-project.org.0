Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AA7100F84
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 00:49:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85A901690;
	Tue, 19 Nov 2019 00:48:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85A901690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574120988;
	bh=ptV/+36m0INhzLyD5x4wIjP02UDYQWg0Xr08xkc+0IM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nnd2cjJVcBMMe+DVYYIUT3KSZDfVDDp2StqMqptuSw45c77dti7US10e6O9vooYpB
	 Qs8ARAxE6Rsu84cgdDnPsPAC68wIUB2ynR2ZUp52cso2/8/R1uzHufze7O9CwjLItP
	 D5CzG98VmpnbAUdfZGyUiXifCzBz5G/5LFY017RU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5DF9F8013C;
	Tue, 19 Nov 2019 00:48:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E2CEF8013B; Tue, 19 Nov 2019 00:48:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAA25F800F6
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 00:47:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAA25F800F6
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Nov 2019 15:47:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,321,1569308400"; d="scan'208";a="200149738"
Received: from mseibert-mobl1.amr.corp.intel.com ([10.251.134.253])
 by orsmga008.jf.intel.com with ESMTP; 18 Nov 2019 15:47:53 -0800
Message-ID: <3fc820272992362a56881abf7230f1500fdfdd2a.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>, "Sridharan, Ranjani"
 <ranjani.sridharan@intel.com>
Date: Mon, 18 Nov 2019 15:47:53 -0800
In-Reply-To: <s5hmucszzni.wl-tiwai@suse.de>
References: <20191117085308.23915-1-tiwai@suse.de>
 <20191117085308.23915-8-tiwai@suse.de>
 <3b407a02-b791-52a4-2335-e21d8ab732dd@linux.intel.com>
 <s5hy2wdyq3t.wl-tiwai@suse.de>
 <CAFQqKeWgqHwrCSSbLrkuCHkBww2g4dsBcF93SDN_ZK_-KSe5tg@mail.gmail.com>
 <s5hpnhpyng6.wl-tiwai@suse.de>
 <CAFQqKeWPgPWpDgZUPvOqSFUY2Zq=8zW-=LhYimtg0S0Hqpc43A@mail.gmail.com>
 <s5hmucszzni.wl-tiwai@suse.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
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

On Mon, 2019-11-18 at 21:40 +0100, Takashi Iwai wrote:
> On Mon, 18 Nov 2019 20:55:19 +0100,
> Sridharan, Ranjani wrote:
> > 
> >     > Thanks for the clarification, Takashi. But just wondering how
> > would one
> >     pass
> >     > on the sync_irq when the snd_card is created? Typically in
> > the case of
> >     the
> >     > Intel platforms, the card->dev points to the platform device
> > for the
> >     machine
> >     > driver that registers the card and the PCI device is the
> > parent of the
> >     machine
> >     > drv platform device. 
> >    
> >     It's completely up to the driver implementation :)
> >     You can implement the own sync_stop ops if that's easier, too.
> > 
> > I think this would make sense in the case of the SOF driver and
> > we'd probably
> > need to just call synchronize_irq() in the sync_stop() operation.
> > With this
> > change, we can probably remove the workaround we have to address
> > the issue we
> > were facing during snd_pcm_period_elapsed(). 
> > 
> > I can give this a try. We might need to run some stress tests to
> > make sure it
> > doesn't break anything. 
> 
> If this helps for SOF, it'd be great.  I have converted only non-ASoC
> drivers regarding the sync-stop stuff, so it won't conflict my
> upcoming changes :)
> 
Hi Takashi,

I just realized that In the SOF driver, we only set the component
driver ops. The pcm ops are set when creating the new pcm. So, should I
also add the sync_stop op in the component driver and set the pcm
sync_stop op to point to the component sync_stop op? Just wanted to
confirm if I am on the right track.

Thanks,
Ranjani

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

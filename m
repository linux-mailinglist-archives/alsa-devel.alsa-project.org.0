Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC07930F59
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 15:54:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4753115F2;
	Fri, 31 May 2019 15:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4753115F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559310862;
	bh=TYT77mLke7b7aD3OztM6CJog3aLzgvZqvQoSEDr6h34=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R70gQmQJFKFagB1muXeuixk3S9+dGHsq8SB5LLW5vhGezzQMm8EwdsZjhKyW/NcUz
	 N8G7jVGSb5kE/PntEwuuAx0Yf+HPLQkQ42Gack8Lo/UewHC2EwzkbFIsriaKtWaPo1
	 VH9Io3E5DYE4rOwEAwRkEYpRA3hzfBPl6C613u5g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D603EF896E4;
	Fri, 31 May 2019 15:52:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 460F2F896E5; Fri, 31 May 2019 15:52:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4FAAF80C1B
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 15:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4FAAF80C1B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 May 2019 06:52:28 -0700
X-ExtLoop1: 1
Received: from hoangng2-mobl.amr.corp.intel.com ([10.254.19.252])
 by fmsmga004.fm.intel.com with ESMTP; 31 May 2019 06:52:28 -0700
Message-ID: <0f75caffee97f7cec5a1bd31e9f3eb3ea1a12948.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Fri, 31 May 2019 06:52:27 -0700
In-Reply-To: <s5hef4en4ct.wl-tiwai@suse.de>
References: <20190530201828.2648-1-ranjani.sridharan@linux.intel.com>
 <684fe069-d2fb-f716-bd3e-67f0c7a52de0@linux.intel.com>
 <s5hftovtaq0.wl-tiwai@suse.de>
 <e8bdeb7b299a11932ec98df805045a2871c0f79d.camel@linux.intel.com>
 <s5hef4en4ct.wl-tiwai@suse.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: hda: increment codec device refcount
 when it is added to the card
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

On Fri, 2019-05-31 at 15:25 +0200, Takashi Iwai wrote:
> On Fri, 31 May 2019 15:18:03 +0200,
> Ranjani Sridharan wrote:
> > 
> > On Fri, 2019-05-31 at 08:11 +0200, Takashi Iwai wrote:
> > > On Thu, 30 May 2019 23:00:10 +0200,
> > > Pierre-Louis Bossart wrote:
> > > > 
> > > > 
> > > > 
> > > > On 5/30/19 3:18 PM, Ranjani Sridharan wrote:
> > > > > Calling snd_device_new() makes the codec devices managed by
> > > > > the
> > > > > card.
> > > > > So, when the card is removed, the refcount for the codec
> > > > > device is decremented and results in the codec device's
> > > > > kobject
> > > > > being cleaned up if the refcount is 0. But, this leads to a
> > > > > NULL
> > > > > pointer exception while attempting to remove the symlinks
> > > > > when
> > > > > the
> > > > > codec driver is released later on. Therefore, increment the
> > > > > codec
> > > > > device's refcount before adding it to the card to prevent
> > > > > this.
> > > > 
> > > > Ranjani, you should add a bit of context for the rest of the
> > > > list...
> > > > 
> > > > This patch suggest a solution to a set of sightings occurring
> > > > when
> > > > removing/adding modules in a loop, and the current analysis
> > > > points
> > > > to
> > > > a difference between the way the HDMI and HDaudio codecs are
> > > > handled.
> > > > 
> > > > https://github.com/thesofproject/linux/issues/981
> > > > https://github.com/thesofproject/linux/issues/966
> > > > https://github.com/thesofproject/linux/pull/988
> > > > 
> > > > Since it's not SOF specific it's better to get feedback
> > > > directly
> > > > from
> > > > the large ALSA community/maintainers. We probably want to focus
> > > > on
> > > > the
> > > > platform-specific/vendor-specific stuff on GitHub and use the
> > > > mailing
> > > > list for such framework-level changes.
> > > 
> > > Hm, I still wonder why this doens't happen with the HDA legacy.
> > > 
> > > What is the shortest way to trigger the bug manually without a
> > > script?
> > 
> > Hi Takashi,
> > 
> > With SOF, I can reproduce the issue if I just unload the
> > sof_pci_dev
> > module with rmmod. 
> > 
> > Basically, the remove routine for the SOF pci device, unregisters
> > the
> > machine driver and then removes the codec device. So the first step
> > of
> > unregistering the machine driver frees the card which decrements
> > the
> > refcount for the HDA codec's kobject. In the case of HDMI codec,
> > since
> > it is not managed by the card, the refcount is not decremented when
> > the
> > card is removed. 
> 
> So it's only about hdac_hdmi codec, or only about hdac_hda codec?

It is only about the hdac_hda codec. 
> 
> And why HDMI codec isn't managed by the card...?  IOW, isn't it
> dangerous -- it means the codec being always removable after bound to
> the card?
That is a good point. Probably this needs to be fixed as well. I can
include the change for that if you think it is the right thing to do.

But I was wondering if it makes sense to increment the refcount when
the device is added to the card with snd_device_new()? 
I'm not sure how it affects the other devices so didnt go down this
route.

Thanks,
Ranjani

> 
> 
> thanks,
> 
> Takashi

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

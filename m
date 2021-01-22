Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD945300F96
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 23:06:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74A141B15;
	Fri, 22 Jan 2021 23:05:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74A141B15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611353165;
	bh=lUCWfw7f240R3Ad1Phna3RN3XJNd6j8EtY2Ow3mu/9g=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eZtplqEpjXszf5n0ImKj6tqw7I+f7uVM3LIArdqCKz2zdcZZ0LMMpC5klKISsKTb1
	 IJ6GC4DZVC+jWgNvWi7riHCklQA++or33hCGox9a0iUfE+PdQO7nE0RdDNcNLGMfts
	 LNvTIXlWMWx3En4Gnj7tWujgvTPdU9K8wAi0bf8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9520CF80129;
	Fri, 22 Jan 2021 23:04:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFD9FF8016E; Fri, 22 Jan 2021 23:04:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09509F80129
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 23:04:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09509F80129
IronPort-SDR: kCfTLE86JBj2Sy38Em547NxV/CcfBHqgdw74jS9nEmZUANeDwrarE5C9w9JTEW7ynpJ78lF/TS
 lfJyQ9UH8PWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9872"; a="264335311"
X-IronPort-AV: E=Sophos;i="5.79,367,1602572400"; d="scan'208";a="264335311"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 14:04:15 -0800
IronPort-SDR: hwJbusAXe2iGnR7jloxxqLn3B09kr9AFMxjy4SkIQdh1Hx4Bi+kKbrbEc6YqnJMmXZjtadJdXL
 pMxT2XB1LazA==
X-IronPort-AV: E=Sophos;i="5.79,367,1602572400"; d="scan'208";a="367583949"
Received: from ovakana-mobl1.amr.corp.intel.com ([10.255.229.172])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 14:04:14 -0800
Message-ID: <a43dcad502b2233bb96a4e4508585830a5b4b7c2.camel@linux.intel.com>
Subject: Re: Question about hdac_ext_link ref_count management
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Fri, 22 Jan 2021 14:04:13 -0800
In-Reply-To: <s5hk0s47w6m.wl-tiwai@suse.de>
References: <aca60b522335f3f916f9f8f204693365bfc32231.camel@linux.intel.com>
 <s5h1red83ic.wl-tiwai@suse.de>
 <9888b27b0dc9399861ecbee23d5d4ea0d844718c.camel@linux.intel.com>
 <s5hk0s47w6m.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com
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

On Fri, 2021-01-22 at 17:50 +0100, Takashi Iwai wrote:
> On Fri, 22 Jan 2021 17:40:55 +0100,
> Ranjani Sridharan wrote:
> > On Fri, 2021-01-22 at 15:12 +0100, Takashi Iwai wrote:
> > > On Fri, 22 Jan 2021 00:23:53 +0100,
> > > Ranjani Sridharan wrote:
> > > > Hi Takashi,
> > > > 
> > > > While exploring some power optimizations on Intel platforms, I
> > > > noticed
> > > > that the hdac_ext_link ref_count is incremented during codec
> > > > probe
> > > > in hdac_hda_codec_probe() and the ref_count is held until the
> > > > codec
> > > > device is removed. 
> > > > 
> > > > I was wondering if it would be possible to call the get/put for
> > > > the
> > > > hdac_ext_link in the codec runtime suspend/resume callbacks so
> > > > that
> > > > the
> > > > link is powered up only when the link is in use. Are there any
> > > > downsides to doing this? 
> > > 
> > > Wouldn't the  snd_hdac_ext_bus_link_power_up() / down() calls do
> > > the
> > > runtime PM stuff?  Maybe we need to revisit those link power
> > > management.  The ext stuff isn't well m
> > > and, I'm afraid.
> > Thanks, Takashi.
> > It looks like snd_hdac_ext_bus_link_power_up/down() are only called
> > during snd_hdac_ext_bus_link_get/put(). Actually, in my observation
> > disabling the CORB/RIRB buffer DMAs is what saves us power and this
> > is
> > done only if snd_hdac_ext_bus_link_put() is called on all links.
> > 
> > > The get() and put() are obviously for fully enabling and
> > > disabling
> > > the
> > > device, hence it's not suitable for the runtime PM
> > > suspend/resume.
> > > The power_up() / down() should be adjusted to fit with the
> > > runtime PM
> > > call, if any.
> > 
> > The only additional thing that snd_hdac_ext_bus_link_get/put() does
> > on
> > top of snd_hdac_ext_bus_link_power_up/down() is to stop the
> > CORB/RIRB
> > DMA when all the link ref_counts are 0. Do you think it is not
> > advisable to stop the CORB/RIRB DMA during runtime PM?
> 
> Why do you need to stop CORB/RIRB?  For stopping the CORB/RIRB DMA,
> you need to disable the IRQ and other stuff at first, in anyway.

Hi Takashi,

I've confirmed that turning off the link and stopping CORB/RIRB is what
yields the maximum power savings. Just powering off the link without
stopping CORB/RIRB does not yield meaningful savings.

If I may ask a question, we already stop CORB/RIRB and turn off the
links in the SOF runtime_suspend callback. The usecase we're trying to
optimize is when wake-on-voice is the only active stream. There is no
HDMI playback and the codec driver is runtime suspended. So, cant we do
the same thing as runtime suspend and turn off the CORB/RIRB as well as
the links too? What adverse impacts am I missing here?

Thanks,
Ranjani



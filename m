Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4871D3009A2
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 18:26:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1C671EEF;
	Fri, 22 Jan 2021 18:25:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1C671EEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611336373;
	bh=05VnOfbnvs4peje4mOZJuAVEH+S8OMDl+rEfq9gwarg=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UG3U7mqfGmrvg4kRuALSwa/4FBWrZ7s4UPX1sZ/3xW9XaTc1bxLWBzraQHmL6bZ2p
	 p5y+BEA9WUS5TmlA4A20afjOR60oZM9WQ2NVJf5//JGPDnRDYBUd59C0TcP9XiVr8A
	 wM9WGUzq6c19mQWinZpR5XalhBKsWhq9XcfN4ddo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0B51F80166;
	Fri, 22 Jan 2021 18:24:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88740F8016E; Fri, 22 Jan 2021 18:24:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F4FFF8015B
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 18:24:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F4FFF8015B
IronPort-SDR: mH9GjfR4ajTVte+BsLkRXx62IAG+W+lWcrMTeCmURjvtgjXrSpe9KLoBR/Gax/CY7rUaMlbZjy
 KqehU/vJYsTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9872"; a="241016564"
X-IronPort-AV: E=Sophos;i="5.79,367,1602572400"; d="scan'208";a="241016564"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 09:24:24 -0800
IronPort-SDR: SBngMueUiX8VlTAEO4ot/4yW5n+jDoX7KoMhG03U344707mtw/A0IFDfvw1tnUF5FN4LX4fFN5
 ZzuJzCw78OgQ==
X-IronPort-AV: E=Sophos;i="5.79,367,1602572400"; d="scan'208";a="367505806"
Received: from ovakana-mobl1.amr.corp.intel.com ([10.255.229.172])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 09:24:23 -0800
Message-ID: <1cc3c8a6326ec83e2a33310f6a80daa23fe65782.camel@linux.intel.com>
Subject: Re: Question about hdac_ext_link ref_count management
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Fri, 22 Jan 2021 09:24:23 -0800
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

> > 
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

I see. Let me go back and double check if powering down the link during
codec runtime suspend yields the same results in terms of power as well
and get back to you.

Thanks,
Ranjani


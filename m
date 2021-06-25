Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0803B3AC1
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Jun 2021 04:13:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DF761662;
	Fri, 25 Jun 2021 04:12:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DF761662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624587197;
	bh=WeDagUQyTub2wyjLODWe2w4SgWNZgNSSMjAPtFRFgj0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UWbk3vprJx7iv/Q9Nxu0mG5WmlNIyVnyaSS2Lv3EvBRnB40i1G7DYosfJPHOcpTjF
	 kri2iNt5+yRm9mhJcn3FDW8+osNHpRIIBX2toUV/MuZhZLNcOoVjFnNuTGx/hS/wTT
	 WfuXM2NwZwp/nkuZXG6AD3I0gOg/abFRzqkQ53W0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A19A0F801DB;
	Fri, 25 Jun 2021 04:11:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AD20F80137; Fri, 25 Jun 2021 04:11:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC5AFF80137
 for <alsa-devel@alsa-project.org>; Fri, 25 Jun 2021 04:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC5AFF80137
Received: by m.b4.vu (Postfix, from userid 1000)
 id 424EC61E5F2F; Fri, 25 Jun 2021 11:41:42 +0930 (ACST)
Date: Fri, 25 Jun 2021 11:41:42 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: ALSA: scarlett2: Default on?
Message-ID: <20210625021142.GB21766@m.b4.vu>
References: <20210624154739.GA20351@m.b4.vu>
 <s5hk0mjkvoa.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hk0mjkvoa.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
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

On Thu, Jun 24, 2021 at 07:40:53PM +0200, Takashi Iwai wrote:
> On Thu, 24 Jun 2021 17:47:39 +0200,
> Geoffrey D. Bennett wrote:
> > 
> > On Wed, Jun 23, 2021 at 08:39:24AM +0200, Takashi Iwai wrote:
> > [...]
> > > OK, now all patches have been merged.
> > 
> > Thanks!
> > 
> > I would next like to consider how we can enable this mixer driver by
> > default. I originally added the device_setup=1 gate because there were
> > reports of the driver making the interface hang. These were all traced
> > back to the problem which was resolved with the commit "Fix device
> > hang with ehci-pci". That commit fixed the issue for those who had
> > reported it and since then there have been no more reports that the
> > mixer driver causes any issues.
> > 
> > Simply removing the device_setup=1 check would leave users with no way
> > to disable the driver in case that turns out to be necessary for some
> > reason though, so I don't think that's a good idea.
> 
> They can blacklist snd-usb-audio, either the module itself (if it's
> the only device), or with enable option of snd-usb-audio module, if
> there are multiple devices bound with the driver.

But wouldn't that disable audio for the device entirely? I am talking
about only disabling the mixer part of the driver (the code in
mixer_scarlett_gen2.c) which uses the proprietary USB messages. So
that if there is some unseen so-far bug the user can revert to
previous behaviour of audio working but no proprietary controls.

> > What I think would be the best option would be to have the driver as
> > its own loadable module. Does this sound like a good idea to you?
> 
> I'm not against splitting, but that is no solution at all, per se.
> 
> 
> Takashi

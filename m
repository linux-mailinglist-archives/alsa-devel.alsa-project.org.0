Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D6A164C40
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 18:41:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00D8916A9;
	Wed, 19 Feb 2020 18:40:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00D8916A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582134066;
	bh=n09TfX6KRd/GHvXKrWyESxKzpL2lx3JGrS0xttGDE8U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hF/M0Hy+HPG3ObOKW2QRRj7ZsD4/ov49BAL/vaPeIHivonRC0WxRoe1+JevzE6/Qo
	 rq0pJojVFVoKlk6yy9bN2zoxSe0hthVxThMww5l5JzDcLTloSd+iazKEbr4yBGoIuA
	 np3WqTYQhPpF08kNhjPISgpLzaQ7a0yZrMvgMLss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBF0FF80142;
	Wed, 19 Feb 2020 18:39:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 194ADF80273; Wed, 19 Feb 2020 18:39:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from muru.com (muru.com [72.249.23.125])
 by alsa1.perex.cz (Postfix) with ESMTP id 17E26F80142
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 18:39:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17E26F80142
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 9F75C80F3;
 Wed, 19 Feb 2020 17:39:53 +0000 (UTC)
Date: Wed, 19 Feb 2020 09:39:02 -0800
From: Tony Lindgren <tony@atomide.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: cpcap: Implement set_tdm_slot for voice call support
Message-ID: <20200219173902.GA37466@atomide.com>
References: <20200211181005.54008-1-tony@atomide.com>
 <ae2b7d9e-d05e-54ac-4f18-27cc8c4e81a0@ti.com>
 <20200212144620.GJ64767@atomide.com>
 <9a060430-5a3e-61e1-3d2c-f89819d9436f@ti.com>
 <20200217232325.GD35972@atomide.com>
 <8fc1dded-6d28-f5cd-f2f9-3a6810571119@ti.com>
 <20200218153211.GI35972@atomide.com>
 <20200218170628.r47xc3yydg6xx2yh@earth.universe>
 <20200218174258.GK4232@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200218174258.GK4232@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>,
 Takashi Iwai <tiwai@suse.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Pavel Machek <pavel@ucw.cz>, linux-omap@vger.kernel.org,
 "Arthur D ." <spinal.by@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
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

* Mark Brown <broonie@kernel.org> [200218 17:43]:
> On Tue, Feb 18, 2020 at 06:06:28PM +0100, Sebastian Reichel wrote:
> 
> > simple-graph-card is the current machine driver. We might have to
> > introduce a Droid 4 specific driver instead. I used simple(-graph)-card
> > instead of introducing a new driver, since the setup was simple enough
> > without modem and bluetooth. The simple card was perfect to test the CPCAP
> > codec driver. The TDM things might be complex enough to create
> > a new machine driver (as I mentioned in the original patchset
> > adding CPCAP codec support).
> 
> I tend to agree here, phones are generally one of the most complicated
> classes of system for clocking and interconnects and the CODECs they use
> often the most complex too so they're really stretching the generic
> cards.  It'd be nice to be able to handle things with generic cards but
> it's likely you'll run into issues that it'd be unreasonable to force
> you to address for system enablement.  OTOH if you manage to get one of
> the generic cards working well that'd be excellent!

Well to me it seems that we just already have all the data needed with
the graph binding and snd-soc-audio-graph-card + codec2codec support.

I don't think we have cases where the cpcap codec is not the master,
so as long as the cpcap codec knows what's going on then there
may not be a need for machine driver.

I guess the the bluetooth to modem path is the one to check to see
what provides the clocks..

Regards,

Tony

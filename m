Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E9C168623
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 19:10:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D015916C7;
	Fri, 21 Feb 2020 19:09:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D015916C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582308621;
	bh=UgMVSZKvFSWlp5v/OxbZklqlFRNqAf02Lty8NYzOhwA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c8TLfOOpwKZxozI21OGF400cMPOi3+wSeoSzAWWPXMQtqkAu7e/YHTDgWPnW2u4Nh
	 6BAEKsxXrp2GpWKY7p3km1n3rmbGMO8TeaHwn2rjb6pmKIPjgylJq/mb3ZCMXPhXWQ
	 TxNugG+5IM83Jk0XyRGPLpIysh4A1CipFbx094tg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 963C9F80273;
	Fri, 21 Feb 2020 19:08:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46F2AF8025F; Fri, 21 Feb 2020 19:08:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=NO_DNS_FOR_FROM, SPF_HELO_NONE,
 SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from muru.com (muru.com [72.249.23.125])
 by alsa1.perex.cz (Postfix) with ESMTP id F1507F800C5
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 19:08:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1507F800C5
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 060D9807E;
 Fri, 21 Feb 2020 18:09:08 +0000 (UTC)
Date: Fri, 21 Feb 2020 10:08:21 -0800
From: Tony Lindgren <tony@atomide.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH] ASoC: ti: Allocate dais dynamically for TDM and audio
 graph card
Message-ID: <20200221180821.GA37466@atomide.com>
References: <20200212143543.GI64767@atomide.com>
 <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
 <20200214170322.GZ64767@atomide.com>
 <d9a43fcb-ed0f-5cd5-7e22-58924d571d17@ti.com>
 <20200217231001.GC35972@atomide.com>
 <5402eba8-4f84-0973-e11b-6ab2667ada85@ti.com>
 <20200218211631.fxojsxzvttoidfed@earth.universe>
 <a263a857-bb8a-0e37-6932-dd07df98ad63@ti.com>
 <20200220201559.GX37466@atomide.com>
 <9ea8239f-3b2d-8206-95ee-2789fbae83d4@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ea8239f-3b2d-8206-95ee-2789fbae83d4@ti.com>
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Merlijn Wajer <merlijn@wizzup.org>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>,
 linux-omap@vger.kernel.org, "Arthur D ." <spinal.by@gmail.com>,
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

* Peter Ujfalusi <peter.ujfalusi@ti.com> [200221 13:21]:
> Hi Tony,
> 
> On 20/02/2020 22.15, Tony Lindgren wrote:
> > * Peter Ujfalusi <peter.ujfalusi@ti.com> [200220 14:16]:
> >> On 18/02/2020 23.16, Sebastian Reichel wrote:
> >>> I suppose in the end its a question if generic card can provide TDM
> >>> support.
> >>
> >> Sure it can, but can it handle the switching between the paths based on
> >> use cases?
> >> There should be machine level DAPM widgets to kick codec2codec (MDM6600
> >> - CPAC_voice for example) and also to make sure that when you switch
> >> between them the system is not going to get misconfigured.
> >> Switching between CPAC and BT route during call?
> >> Not allowing VoIP while on call, etc.
> > 
> > Well I guess the key thing to check here is if it's enough to
> > keep track of things in the cpcap codec driver. If cpcap is always
> > involved, that should be sufficient.
> 
> The codec driver should keep track on what it can do, but should not
> start policing the outside world.
> The machine driver knows the connections and should tell the components
> on what to do.

OK that makes senes to me. So I guess now the question is if
we can maintain this state in snd-soc-audio-graph-card instead
of needing a custom machine driver.

Regards,

Tony

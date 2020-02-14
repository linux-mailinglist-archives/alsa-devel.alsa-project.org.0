Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C46C915EA14
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 18:11:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FC6C168A;
	Fri, 14 Feb 2020 18:11:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FC6C168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581700311;
	bh=cKIUgCdWxkkb2PIYZffI1L8Hs7ORKEv30EshOVg2CAI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ambkLt7ZHJOadmKAtVoya42nj+vo7hp9jR6rCzGnw2X/cwiNpgPaigtSKtXlVhYqs
	 c/U7tYo1YUUSiIIOyq/wMyKCXOuqTByrTjd60y1X0Fog2s7kw0cPar13cOkAbWqyq2
	 wAtaHt162qgjeX+u2799kziMcWFPdF1E6SzofDLY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7911AF80086;
	Fri, 14 Feb 2020 18:10:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AC3BF8013E; Fri, 14 Feb 2020 18:10:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=NO_DNS_FOR_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from muru.com (muru.com [72.249.23.125])
 by alsa1.perex.cz (Postfix) with ESMTP id 5CEE7F80086
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 18:09:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CEE7F80086
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 0E82B80E7;
 Fri, 14 Feb 2020 17:10:33 +0000 (UTC)
Date: Fri, 14 Feb 2020 09:09:46 -0800
From: Tony Lindgren <tony@atomide.com>
To: Sebastian Reichel <sre@kernel.org>
Message-ID: <20200214170946.GB64767@atomide.com>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <20200214003452.xuadnylj2udqyljs@earth.universe>
 <20200214013454.GX64767@atomide.com>
 <20200214130428.gkhmr55ptmi2bh2x@earth.universe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200214130428.gkhmr55ptmi2bh2x@earth.universe>
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Aaro Koskinen <aaro.koskinen@iki.fi>, linux-kernel@vger.kernel.org,
 Merlijn Wajer <merlijn@wizzup.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 "Arthur D ." <spinal.by@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: ti: Allocate dais dynamically for
 TDM and audio graph card
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

* Sebastian Reichel <sre@kernel.org> [200214 13:05]:
> On Thu, Feb 13, 2020 at 05:34:54PM -0800, Tony Lindgren wrote:
> > And bluetooth would be similar to cpcap_audio and mot_mdm6600_audio
> > above.
> 
> My understanding is, that CPU is not involved for calls (except for
> setting up cpcap registers correctly). Basically McBSP3 should
> remain idle for a call and data goes directly from modem to cpcap.
> The same should work for modem <-> BT, except that CPCAP seems to
> always provide the clock. That would imply a direct link between
> modem and codec / BT?

Yes the direct link is i2s. I'm ot sure if mcbsp can be idle during
voice call though, I guess it should be doable since mcbsp is not
the clock master :)

> > My guess is that only cpcap registers and clock rate needs to be
> > changed for bluetooth audio BTW, so if somebody havs a bluetooth
> > headset just do the following in Android:
> > 
> > # cpcaprw --all > /tmp/before
> > configure bluetooth headset for audio in android and start
> > playing some music or make a phone call
> > ...
> > # cpcaprw --all > /tmp/after
> > stop playing music or phone call
> > ...
> > diff -u /tmp/before /tmp/after
> > 
> > The registers will be different for a bluetooth phone call and
> > playing music.
> 
> I can provider register values once I find some time.

OK great.

Regards,

Tony

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

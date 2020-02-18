Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0611627FF
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 15:21:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73598169F;
	Tue, 18 Feb 2020 15:20:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73598169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582035665;
	bh=G6e1VzpmxOIF/WOf8kSYryoy4ac3z3aFGWDdMckuGb0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dse/9P0ylvuuUppWCA76jg5f2SH1mEOLkRs3thp23m8FY17Smg/bwjzU2wMlselwe
	 gk8VBj9crnkrkr+sSAU9aZBq/P3cxHD1AIrMgBHzGHArjuQPcUfbkL7whuk6kz/ZF9
	 rZ3prj3tIcJ2kgSzimgZwgmzkKppdk3zkFbqPaQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A06AFF80145;
	Tue, 18 Feb 2020 15:19:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D35FAF80148; Tue, 18 Feb 2020 15:19:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=NO_DNS_FOR_FROM, SPF_HELO_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from muru.com (muru.com [72.249.23.125])
 by alsa1.perex.cz (Postfix) with ESMTP id 8F9D8F80135
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 15:19:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F9D8F80135
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 6B43D8043;
 Tue, 18 Feb 2020 14:19:52 +0000 (UTC)
Date: Tue, 18 Feb 2020 06:19:05 -0800
From: Tony Lindgren <tony@atomide.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH] ASoC: ti: Allocate dais dynamically for TDM and audio
 graph card
Message-ID: <20200218141905.GG35972@atomide.com>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <20200214003452.xuadnylj2udqyljs@earth.universe>
 <20200214013454.GX64767@atomide.com>
 <20200214130428.gkhmr55ptmi2bh2x@earth.universe>
 <20200214170946.GB64767@atomide.com>
 <20200218140431.emrxgvckrpltmg2s@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200218140431.emrxgvckrpltmg2s@earth.universe>
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Aaro Koskinen <aaro.koskinen@iki.fi>, linux-kernel@vger.kernel.org,
 Merlijn Wajer <merlijn@wizzup.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 "Arthur D ." <spinal.by@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>
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

* Sebastian Reichel <sebastian.reichel@collabora.com> [200218 06:05]:
> Hi,
> 
> On Fri, Feb 14, 2020 at 09:09:46AM -0800, Tony Lindgren wrote:
> > * Sebastian Reichel <sre@kernel.org> [200214 13:05]:
> > > On Thu, Feb 13, 2020 at 05:34:54PM -0800, Tony Lindgren wrote:
> > > > And bluetooth would be similar to cpcap_audio and mot_mdm6600_audio
> > > > above.
> > > 
> > > My understanding is, that CPU is not involved for calls (except for
> > > setting up cpcap registers correctly). Basically McBSP3 should
> > > remain idle for a call and data goes directly from modem to cpcap.
> > > The same should work for modem <-> BT, except that CPCAP seems to
> > > always provide the clock. That would imply a direct link between
> > > modem and codec / BT?
> > 
> > Yes the direct link is i2s. I'm ot sure if mcbsp can be idle during
> > voice call though, I guess it should be doable since mcbsp is not
> > the clock master :)
> > 
> > > > My guess is that only cpcap registers and clock rate needs to be
> > > > changed for bluetooth audio BTW, so if somebody havs a bluetooth
> > > > headset just do the following in Android:
> > > > 
> > > > # cpcaprw --all > /tmp/before
> > > > configure bluetooth headset for audio in android and start
> > > > playing some music or make a phone call
> > > > ...
> > > > # cpcaprw --all > /tmp/after
> > > > stop playing music or phone call
> > > > ...
> > > > diff -u /tmp/before /tmp/after
> > > > 
> > > > The registers will be different for a bluetooth phone call and
> > > > playing music.
> > > 
> > > I can provider register values once I find some time.
> 
> [NI] Normal idle (no BT headset connected)
> [BI] Bluetooth idle (with BT headset connected)
> [BC] Bluetooth call in progress
> [NC] Normal call in progress (BT headset disabled)
> 
>                      [NI]  =>  [BI]  =>  [BC]  =>  [NC]
> CPCAP_REG_VAUDIOC   0x0065 => 0x0065 => 0x0065 => 0x0025
> CPCAP_REG_CC        0x0000 => 0x0000 => 0x6000 => 0x60df
> CPCAP_REG_CDI       0x0040 => 0x0000 => 0xaa40 => 0xae0a
> CPCAP_REG_SDAC      -------------- 0x0000 --------------
> CPCAP_REG_SDACDI    -------------- 0x0004 --------------
> CPCAP_REG_TXI       0x0804 => 0x0004 => 0x0000 => 0x0cc6
> CPCAP_REG_TXMP      0x079c => 0x079c => 0x0400 => 0x0673
> CPCAP_REG_RXOA      0x0000 => 0x0000 => 0x0001 => 0x0001
> CPCAP_REG_RXVC      0x0d34 => 0x0d34 => 0x0000 => 0x0b2c
> CPCAP_REG_RXCOA     0x0000 => 0x0000 => 0x0000 => 0x0601
> CPCAP_REG_RXSDOA    0x0000 => 0x0000 => 0x0600 => 0x0600
> CPCAP_REG_RXEPOA    -------------- 0x0400 --------------
> CPCAP_REG_RXLL      -------------- 0x0000 --------------
> CPCAP_REG_A2LA      -------------- 0x0030 --------------
> CPCAP_REG_MIPIS1    -------------- 0x0000 --------------
> CPCAP_REG_MIPIS2    -------------- 0x0000 --------------
> CPCAP_REG_MIPIS3    -------------- 0x0000 --------------
> CPCAP_REG_LVAB      -------------- 0x0000 --------------

Great thanks! Care to do also a dump just playing music to on
bluetooth headset at some point?

Regards,

Tony



Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 914B064D86D
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Dec 2022 10:19:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A7F818DB;
	Thu, 15 Dec 2022 10:18:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A7F818DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671095944;
	bh=tAGWssqs6Y+Evzhu2VStTCAYSFFp9/Hq4bHt3MZywCM=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sVLntzfEz0H3+G29fa2dQoVvoE/3vItNupBOjmQdYTldbC1m2CpH84H6hIFw6feRj
	 Av9sR5sxF8ZdFDiYM9h4FH/YsOHKPaxHKCKdR6eP1cryLKLmJc0Bz/8/bFfd/RGmDi
	 OzGOsG9+DyBSiLtk/0JcRrIzPwVU57bJWR5lyDY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7427F80141;
	Thu, 15 Dec 2022 10:18:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D636F804ED; Thu, 15 Dec 2022 10:18:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88173F801D5
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 10:17:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88173F801D5
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1p5kNA-0007jH-PM; Thu, 15 Dec 2022 10:17:48 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1p5kN9-0001pe-Jb; Thu, 15 Dec 2022 10:17:47 +0100
Date: Thu, 15 Dec 2022 10:17:47 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: max98088: fix initial dai mute state
Message-ID: <20221215091747.xn3f7ecrwoc7ssyo@pengutronix.de>
References: <20221213095328.122309-1-r.czerwinski@pengutronix.de>
 <20221213095328.122309-2-r.czerwinski@pengutronix.de>
 <Y5hpqWH2WuSIUHil@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5hpqWH2WuSIUHil@sirena.org.uk>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org,
 Rouven Czerwinski <r.czerwinski@pengutronix.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 kernel@pengutronix.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Mark,

On 22-12-13, Mark Brown wrote:
> On Tue, Dec 13, 2022 at 10:53:28AM +0100, Rouven Czerwinski wrote:
> 
> > To fix that we need to explicit set the mute state. Now the first
> > playback request gets played correctly.
> 
> > +++ b/sound/soc/codecs/max98088.c
> > @@ -1710,6 +1710,11 @@ static int max98088_probe(struct snd_soc_component *component)
> >         snd_soc_component_write(component, M98088_REG_1E_DAI2_IOCFG,
> >                 M98088_S2NORMAL|M98088_SDATA);
> >  
> > +       snd_soc_component_update_bits(component, M98088_REG_2F_LVL_DAI1_PLAY,
> > +               M98088_DAI_MUTE_MASK, M98088_DAI_MUTE);
> > +       snd_soc_component_update_bits(component, M98088_REG_31_LVL_DAI2_PLAY,
> > +               M98088_DAI_MUTE_MASK, M98088_DAI_MUTE);
> > +
> 
> Won't this be broken again after suspend?  The device gets powered off
> over suspend, then when it powers on again with the output unmuted
> nothing will do another write since the register is already in the state
> in the cache.

I didn't found any suspend logic within the driver. Is this handled
within the ASoC core?

Regards,
  Marco

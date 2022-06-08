Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 931F8542B91
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jun 2022 11:29:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC49417B2;
	Wed,  8 Jun 2022 11:28:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC49417B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654680556;
	bh=OJg5R3Z8SRe2349PacDzTgVNfHg9wT1Ckk+x1XBo6bU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XYjOxh5lzrqoNHl5JfVKJ2pIHhZIXyNRKbDu2ZJJqmRJuV54rqx2BUhNuHZr2IFOm
	 SwTjuiAndBzt4HUzROtI4G8Qr2M9qJzpz+Ux8F1tyzDOlEMlW5xZ5K7wMPZTWM7lcy
	 A3DUVlrNck92qMhodqRdAIKS862omMLVIswQGiAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22D76F80118;
	Wed,  8 Jun 2022 11:28:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82B55F8024C; Wed,  8 Jun 2022 11:28:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E61DDF80118
 for <alsa-devel@alsa-project.org>; Wed,  8 Jun 2022 11:28:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E61DDF80118
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nyryt-0004KR-LB; Wed, 08 Jun 2022 11:28:03 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nyrys-0002TW-UP; Wed, 08 Jun 2022 11:28:02 +0200
Date: Wed, 8 Jun 2022 11:28:02 +0200
From: Sascha Hauer <sha@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: Audio mem2mem devices aka asymmetric sample rate converters
Message-ID: <20220608092802.GV1615@pengutronix.de>
References: <20220602112106.GO2387@pengutronix.de>
 <Ypit14mY/Tx8pgK2@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ypit14mY/Tx8pgK2@sirena.org.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
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

On Thu, Jun 02, 2022 at 02:32:23PM +0200, Mark Brown wrote:
> On Thu, Jun 02, 2022 at 01:21:06PM +0200, Sascha Hauer wrote:
> 
> > How would such units be integrated into ASoC? I can think of two ways. First
> > would be to create an separate audio card from them which records on one end
> > and plays back with a different sample rate / format on the other end, in the
> > v4l2 world that would be a classical mem2mem device. Is Alsa/ASoc prepared for
> > something like this? Would it be feasible to go into such a direction? I
> > haven't found any examples for this in the tree.
> 
> You could certainly do that, though I'd expect userspace wouldn't
> know what to do with it without specific configuration.  It also
> feels like it's probably not what users really want - generally
> the use case is for rewriting an audio stream without going back
> to memory, going back to memory means chopping things up into
> periods which would tend to introduce additional latency and/or
> fragility which is undesirable even if the devices were DMAing
> directly to memory.
> 
> > The other way is to attach the ASRC to an existing audio card. That is done
> > with the existing in-tree sound/soc/fsl/fsl_asrc.c and
> > sound/soc/fsl/fsl_easrc.c drivers.  This approach feels somehow limited as it's
> > not possible to just do conversions without playing/recording something. OTOH
> > userspace is unaffected which might be an advantage. What nags me with that
> > approach is that it's currently not integrated into the simple-audio-card or
> > audio-graph-card bindings. Currently the driver can only be used in conjunction
> > with the fsl,imx-audio-* card driver. It seems backward to integrate such a
> > generic ASRC unit into a special purpose audio card driver. The ASoC core is
> > fully unaware of the ASRC with this approach currently which also doesn't look
> > very appealing. OTOH I don't know if ASoC could handle this. Can ASoC handle
> > for example a chain of DAIs when there are different sample rates and formats
> > in that chain?
> 
> This is essentially the general problem with DPCM not really
> scaling at all well, we need to rework the core so that it
> understands tracking information about the digital parameters of
> signals through the system like it tracks simple analog on/off
> information.  At the minute the core doesn't really understand
> what's going on with the digital routing within the SoC at all,
> it's all done with manual fixups.
> 
> If you search for talks from Lars-Peter Clausen at ELC-E you
> should find some good overviews of the general direction.

You likely mean https://www.youtube.com/watch?v=6oQF2TzCYtQ. That indeed
gives a good overview where we are and where we want to go.

> This
> is broadly what all the stuff about converting everything to
> components is going towards, we're removing the distinction
> between CPU and CODEC components so that everything is
> interchangable.  The problem is that someone (ideally people with
> systems with this sort of hardware!) needs to do a bunch of heavy
> lifting in the framework and nobody's had the time to work on the
> main part of the problem yet.  Once it's done then things like
> the audio-graph-card should be able to handle things easily.
> 
> In theory right now you should implement the ASRC as a component
> driver.  You can then set it up as a standalone card if you want
> to, or integrate into a custom card as you do now.

Thanks for your input. I'll see how far I get.

Sascha


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

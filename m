Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECF826A70C
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 16:29:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B61C1676;
	Tue, 15 Sep 2020 16:28:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B61C1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600180178;
	bh=XabeN+MBS9k9ZL9I+s35yQaHkcjQA3j6hppuIob2ayo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OCrFxlgefCpi85P6UNg8dofZU2mnRSImLysaMheBjVGg97O9dMVSUr+1u+/EmXnGo
	 xZZsZnmt4tgUiJezNv91n6333CgRAeHYGCqlxSV9etyiZQLayaWphelQzb2yaDUHTq
	 Kqsri2rRPr2t1KrH8n8MvLpaMqEG9sis87o4U5I8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 230BBF80146;
	Tue, 15 Sep 2020 16:27:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97CE4F80146; Tue, 15 Sep 2020 16:27:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_25,PRX_BODY_59,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A43EAF80146
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 16:27:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A43EAF80146
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr
 [90.65.88.165]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 86096C001D;
 Tue, 15 Sep 2020 14:27:43 +0000 (UTC)
Date: Tue, 15 Sep 2020 16:27:43 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 3/3] ASoC: tlv320aic32x4: Enable fast charge
Message-ID: <20200915142743.GB9675@piout.net>
References: <20200911173140.29984-1-miquel.raynal@bootlin.com>
 <20200911173140.29984-4-miquel.raynal@bootlin.com>
 <20200915082602.GH4230@piout.net>
 <20200915115034.GA5576@sirena.org.uk>
 <20200915130207.GA9675@piout.net>
 <20200915141025.GB4913@sirena.org.uk>
 <20200915161401.54f6d4f3@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915161401.54f6d4f3@xps13>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

On 15/09/2020 16:14:01+0200, Miquel Raynal wrote:
> Mark Brown <broonie@kernel.org> wrote on Tue, 15 Sep 2020 15:10:25
> +0100:
> 
> > On Tue, Sep 15, 2020 at 03:02:07PM +0200, Alexandre Belloni wrote:
> > > On 15/09/2020 12:50:34+0100, Mark Brown wrote:  
> > > > On Tue, Sep 15, 2020 at 10:26:02AM +0200, Alexandre Belloni wrote:  
> > > > > On 11/09/2020 19:31:40+0200, Miquel Raynal wrote:  
> > 
> > > > > > +	/*
> > > > > > +	 * Enable the fast charging feature and ensure the needed 40ms ellapsed
> > > > > > +	 * before using the analog circuits.
> > > > > > +	 */
> > > > > > +	snd_soc_component_write(component, AIC32X4_REFPOWERUP,
> > > > > > +				AIC32X4_REFPOWERUP_40MS);
> > > > > > +	msleep(40);
> > > > > > +  
> > 
> > > > > Maybe the actual REFPOWERUP value could be exposed as a control so
> > > > > userspace has a way to set the policy?   
> > 
> > > > We very rarely do this, there's not usially anything   
> > 
> > > Could you suggest something then? This mainly changes the power
> > > codec power consumption. I guess people will want to trade latency
> > > for less consumption.  
> > 
> > Is it increasing steady state power consumption or is it just drawing
> > more power during the ramp (ie, peak current consumption is bigger)?
> > Usually this is trading off clean ramps for fast ramps rather than
> > affecting steady state.  If it's affecting steady state a control seems
> > sensible.
> 
> Indeed, it is just affecting the ramp (peak current is bigger).
> 

However, forcing powerup at probe time versus at play time means that
you consume power even when not playing audio.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

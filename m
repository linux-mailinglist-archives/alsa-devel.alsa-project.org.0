Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1948820F85
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 22:14:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89C8416D4;
	Thu, 16 May 2019 22:14:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89C8416D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558037697;
	bh=Kaiz6fhGb5gfiuLIWbQfprCE2d4B4S88UKRbhoebtTk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LX1fd8Uo7GLjAT2JhqjDQ6lHtjxCArwEyiWgjv/QLeYi2dg7yxXXAWzkNIb/5czd9
	 O7szvwIBmNoIjAyOiTrcABjDVB/x1qEUhPocC+eEB5I7uep7T6V8K2fJ1smqTXz7VO
	 KOjuPyTGFbm2vTbFvLrrHRYkd7sBU9DBAE105Pfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9F81F806E7;
	Thu, 16 May 2019 22:13:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E05AF896B6; Thu, 16 May 2019 22:13:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_26, RCVD_IN_MSPIKE_H2,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84CF9F806E7
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 22:13:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84CF9F806E7
X-Originating-IP: 46.193.9.130
Received: from localhost (cust-west-pareq2-46-193-9-130.wb.wifirst.net
 [46.193.9.130]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id BC2EBC0005;
 Thu, 16 May 2019 20:12:58 +0000 (UTC)
Date: Thu, 16 May 2019 22:12:56 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Georgii Staroselskii <georgii.staroselskii@emlid.com>
Message-ID: <20190516201256.te7ya3n7ugbfmzrw@flea>
References: <1557925120-31498-1-git-send-email-georgii.staroselskii@emlid.com>
 <20190515135813.5y72f2h526yjkncy@flea>
 <20190515152749.GA2241@softcrasher>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515152749.GA2241@softcrasher>
User-Agent: NeoMutt/20180716
Cc: alsa-devel@alsa-project.org, dannym@scratchpost.org, tiwai@suse.com,
 lgirdwood@gmail.com, wens@csie.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] ASoC: sun4i-codec: fix first delay on
	Speaker
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

On Wed, May 15, 2019 at 06:27:49PM +0300, Georgii Staroselskii wrote:
> On Wed, May 15, 2019 at 03:58:13PM +0200, Maxime Ripard wrote:
> > > diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
> > > index 15d08e3..e0099519 100644
> > > --- a/sound/soc/sunxi/sun4i-codec.c
> > > +++ b/sound/soc/sunxi/sun4i-codec.c
> > > @@ -1329,6 +1329,15 @@ static int sun4i_codec_spk_event(struct snd_soc_dapm_widget *w,
> > >  	gpiod_set_value_cansleep(scodec->gpio_pa,
> > >  				 !!SND_SOC_DAPM_EVENT_ON(event));
> > >
> > > +	if (SND_SOC_DAPM_EVENT_ON(event)) {
> > > +		/*
> > > +		 * Need a delay to have the amplifier up. 700ms seems the best
> > > +		 * compromise between the time to let the amplifier up and the
> > > +		 * time not to feel this delay while playing a sound.
> > > +		 */
> > > +		msleep(700);
> > > +	}
> > > +
> >
> > Since this is an external amplifier, I guess they would have different
> > warm-up time depending on the exact part being used?
>
> I guess I might've used Speaker wrong and bumped into an existing
> issue.  The issue first arose when I needed to connect a speaker and
> use a mute GPIO pin to toggle it. I bumped into the lag similar to
> the one that has been fixed in bf14da7. The word "amplifier" here in
> my comments might be wrong and misleding. Sorry for that. I just
> measured the latency on the speaker I'm using and it is well under
> 1ms so this is the Allwinner DAC that is pushing the data with a
> lag. Or some other thing, I'm not sure.
>
> I want to stress again that I might've experienced the issue because
> I was abusing "Speaker" routing. I basically just needed the analog
> audio stream and mute GPIO handling done automatically.

Ok. I guess the comment should just be reflecting that then.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFFA1F776
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2019 17:29:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45DBC16BC;
	Wed, 15 May 2019 17:28:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45DBC16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557934186;
	bh=Y3NGfyzz+Em2WwE0INgQ9or381iNJ5IJrLBBFbj3Jes=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YOJ0FQ8EYIhrGkzOmOY5pTkC5hbTTRgGOXn+Snc4rwIaOSBXns0YGkmI+2STrL+qE
	 MdwEnoqgrYnnZZ17YLnUMZJU2J1KY0UZvTLEr6ou9PayC5PiEvlhdSSAoSaYJ+gA6Y
	 aNiCVh6AKDfwLMbwuI76bjDspw+wUSS5eIb/n9NM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41DA7F89684;
	Wed, 15 May 2019 17:28:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FAB3F8968A; Wed, 15 May 2019 17:27:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from forward102p.mail.yandex.net (forward102p.mail.yandex.net
 [IPv6:2a02:6b8:0:1472:2741:0:8b7:102])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E346F80C17
 for <alsa-devel@alsa-project.org>; Wed, 15 May 2019 17:27:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E346F80C17
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=emlid.com header.i=@emlid.com
 header.b="tnQRMJzn"
Received: from mxback6j.mail.yandex.net (mxback6j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::10f])
 by forward102p.mail.yandex.net (Yandex) with ESMTP id 4FBBC1D40BDA;
 Wed, 15 May 2019 18:27:54 +0300 (MSK)
Received: from smtp4o.mail.yandex.net (smtp4o.mail.yandex.net
 [2a02:6b8:0:1a2d::28])
 by mxback6j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id kDVHURfUA6-Rq4Wx0eM; 
 Wed, 15 May 2019 18:27:54 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlid.com; s=mail;
 t=1557934074; bh=C9/4v9tZ0QA/I8UwQ8+Wr54uQ98kB7tY2rAZlSGmGYI=;
 h=In-Reply-To:Subject:Cc:To:From:References:Date:Message-ID;
 b=tnQRMJznuo5R16cq/Ov8sa/PaVK+rORZKkA1sQYsDu0o7peSJuugenAiGPWBPUrlS
 Up1xPKTEoZMWy/XFlbCRjS95GmR1jY25LEe2yKUe4L0eJJOe3RT4ubBCE7e+4TGmF3
 VJRm9s/M6jk8QSmFGD3aS7F7dR37uzC5JOsQ8wj4=
Authentication-Results: mxback6j.mail.yandex.net; dkim=pass header.i=@emlid.com
Received: by smtp4o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
 biQI4DmMhu-Ro3qG95V; Wed, 15 May 2019 18:27:50 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client certificate not present)
Date: Wed, 15 May 2019 18:27:49 +0300
From: Georgii Staroselskii <georgii.staroselskii@emlid.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190515152749.GA2241@softcrasher>
References: <1557925120-31498-1-git-send-email-georgii.staroselskii@emlid.com>
 <20190515135813.5y72f2h526yjkncy@flea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515135813.5y72f2h526yjkncy@flea>
User-Agent: Mutt/1.5.24 (2015-08-30)
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

On Wed, May 15, 2019 at 03:58:13PM +0200, Maxime Ripard wrote:
Hi!

> Hi,
> 
> On Wed, May 15, 2019 at 03:58:40PM +0300, Georgii Staroselskii wrote:
> > This commit fixes the same issue as bf14da7 but for another codepath.
> > The issue can be triggered by having Speaker in codec audio routing.
> 
> Mentionning what "the issue" is in the commit log would be great.
> 

Sure, will do.

> > &codec {
> >         allwinner,pa-gpios = <&r_pio 0 11 GPIO_ACTIVE_HIGH>; /* PL11 */
> >         allwinner,audio-routing =
> >                 "Speaker", "LINEOUT";
> >
> >         status = "okay";
> > }
> >
> > Signed-off-by: Georgii Staroselskii <georgii.staroselskii@emlid.com>
> > ---
> >  sound/soc/sunxi/sun4i-codec.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
> > index 15d08e3..e0099519 100644
> > --- a/sound/soc/sunxi/sun4i-codec.c
> > +++ b/sound/soc/sunxi/sun4i-codec.c
> > @@ -1329,6 +1329,15 @@ static int sun4i_codec_spk_event(struct snd_soc_dapm_widget *w,
> >  	gpiod_set_value_cansleep(scodec->gpio_pa,
> >  				 !!SND_SOC_DAPM_EVENT_ON(event));
> >
> > +	if (SND_SOC_DAPM_EVENT_ON(event)) {
> > +		/*
> > +		 * Need a delay to have the amplifier up. 700ms seems the best
> > +		 * compromise between the time to let the amplifier up and the
> > +		 * time not to feel this delay while playing a sound.
> > +		 */
> > +		msleep(700);
> > +	}
> > +
> 
> Since this is an external amplifier, I guess they would have different
> warm-up time depending on the exact part being used?
> 

I guess I might've used Speaker wrong and bumped into an existing issue.
The issue first arose when I needed to connect a speaker and use a mute
GPIO pin to toggle it. I bumped into the lag similar to the one that has
been fixed in bf14da7. The word "amplifier" here in my comments might be wrong 
and misleding. Sorry for that. I just measured the latency on the speaker I'm
using and it is well under 1ms so this is the Allwinner DAC that is
pushing the data with a lag. Or some other thing, I'm not sure.

I want to stress again that I might've experienced the issue because
I was abusing "Speaker" routing. I basically just needed the analog 
audio stream and mute GPIO handling done automatically.

bf14da7 made me think that this is some hardware Allwinner issue that
needs to be fixed here. And well, it did fix the problem.

> If so, we should use a property and set it on a per-board basis.
> 

There might be a use case for that but this issue seems to be orthogonal
to this.

> Maxime
> 
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Best regards,
Georgii Staroselskii
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

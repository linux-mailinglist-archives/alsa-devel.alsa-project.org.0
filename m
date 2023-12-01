Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D5780060F
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Dec 2023 09:42:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45D92847;
	Fri,  1 Dec 2023 09:42:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45D92847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701420146;
	bh=h+Hbpyz8/Ys3nPCoj7QilE7/8sWLKRsC6ueKdnFEGPo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pl/tQxI2plWczJj3qLDeMwOZDF5JudYUlXC0xHkzNhi5v5m7lOwWyYsvm2yCquc07
	 wWRHSDi4ekPoZO1AZLL9kZHUDfXoecpG5zultjiAUaTJJHYJjPRu8whzkC1GP9f8VL
	 w+J9lcSGOxAnKhNIDSwLDbhmYyhqJukcAtufmCP0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3515BF80104; Fri,  1 Dec 2023 09:41:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8BF2F80570;
	Fri,  1 Dec 2023 09:41:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C583BF8016E; Fri,  1 Dec 2023 09:41:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B94FF800F5
	for <alsa-devel@alsa-project.org>; Fri,  1 Dec 2023 09:41:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B94FF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J7QCZVt+
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94FC0FF803;
	Fri,  1 Dec 2023 08:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701420080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3amwn1NJ1mTvbaM/76zfWCSHxT3BcZtBq0Slk1BBD5E=;
	b=J7QCZVt+qjfwtn4lkc+mRKNeWj9I7dyMQkTqCg6x3AxFrGxn6riCQlAAga7XqY3H0z4dvu
	ci6RBDDq+M64+xHcIAs+E/WwFUr1GUd8Qxu/bemppUt4V/OsVaPTk0/hdKzS/zo+6W2pnC
	27mFsOf9kA8DYdEMd4Dc93UdyLYS+PBJKdMVWFceH4fBUGeZSjQu5k9kTiHCgZXnqJqgrd
	UrXofxxypUS8Cc8+DrGRBiQ9mSKLll4xZvTwLqG4qChEGQvL5xAWBn5ntVeSWnutUArT0v
	aO4tKPgmuoj8ar/84F+YLKMMChuXD7iPKna1YgaZglNaMO8yzRZGvrUA0m169w==
Date: Fri, 1 Dec 2023 09:41:16 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Qiang Zhao" <qiang.zhao@nxp.com>, "Leo Li" <leoyang.li@nxp.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Shengjiu Wang" <shengjiu.wang@gmail.com>,
 "Xiubo Li" <Xiubo.Lee@gmail.com>, "Fabio Estevam" <festevam@gmail.com>,
 "Nicolin Chen" <nicoleotsuka@gmail.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Christophe Leroy"
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 15/17] soc: fsl: cpm1: qmc: Handle timeslot entries at
 channel start() and stop()
Message-ID: <20231201094116.65956f60@bootlin.com>
In-Reply-To: <46d0248d-c322-4856-8e9e-6468ac1b7a02@app.fastmail.com>
References: <20231128140818.261541-1-herve.codina@bootlin.com>
	<20231128140818.261541-16-herve.codina@bootlin.com>
	<46d0248d-c322-4856-8e9e-6468ac1b7a02@app.fastmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: 4SEMYUURO2BTL6FTNBUYIFMJ7CEB6USU
X-Message-ID-Hash: 4SEMYUURO2BTL6FTNBUYIFMJ7CEB6USU
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4SEMYUURO2BTL6FTNBUYIFMJ7CEB6USU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Arnd,

On Wed, 29 Nov 2023 15:03:02 +0100
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Nov 28, 2023, at 15:08, Herve Codina wrote:
> > @@ -272,6 +274,8 @@ int qmc_chan_get_info(struct qmc_chan *chan, struct 
> > qmc_chan_info *info)
> >  	if (ret)
> >  		return ret;
> > 
> > +	spin_lock_irqsave(&chan->ts_lock, flags);
> > +
> >  	info->mode = chan->mode;
> >  	info->rx_fs_rate = tsa_info.rx_fs_rate;
> >  	info->rx_bit_rate = tsa_info.rx_bit_rate;
> > @@ -280,6 +284,8 @@ int qmc_chan_get_info(struct qmc_chan *chan, struct 
> > qmc_chan_info *info)
> >  	info->tx_bit_rate = tsa_info.tx_bit_rate;
> >  	info->nb_rx_ts = hweight64(chan->rx_ts_mask);
> > 
> > +	spin_unlock_irqrestore(&chan->ts_lock, flags);
> > +
> >  	return 0;
> >  }  
> 
> I would normally use spin_lock_irq() instead of spin_lock_irqsave()
> in functions that are only called outside of atomic context.

I would prefer to keep spin_lock_irqsave() here.
This function is part of the API and so, its quite difficult to ensure
that all calls (current and future) will be done outside of an atomic
context.

> 
> > +static int qmc_chan_start_rx(struct qmc_chan *chan);
> > +
> >  int qmc_chan_stop(struct qmc_chan *chan, int direction)
> >  {  
> ... 
> > -static void qmc_chan_start_rx(struct qmc_chan *chan)
> > +static int qmc_setup_chan_trnsync(struct qmc *qmc, struct qmc_chan *chan);
> > +
> > +static int qmc_chan_start_rx(struct qmc_chan *chan)
> >  {  
> 
> Can you reorder the static functions in a way that avoids the
> forward declarations?

Yes, sure.
I will do that in the next iteration.

Thanks for the review,

Best regards,
Hervé

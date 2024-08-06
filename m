Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D20F6948F55
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 14:42:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 118122D95;
	Tue,  6 Aug 2024 14:41:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 118122D95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722948129;
	bh=Q5ZNqxDbR4EwDeeBN89lQiVRPFwV9vl6BCMgkOcCKMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tetsLc4nqWjOC0f7ieiO6ZEi1l945/sKxvBufa3s6nTF86xnvE5Y/AIlaoRGblab8
	 4qDWox3mZcXbTUfXhdZlhE6h/ygKDSWC+cTyhewWm2T04tvoPVayIMIPXEMXuHnWis
	 3SDN3ZXDgbQRLmGJ2BqEVBb3N1dRHaCeZOnfLZpc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B63EF800B0; Tue,  6 Aug 2024 14:41:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DE34F805AE;
	Tue,  6 Aug 2024 14:41:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8E2BF802DB; Tue,  6 Aug 2024 14:36:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7A6FF80236
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 14:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7A6FF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linutronix.de header.i=@linutronix.de
 header.a=rsa-sha256 header.s=2020 header.b=4m0tszts;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=wotMqU59
Date: Tue, 6 Aug 2024 14:36:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722947761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LxRFPMssv0TbntD/eFDfQJABume4sd1MP+ymuPVXIMs=;
	b=4m0tsztsBPr+9mmrcnWxq/lZkoO8odl8CGs6qI25Z1zRNYgQoKXKr4ZaByl6dBrVhFzByu
	kzA5HK8d9DMIOtsKiVlrdcZO/8QWXdrbbKjYqqjOsCLbqdNa4KaD0fVY+45JiomSwJkueT
	z9cNVR8YYFIPCX1QATrLaeyWFJ920wDF1X1U4QwsyNd4TId6eOQmDrskXmTeAmvKoNmWid
	TY0AUs52gyd4bOmrCTMoq51FigtT2MDE9a8lE3nvlgfC/jvuMrcjP90VKpB1FGP4EiPciB
	N3LbMvHa0DE1NrFVpp5vB2n9BHncTWQsw7Vj5ajqlMt7L/jfM8dkyCyNtgwDEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722947761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LxRFPMssv0TbntD/eFDfQJABume4sd1MP+ymuPVXIMs=;
	b=wotMqU59S88oaztq3MncD0BL4YuXzvYzxYh4qAO3DGWbQurB/e6HrSu55TBnCKXPBZA7aM
	OlapAP5nRhxhSTDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Subject: Re: [PATCH] ASoC: meson: axg-fifo: fix irq scheduling issue with
 PREEMPT_RT
Message-ID: <20240806123600.uI5LeCdp@linutronix.de>
References: <20240806102707.3825703-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240806102707.3825703-1-jbrunet@baylibre.com>
Message-ID-Hash: 66BYAAW6MQQLN2DJWNP2275TEYWLAQOQ
X-Message-ID-Hash: 66BYAAW6MQQLN2DJWNP2275TEYWLAQOQ
X-MailFrom: bigeasy@linutronix.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/66BYAAW6MQQLN2DJWNP2275TEYWLAQOQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2024-08-06 12:27:03 [+0200], Jerome Brunet wrote:
> With PREEMPT_RT enabled, spinlocks become preemptible.
With PREEMPT_RT enabled a spinlock_t becomes a sleeping lock.

> This is usually not a problem with spinlocks used in IRQ context since
> IRQ handlers get threaded. However, if IRQF_ONESHOT is set, the upper half
> of a threaded irq handler won't be threaded and this causes scheduling
> problems if spinlocks are used in the upper half, like with regmap when
> '.fast_io' is set.

=E2=80=A6 However, if IRQF_ONESHOT is set, the primary handler won't be
force-threaded and runs always in hardirq context. This is a problem
because spinlock_t requires a preemptible context on PREEMPT_RT.=20

> In this particular instance, it is actually better to do everything in
> the bottom half and it solves the problem with PREEMPT_RT.

      threaded handler

The term "bottom half" is usually used with softirq. The IRQ part has a
primary handler and a threaded handler.

> Reported-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
> Closes: https://lore.kernel.org/linux-amlogic/20240729131652.3012327-1-av=
krasnov@salutedevices.com
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Fixes: b11d26660dff ("ASoC: meson: axg-fifo: use threaded irq to check pe=
riods")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  sound/soc/meson/axg-fifo.c | 26 ++++++++++----------------
>  1 file changed, 10 insertions(+), 16 deletions(-)
>=20
> diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
> index 7e6090af720b..d0d05fa44d66 100644
> --- a/sound/soc/meson/axg-fifo.c
> +++ b/sound/soc/meson/axg-fifo.c
> @@ -251,8 +244,9 @@ int axg_fifo_pcm_open(struct snd_soc_component *compo=
nent,
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D request_threaded_irq(fifo->irq, axg_fifo_pcm_irq_block,
> -				   axg_fifo_pcm_irq_block_thread,
> +	/* Use the bottom half of a threaded irq with non-atomic links */

This requests only a threaded handler. There is no "bottom half of a
threaded IRQ".

> +	ret =3D request_threaded_irq(fifo->irq, NULL,
> +				   axg_fifo_pcm_irq_block,
>  				   IRQF_ONESHOT, dev_name(dev), ss);
>  	if (ret)
>  		return ret;

Sebastian

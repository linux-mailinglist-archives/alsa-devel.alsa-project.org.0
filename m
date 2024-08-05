Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D89947E3A
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 17:35:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE4215931;
	Mon,  5 Aug 2024 17:35:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE4215931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722872132;
	bh=xz7pMosSnrQEU6GYh1jNebd60Tvu1ZpHTzssxOtrjUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PBBMQiLJAGOv82+U0HN5i2kuZBudW9JQenOcqjtq9JTE9Uumz+zV3DvmPjDQ0cVfv
	 4w3ynRD/JNOQ6AUzKPQ1E7eGH21W/M6fzk77JRdQBCJnKkxCuhnIIsEAgek3gWoAu1
	 EGFjlP9RSeMVLaaMdrd0cKnWPX0pH7T02PCL2FQI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF111F805B0; Mon,  5 Aug 2024 17:35:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8A44F805AE;
	Mon,  5 Aug 2024 17:34:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54783F8023A; Mon,  5 Aug 2024 17:33:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from galois.linutronix.de (galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC4F1F800BF
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 17:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC4F1F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linutronix.de header.i=@linutronix.de
 header.a=rsa-sha256 header.s=2020 header.b=XQD5dh/d;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=/2TPugQf
Date: Mon, 5 Aug 2024 17:33:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722871990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZoVVPlB6sIY1d5GK5dwozDR3uFKevJmf+6ocl8483Eo=;
	b=XQD5dh/dS9zvxT1sxq/wfab9IbwdBAT6s4IMbz3LWOZ7UQqXH1kfld+65EbWFaQ+IC9w3N
	rdvShYi8dFrmIZgxKQNeSqof4R4DpD4WNkP6+4d19QmBQ2KBEMkryzOEVTcTshED3EaKxQ
	rczurYtMnr/7nJ2C2shls6MVWdZfuCHZF5OiE3DBDRJ0MLoAKn+uuU+BunmXzkLqCguAYq
	98/O3A/o1SxzPYYz2VmiW5VjLOONfd38CBEGlT9jXq4efUKF1xa+ohMUgIvT/VlqPfyCCD
	hZswJVT8gPz06dTADE4rqcZ620gyeyFrILIiKmbC10Ir2+H4yy9rUtvzJguSag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722871990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZoVVPlB6sIY1d5GK5dwozDR3uFKevJmf+6ocl8483Eo=;
	b=/2TPugQf5xOZFfBEW6r5XFwR13BURvd9nXqxgUgsfnjYsOW99yVs36NxapFUE0d7aSy+3B
	suo4AYuzhO8ljlAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, linux-rt-users@vger.kernel.org,
	Arseniy Krasnov <avkrasnov@salutedevices.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@sberdevices.ru, oxffffaa@gmail.com,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v1] ASoC: meson: axg-fifo: set option to use raw spinlock
Message-ID: <20240805153309.k_SfHw62@linutronix.de>
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
 <1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
 <2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk>
 <1j5xsow839.fsf@starbuckisacylon.baylibre.com>
 <7dfdade5-3a57-4883-bfac-067c50ec0ffb@sirena.org.uk>
 <1j1q3cw5ri.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1j1q3cw5ri.fsf@starbuckisacylon.baylibre.com>
Message-ID-Hash: CFVWKIBBVZJI3STEXJLF5OYRINT4TAXA
X-Message-ID-Hash: CFVWKIBBVZJI3STEXJLF5OYRINT4TAXA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CFVWKIBBVZJI3STEXJLF5OYRINT4TAXA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2024-07-29 17:57:05 [+0200], Jerome Brunet wrote:
> On Mon 29 Jul 2024 at 16:28, Mark Brown <broonie@kernel.org> wrote:
>=20
> > On Mon, Jul 29, 2024 at 05:06:50PM +0200, Jerome Brunet wrote:
> >> On Mon 29 Jul 2024 at 15:44, Mark Brown <broonie@kernel.org> wrote:
> >
> >> > I don't recall this coming up much TBH.  It may be that people just =
set
> >> > raw spinlocks when they need it, or that there's not many people usi=
ng
> >> > relevant devices with RT kernels.
> >
> >> I have not been playing much with RT TBH, but AFAIK, with RT irq
> >> handlers are threaded unless IRQF_NO_THREAD is set. In this case,
> >> something preemptible in the handler should not be a problem.
> >
> >> The axg-fifo drivers do not have IRQF_NO_THREAD so something is a bit
> >> unclear here.
> >
> > Yeah, it's definitely likely to happen all the time for people using RT
> > with relevant devices.  I'm not sure I have a good sense of if it's
> > likely to be a nasty surprise to switch raw spinlocks on by default when
> > it's currently controllable, I'd expect it'll generally be fine but it's
> > possibly a bit rude to any users that don't use interrupts...
>=20
> Indeed it is bit radical.
>=20
> My concern with this patch is that, IIUC, the handler should be
> threaded under RT and there should be no problem with the spinlock API.
>=20
> Adding the RT folks to try to get a better understanding, they should
> have been CCed anyway.

I'm not sure if making the lock a raw_spinlock_t solves all the
problems. The regmap is regmap_mmio so direct memory-access and looks
simple enough to do so. In regmap_mmio_write() I see clk_enable() and
and this uses a spinlock_t so we should be back at the same problem.
There might be an additional problem if reg-caching is enabled.

Let me propose two alternatives:
#1: Why two handlers if we have IRQF_ONESHOT and the primary does almost
    nothing. Assuming the thread is always woken up and the "unexpected
    irq" case does not happen. If so, why not:

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 7e6090af720b9..60af05a3cad6b 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -220,9 +220,21 @@ static irqreturn_t axg_fifo_pcm_irq_block(int irq, voi=
d *dev_id)
 static irqreturn_t axg_fifo_pcm_irq_block_thread(int irq, void *dev_id)
 {
 	struct snd_pcm_substream *ss =3D dev_id;
+	struct axg_fifo *fifo =3D axg_fifo_data(ss);
+	unsigned int status;
+
+	regmap_read(fifo->map, FIFO_STATUS1, &status);
+	status =3D FIELD_GET(STATUS1_INT_STS, status);
+
+	/* Use the thread to call period elapsed on nonatomic links */
+	if (!(status & FIFO_INT_COUNT_REPEAT)) {
+		dev_dbg(axg_fifo_dev(ss), "unexpected irq - STS 0x%02x\n",
+			status);
+		return IRQ_NONE;
+	}
+	axg_fifo_ack_irq(fifo, status);
=20
 	snd_pcm_period_elapsed(ss);
-
 	return IRQ_HANDLED;
 }
=20
@@ -251,9 +263,9 @@ int axg_fifo_pcm_open(struct snd_soc_component *compone=
nt,
 	if (ret)
 		return ret;
=20
-	ret =3D request_threaded_irq(fifo->irq, axg_fifo_pcm_irq_block,
-				   axg_fifo_pcm_irq_block_thread,
-				   IRQF_ONESHOT, dev_name(dev), ss);
+	ret =3D request_threaded_irq(fifo->irq, NULL,
+				   axg_fifo_pcm_irq_block_thread, IRQF_ONESHOT,
+				   dev_name(dev), ss);
 	if (ret)
 		return ret;
=20

#2: If two handers are required due to $REASON then primary should ACK/
    disable the interrupt line while the secondary/ threaded handler is
    running. In this is case then IRQF_ONESHOT is not needed because its
    "tasks" is performed by the primary handler:

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 7e6090af720b9..5b4c518eb4ccd 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -205,11 +205,16 @@ static irqreturn_t axg_fifo_pcm_irq_block(int irq, vo=
id *dev_id)
=20
 	regmap_read(fifo->map, FIFO_STATUS1, &status);
 	status =3D FIELD_GET(STATUS1_INT_STS, status);
-	axg_fifo_ack_irq(fifo, status);
=20
 	/* Use the thread to call period elapsed on nonatomic links */
-	if (status & FIFO_INT_COUNT_REPEAT)
+	if (status & FIFO_INT_COUNT_REPEAT) {
+		/*
+		 * ACKs/ Disables the interrupt until re-enabled by
+		 * axg_fifo_pcm_irq_block_thread()
+		 */
+		axg_fifo_ack_irq(fifo, status);
 		return IRQ_WAKE_THREAD;
+	}
=20
 	dev_dbg(axg_fifo_dev(ss), "unexpected irq - STS 0x%02x\n",
 		status);
@@ -253,7 +258,7 @@ int axg_fifo_pcm_open(struct snd_soc_component *compone=
nt,
=20
 	ret =3D request_threaded_irq(fifo->irq, axg_fifo_pcm_irq_block,
 				   axg_fifo_pcm_irq_block_thread,
-				   IRQF_ONESHOT, dev_name(dev), ss);
+				   0, dev_name(dev), ss);
 	if (ret)
 		return ret;

On the PREEMPT_RT both handler will be threaded.
=20
My favorite is #1. Also ACKing the interrupt only if it occurred for the
device/ driver in charge. Otherwise don't care=E2=80=A6

Sebastian

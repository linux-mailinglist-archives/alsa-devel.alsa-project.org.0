Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F349948B92
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 10:47:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71F172EA7;
	Tue,  6 Aug 2024 10:46:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71F172EA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722934008;
	bh=T6SyAPa43fw3itnzT92TxN8RxarjUCzV8S2bnCPfBT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oqrr0L3YAbsQe/rEp3BQXm5FfXl9j2orNMace02dplrgHKKQVeuFZ+j8qh6k21NBc
	 2im3ZxdbTn43gERO88NJsjp4VUtb4ms0FaaWN4dlWPcGU4XZM7KKbbEm6Mbu6gy2vJ
	 cD0mNf9KzeaDqVjZfoNblT+DAJxkdfHEFO1Izzno=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41F97F805B6; Tue,  6 Aug 2024 10:46:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCA1DF805B1;
	Tue,  6 Aug 2024 10:46:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA4E2F802DB; Tue,  6 Aug 2024 08:55:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0
	tests=RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,TIME_LIMIT_EXCEEDED,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable version=3.4.6
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35B71F80236
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 08:50:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35B71F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linutronix.de header.i=@linutronix.de
 header.a=rsa-sha256 header.s=2020 header.b=KRNXjRJv;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=n3ml5t+u
Date: Tue, 6 Aug 2024 08:50:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722927024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8rYwgW2vpzfVbKjwpUB+DO7Cgb0fWJ3gvVqC78ZYBjc=;
	b=KRNXjRJvNQzui5oqkfFTnZJm+mq5/Uz7KzMCCC2D3wdX+ye1GTrX5Msw+xHtI3OOc1Hdj6
	VieGZ1a/OcRs1m9Sb2Apsmoh29p7j8ragrJqRrkqTqzqWEkNyQJ83OHZPhua96Npo0mpEe
	ALyPCoum7gGChvW2uRhzsZhC8bPmttEZSXIRuy8QVmDTcKZgGI0Bu2e1i1m7QVORQDKD+R
	bb85RgD+Xnhhb0aIybhg3yASzuJvvC5V4LhL3djs7AlTa8zOr56uJSarKVsxymHbK00x3E
	/2asiIoBSLElgrAJZCcVvjtdcfpxSUUlT86D3WjGTe3nt3MpWwhG2OJ6RW5VPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722927024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8rYwgW2vpzfVbKjwpUB+DO7Cgb0fWJ3gvVqC78ZYBjc=;
	b=n3ml5t+ugxpduMixS1Q22fM9Y967N/rmITKJzqOlOAMP+ffzesZhFEfh/n6FQXYxf5BhY4
	KO++8jgRBOhm3lAQ==
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
Message-ID: <20240806065021.PINvpze_@linutronix.de>
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
 <1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
 <2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk>
 <1j5xsow839.fsf@starbuckisacylon.baylibre.com>
 <7dfdade5-3a57-4883-bfac-067c50ec0ffb@sirena.org.uk>
 <1j1q3cw5ri.fsf@starbuckisacylon.baylibre.com>
 <20240805153309.k_SfHw62@linutronix.de>
 <1jplqnuf5r.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jplqnuf5r.fsf@starbuckisacylon.baylibre.com>
Message-ID-Hash: 7AINGMCJS5D5STEV6JRSWF33SC5SQNWT
X-Message-ID-Hash: 7AINGMCJS5D5STEV6JRSWF33SC5SQNWT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7AINGMCJS5D5STEV6JRSWF33SC5SQNWT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2024-08-05 18:07:28 [+0200], Jerome Brunet wrote:
> Hi Sebastian,
Hi Jerome,

> Thanks a lot for taking the time to dig into the driver specifics.
> The IRQ handler is actually not awfully critical in this case. The HW
> will continue to run regardless of the IRQ being acked or not
>=20
> The purpose of the handler is mainly to let Alsa know that 1 (or more)
> period is ready. If alsa is too slow to react, and the buffer allows
> just a few periods, the HW may under/overflow the buffer.
>=20
> IRQF_ONESHOT is fine because snd_pcm_period_elapsed() 'notifies'
> all past periods, not just one. The irq handler does not need to
> run again until this function has been called. It also helps if the
> period is ridiculously small, to try to reduce the number of IRQs.

IRQF_ONESHOT is used to disable to keep the IRQ line disabled (after the
primary handler) while the threaded handler is running. This implies
that the primary handler must not be threaded under PREEMPT_RT.
=E2=80=A6
> I'd prefer #1 too. IRQ is not shared, so the ownership should be fine.
>=20
> However I still don't fully understand what we are fixing here TBH. It
> seems it could apply to other parts of the kernel so I'd like to
> understand what is wrong (and avoid repeating the same mistake)
>=20
> * With PREEMPT_RT, both handler will threaded, so they should be able to
>   call preemptible function, right ?

Correct. But flags like IRQF_ONESHOT won't thread the primary handler.

> * If so, and spinlock_lock() actually becomes preemptible with
>   PREEMPT_RT as stated in this change description, why is it problem here=
 ?

Because in this case the primary handler is not threaded and runs in
not preemptible hard-IRQ context.

> Do you have an idea about what is going on ?

Yes.

Sebastian

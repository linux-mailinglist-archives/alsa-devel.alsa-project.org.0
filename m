Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F442948BC7
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 10:56:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B10C45009;
	Tue,  6 Aug 2024 10:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B10C45009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722934587;
	bh=N7g1AP1MRXJlKsv+snG6qoOFn+tmUQ1MGZZk1aup6Dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gk5AqhPBWaei4JrHaJio3UoneQM9K7u/BMT9YNJuuidhGTCO7snocANuM5qM++CRU
	 ZZzkNiaw0rDmguVsgRjnhA62ykB96PvP+Ie+FSpTYp7HZmAvoF7ZGX6eTXK3X8H3CL
	 e+yuabv2vJoxP9pVAcCslyGO0TUuaSOOKgALI5CM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 580D8F805B3; Tue,  6 Aug 2024 10:55:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4E5BF805AD;
	Tue,  6 Aug 2024 10:55:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96F95F80236; Tue,  6 Aug 2024 08:59:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73E3CF80236
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 08:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73E3CF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linutronix.de header.i=@linutronix.de
 header.a=rsa-sha256 header.s=2020 header.b=cJRRVkgB;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=QDiaKIxv
Date: Tue, 6 Aug 2024 08:57:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722927461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=62j0r8NgTpks8O2+mQwJWIgoNQHaq1WhltO5raRF02k=;
	b=cJRRVkgBGdGhodNNKTBJlbcd6CZrAkA/ofmdaQEfsMZAYKUC2t6laHW3ecwbsZYsFCkjf2
	34NutzNm4wtBFruN1N/CaUOqAJVkcorfbh7KLq9O+wButW4dCGbS+Pm+dpqnYVhnU7CcKH
	Xu7lftAhyAixgFQgNUz0otmYznlLcuO6szm1IxiNQ7CLQdg/mFfRhVCTG91PjDcYfObYyF
	wVnB2WwvbJMyAvNcERY9GkyHzIeC6CAk1vmGaMiCeZAJNws74jPchsjxbw/c/DJIPpQASm
	gMtijUgKIMSgRg0gfH2PAro4Eo1bHCZVngsmOhRxVPQ2k424eg37xaWoTEAScg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722927461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=62j0r8NgTpks8O2+mQwJWIgoNQHaq1WhltO5raRF02k=;
	b=QDiaKIxvidaD49LuxspxsysRalmPj+QyVKlprtlmK9xpaznAzA3Asj/riap4hJk0L+Ls7X
	kFkI1mah3UN8YyCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-rt-users@vger.kernel.org,
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
Message-ID: <20240806065740.DAZwSnQ7@linutronix.de>
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
 <1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
 <2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk>
 <1j5xsow839.fsf@starbuckisacylon.baylibre.com>
 <7dfdade5-3a57-4883-bfac-067c50ec0ffb@sirena.org.uk>
 <1j1q3cw5ri.fsf@starbuckisacylon.baylibre.com>
 <20240805153309.k_SfHw62@linutronix.de>
 <04b2b8c5-8b18-4594-9eeb-9971d8cf3786@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <04b2b8c5-8b18-4594-9eeb-9971d8cf3786@sirena.org.uk>
Message-ID-Hash: QX4HWKNINYI57BG4DL33JS7SBZ4KOXM2
X-Message-ID-Hash: QX4HWKNINYI57BG4DL33JS7SBZ4KOXM2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QX4HWKNINYI57BG4DL33JS7SBZ4KOXM2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2024-08-05 17:56:22 [+0100], Mark Brown wrote:
> On Mon, Aug 05, 2024 at 05:33:09PM +0200, Sebastian Andrzej Siewior wrote:
> 
> > I'm not sure if making the lock a raw_spinlock_t solves all the
> > problems. The regmap is regmap_mmio so direct memory-access and looks
> > simple enough to do so. In regmap_mmio_write() I see clk_enable() and
> > and this uses a spinlock_t so we should be back at the same problem.
> 
> The clk_enable() is optional, users simply shouldn't use the internal
> clock management with devices that it'll cause problems for.
> 
> > There might be an additional problem if reg-caching is enabled.
> 
> The flat cache is there mostly for the benefit of things accessed from
> interrupt context, it guarantees to never do any allocations and doesn't
> lock.  You can also use other caches if you ensure that any registers
> accessed in interrupt context are already cached so won't trigger any
> new allocations.

My point is simply that those two things could complicate things further
if the desired fix is to (always) use raw_spinlock_t.

Sebastian

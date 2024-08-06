Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0913948C9B
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 12:09:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51DDA3281;
	Tue,  6 Aug 2024 12:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51DDA3281
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722938928;
	bh=21Y0pBIwI1HwR2U/LzZA8z4cSXds/LWXTl9nxaUvVYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b6FAP106vkHRPTut9jlXHm3C0I5Fb8z3i0Hvb5AkPhx5ZiDqNnntYuqz5Gy8Owx8F
	 9ItR03/bA/OapRHXOx8UTal9Kpe5iOuPbJ7PblDkdH+lVf0xOtNh3HbzO2P/VGbn7M
	 lB8wfyTyy7abWvgU0w61lnJLJCFX9EZopBC59tOo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06513F805AE; Tue,  6 Aug 2024 12:08:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B22AF805AE;
	Tue,  6 Aug 2024 12:08:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E048F802DB; Tue,  6 Aug 2024 12:03:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A77ABF800E3
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 12:03:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A77ABF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linutronix.de header.i=@linutronix.de
 header.a=rsa-sha256 header.s=2020 header.b=Ye9wDXLy;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=YwVtx5h/
Date: Tue, 6 Aug 2024 12:03:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722938583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CJrVNiSI/EhQvj7Rlw5xd+RbUJSrKucNzsEUSMrER3w=;
	b=Ye9wDXLyEG1YGrxeXzdM4wDn35Pm8HgIT2GMjREevsmZpjkH9w7d0u3V2FvVo29k9nE0l5
	mBQQKQMBDDGsevQuOX+zeBCn0aQ9pKkmagioEcsKOziMw9k76+KUqFULSrDNZO7qZ6IOER
	+4mQ9+erau+G6RKuqLIkL8EeWmjvujTIPD3pkgqIDxri0LRpIHpo8sQEE9GjhTBS+ZdthC
	dTYoD90oZ3U9CO5KJQVJNuCYtzDi9S93VK3Zaa26CTHPNNxZehk8y32JOQphwLvsz1Q+OT
	7ZaVF7gguZFRf8/q4MXbXGb6xMGKh34kVBx9T0gL2xynnrmmEYWiRtMXXsbvWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722938583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CJrVNiSI/EhQvj7Rlw5xd+RbUJSrKucNzsEUSMrER3w=;
	b=YwVtx5h/onLbQ9kVaqP9fZ3ZiVEu5dYoPqDOBbRZWdoM5gDipsTsy0vAfbKrxprnSE32lz
	U0tbrXT2FbsBrgBQ==
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
Message-ID: <20240806100302.Up0MShrZ@linutronix.de>
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
 <1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
 <2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk>
 <1j5xsow839.fsf@starbuckisacylon.baylibre.com>
 <7dfdade5-3a57-4883-bfac-067c50ec0ffb@sirena.org.uk>
 <1j1q3cw5ri.fsf@starbuckisacylon.baylibre.com>
 <20240805153309.k_SfHw62@linutronix.de>
 <1jplqnuf5r.fsf@starbuckisacylon.baylibre.com>
 <20240806065021.PINvpze_@linutronix.de>
 <1jle1auhu9.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1jle1auhu9.fsf@starbuckisacylon.baylibre.com>
Message-ID-Hash: GU7VX6G7YZ2ATRCCLFWM34ODRH5Z3F2B
X-Message-ID-Hash: GU7VX6G7YZ2ATRCCLFWM34ODRH5Z3F2B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GU7VX6G7YZ2ATRCCLFWM34ODRH5Z3F2B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2024-08-06 11:21:50 [+0200], Jerome Brunet wrote:
> I have tweaked #1 and added a few tags but the gist remains the same.
> I was going to add you under 'Suggested-by' but maybe putting you as the
> actual Author would be more appropriate. 
> 
> What do you prefer ?

Suggested-by is fine.

Sebastian

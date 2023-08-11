Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EF6778FBB
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 14:41:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16A8C827;
	Fri, 11 Aug 2023 14:41:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16A8C827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691757715;
	bh=qfaUjR04HSY6mmUGBpO4Lpy0te0bZmo+BkWNxIwNYyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=awZqvv1M6uQGiYKHIERUdE/o3Ap8hUIjs4aG/+v4IpTLybvqOGTHIBo71H6ya7Z3y
	 cIhdjxAxGh4KrMmtNMP19+C213ZaVCtpugZlEGSW1U8v/NTCl8OppjW7rVEjNLLPzz
	 u1mWlSaqiGVoxl/LVACJVfEH1ihbcaXxVON1pnWY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40A14F80552; Fri, 11 Aug 2023 14:40:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 308C3F80134;
	Fri, 11 Aug 2023 14:40:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22FEDF80166; Fri, 11 Aug 2023 14:40:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out-102.mta0.migadu.com (out-102.mta0.migadu.com
 [91.218.175.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 108F4F80016
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 14:40:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 108F4F80016
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=BchVAq6X
Date: Fri, 11 Aug 2023 22:39:54 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691757620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8vNMSKN+vtwKFHAf06jkI6GM9sIuZ9HaDo3mOdRlVL0=;
	b=BchVAq6XdbomT9nJbHcoXXXO290cJ6HsWBHEoegfNiBXIvC9sMXlAhFNYv8k87Ja8wK6Wb
	0uTwT/ou6jTOVhBmR/kaiJ4p36ruEdBegikdugGr+cszRl+OlTzPh7JXDMojRQBlbF0XnU
	Jeu1r+jLz0YH5IHoNCnDgiocILxQmdcZk0zZlT9j7AgGgZSQIyt/yrH3VVShoqt7ve3vf0
	/MqDD8yYX2fG/UDnO8efHTMtm+FFoTMp3aKgpiRwVYmghaGH0uIZlzj/7jBVdwWASKze/j
	len8GdK8MNuEPLJ1Ui5zfEz3YjdTfFcbQf6cgGHS7xFx/8zBd3jPAdbNacClFA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jeff LaBundy <jeff@labundy.com>, Marek Vasut <marex@denx.de>,
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Manuel Traut <manuel.traut@mt.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-pwm@vger.kernel.org, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] Input: pwm-beeper - Support volume setting via sysfs
Message-ID: <ZNYsGr6yBeVTtNMK@titan>
References: <873514d2ju.wl-tiwai@suse.de>
 <63adce9a-df65-b462-9055-0ece5216d680@denx.de>
 <87tttkjmyu.wl-tiwai@suse.de>
 <0cffe366-75af-d8a8-8920-6fb94c321a89@denx.de>
 <87h6pkjh7q.wl-tiwai@suse.de>
 <618add56-3675-4efe-5b20-665c10040e03@denx.de>
 <ZMfgJ3o00nApkXGp@google.com>
 <f4612dc5-a7d4-74ba-2ed8-ea70314625b6@denx.de>
 <ZMh0Sa9s25JHhWw5@nixie71>
 <ZMi0HT/yaTo9uTyi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMi0HT/yaTo9uTyi@google.com>
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: FBRESXCZHS4TUK6FSRBFXUX5PHJVLQVE
X-Message-ID-Hash: FBRESXCZHS4TUK6FSRBFXUX5PHJVLQVE
X-MailFrom: contact@jookia.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FBRESXCZHS4TUK6FSRBFXUX5PHJVLQVE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 01, 2023 at 12:28:29AM -0700, Dmitry Torokhov wrote:
> If we want to extend the API we will need to define exactly how it will
> all work. I.e. what happens if userspace mixes the old SND_TONE and
> SND_BELL with the new SND_BELL_VOL or whatever. Does it play with
> previously set volume? The default one? How to set the default one? How
> to figure out what the current volume is if we decide to make volume
> "sticky"?
> 
> As far as userspace I expect it is more common to have one program (or
> component of a program) to set volume and then something else requests
> sound, so having one-shot API is of dubious value to me.
> 
> I hope we can go with Takashi's proposal downthread, but if not I wonder
> if the sysfs approach is not the simplest one. Do we expect more beepers
> that can control volume besides pwm-beeper?
> 
> Thanks.
> 
> -- 
> Dmitry

(Just to duck in as someone that has written a little program to play beeps and
tones using the EV_TONE API)

It might be worth distinguishing between the goals of having some beeps with
different volumes compared to all beeps with different volumes.

Sound card mixers generally control some sort of global volume while I would
imagine the tone API would control per-tone volume. I don't know too much about
safety guarantees but writing an input then sysfs or mixer then input again
seems like it could get jumbled up.

In that speicfic case I think it would make more sense to send volume and tone
from whatever beep API is being used, with the volume being a multiplier of the
loudest volume. This is similar to how audio works with PCM output. Existing
beeps would have the volume set to 100%.

John.

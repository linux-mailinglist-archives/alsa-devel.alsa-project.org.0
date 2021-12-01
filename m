Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 599CA4652CF
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 17:33:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E56DC2606;
	Wed,  1 Dec 2021 17:32:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E56DC2606
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638376412;
	bh=DjtGtk4qiMPnsgkCOR3f2tpkpDFCrQvM5yhYi67G6xg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SBe7dpYpZvzM4qOHYrP7jWwX6fB8hr2YOgJAHJ1d8Vv8Y5uF/4+bHve3mb07fyI7U
	 HBlOB0esQ9jK2EQuQKTT05WVzFOh8uBxzE+/0YOCkTQ8NK3Hdmas57OO4urbz2tyZJ
	 1WJhECyCucnXhqQE4yYzJ+1bSTqJLyFOw7+qO1pI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53C7DF80249;
	Wed,  1 Dec 2021 17:32:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85600F80246; Wed,  1 Dec 2021 17:32:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E21A7F80121
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 17:32:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E21A7F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QKfsiixy"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B46A2B82029;
 Wed,  1 Dec 2021 16:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C12C53FAD;
 Wed,  1 Dec 2021 16:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638376327;
 bh=DjtGtk4qiMPnsgkCOR3f2tpkpDFCrQvM5yhYi67G6xg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QKfsiixyYi/EuxmoFb6eDZr0MwFg31wREGE6AfVtG+tmpaFqog0DIx8tZW81ZVRE0
 76k2dfr+Kn2ifp9Lzopf9EanId7AMOfnbM1MQkoVJo+ALJFwIzcRU07y1RA4IApWqQ
 ViekO0OEfcRKCYe9oDkzumoYr4n+TIcpuEIPKDgO+5p8HR010XkXq1RfaSSvGSlT5X
 FEnBBPrZmaSUFJPY/SwDG9pgRtygz83buiSJUpKN/JwjmidBCQvBq/5notc8wBRK6c
 Aqa7V2rkEg+olXdhgmpa+J3kxGFUIN4ra5vldsoAqP53zlrdCa1eVocl1t64VG03gc
 ZfDHsjCI/NzyA==
Date: Wed, 1 Dec 2021 16:32:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l42: Implement system suspend
Message-ID: <YaejghraYE6lD7FD@sirena.org.uk>
References: <20211201153648.17259-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RkDed11whgknlEPT"
Content-Disposition: inline
In-Reply-To: <20211201153648.17259-1-rf@opensource.cirrus.com>
X-Cookie: All true wisdom is found on T-shirts.
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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


--RkDed11whgknlEPT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 01, 2021 at 03:36:48PM +0000, Richard Fitzgerald wrote:
> Add system suspend functions to handle clean power-down on suspend and
> restoring state on resume.
>=20
> The jack state could change during suspend. Plug->unplug and unplug->plug
> are straightforward because this looks no different from any other plug
> state change. However, the jack could be unplugged and a different type

This fiddling about with the jack detect feels like it should be at
least one separate change, possibly multiple changes - the reporting of
button states feels like it should be a good cleanup/fix separately for
example.

> of jack plugged, and on resume the plug state would not have changed.
> Some code changes are needed to the jack handling so that on resume a
> plugged state will be re-evaluated instead of filtered out. In this case

It would be helpful to elaborate on what these code changes might be.

> +	/*
> +	 * PWR_CTL2 must be volatile so it can be used as a canary bit to
> +	 * detect a reset during system suspend.
> +	 */
> +	case CS42L42_PWR_CTL2:

This feels a bit hackish - is the cost of doing the cache sync really so
expensive that it's worth the effort of trying to skip it?

> +	if (cs42l42->suspended) {
> +		mutex_unlock(&cs42l42->irq_lock);
> +		return IRQ_NONE;
> +	}

Given that you're using disable_irq() to force the interrupt off (which
is a bit rude but often the best one can do) how might we be getting an
interrupt while suspended?  This seems to indicate an error condition.

>  			case CS42L42_PLUG_OMTP:
>  				snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADSET,
> -						    SND_JACK_HEADSET);
> +						    SND_JACK_HEADSET |
> +						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
>  				break;
>  			case CS42L42_PLUG_HEADPHONE:
>  				snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADPHONE,
> -						    SND_JACK_HEADPHONE);
> +						    SND_JACK_HEADSET |
> +						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +						    SND_JACK_BTN_2 | SND_JACK_BTN_3);

This unconditionally clears the button status - will something notice if
the buttons are pressed?

> +	} else {
> +		/*
> +		 * Only call regcache_mark_dirty() if cs42l42 reset, so
> +		 * regcache_sync() writes all non-default cached values.
> +		 * If it didn't reset we don't want to filter out syncing
> +		 * dirty cache entries that have default value.
> +		 * DISCHARGE_FILT=3D=3D1 after suspend. If the cs42l42 reset
> +		 * it will now be 0.
> +		 */

Something needs to tell regmap that the cache is dirty otherwise it
won't sync anything, including the non-default register values?  There's
currently an assumption coded in there that the cache is dirty because
the device was reset and everything has default values.

--RkDed11whgknlEPT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGno4IACgkQJNaLcl1U
h9DJ6Qf/YafozpTqOUoPhMpfJCM+TFh3s5pwYjW/9Owy6eXZR6F9a2b0z9CRQrG2
YoAmhZw/rXZ/2IvlvhVM8rl+Fy/uvQAbZECjWPmOjuiDcPPdbMHflKjs0frsTKz6
97yD2Q7nkyofOIsQtc0V+1XA4ndeUH1Z1Ky4J7bgaODtrgSVLQ6lyMHNIqq7AbX+
hMquuSUSTqJW6lhvIit2NHFEdY1AKlagS7wMw+Re9qGkzAGtdQc3AOXvwZybgrz/
p4B2sHnJ+sCI1jmgm5p/mDPmShrwx5W0Fl623KDMqLvRtPc725Kg97IFJ9skjjBf
mwxwhYHq8RvnKZpkmuqm3wXkhzjO2g==
=I0x7
-----END PGP SIGNATURE-----

--RkDed11whgknlEPT--

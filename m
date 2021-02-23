Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AB5322795
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 10:14:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 216ED167A;
	Tue, 23 Feb 2021 10:13:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 216ED167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614071647;
	bh=PkAlVpVkdTO+wHlQC1hkLqhwgmegO/thAGckDU9/J8E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LK9eECtK7ctol+16UBhXHPa5bHzQbn8BD6lir0PbIGcqBhkpcWPnbfd0cqd12KHBz
	 LiWsgwqizYcTOJUw3tv09b7E8mSzRwjPLn3xxStWQpOu1BwIROFlzl0O2eMM+r2BmU
	 y2qPTKrfKKnhmSr8Xuuga2+OhUa7+hPHIutEo71Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66CA6F8016D;
	Tue, 23 Feb 2021 10:12:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B5CFF8016A; Tue, 23 Feb 2021 10:12:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07EABF800B4
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 10:12:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07EABF800B4
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id C96211C0B7F; Tue, 23 Feb 2021 10:12:30 +0100 (CET)
Date: Tue, 23 Feb 2021 10:12:30 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2] leds: trigger: audio: Add an activate callback to
 ensure the initial brightness is set
Message-ID: <20210223091230.GI9750@amd>
References: <20210221115208.105203-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="PMULwz+zIGJzpDN9"
Content-Disposition: inline
In-Reply-To: <20210221115208.105203-1-hdegoede@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 linux-leds@vger.kernel.org
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


--PMULwz+zIGJzpDN9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Some 2-in-1s with a detachable (USB) keyboard(dock) have mute-LEDs in
> the speaker- and/or mic-mute keys on the keyboard.
>=20
> Examples of this are the Lenovo Thinkpad10 tablet (with its USB kbd-dock)
> and the HP x2 10 series.
>=20
> The detachable nature of these keyboards means that the keyboard and
> thus the mute LEDs may show up after the user (or userspace restoring
> old mixer settings) has muted the speaker and/or mic.
>=20
> Current LED-class devices with a default_trigger of "audio-mute" or
> "audio-micmute" initialize the brightness member of led_classdev with
> ledtrig_audio_get() before registering the LED.
>=20
> This makes the software state after attaching the keyboard match the
> actual audio mute state, e.g. cat /sys/class/leds/foo/brightness will
> show the right value.

Makes sense.

> +++ b/drivers/leds/trigger/ledtrig-audio.c
> @@ -6,10 +6,33 @@
>  #include <linux/kernel.h>
>  #include <linux/leds.h>
>  #include <linux/module.h>
> +#include "../leds.h"
> =20
> -static struct led_trigger *ledtrig_audio[NUM_AUDIO_LEDS];
>  static enum led_brightness audio_state[NUM_AUDIO_LEDS];
> =20
> +static int ledtrig_audio_mute_activate(struct led_classdev *led_cdev)
> +{
> +	led_set_brightness_nosleep(led_cdev, audio_state[LED_AUDIO_MUTE]);
> +	return 0;
> +}

Is mute_activate called from atomic context?

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--PMULwz+zIGJzpDN9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmA0xv4ACgkQMOfwapXb+vJeMgCfUzGgsQwaCEMPA+s1EZUQHoFW
ER4AnA39Cz2oUVyYsHn6mWg9YnddR0Il
=R0dI
-----END PGP SIGNATURE-----

--PMULwz+zIGJzpDN9--

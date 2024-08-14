Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6636951B58
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 15:05:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEB72236A;
	Wed, 14 Aug 2024 15:05:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEB72236A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723640739;
	bh=/Fnx8Y5nhqPcK9Nfc3bO6zeYZ7dh7PtJbYQ6H77206E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R2npSmuoYe4nXzG21vbuRjFxWDPmDD5Q0YwrvwrucDKeVPSOfen+/8SnkeMBUd3Mu
	 BJIKaTmF5JMQssDv7mIDWGNro84jM153Vde6N9X+0wjpGcDdVOQdnaPPckcrIGfjc5
	 tOhwen96sJsCpdB/1oYLt/njNlIVn6urKGi1jN54=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF89DF8058C; Wed, 14 Aug 2024 15:05:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DD14F805AF;
	Wed, 14 Aug 2024 15:05:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C203EF80423; Wed, 14 Aug 2024 15:04:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70601F8016E
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 15:04:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70601F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ye0Te/Ue
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1804FCE194E;
	Wed, 14 Aug 2024 13:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCEADC32786;
	Wed, 14 Aug 2024 13:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723640675;
	bh=/Fnx8Y5nhqPcK9Nfc3bO6zeYZ7dh7PtJbYQ6H77206E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ye0Te/UeybODxpQTaIWo1lpYJy4JnUeOdxTjfQK9Tv1j7aQsDVxj45xWzgUemE/iz
	 3Sz9p4hgU9z+OuwY3rSCQAlXvbdraw2GTHpGgP9aZ+Vo/IsBYrBkrlH1uMQIm32ojw
	 yIYMXFcKlU0x7VFCyKebvdjbjePhqIv5+a+YYxLR0mJdtYq/8iRPMIEPFenR6j+5uu
	 BXrR6UEx6dFHVtxEnya+saegnK6plfHSIa7SS3tCsfwaqGS9MqeRp5yt2Hk2FGYAWf
	 raDsbte2NQMH2W3iNAcyKTzBNtL0OspaQyMKNWtt9p3ydflz8tvD8joxgwlwmy63xJ
	 bGl7Jnf74hxBA==
Date: Wed, 14 Aug 2024 14:04:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Ki-Seok Jo <kiseok.jo@irondevice.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: FW: [PATCH 1/2] ASoC: sma1307: Add driver for Iron Device SMA1307
Message-ID: <33576ed9-abe6-4c6b-a3a3-0ae775601aa2@sirena.org.uk>
References: <20240813052609.56527-1-kiseok.jo@irondevice.com>
 <20240813052609.56527-2-kiseok.jo@irondevice.com>
 <66113ea5-11a7-41a9-8e28-af0394d7ded7@sirena.org.uk>
 <SL2P216MB233758C3649FAF0ACDCCB8898C872@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TTZ7pARm+F/j3sYW"
Content-Disposition: inline
In-Reply-To: 
 <SL2P216MB233758C3649FAF0ACDCCB8898C872@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
X-Cookie: The second best policy is dishonesty.
Message-ID-Hash: 72IWXCSPEHMBSPPMZR6VZARONRZ2JOHR
X-Message-ID-Hash: 72IWXCSPEHMBSPPMZR6VZARONRZ2JOHR
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/72IWXCSPEHMBSPPMZR6VZARONRZ2JOHR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--TTZ7pARm+F/j3sYW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 14, 2024 at 05:54:19AM +0000, Ki-Seok Jo wrote:

> > > +		return false;
> > > +	}
> > > +	sma1307_regmap_update_bits(sma1307, SMA1307_00_SYSTEM_CTRL,
> > > +				   SMA1307_RESET_MASK, SMA1307_RESET_ON);
> > > +	sma1307_reset(component);

> > This is a very unusual thing to support - what's the motivation for it?
> > If we were going to support it then we'd need to handle what happens to
> > the controls, either generating events saying where they've changed or
> > rsyncing existing values.

> The 'sma1307_reset' function is responsible for configuring the amplifier to operate properly.
> Sometimes users may want to reset the mixer control to its initial state after having used it.
> I have added a reset control for this purpose.
> Will it be problematic to initialize the chip values and return it to a usable state?

Yeah, so we don't usually have a control for that - most drivers could
have one after all.  The usual thing with ALSA would be to do this at
the userspace level, saving the configuration on startup and then
rewriting the controls from that saved configuration to reset everything
back to the initial state.  I guess you're partly using this to reload
the configuration from firmware?

> > > +static int sma1307_register_write(struct snd_kcontrol *kcontrol,
> > > +				  struct snd_ctl_elem_value *ucontrol) {

> > Again, this seems better provided by the regmap debugging features.

> Occasionally, regmap writes are restricted in debugfs, so I added it.
> (Reading is still allowed, so a read function shouldn't be necessary.)

Yes, the regmap debugfs interface requires modification of the kernel to
support writes which is generally fine for that application where you're
doing things during development.  Do you have a use case for this in
normal operation?

> > > +	/* HEADER */
> > > +	sma1307->set.header_size = SMA1307_SETTING_HEADER_SIZE;
> > > +	sma1307->set.checksum = data[sma1307->set.header_size - 2];
> > > +	sma1307->set.num_mode = data[sma1307->set.header_size - 1];

> > We didn't verify that the firmware is big enough to contain the header (eg,
> > if there's some filesystem corruption) or any of the other sizes or counts.

> The file format is fixed.
> The size isn't very large, but up to what extent is it acceptable?
> The header size is predefined, and the header contains the file size value.

It's just about making sure that we're not reading beyond the end of the
data we got from request_firmware(), or doing something like
dereferencing a NULL pointer.  The main issue is being robust against
loading a corrupted firmware file, so no real need to enforce specific
limits other than what's needed to make sure that reads are in bounds.
Consider what would happen if there were a 0 byte file instead of an
actual firmware for example.

> > > +	/* Register Initial Value Setting */
> > > +	switch (sma1307->amp_set) {
> > > +	case SMA1307_DEFAULT_SET:
> > > +		sma1307_set_default(component);
> > > +		break;

> > Why aren't we just using the chip defaults here?

> The values input to this function are the default values for the chip to operate.
> The chip won't function with just power applied; it requires specific values to be provided to operate.

Sure, but IIRC some of them looked like things which would normally be
runtime configured through ALSA controls rather than fixed at startup -
for ALSA controls we generally leave them at chip defaults and let each
userspace pick what makes sense for it.  This is just a way of making
sure that we don't have issues with different userspaces wanting
different configurations, the hardware provides a convenient default.

> > > +	case SMA1307_BINARY_FILE_SET:
> > > +		sma1307_setting_loaded(sma1307, setting_file);
> > > +		if (sma1307->set.status) {
> > > +			sma1307_set_binary(component);
> > > +		} else {
> > > +			sma1307->force_mute_status = true;
> > > +			sma1307_set_default(component);
> > > +		}
> > > +		break;

> > What's this for?  Usually any default setup would just be done through the
> > usual control interface.

> Generally, the amplifier operates correctly with default settings.
> Occasionally, when users want different output levels, we provide a binary file to adjust the settings.

> Since the settings may vary depending on the speakers used and other external factors, and because these settings cannot be adjusted by the user, the purpose is to provide a configuration file upon request.

So really this is loading a firmware file with parameters?  That's
probably fine.  It might be better to just try to load the firmware
unconditionally and then fall back to defaults if there's no firmware,
though possibly there's safety issues.

The setting_file should probably be named based on the machine
compatible or something, that way people can ship a single firmware
image with multiple machines supported.  Possibly also with an option
for extra configuration if it's at all plausible that there might be
more than one of these devices in a single system.

--TTZ7pARm+F/j3sYW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma8q14ACgkQJNaLcl1U
h9CSuAf/Vy/pX6hgSnMKf5Z3timCWGt1jEg38/44dfm308zhOtmw5egoPlTN1sIT
iIrOb8A5yfUfNOPt4prihyqmh5GR2jMAKohQXWT1wjsglAWHSPzkD2RQewZgd5w2
waiiVl0CYd88EuYeaWbEC9bM5fAV/rPME97T4WoFlC6hK1kjho3ArDgjo2CviYXe
lg2rPLPyPbVkenFHiokP4PJtaYEPvvSoS+YCj632wjfrKBDCrjNhxq/UnSWVBWdY
a/p/keQx2/Sa7oYwDfsedMkkN9FbhZKJVUz/dZDsRcyOJsK6p37DPRKPjeOVL7w3
CbeTzZRnkurD+lVSGfjmgEEnsDoHWw==
=T5o+
-----END PGP SIGNATURE-----

--TTZ7pARm+F/j3sYW--

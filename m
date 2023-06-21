Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD90073872D
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 16:36:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4B9B1EF;
	Wed, 21 Jun 2023 16:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4B9B1EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687358216;
	bh=W2XF7Oua9MyLK7f+VdvwpICbplyFhJN3xZ2lUbZlqAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pn/opjyl5T7XXVjQVxw+SIVzVmOS1sij3qbTKBpwWCqJN5ZMd1TSaY2IDEFzHUoWz
	 /d+B9lflp5E4p+3EYOkpAotH7FyYvlcBlmnBw/oxhusSqg4t2hp5ggBbkklZSROY6q
	 b8l6vBpoNXDkKkqtN5Fjr3ThpL7CcOxXKXbPTxs0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3DE9F80141; Wed, 21 Jun 2023 16:36:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 422F5F80132;
	Wed, 21 Jun 2023 16:36:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31077F80141; Wed, 21 Jun 2023 16:36:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7401CF80124
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 16:35:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7401CF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Mwbyt3bv
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EA58061570;
	Wed, 21 Jun 2023 14:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F9CC433C0;
	Wed, 21 Jun 2023 14:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687358155;
	bh=W2XF7Oua9MyLK7f+VdvwpICbplyFhJN3xZ2lUbZlqAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mwbyt3bvhlfW6wb6ioKf7FJCJWZRoFxdcB2Ji6NuyPM2bDnwGq3tAA9thyNMVbLhh
	 IIezVbNSq+ffB2Z0OqoIYQ2nar3HKK1GoRDSbwuqdwnheDmZ5nhDBDHhIIhMIMadRm
	 KciOMEcloer9Nio3dK1oTx0dmJF8mBebye6tjT65BZE8rhY4YHmgk6n0fAkmzzfYMb
	 jLu7cWNk8Xu/+Tuo3o0s7BrJS1EGjI5STnc1FYO7cyMJj6rcq34n4nNWXJ7Jw5ZCxC
	 M1Skx4oSqflz7MLg3y8MXzr/a6H85SAifVg1KU5YQAVKYEXJLGDe8pP3/ua1m5LI4W
	 Z2llrRYsFG/MA==
Date: Wed, 21 Jun 2023 15:35:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] ASoC: codecs: max98090: Allow dsp_a mode
Message-ID: <c054b036-d5fd-482b-adc4-913edbcd007c@sirena.org.uk>
References: <20230621115328.156457-1-fido_max@inbox.ru>
 <3805dc65-113f-453a-90a9-2ae6204004ba@sirena.org.uk>
 <e6be75f6-054f-6c3b-00b4-a5e112bcefc3@inbox.ru>
 <b763d08e-f751-480c-96b6-339a53856768@sirena.org.uk>
 <ed9606a4-4be6-7403-6e32-1c045ac0bdf6@inbox.ru>
 <adbe1b82-9478-4462-ace9-968723a6ce3f@sirena.org.uk>
 <0ada8334-4006-438f-8461-5c4c8e13f65d@inbox.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2neDLP738ecGvEVW"
Content-Disposition: inline
In-Reply-To: <0ada8334-4006-438f-8461-5c4c8e13f65d@inbox.ru>
X-Cookie: When among apes, one must play the ape.
Message-ID-Hash: SIY2G2I5ZARRI3O3LCDBSSNOCCCU2563
X-Message-ID-Hash: SIY2G2I5ZARRI3O3LCDBSSNOCCCU2563
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SIY2G2I5ZARRI3O3LCDBSSNOCCCU2563/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--2neDLP738ecGvEVW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 21, 2023 at 05:28:41PM +0300, Maxim Kochetkov wrote:

> Yep. But we have to specify TDM parameters (slot masks, slot width, etc) any
> way. Because there is no default TDM configuration like I2S and so. And pure
> DSP_A/B mode just have no sense.

No, they make perfect sense and are widely supported - the sample size
is chosen based on the hwparams instead of being forced by configuring
TDM mode.

> Anyway. What do you suggest? Should I perform some refactoring for the
> driver? Should I move M98090_REG_TDM_FORMAT/M98090_REG_TDM_CONTROL registers
> setup to the max98090_dai_set_fmt()?

To repeat:

> > > I'm saying there should be some interlock between these two settings, if
> > > nothing else setting DSP A mode should force TDM mode with automatically
> > > configured slot sizes.

--2neDLP738ecGvEVW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSTCsQACgkQJNaLcl1U
h9D+2Qf+OXZ936gjrm5garp8HyHsxJi4cDxPg+iRNTE2bFGPiZZGalEyqDobvnT+
+V3eOdmPrirjskcEkG1J+YGJkfMFtvoRg2+O613K3yRKx27jEZK7zkwCMmjaXKA1
1SPuLLuG0xuTiFR5XCWQ3TlextQXT9Bd8yzEjKQ5v8IF3jkxBUi6tUmk3S7s05Ow
ZytXngPOb15z/tIJa3/1GwQ+ICN/BVXRfexX22SIFyRrfZMuRRQH4hdpJpjWXHe7
bUMsxFYPB45ULLHHVAET28DckyE0K3V0gKSDBdrH5g1lbXCDtz4M2YZGQh70s+Ub
1hM84darU01Y53RTLeS5w/tr70Ua+w==
=FNmd
-----END PGP SIGNATURE-----

--2neDLP738ecGvEVW--

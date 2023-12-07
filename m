Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B4380926F
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 21:37:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B59F868;
	Thu,  7 Dec 2023 21:37:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B59F868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701981439;
	bh=A/iJPAJZbCyqXwpvMP5DNRiXuMJzxGLIa64KiWx8Gas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dowNXC5sKj59cZLO4LE/+MeqncjlV6xUpXbj1eAnWCpKn0EuZ0COft7EN5sLoxhKW
	 4zGGVdajXlob2GGnXtCgLScbFhUU7reiejpMRCU7zXERk+5oX666NjhZ3aLLYmSQXa
	 u7Bp0TCVUmaDefSkk3/AKwd0WZOhG73v3Cx2FOXE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C28A7F80564; Thu,  7 Dec 2023 21:36:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29E40F80570;
	Thu,  7 Dec 2023 21:36:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78381F80166; Thu,  7 Dec 2023 21:36:41 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0024BF800D2
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 21:36:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0024BF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AexSbexJ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B68361CF2;
	Thu,  7 Dec 2023 20:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B75C433C8;
	Thu,  7 Dec 2023 20:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701981387;
	bh=A/iJPAJZbCyqXwpvMP5DNRiXuMJzxGLIa64KiWx8Gas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AexSbexJDdMRswMqpmCdOlHy2crmiHPWy9KFikL1+b2b7eNj7Oo1EZ44VOWsy2U88
	 OeaRxbiJi00cyTUY4bziwCtpr+2QZpTl+4mEt2Ujx2M85ok0VyNA92hBtk4cmpMXWn
	 UgQLxN5ZvcFy1gjkjc4ACN4HsjQZXjvXgGIwzNX20ufxaw7OuMt2nUtz1e7KMUJjKB
	 pjVGdTpPgg45CON4WHIgBsgy5wlWiETvDuU1qx6v769g/T+B8McsVuYKCd4JaRVJB7
	 hx7y4vYIoJvK4DV7s2PusDCaRcAAjs3Yqxo6AGHFerphjZI6EGN6V8oGhcqZC6p4Ma
	 bwIOLfPLxV2KQ==
Date: Thu, 7 Dec 2023 20:36:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 03/16] ASoC: tas2781: disable regmap regcache
Message-ID: <5f3f0306-799f-4f3b-9e05-fbd300c59d5d@sirena.org.uk>
References: <cover.1701906455.git.soyer@irl.hu>
 <21a183b5a08cb23b193af78d4b1114cc59419272.1701906455.git.soyer@irl.hu>
 <0b836c10-b21b-4275-8dd0-254dd5467497@sirena.org.uk>
 <47097f19398808b64f4cc87c2a3c7cc462fb2416.camel@irl.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Uj2TarlHLm2msvZq"
Content-Disposition: inline
In-Reply-To: <47097f19398808b64f4cc87c2a3c7cc462fb2416.camel@irl.hu>
X-Cookie: Two is company, three is an orgy.
Message-ID-Hash: 4E2W265BLHDXRJ2QKC2AN4MDIUAWMXCK
X-Message-ID-Hash: 4E2W265BLHDXRJ2QKC2AN4MDIUAWMXCK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4E2W265BLHDXRJ2QKC2AN4MDIUAWMXCK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Uj2TarlHLm2msvZq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 09:19:34PM +0100, Gergo Koteles wrote:
> On Thu, 2023-12-07 at 18:20 +0000, Mark Brown wrote:
> > On Thu, Dec 07, 2023 at 12:59:44AM +0100, Gergo Koteles wrote:

> > > The amp has 3 level addressing (BOOK, PAGE, REG).
> > > The regcache couldn't handle it.

> > So the books aren't currently used so the driver actually works?

> It writes to the book 0 and 8c. The initialization works with regcache,
> because it writes also the i2c devices.

I can't see any references to 0x8c in the driver?

> > >  static int tas2781_system_suspend(struct device *dev)
> > > @@ -770,10 +758,7 @@ static int tas2781_system_suspend(struct device =
*dev)
> > >  		return ret;
> > > =20
> > >  	/* Shutdown chip before system suspend */
> > > -	regcache_cache_only(tas_priv->regmap, false);
> > >  	tasdevice_tuning_switch(tas_priv, 1);
> > > -	regcache_cache_only(tas_priv->regmap, true);
> > > -	regcache_mark_dirty(tas_priv->regmap);

> > How can this work over system suspend?  This just removes the cache with
> > no replacement so if the device looses power over suspend (which seems
> > likely) then all the register state will be lost.  A similar issue may
> > potentially exist over runtime suspend on an ACPI system with
> > sufficiently heavily optimised power management.

> In runtime_resume, only one of the two amplifiers goes back.
> The runtime_suspend sets the current book/prog/conf to -1 on all
> devices, and tas2781_hda_playback_hook will restore the
> program/configuration/profile with tasdevice_tuning_switch.

What does "go back" mean? =20

> And only one, because tasdevice_change_chn_book directly changes the
> address of i2c_client, so the unlucky one gets invalid values in its
> actual book from regcache_sync.

The code creates the impression that writing to one tas2781 writes to
all of them, is that not the case?

> system_restore doesn't work at all, because regcache_cache_only stays
> true since system_suspend.

Presumably the next runtime resume would make the device writable again?

> It works without the regcache functions.

How would the devices get their configuration restored?

This sounds very much like a case of something working for your specific
system in your specific test through some external factor rather than
working by design, whatever problems might exist it seems fairly obvious
to inspection that this patch would make things worse for other systems.

At a minimum this patch needs a much clearer changelog (all the patches
I looked at could use clearer changelogs) which explains what's going on
here, I would really expect to see something that replaces the use of
the cache sync to restore the device state for example.

--Uj2TarlHLm2msvZq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVyLMUACgkQJNaLcl1U
h9A1fQf/Tlm20RKXzkcJxmQRhcBpwToF4r81+C/V1oU79kt+sva9XYW8cdM7zpJQ
LRgZIL4PcwHJIFjlxILYMs7iUaYnGqYEcL9OTxorCkVKUA29gqpF0LJLLQhxuCje
FVEHeQLgF1lPk2bu0WuJeyvOJuAjXQYRrmSdIFLIQZOS4r4T3HsjX4OIV6fiGaxR
pZZp+/R9MMFRe5nnA3nIsKVeqA21rH7rGdN0eCZsMhbRF82Vy9N8MNoAPw8EwgVU
d1DQ9lsWKqnvZkRnEIca9VU5kfcswwqtvj4fQn4e3mv2mrQpKBMXvng7lGHM5Hn5
43hKhgOyvrEp9y/L+pdxWi/piD+Uog==
=DLg/
-----END PGP SIGNATURE-----

--Uj2TarlHLm2msvZq--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3190738617
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 16:03:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0920582C;
	Wed, 21 Jun 2023 16:02:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0920582C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687356207;
	bh=WaSxUSnDv1Zs13RbnqxjrcQaB3saqQt/wEzq2vsKKLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AAeCJ+bfChMpDSNKXelc4CEm2EDlEjxaAa4AGhZ/LdkjCZAQMblfbwS1bg/CoWY0O
	 B7fzjOCNRtzgZoO0Yms1hiX6i+CQQ4FEzF0uU+fPjLYcR8lbTnOoTFci3CX/Zl0app
	 bAWObFeESpHHP1FgOqADkWtwlASk3gdmcA8H8BSg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6F07F8051E; Wed, 21 Jun 2023 16:02:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41DB7F80124;
	Wed, 21 Jun 2023 16:02:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3432F80141; Wed, 21 Jun 2023 16:02:07 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 66873F80093
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 16:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66873F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pi8yRU+i
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 168C96150F;
	Wed, 21 Jun 2023 14:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA713C433C8;
	Wed, 21 Jun 2023 14:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687356120;
	bh=WaSxUSnDv1Zs13RbnqxjrcQaB3saqQt/wEzq2vsKKLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pi8yRU+iMzkhI91FHgk9BOXlwCTXpYUjBxKKTaGkaKzexseV5WdIoSgPf0EelJNSN
	 cJ/Ci9p/9aRLjK5IvCqiqeIDc0vUFCLZbZ/pc+N4Em6iVxvWo5uOhAUIkuEfDHNgBg
	 rc2Vy2UUlVvKHxYhKzeGwN2eFKIrYEc77rVbieVQ653kFkcwR7eKQ7paYsL/hPmsEn
	 Jj7W2c75JG9GsaVf+pq40deqOJ1TycVxbkDjdSpDSQ6A6xVwXPKdE80VcQXXVlUEOP
	 95BKYvVgmwRQeKajYHAFySLSuPbMa8WlEFJRrFP2eNgqZH0zjwqWIWfudollxusi2+
	 NoXrKZGwnNAWQ==
Date: Wed, 21 Jun 2023 15:01:54 +0100
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
Message-ID: <adbe1b82-9478-4462-ace9-968723a6ce3f@sirena.org.uk>
References: <20230621115328.156457-1-fido_max@inbox.ru>
 <3805dc65-113f-453a-90a9-2ae6204004ba@sirena.org.uk>
 <e6be75f6-054f-6c3b-00b4-a5e112bcefc3@inbox.ru>
 <b763d08e-f751-480c-96b6-339a53856768@sirena.org.uk>
 <ed9606a4-4be6-7403-6e32-1c045ac0bdf6@inbox.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xMFEG+XNmWkIkuCL"
Content-Disposition: inline
In-Reply-To: <ed9606a4-4be6-7403-6e32-1c045ac0bdf6@inbox.ru>
X-Cookie: When among apes, one must play the ape.
Message-ID-Hash: W4T7TEMW4QUK2W6VI235R3VNDCQNSQND
X-Message-ID-Hash: W4T7TEMW4QUK2W6VI235R3VNDCQNSQND
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W4T7TEMW4QUK2W6VI235R3VNDCQNSQND/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--xMFEG+XNmWkIkuCL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 21, 2023 at 04:55:18PM +0300, Maxim Kochetkov wrote:
> On 21.06.2023 16:18, Mark Brown wrote:

> > I'm saying there should be some interlock between these two settings, if
> > nothing else setting DSP A mode should force TDM mode with automatically
> > configured slot sizes.

> At this time there is no any interlock for TDM mode in MAX98090 driver. We

Yes, that's the problem I am identifying.  The driver allows TDM mode to
be configured independently of the DAI format but the two are related.

> can specify dai-tdm-slot-* properties in DT and .set_tdm_slot() will be
> called to setup TDM mode. And SND_SOC_DAIFMT cannot affect it. I checked
> other codecs drivers: most of them performs TDM setup this way. So why do we
> need such interlock right now?

A lot of devices support TDM modes with other DAI formats, or allow the
mode that is required for TDM to be configured even without doing TDM
setup.  Some always configure TDM like I'm suggesting, with the explicit
TDM configuration just being an override.  Some are just buggy and
nobody noticed.  The issue is that the driver will claim to have
configured DSP A mode but actually done something else unless the user
also configures TDM.

--xMFEG+XNmWkIkuCL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSTAtIACgkQJNaLcl1U
h9D8DQf+M4lV2nSFMSMoBz0YSFaNAMSRSdqSJ9UyHCOw+o7zxjArfhrL0vZiEt+G
q0D4SJyO5h7vtKfGPp5DwQTWp47q0ZnWENjn/KVFHGeZu3Vk/0xzOewJQaNGkWcU
aDxOXr9hqjKPx71GsBiA5DKSCd+cWGwQaCBzugsh0eNNkNwFXLyfZg0C+VjFZm6L
XomAL6gQSoJvGqO8iw3O0oPf43t+Mgws5pSoC8dkyIKQGu+8qA/UZa70zKl/lAtE
YN2gOxv5X9tX5P0z/1w1TCaWlWmOuAOo0sYU4/nq8q+e0qss15bKMjy8aJBUX7RN
P/cFt5MgYCerxyTmErcqM4CjWzFHbQ==
=X2Ph
-----END PGP SIGNATURE-----

--xMFEG+XNmWkIkuCL--

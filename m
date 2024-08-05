Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFF4947FBF
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 18:57:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FD8152AA;
	Mon,  5 Aug 2024 18:57:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FD8152AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722877034;
	bh=cJWWhC5ntldu+JRfUJ99sO45oMidL1C+aIhRQhQ9HhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TRrOUlKqWRQ9UMByKqXZFYiWsH/1O9jETOr7yUPKwkq/xvUlYQgQsiqfWi5UNvNj9
	 oGtbSkm1jPI2Tp0Bo9a4kdwtM4uy55/BuAfgpy01NGPn0p2rShMRHENzbWbP3qQr9A
	 K3znEIXY/1mLeFHaYXT+eLLuBbmUmM8A0NOO3dP8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 396A7F805B2; Mon,  5 Aug 2024 18:56:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2E97F805AF;
	Mon,  5 Aug 2024 18:56:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B964AF802DB; Mon,  5 Aug 2024 18:56:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8B6BF800B0
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 18:56:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8B6BF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=biWOUkoZ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7EFF160C7C;
	Mon,  5 Aug 2024 16:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27EFC4AF0B;
	Mon,  5 Aug 2024 16:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722876989;
	bh=cJWWhC5ntldu+JRfUJ99sO45oMidL1C+aIhRQhQ9HhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=biWOUkoZ5sBoNUHYGurUnIIqoCBRLJ5bAmFx1TzTjhQrqkTfFCnQ37ZuIwUuokGp3
	 RuY7tEaw8jgMKjxaVkj6bCKPQlKwwbXAG/CrmwhMqOLtMyvkn0kGUtu5tZezCPjZav
	 Yr5F/9aC66HXQmBSwk1T26ph83Ka2gtp9UucMS77yZvzWlvz+fO+tC3q9Vhjdoon0I
	 aWVMobpfMB8zCj9Xx9eT79SxEgjCG8fhoEb9JOzWaZB+AAwROTPV2yV4aBtK/Hicta
	 AucsqaeypgdjrEcJIcF1ukeUUcZcEoSAIMyAinI2CfWUm+YQ/UC5DglJIs1uUYNzqO
	 OcuMSCut6P2Fg==
Date: Mon, 5 Aug 2024 17:56:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
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
Message-ID: <04b2b8c5-8b18-4594-9eeb-9971d8cf3786@sirena.org.uk>
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
 <1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
 <2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk>
 <1j5xsow839.fsf@starbuckisacylon.baylibre.com>
 <7dfdade5-3a57-4883-bfac-067c50ec0ffb@sirena.org.uk>
 <1j1q3cw5ri.fsf@starbuckisacylon.baylibre.com>
 <20240805153309.k_SfHw62@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PmcO6oqNBVuQAmrg"
Content-Disposition: inline
In-Reply-To: <20240805153309.k_SfHw62@linutronix.de>
X-Cookie: Goodbye, cool world.
Message-ID-Hash: MRNE2QZ2R5AWPD2BSJSKZGKY2CGI22CN
X-Message-ID-Hash: MRNE2QZ2R5AWPD2BSJSKZGKY2CGI22CN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MRNE2QZ2R5AWPD2BSJSKZGKY2CGI22CN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--PmcO6oqNBVuQAmrg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 05, 2024 at 05:33:09PM +0200, Sebastian Andrzej Siewior wrote:

> I'm not sure if making the lock a raw_spinlock_t solves all the
> problems. The regmap is regmap_mmio so direct memory-access and looks
> simple enough to do so. In regmap_mmio_write() I see clk_enable() and
> and this uses a spinlock_t so we should be back at the same problem.

The clk_enable() is optional, users simply shouldn't use the internal
clock management with devices that it'll cause problems for.

> There might be an additional problem if reg-caching is enabled.

The flat cache is there mostly for the benefit of things accessed from
interrupt context, it guarantees to never do any allocations and doesn't
lock.  You can also use other caches if you ensure that any registers
accessed in interrupt context are already cached so won't trigger any
new allocations.

--PmcO6oqNBVuQAmrg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaxBDYACgkQJNaLcl1U
h9Be3wf9E7bM5pWGm5SeLcoOoFtCljwgUPX4/syxkWZ4gbzyXkWXA1jBOgucoU9o
FvwE+yafCfSo0zG2EhElLUT9dp9MLj0S8JrWfQFSeh+1OGdZR/KjK1NEVYiV6doP
Ye1L6xxIstW6NNhLYENRIUok6WX6L4vFOAWR2By2lr+0IYY9gpstt1/s72jdLamt
xhKp1TzPAOTUvjhYP5BTZJCQ0ugrCnW+T52tdExyCnj/7wdomwKf8TRUZsz1AmUF
yL//1bYA5Oynyz/rrvKNPxjcvG6sGmXaV1ZsomGzrMRnZH0kXzFu6IPUNIRG9fN2
YK8Qt4jLj7DKCNmtBrQLLUjQDKN1Lg==
=p6B8
-----END PGP SIGNATURE-----

--PmcO6oqNBVuQAmrg--

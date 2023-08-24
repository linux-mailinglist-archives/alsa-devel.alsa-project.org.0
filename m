Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AB1787A10
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 23:16:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30D6B832;
	Thu, 24 Aug 2023 23:15:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30D6B832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692911782;
	bh=I9F0zhx3SZYr5cfpl/eOglkUMKDY7aystEvL8YQvAgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AxB43srG9J8u0EEWwkmGdmiqWnfh5vC1QwYUNDg38jee8DhLD62LDqVKEcr3ZKGD0
	 yZqjDicvdOf9MbeAb/p85Ag+r9/3ETDyBcQNEtKRnGGxQPerHc7W5sN9dq2kH84oo5
	 SS0P/BP+QnTXG/mb/Gv8ozkHCg1dnG0se2GflSAM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2439AF800BF; Thu, 24 Aug 2023 23:15:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99D00F800F5;
	Thu, 24 Aug 2023 23:15:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B39AF80158; Thu, 24 Aug 2023 23:15:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DDF1F80074
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 23:15:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DDF1F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Bg1Q+SAi
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 857C866253;
	Thu, 24 Aug 2023 21:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 613F2C433C7;
	Thu, 24 Aug 2023 21:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692911707;
	bh=I9F0zhx3SZYr5cfpl/eOglkUMKDY7aystEvL8YQvAgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bg1Q+SAiXkZ2kKB0x47+NxnL3nNclkg+IYmp4lWkAB25TKPEWkpqnWW9EuTAeAJIO
	 OxANViljy0gZouyVduat8PPEKGSyU09YDd01cSWn5zcjS9qI8U+XzSUU8aChyU5qM9
	 s2UVECHKKn6LgQjo2a1GsGY/AeQuC7BG3AZV0jL+cTy9AnDNYGqBB2Xvb7vcc0GWpB
	 Gbokq32m+pUHM13g1p6S06aoJ0AWoj6HswD8KLhNkf3HgTG+2qyHwPUXRDI9/LkIW5
	 9ohNT27DWsLd+wtLqibsJcasQPnJOEGoj3BXewnuytRnnU3c0mk/cw3CMhmpNvwSpX
	 PGVjs8qcpox8A==
Date: Thu, 24 Aug 2023 22:15:03 +0100
From: Mark Brown <broonie@kernel.org>
To: cujomalainey@chromium.org
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Dan Carpenter <error27@gmail.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Clement Lecigne <clecigne@google.com>,
	Min-Hua Chen <minhuadotchen@gmail.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <treding@nvidia.com>,
	Geoff Levand <geoff@infradead.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 2/2] ALSA: core: split control primitives out of snd_card
Message-ID: <ZOfIV2rv5H3qCA8A@finisterre.sirena.org.uk>
References: <20230824210339.1126993-1-cujomalainey@chromium.org>
 <20230824210339.1126993-3-cujomalainey@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oFwSR4Z9GP03rUSi"
Content-Disposition: inline
In-Reply-To: <20230824210339.1126993-3-cujomalainey@chromium.org>
X-Cookie: Give him an evasive answer.
Message-ID-Hash: LBAPOBYUKL4D5E7ATKMMV6T6XXK27SPE
X-Message-ID-Hash: LBAPOBYUKL4D5E7ATKMMV6T6XXK27SPE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LBAPOBYUKL4D5E7ATKMMV6T6XXK27SPE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--oFwSR4Z9GP03rUSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2023 at 02:02:53PM -0700, cujomalainey@chromium.org wrote:
> From: Curtis Malainey <cujomalainey@chromium.org>
>=20
> Having two kobj in the same struct is broken at its core. This splits
> card_dev from ctl_dev so they can properly refcount and release on their
> own schedules without the workaround of having them being just a
> pointer.

Acked-by: Mark Brown <broonie@kernel.org>

--oFwSR4Z9GP03rUSi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTnyFYACgkQJNaLcl1U
h9D5MAf/WoiwxOLfgN7Gz3MOOUi3ZMkjuTKwDnjx3/SzAqCGVygYHK+gjn56z8nk
3t8dbIQDzBZpyyD+UcxhDm3sXVPbO/00IRgNC2OYa4DMLpNiyHjgp8GTZOz4Fu9z
PPGUovW8ZnQIBEE4uzqaTC6UdbkOKymrj/cO8pp+lkALdNIIPXnYVvS21GaWKPWq
qqWFqzD19+K/dbPj4p1Gf3iOXCL2ZAIOJUpg/wHOs8rlImGJXpY8FnEMacZfDy4S
STKoeUpdk0EDJT85aHfrSgtkEJWOfDdhlGhdq9k3VxFWwh2dtnwjnl27d2aX6zUk
QbWWECQlYWKbvG2C+uYoigv6VrLbaA==
=P6vk
-----END PGP SIGNATURE-----

--oFwSR4Z9GP03rUSi--

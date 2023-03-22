Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C396E6C4CE0
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 15:05:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB94DE8C;
	Wed, 22 Mar 2023 15:04:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB94DE8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679493911;
	bh=kQeEJQhzQ1qb2clj3gu7TZ61M8ol7Sig5WBGaaImw+0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HWWOgytPBAEgjK2bhmUXxAmRsB2NM6soeZkXjiBDn2s+TyfzBuuDqbWHYJ4OJMFFw
	 r7OuJ/5B7UGEzSH4uGnB/t9xVT92jj7DuBluO71O5Fxc39j38Ik8XB+UCEs7bmfa72
	 XH1nUWIbQpCAjb/pXNXg+wJDH1IMBfECJzSF+HD0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F274F80254;
	Wed, 22 Mar 2023 15:04:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 931B0F802E8; Wed, 22 Mar 2023 15:04:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7DE9F8027B
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 15:04:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7DE9F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=clxOzlte
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6F11162053;
	Wed, 22 Mar 2023 14:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2A0C433D2;
	Wed, 22 Mar 2023 14:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679493849;
	bh=kQeEJQhzQ1qb2clj3gu7TZ61M8ol7Sig5WBGaaImw+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=clxOzlteSD4o22yBMLhu2961tMzxFRhEnkatiCnZwNO2DvjtLX0sFzS7Wu+NFuyzQ
	 X4B21AyizzubUf2954aM/Z43nrqOfgHiijGKbwnrP3Sz4kbNiU2GT1t6Q03l9+kmij
	 1FVtzDStQNjLvNpuCUZ9VJmAoQUAxvCnC6A8uZ0JwGIfusf5FvudW48CLPbaQtOJVl
	 EQ8Vlzz5sp7jjGC2bUvzbRZxxqBkpVwebLb+wIcBRBLsSWz2qgr8UdGvdKwEL+HFEB
	 AyIAVwUeSLWc/vZMBxAc3OFlKJCHNgYwQFiTWLZgInXLQHr1mUr/TmKHbTTbWKCQji
	 gE831QEHg+LcA==
Date: Wed, 22 Mar 2023 14:04:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2 0/3] ASoC: SOF: ipc4/intel: Support for ChainDMA
Message-ID: <ZBsK5mJUfHSyrlU5@sirena.org.uk>
References: <20230322135927.7668-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y+JzEVFg7Oj9jhO7"
Content-Disposition: inline
In-Reply-To: <20230322135927.7668-1-peter.ujfalusi@linux.intel.com>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: 7OI65UR54KI6UYVJRKNNI36DXMDRBM3U
X-Message-ID-Hash: 7OI65UR54KI6UYVJRKNNI36DXMDRBM3U
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, jyri.sarha@intel.com, rander.wang@intel.com,
 error27@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7OI65UR54KI6UYVJRKNNI36DXMDRBM3U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Y+JzEVFg7Oj9jhO7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 03:59:24PM +0200, Peter Ujfalusi wrote:
> Hi,
>=20
> Changes since v1:
> - Fix missed mutex unlocking in sof_ipc4_widget_free()
>   Reported by Dan Carpenter (thank you!)

Please do not submit new versions of already applied patches, please
submit incremental updates to the existing code.  Modifying existing
commits creates problems for other users building on top of those
commits so it's best practice to only change pubished git commits if
absolutely essential.

--Y+JzEVFg7Oj9jhO7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQbCuMACgkQJNaLcl1U
h9D+Twf+OxTEABgKjq5hdIIuCWQs4gYUEOuA7rTZzctemNwag2O6tXoVk7RW9Oaf
aCr6bzQt9qcZhBv8nJbysq1uXx01btcZ6H1iI0HK3SCR2B9HACtTkgNbULqpVjLh
D0CAyBbh9uYshE++2qxY+Ju/YV4ftfC2Y28JasWUvrl69SMAunzMlaxjbjTgzvW6
mOaQu6vtnpTzTNHzYU+uk0CEOdrxQiyOhLW7yG0ayx9uFcWFM9rYqoW6D4MCPz7q
l/C4gbWBF08pBCnq/Cyd1u9J2XLmPLosJuTvtQducVZJslkrU58zHJqC9jCqz3zr
sXDbyAPfMVjlVHtzf/aW98o+pTL9MA==
=55zD
-----END PGP SIGNATURE-----

--Y+JzEVFg7Oj9jhO7--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEEB97ADCD
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2024 11:24:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AD70E72;
	Tue, 17 Sep 2024 11:23:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AD70E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726565049;
	bh=nsRUUHtPJFFITXgQq/oXznG1F1LUC1JFyN5PWBkyW+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S4s6xjDc9KKK/tApjMbkDkMUhHDXhw6+JVkVtGQbJH9yi2TVvkebYYOaQljDAwiCK
	 lVxTvXQEkhSbzp6Sf/bhoPo93JD/w9fovepYjwd2LYimcXhtqZTLQ2bUnompoGseGd
	 eOkiQXXjbv700e8+xBqhhqawrESGM7/cw3+3dwdQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED1B5F805B6; Tue, 17 Sep 2024 11:23:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54448F8058C;
	Tue, 17 Sep 2024 11:23:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 077D3F8020D; Tue, 17 Sep 2024 11:23:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25808F8010B
	for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2024 11:23:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25808F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hgmb0QCQ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 331B9A40833;
	Tue, 17 Sep 2024 09:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC92C4CEC5;
	Tue, 17 Sep 2024 09:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726565006;
	bh=nsRUUHtPJFFITXgQq/oXznG1F1LUC1JFyN5PWBkyW+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hgmb0QCQzPC3Q6oJcFI0FfPNgXUvSd2K7Tz5dhQPE5mUauSzv7oEYvcErLSqRgqLC
	 9DuBr8LzqV4+ynkLxFuInKVDesFMiPlAEYwWogiCypuzIkCNNJU+dUdx+xheY1LAJY
	 7czsGYGaiSIxiwrP2x52uuiSLzxR0dtlcTpxuWQhyTsZt98MwHY3REbmk1KNWdsyAJ
	 MJJcPJr7x9mRwXrgRHVXNZEJyZQqjIB3v5ccaXHTHPDd8AWiTCDJC/exa9rCqNUUii
	 vjg3la3ZMotgDh4LWpdqnKUq1ldbM3+T2PWaAhcfKJQXFiiI0IeCiJ40xYzY/Ff5PA
	 +sg7kIXXF7/WQ==
Date: Tue, 17 Sep 2024 11:23:22 +0200
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
	yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com,
	tiwai@suse.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: amd: acp: don't set card long_name
Message-ID: <ZulKiltQog5Dqo5h@finisterre.sirena.org.uk>
References: <20240916061318.3147988-1-Vijendar.Mukunda@amd.com>
 <0ab48a05-54fa-45ff-9613-62dfff2fa699@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LSgi9HRq9ifp+Unz"
Content-Disposition: inline
In-Reply-To: <0ab48a05-54fa-45ff-9613-62dfff2fa699@perex.cz>
X-Cookie: Editing is a rewording activity.
Message-ID-Hash: WRYTGG3FPALAYW4SV4BTCJMPRQI2OQF6
X-Message-ID-Hash: WRYTGG3FPALAYW4SV4BTCJMPRQI2OQF6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WRYTGG3FPALAYW4SV4BTCJMPRQI2OQF6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--LSgi9HRq9ifp+Unz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 10:25:37AM +0200, Jaroslav Kysela wrote:
> On 16. 09. 24 8:13, Vijendar Mukunda wrote:
> > UCM can load a board-specific file based on the card long_name. Remove
> > the constant "AMD Soundwire SOF" long_name so that the ASoC core can
> > set the long_name based on DMI information.
> >=20
> > Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>=20
> I have to say, that DMI information in long name is really confusing for
> users for GUI. UCM can fetch DMI information directly using sysfs. This t=
ype
> of hardware identification is no longer required.

I dunno, a lot of Windows sound cards seem to end up with something that
looks a lot like the sort of thing you might get from DMI showing right
up in the UI - vendors seem keen on it.

--LSgi9HRq9ifp+Unz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbpSokACgkQJNaLcl1U
h9AAkAf9E4sw0qTTWfzfUii9Rufag8+mTscuyht6+cmj4gtc3Uvw5qTWie+cjNGI
NYWD9GQE5AXX493y08Zq06yrBgObrK/Au+gJtA26IOID9+lLdRivMwqf301YH4QX
TwsBj6no41KshlD5BVqVs6wLNeTMnMs7Cvx2St34mD9G9C2GvgToSuGVb9Qdfchu
frobzzalewtdUZ2QBtraMMVlPiJRHnfobIE71MFhz2SsB9vQqIKvLalxvfiwwRck
1OXbHbbvQTIA5Zni5LsVfiCnnrGeTPcdi9BtPJOyNCjEjgW7z90XlmI5Su3+/Qff
8PeFpQ4bcn7bR7af9jV1zBUo0MyGFQ==
=s6El
-----END PGP SIGNATURE-----

--LSgi9HRq9ifp+Unz--

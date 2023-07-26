Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 895AD76359A
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 13:50:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D0E67F8;
	Wed, 26 Jul 2023 13:49:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D0E67F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690372234;
	bh=lbF0liGI7QHy1bpQGze9hCny5OUhXwB6mv1T2xUmixM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PqIoxMHI7bONN2wfgMTu21oI754ShZBAoDiqpmL4WLixQ5nNUEneJ58a0kN+nQttc
	 t/hrfZXtzb7zzGDIqEk0fnU3TUZi6LcFbDio3CkGVu+7jyBvGGEyvw9vqJ3uvg23dM
	 y0ZOWYH0rVU/sY/znlahKgqyqZWppvde6FotI00M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2CD4F80535; Wed, 26 Jul 2023 13:49:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97365F80153;
	Wed, 26 Jul 2023 13:49:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE42EF8019B; Wed, 26 Jul 2023 13:49:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC12DF800C7
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 13:49:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC12DF800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=udFHHdx/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BA10D61AB6;
	Wed, 26 Jul 2023 11:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441B9C433C8;
	Wed, 26 Jul 2023 11:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690372169;
	bh=lbF0liGI7QHy1bpQGze9hCny5OUhXwB6mv1T2xUmixM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=udFHHdx//JEXY8/J5haNDvJ5+2W4enEwTQaN8r9/mk6x9Nap8a5w66bQBFShMoQD6
	 LP08fnZz6w+7Qe3jgYRyXWYKaj8pyIVvxiIyXPKcVuaQohmTj4iGUGdJR2VLJHBmZI
	 XAEtD7g2zk9e7uVCVzThcE3AM1NcmjIsMIXFFYFM9611RURnIXm4MIXmfqmzkDwOWA
	 ufp/H8We2eVZD+c719ZG0koNjl8GrcBeEMF94rpeOx8FzrXX4hR2Qq8NXGvTa/X3Ym
	 DsPpBk2lTv5RSGntLKH55ipC+la+9JtxNuNB7uBxnk6xETnmqUZm9jz2z+Xiq1/H/U
	 J+sPKSqCdmXog==
Date: Wed, 26 Jul 2023 12:49:23 +0100
From: Mark Brown <broonie@kernel.org>
To: justinstitt@google.com
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] ASoC: intel: avs: refactor strncpy usage in topology
Message-ID: <8f9467c4-06c5-4e48-8f7e-2565e6b3b637@sirena.org.uk>
References: 
 <20230725-sound-soc-intel-avs-remove-deprecated-strncpy-v1-1-6357a1f8e9cf@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iADVvZ87iNIM/HX1"
Content-Disposition: inline
In-Reply-To: 
 <20230725-sound-soc-intel-avs-remove-deprecated-strncpy-v1-1-6357a1f8e9cf@google.com>
X-Cookie: Just to have it is enough.
Message-ID-Hash: J2RU7H7PVRRC7XO2AS4IFHSO3B7P6C4L
X-Message-ID-Hash: J2RU7H7PVRRC7XO2AS4IFHSO3B7P6C4L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J2RU7H7PVRRC7XO2AS4IFHSO3B7P6C4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--iADVvZ87iNIM/HX1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 10:08:38PM +0000, justinstitt@google.com wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings
> [1].
>=20
> A suitable replacement is `strscpy` [2].
>=20
> There are some hopes that someday the `strncpy` api could be ripped out
> due to the vast number of suitable replacements (strscpy, strscpy_pad,
> strtomem, strtomem_pad, strlcpy) [1].
>=20
> [1]: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nu=
l-terminated-strings
> [2]: manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html
>=20
> ---
>=20
>=20
> Link: https://github.com/KSPP/linux/issues/90
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---

You've put your signoff after a --- which means it gets deleted when
applied, don't do this.  The Signoff should be start of the main
changelog.

--iADVvZ87iNIM/HX1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTBCEIACgkQJNaLcl1U
h9AFWQf+NwrKTGgyPU7rnOtBaswSIlcHbij0ClP3vSjtJ/15xC6XRDzxtti6UZa5
HIOsxjuMRRTq6JKuh2/uRKc3IY2ZXqL1Wy7paSR+YB23DY+IBl3npR2aL3Bz7bP/
YMvM2vvrzdLmxmkY+uvvuGGfA46jlgnKT6ULtHECymLHXUolMeXOGWsy0Gd+YPAO
BL2P3v2NuPBe1b0KWfljfVaeGYXVGGvq9Xm4BcZPY3PCFngW00BvduN+USbQZFOy
+EQV18D7MB3sYYXmzmukLOdRNRSkKwE7p2q7Vy3ab0QX/Cwj1bV+hpKnKo2ielOW
IrmADzy2JEdr5W1FP6jXtCemKMKkEQ==
=g3ra
-----END PGP SIGNATURE-----

--iADVvZ87iNIM/HX1--

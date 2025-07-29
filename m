Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB7AB14C51
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Jul 2025 12:37:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B96160210;
	Tue, 29 Jul 2025 12:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B96160210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753785434;
	bh=PAmGFz6fuvJ0+txbapj32eZ4+ppJS2V2a0z1iKAPypQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M+9QvisDFRKMVBxxKVzct9krkudcVQGfizchlBOBrYtXQiutqAvvdN2iidjFIzex1
	 WEasUkmbW+WAUVvFu6RxHMPxsnMaRFFfc7vcFXkZ5kadz6JQl+Ur6TdONtiTMK1T3O
	 xgxvHOmYsKEqf3KIo7rJmg0OpOSIrZRl6doLju2k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C42DF805C3; Tue, 29 Jul 2025 12:36:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC39BF805C5;
	Tue, 29 Jul 2025 12:36:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5229AF80254; Tue, 29 Jul 2025 12:36:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94E15F80152
	for <alsa-devel@alsa-project.org>; Tue, 29 Jul 2025 12:36:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94E15F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZRXove43
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3968EA54F42;
	Tue, 29 Jul 2025 10:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D8AC4CEEF;
	Tue, 29 Jul 2025 10:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753785371;
	bh=PAmGFz6fuvJ0+txbapj32eZ4+ppJS2V2a0z1iKAPypQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZRXove43Flq4L54vJ/Z175oQc5lr+hBuqUtZvXhosonDQ1jR4OM7hDYnQP2/geo8p
	 wB5S+sMG+CSMIOsNZwRC15xJm/riWcvFAmRPNSni3JVIotvqOkENlD/g5l1A0Uz4Fk
	 jLGNtVa8L8GnSDgi+RbpbJYt0I3Py05f3rGbpwkrdbli/dJ31DwEcLQq2YupYb2tJg
	 fUnPxaSQZio7bEm9ykw02FQxzM/FwH8kQOr9SF5hlQOw5d/m1BBYO+I2IvQMk277gQ
	 HNdFd93jdnxkYsoIWbOriRUR3QjrfD4p8kNcnj0D11XpxA3urIWCyup0yIb1HfSk0W
	 ejk7Irz42kf9A==
Date: Tue, 29 Jul 2025 11:36:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	alsa-devel@alsa-project.org, Vijendar.Mukunda@amd.com,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	syed.sabakareem@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: amd: acp: Adjust pdm dmic gain using module
 parameter
Message-ID: <d7326f95-13fb-4f3b-86e5-69797b9235f8@sirena.org.uk>
References: <20250728094243.3824450-1-venkataprasad.potturu@amd.com>
 <2025072814-stardom-anointer-0a62@gregkh>
 <7d8c0bbf-2911-4e18-8287-e7c72fab396c@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="THCj9nB3gw2irpsq"
Content-Disposition: inline
In-Reply-To: <7d8c0bbf-2911-4e18-8287-e7c72fab396c@amd.com>
X-Cookie: Short people get rained on last.
Message-ID-Hash: BSAAIZBMHS473LEAWLXIOE37UBX2SU6K
X-Message-ID-Hash: BSAAIZBMHS473LEAWLXIOE37UBX2SU6K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BSAAIZBMHS473LEAWLXIOE37UBX2SU6K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--THCj9nB3gw2irpsq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 29, 2025 at 11:34:59AM +0530, Mario Limonciello wrote:
> On 7/28/2025 4:22 PM, Greg KH wrote:
> > On Mon, Jul 28, 2025 at 03:12:27PM +0530, Venkata Prasad Potturu wrote:

> > >   * If users do end up using it to debug and report different values
> > >     we should introduce a config knob that can have policy set by ucm.

> > Please do this properly, with a per-device setting.

> As the main purpose for this parameter is for being able to tune whether the
> property is correct, how about adding a debugfs file instead?

> AFAICT it should just be a single register write, so debugfs to read current
> value and write the debugging value seems pretty straightforward.

Or you could just go direct to making it user tunable like a normal gain
control?

--THCj9nB3gw2irpsq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiIpBQACgkQJNaLcl1U
h9Af2Af/ZHOIDdRyN8oESG5QLmQLs7d0Oelgs8FwkLMeecheCioZ4xlxslIC7tjW
AMnSumzY3xrWiRha8JFBiO7jyxN32o27AgNbXa0nVxKmpczL5Pp1UVU62QfpuBJX
1Lu8BIKYeiT8vTPGfZfhZ/ypGtehBJPiPepn0+nlsTPQkGwtdnbyShpNihbrnhUs
YpVBANMyEeroYqcDE0P74QSiA8NqWmY7TlIeFnPXbd6PWsLWkV4vmfGK9oyXWKtX
cv2Q2p512BtnrGv5snTVctWJrJIk2ucLVFDPUrF9+NW6u6vChdEOs10Ix6OXl623
OGpb2W9g/8YA5ReOLrsz+fSDphNJLQ==
=pQ9m
-----END PGP SIGNATURE-----

--THCj9nB3gw2irpsq--

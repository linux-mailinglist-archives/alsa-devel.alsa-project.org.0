Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D975832513
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 08:35:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DD577F4;
	Fri, 19 Jan 2024 08:35:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DD577F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705649721;
	bh=QYE7yiCJxwlmebwjTQpebpKMDD+EhMMsKm31/uR2Rac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=izcHf2sRAGmIWcOoTQLlV8XasAG9Kvc5YO3TeBa80L1h0zMuLYIhb/qiSzUBW3ebo
	 uCrUNXVWKS3pGcex7lQziN5w/7vXguEzXTX6nA6c7WBqBtXGqV/UOzSzo5cuRC2obE
	 ggWiHoSsCLSekgJ76PRSk7rt7C4fRtSPemSBX5TI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AF6CF8003A; Fri, 19 Jan 2024 08:34:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9AD1F804E7;
	Fri, 19 Jan 2024 08:34:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74EBEF801F5; Fri, 19 Jan 2024 08:34:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2410CF8003A
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 08:34:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2410CF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cmprS5pw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 78063B818F7;
	Fri, 19 Jan 2024 07:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0121C433F1;
	Fri, 19 Jan 2024 07:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705649665;
	bh=QYE7yiCJxwlmebwjTQpebpKMDD+EhMMsKm31/uR2Rac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cmprS5pw7FkNoy135BDsZfB1tBF5CbghTkRQb4LtU5jIy9Zc+zTH11SgDvqajQVVd
	 9Xb2kRHVgCKx2s+ojpnDl7B4sP1w4hxZnCmiJ4XEb+Wd+muQ5MDgxZYIvEIkXG5Coq
	 4nHeMI2H0m6OKGIVK7RkMjN9OJ9Kgay0AGGtEXyFw6pPl0vaZeubVnTPsEO1NeKtA6
	 ESxaZGl5UQ5sq6ci9bgDZ5SB5smWBj7iDZTIjv/ExT4wfK55UJvdqt18K3+b1GpYVI
	 JXgcv4GBD/VlkPWEyAa5rOR+zs4d3/7A/dc38G4pVuc5C7wlPesYY7nnxCdNr6bhxB
	 o81QuyyVxDrJQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rQjOc-0004S4-03;
	Fri, 19 Jan 2024 08:34:34 +0100
Date: Fri, 19 Jan 2024 08:34:34 +0100
From: Johan Hovold <johan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/5] ASoC: codecs: wsa883x: fix PA volume control
Message-ID: <ZaomCpQ2ged-zpQ6@hovoldconsulting.com>
References: <20240118165811.13672-1-johan+linaro@kernel.org>
 <20240118165811.13672-2-johan+linaro@kernel.org>
 <a9e1f3b8-9597-454e-b68d-4014e923ee61@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KGFq/OtHqyzEakW+"
Content-Disposition: inline
In-Reply-To: <a9e1f3b8-9597-454e-b68d-4014e923ee61@sirena.org.uk>
Message-ID-Hash: FO7EIBOI45FUGO32PMV34OJKTHZDK2C2
X-Message-ID-Hash: FO7EIBOI45FUGO32PMV34OJKTHZDK2C2
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FO7EIBOI45FUGO32PMV34OJKTHZDK2C2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--KGFq/OtHqyzEakW+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 05:24:16PM +0000, Mark Brown wrote:
> On Thu, Jan 18, 2024 at 05:58:07PM +0100, Johan Hovold wrote:
> > The PA gain can be set in steps of 1.5 dB from -3 dB to 18 dB, that is,
> > in fifteen levels.
> >=20
> > Fix the range of the PA volume control to avoid having the first
> > sixteen levels all map to -3 dB.
> >=20
> > Note that level 0 (-3 dB) does not mute the PA so the mute flag should
> > also not be set.
> >=20
> > Fixes: cdb09e623143 ("ASoC: codecs: wsa883x: add control, dapm widgets =
and map")
> > Cc: stable@vger.kernel.org      # 6.0
>=20
> This will mean that any configuration saved with alsactl store will
> change effect, it might be better to just fix the TLV description and
> live with the unfortunate UX...

Indeed, but the machine limit set by this series will make that less of
any issue. At least for mainline, all users of this codec use the same
machine driver so will also be limited to -3 dB.

Johan

--KGFq/OtHqyzEakW+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCZaomBgAKCRALxc3C7H1l
CGmdAPwK+i5ESpbb1IA/xZpXm46rdEOQaskthgednCfQz4yO4QD9HTPCQrWiYtnU
7vkKlcGYrNxBK2azazVxdjYLIYW5ZA8=
=b1Be
-----END PGP SIGNATURE-----

--KGFq/OtHqyzEakW+--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FBF913412
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jun 2024 15:04:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC0C99F6;
	Sat, 22 Jun 2024 15:04:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC0C99F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719061467;
	bh=UrxnrK5wRWLLAqbFuJQdybESu+fL2JUBL/OQiQsMn1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ec66Gj//oX/QARIpLy5BopfTLPiw2Ri2vyBzPCZ6gbq1k8a+IjJyBDDQTKalU58nG
	 E7xqIRUaWVoVyoOR4FiCX/32DZP0lz7WrkbPg4EVwOqBKEj6jRtNz57qa1ySBtBves
	 cya8/CcA7im7TYg3HywWca4ZIQDJBhDWF4cOAaMo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00D13F805B0; Sat, 22 Jun 2024 15:03:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98B74F80589;
	Sat, 22 Jun 2024 15:03:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1C76F8023A; Sat, 22 Jun 2024 15:03:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1C98F800ED
	for <alsa-devel@alsa-project.org>; Sat, 22 Jun 2024 15:03:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1C98F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rICmA/7h
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3F487CE09BA;
	Sat, 22 Jun 2024 13:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16BBC3277B;
	Sat, 22 Jun 2024 13:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719061415;
	bh=UrxnrK5wRWLLAqbFuJQdybESu+fL2JUBL/OQiQsMn1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rICmA/7hK70cX0IM8LZFNqXzboC014+YqVAuaOumofoi5yYT73G7QM/sPccdVDXRC
	 Ds/JWgeRnBygStUgniH4iZAEy82fp3Hlq4a0dNFCrhTSd56vOua4AXaTQad9KMfz0I
	 uP9KFkg8gS8/8L4KgN+1KIXLam4+bHx9vIFTemOaQC3KIRjJo9wcqKLGrzz7Emn6G5
	 SqI4KtrZmSMe1aVqyjbgitUy/CTLYQJO9Q2LAGszmeZhCkB9ppCrqXK8JEjEs1QeOh
	 D90xD3WapBblbNM03i3Lk7mQ/ue7KOZNZw7X9T+O8X5rtL1P6oJSo92LFKpzSBmv6t
	 wMZRI4tt+7+DA==
Date: Sat, 22 Jun 2024 14:03:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/2] ASoC: Add support for ti,pcm5242 to the pcm512x
 driver
Message-ID: <57f0036c-4412-48fa-a6f9-3fa721717be9@sirena.org.uk>
References: <20240622124603.2606770-1-christianshewitt@gmail.com>
 <20240622124603.2606770-3-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ns7W6Wuqxln5UvNz"
Content-Disposition: inline
In-Reply-To: <20240622124603.2606770-3-christianshewitt@gmail.com>
X-Cookie: No stopping or standing.
Message-ID-Hash: E23MDSW2EXDJ3YHW5NKRE7LHSLSEV6SG
X-Message-ID-Hash: E23MDSW2EXDJ3YHW5NKRE7LHSLSEV6SG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E23MDSW2EXDJ3YHW5NKRE7LHSLSEV6SG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Ns7W6Wuqxln5UvNz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 22, 2024 at 12:46:03PM +0000, Christian Hewitt wrote:
> Add a compatible string to enable support for the ti,pcm5242 DAC chip
> in the pcm512x driver.
>=20
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  sound/soc/codecs/pcm512x-i2c.c | 2 ++
>  1 file changed, 2 insertions(+)

The device appears to have SPI support too like the other devices in the
family, why not add the ID for SPI as well:

   https://www.ti.com/product/PCM5242

--Ns7W6Wuqxln5UvNz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ2y6EACgkQJNaLcl1U
h9BmaAf/Wf4dlhJjpl3fS3/Wwz1IA7U7HfafHCnGFTG5WaABcOG2qOrxjfPC42iR
KUeRAaU4lqzPSWjayl/eVXWAB6v+x7qKiZuAcQ4vP7g5odGfmIKt+syT5RN4P+xP
R/EC9NkzmlgH0nb23+NJXnuI+sekheoJvxEt2dkbOsDQivW4IMWwzmiOfTzwLCux
3zOVaKR+MzriPl0P06oDNsiDycmByd/S2q/bbAbcdrdacAoURmI7mY+F2Q5lVGOL
07n+SC66baBDVYndWfWS28+50cenwUOAwm1+am3xFTIiNa5U7Zr3ShBj+S67sDzV
ijKbKj9dvuc7CO9qB3dyJcvkOi9s0Q==
=lfJ9
-----END PGP SIGNATURE-----

--Ns7W6Wuqxln5UvNz--

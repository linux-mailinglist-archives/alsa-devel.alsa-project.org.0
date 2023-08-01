Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B960876BD63
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 21:10:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D8D114E;
	Tue,  1 Aug 2023 21:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D8D114E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690917028;
	bh=dAh5inHpSc5Eih6HTIPWodjYBRbBt5z/XQeIIkmS9O4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t0VfKvfyeDW38ox7XbvgJxgBGUDWftPB6r5qBz5k4v00GD5r4/uoRu7zNWicjzmuv
	 /Hk9s/4jzPHSC8gzauUgzCInVcOp60lmXyk88VpDjWiW7Nra/0Krl0n00UMlCiZMOy
	 Y/wxANd8UEJHcxSzDPoxFyFWaFobxag5e/GCzE+A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C04BF8053B; Tue,  1 Aug 2023 21:09:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF441F8016D;
	Tue,  1 Aug 2023 21:09:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92468F801D5; Tue,  1 Aug 2023 21:09:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63F65F80087
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 21:09:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63F65F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=O/jBSaBK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A68C616A0;
	Tue,  1 Aug 2023 19:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCAE9C433C8;
	Tue,  1 Aug 2023 19:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690916955;
	bh=dAh5inHpSc5Eih6HTIPWodjYBRbBt5z/XQeIIkmS9O4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O/jBSaBK+Oku8L8RDZd8qPXZk+YOAU6ATEk0xGAk73Vd/WmcByrwA02EPClYBujKW
	 qmnjHFRLSpK4Qr8eyBfmawP+WRvSJViZvPj0fgTPNb3yUa3Kcya/tuRGJi/ICpbQ1x
	 mfIQwfmXTkGognKfh+k7KhZP1KBWbuMP9yqW2RCTQkjAf1TVKtmLbMpmA8k6IAzE3R
	 MWfhpSwRjT/SACGW3Fllr2AsVdohtPIJgYih9h3f9Pz/2tdr48Z2HUfzeLiJw3po66
	 4L7GFZmwn1yel8Jvsw4uR+g/JD3VcvPZqIXcEOKz3wdUITcT5/q1SKzZ1RsKgnVFqo
	 c5R+uA/uAVfrA==
Date: Tue, 1 Aug 2023 20:09:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: alsa-devel@alsa-project.org, robh+dt@kernel.org,
	kuninori.morimoto.gx@renesas.com, spujar@nvidia.com, tiwai@suse.com,
	perex@perex.cz, linux-kernel@vger.kernel.org, linux-imx@nxp.com,
	devicetree@vger.kernel.org, daniel.baluta@gmail.com
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: simple-card: Document new DAI
 flags playback-only/capture-only
Message-ID: <8c3f90ef-5f12-42aa-bae9-dec997e2b82a@sirena.org.uk>
References: <20230801082433.548206-1-daniel.baluta@oss.nxp.com>
 <20230801082433.548206-3-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lzabSlSNKrz1vv9q"
Content-Disposition: inline
In-Reply-To: <20230801082433.548206-3-daniel.baluta@oss.nxp.com>
X-Cookie: I thought YOU silenced the guard!
Message-ID-Hash: 5A36ZKCM4IF6YSBOR24ASFWMFPW6MYLF
X-Message-ID-Hash: 5A36ZKCM4IF6YSBOR24ASFWMFPW6MYLF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5A36ZKCM4IF6YSBOR24ASFWMFPW6MYLF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--lzabSlSNKrz1vv9q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 01, 2023 at 11:24:33AM +0300, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
>=20
> Document new playback-only and capture-only flags which can be used when
> dai link can only support just one direction: playback or capture but
> not both.
>=20
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/simple-card.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)

Please add new features to audio-graph-card2 - we're trying to deprecate
simple-card, audio-graph-card2 is a superset with more flexibility.
It's not the end of the world to also support things in simple-card but
it definitely shouldn't have any capabilities that the newer card lacks.

--lzabSlSNKrz1vv9q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTJWFQACgkQJNaLcl1U
h9ApjQf/cWvoHZfKG9fC0sAkmpQfTqqul0KPx4mcBD/lJdJGzc0BY91BinbZ2/eD
MaHRMlOnz9feDkcIty7oeB9UEp55hl2MaTgQAdUQop2tRz4g8x9u7A1EgV6H6L1P
NHsMKzgqtRiIxZGPtwMJYVxOP+nyCov74BjSSY0+JuJQN0vG+7UwDi/4FuAOwZmv
ZfLzLPN2ZXKVQ8drGPo4VBlkU/9UcefpIs0/f6KeRea1iP60tx1BYOcayd2KZoxA
iV5Az3WwlAozJQoTiuzdW+WoUk4xz6dSu4efzq80uI8zth4zBrnSJFtCITtw2DU2
Eb6Jj8cc8JaZ3aOv/0164/xXWHfk+w==
=KxEv
-----END PGP SIGNATURE-----

--lzabSlSNKrz1vv9q--

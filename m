Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9587A4A98
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 15:32:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BDEE201;
	Mon, 18 Sep 2023 15:31:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BDEE201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695043959;
	bh=K06M3VCr0WHKqkg1Cw3llw5aRxi2imdgpuq+0caHVrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F181q//nUlQPRRRxp+KxalNQ+uz1KfUbdheZ0HroDYdRypBCkhcb7Isiew5EqS22p
	 dUtofnuQBc9INzgsBY4Q5P1CV7Xw45a/n73F8s7k66FesxJcEWoYaIGFzbl2HhZkkB
	 Sqs5lI6feqHfgB9aEvxFJ7HdZeJm7eFiEm6V8wP0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E93EF80125; Mon, 18 Sep 2023 15:31:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BCCE0F801D5;
	Mon, 18 Sep 2023 15:31:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D97D8F801F5; Mon, 18 Sep 2023 15:31:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B7FCF80124
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 15:31:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B7FCF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FIkb50Cw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6F382B80D13;
	Mon, 18 Sep 2023 13:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DCFFC433AD;
	Mon, 18 Sep 2023 13:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695043894;
	bh=K06M3VCr0WHKqkg1Cw3llw5aRxi2imdgpuq+0caHVrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FIkb50CwTmrvliTx4dhLfE3sM2zHntXcc0rjgJrTIRi8nlkvU6XdOzQqvcqT+6Vkt
	 OgR48Iq/Txyw1RuyjMqQVmzsd1Ie1EcSSdnp9cZBHzl0CM7Dlw5i9ULq9wPbkRCpxu
	 /vt1twaho0ZShLhc8ohWqIPFncebh3mxB5aJW8cbAlDLnGMMxu7EIf6ZHNrxfZuxW2
	 AKwrw2lynoZSQC68AqoU7ugpRuE6T20273oWoqJ9IgG3F4r6Anwl6mmEHxclDKBVPE
	 DbhV572jaEE3ZxlhRXnKJMFVR74bB/bQ5FbZ8U4UkSbuDNgkgaBC5XVzytS8F6PRz2
	 NXP+esALPesUQ==
Date: Mon, 18 Sep 2023 14:31:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandra Diupina <adiupina@astralinux.ru>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Eason Yen <eason.yen@mediatek.com>, alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] asoc: mediatek: common: Remove check of return value of
 mtk_memif_set_addr() and mtk_memif_set_format()
Message-ID: <0b94717e-1198-4b6d-bd64-270dbeb92f79@sirena.org.uk>
References: <20230825153650.20923-1-adiupina@astralinux.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DRbDaKLEClkXmGi+"
Content-Disposition: inline
In-Reply-To: <20230825153650.20923-1-adiupina@astralinux.ru>
X-Cookie: Never kick a man, unless he's down.
Message-ID-Hash: TEOR527KNRDQTHGROA7UFN7AZNRC6HDC
X-Message-ID-Hash: TEOR527KNRDQTHGROA7UFN7AZNRC6HDC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TEOR527KNRDQTHGROA7UFN7AZNRC6HDC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--DRbDaKLEClkXmGi+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 06:36:50PM +0300, Alexandra Diupina wrote:
> The mtk_memif_set_addr() and mtk_memif_set_format() functions always retu=
rns 0, so it is
> necessary to remove the check of its return value (which was
> probably specified by analogy with the check of return values
> for other functions) to make the code more readable

If the return values can be safely ignored the functions should be
updated to return void, if the functions are returning a value it is
sensible defensive programming to check it.

> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>=20
> Fixes: df799b9502ed ("ASoC: mediatek: common: refine hw_params and hw_pre=
pare")

This is in no way a bug fix, please don't include noise like this - it
causes people to waste time doing things like considering it for backport.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--DRbDaKLEClkXmGi+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUIUS8ACgkQJNaLcl1U
h9B5fAf/Wt1o8/BD/FOp0dhg9MPqSJ4CExDadYY8vIXEpw9Txy/tYSjqR1VbchGZ
OBfqVnvtKgqQy7XgNCLffYhzsq1dCkQO1TDWU38imdMCCYswL7+MfBdxA6ZqqQlK
GGChui6/43ql1XZ1rQ76ZQiuNo4SEKVf2DmcPNee1CiwIoTm7JPVQcWL7SDXAHnC
v+GQrwEVj4BHZzfWuIa8vuoHf/GdYpGWuUkVYPVxS4/Wsd3NoKMQ/4O3ajJOQD4g
F/2uzEi9/y6EX0/8n8xIJ0+vKtPtvuxR5Y7aKnTU509sCU2TQgOEGzAfqc13odCj
3xhnA7V0r+I66VKwPZXUCimV2+Jhyw==
=uuBR
-----END PGP SIGNATURE-----

--DRbDaKLEClkXmGi+--

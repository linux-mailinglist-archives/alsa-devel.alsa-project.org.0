Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 997B8510579
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 19:33:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20C1E18F1;
	Tue, 26 Apr 2022 19:33:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20C1E18F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650994432;
	bh=qkD86Xitsnlb5Yfbt9GM23fzahcRn2FpxVppqyesr7c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g8fe4Q2ahL1hWkueMwu33EcdLoe6ESJsxWLJW9MxKXqEDoIOunorGy4n5bVOqjVfA
	 X60x0hmoAL/mxhU5lusbunKOwdhg+aJnyxQ+Y7JXwcjYStc5+BmTGIWqEndhBXuRUO
	 8Pk5DDnPmqdKRAuhUPLN/mc4A0p59tN4Uia7HAuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 767D8F800FA;
	Tue, 26 Apr 2022 19:32:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3F2FF80152; Tue, 26 Apr 2022 19:32:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57BA5F800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 19:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57BA5F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V/hs/xNt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D5A61B81FE5;
 Tue, 26 Apr 2022 17:32:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D6CC385A0;
 Tue, 26 Apr 2022 17:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650994366;
 bh=qkD86Xitsnlb5Yfbt9GM23fzahcRn2FpxVppqyesr7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V/hs/xNtPRFVBfiDGb5EOEFmPohjKr1J6aFFelbZV781VBIl62xYSla9FgN14Zcj3
 ZBIYdo+DT88ERsxbMsa3s1AFLgDmyZuG0tgMs7UFK/DFy+oc4+sZ7bF1LY2s7scZcp
 2wITDDhJq5AlSnmSr9J0ZAY5da8SFiEqlUxdnwNGlsfLcz+d5ndlygpMLBrWG+18iY
 WQ4jlcprHycvq2FNNXLDpTKgrjJxenZeXW6D/LViXa4qhHzmbW6hnptIk8QzfPq8aK
 KuIsfEgVyR6F+EgClNFMQlm5M5XOifwUpqLGbgYw8dY0bIiRegQ4T+2V/reby6WGqQ
 xLn2SamighHWA==
Date: Tue, 26 Apr 2022 18:32:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Adam Ford <aford173@gmail.com>
Subject: Re: WM8962 crashing on suspend
Message-ID: <YmgsuUmHwffwP6X9@sirena.org.uk>
References: <CAHCN7xJuAuGmSQsmBfg-C6jOdJmf1Li=YWp7Jdi29nU3kk1GcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LDgDtAzLAJ5BxvSB"
Content-Disposition: inline
In-Reply-To: <CAHCN7xJuAuGmSQsmBfg-C6jOdJmf1Li=YWp7Jdi29nU3kk1GcA@mail.gmail.com>
X-Cookie: I'm a Lisp variable -- bind me!
Cc: patches@opensource.cirrus.com,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--LDgDtAzLAJ5BxvSB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 11:36:26AM -0500, Adam Ford wrote:
> I have an imx8m Mini with a wm8962 codec.  If I run a speaker test and
> suspend the board while the speaker test is running, I get the
> following upon wake:
>=20
> wm8962 3-001a: ASoC: error at soc_component_read_no_lock on wm8962.3-001a=
: -16
>=20
> This message repeats itself over and over again.  If I attempt to use
> any audio, it fails until I reboot the board.
>=20
> If I run the audio test, then exit and suspend, the audio works upon
> resume, so it appears to be related to suspending while running.
>=20
> I am hoping someone might have a suggestion as to what I might be able
> to do or try to allow this to successfully suspend and resume if the
> device is playing sound.

I do note that wm8962 doesn't have any system suspend code which is
possibly an issue if power is lost during suspend, it only has runtime
PM operations.  If the device was runtime idle before suspend those will
figure everything out, if the device was active they won't kick in.

--LDgDtAzLAJ5BxvSB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJoLLkACgkQJNaLcl1U
h9Co3Qf5AVzJYM6Psm59y4APUE6ixsi4TpiV+RZIxbVMf6dXLqfg1SPUY9TwHYxf
J8xUtuTpSz4KfkvMjATVau6+DqpDAgxPxJDiw8RBa28y6B/8irrAVEioFC4WHybR
6PqyRnVUd9gi7EFDYWyiL4DiE4l2ZwwcyLMlzw4yCAc/4MuZVxi5Geqhu4U7AXbL
AM5APAPIZ95xLBWmyaME+KgF8QUIVHxqYHmIs08A48waTHQLjIdGR6j0SqY887N9
O0Gg9Ryk03za80/kqx+zgkAJxSnBTmJ2FcyV5oafjg+iZOHpoF8K5TxDlBvhwqeH
SfyZBzTizUgutjog10Hu2AiHRfyZ5g==
=7hQM
-----END PGP SIGNATURE-----

--LDgDtAzLAJ5BxvSB--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6335553E5AF
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 18:19:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05AEB1A75;
	Mon,  6 Jun 2022 18:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05AEB1A75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654532382;
	bh=3oCBnEMhW8iOscqIU/v0ccC1Gno4VX5ZfFY5AQN/GQs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uEaW3T5YSvpCPP3OZR13xqsaclIOFIECx2oQ2NI0/Gm0GCUMyKlvcAfNbuOmNfDbb
	 S40X+lICk65gX0YsUTb2Qj1mNQab+GKMbGvsoADhCPJWhFHj2ZvVTfIJITc+cgxWJ0
	 z7xtAKI3FMxxHKwLD1IhyHlT7mk9AJEomiRzHSBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88780F801D8;
	Mon,  6 Jun 2022 18:18:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA001F8012A; Mon,  6 Jun 2022 18:18:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45EAEF8012A
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 18:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45EAEF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DOaXzseA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B71F8B81AA1;
 Mon,  6 Jun 2022 16:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD1EC385A9;
 Mon,  6 Jun 2022 16:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654532318;
 bh=3oCBnEMhW8iOscqIU/v0ccC1Gno4VX5ZfFY5AQN/GQs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DOaXzseA3IdedKlDd/0SMXSAH2XsHX4047LtvaxgprVkZ5ylLldFVhtYPLNg8vz9m
 F5tlfOrpFSXLtIlvFugShdJZDaeWfjPDjYGLkuuI6HnCYnUd9p3vqEb01M1cumxi6r
 Vp94/VbeioAXEbIrImwBWcY2VPF2TTN+tEeLcfNx2nqcN7ooPVgJVUuBcX+CvFfpnC
 zqOgDZKC/jgC4z8htUqsmPHnaNg71zIxbjHnrnIuCNgHUcQoK7xESnbV5rUTG+iDzU
 GZEjKHVoPV2DBIv292LdXxIyoq3ixFVXvrFEhNPh1tBAe13KkotFQCTOGMChd3/mqg
 WRjq4l6jJp8qg==
Date: Mon, 6 Jun 2022 17:18:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH 2/3] ASoC: wm8940: Rewrite code to set proper clocks
Message-ID: <Yp4o2bQammYjv7Kt@sirena.org.uk>
References: <20220606154441.20848-1-lukma@denx.de>
 <20220606154441.20848-2-lukma@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3nyy0JRAQdDxWcrH"
Content-Disposition: inline
In-Reply-To: <20220606154441.20848-2-lukma@denx.de>
X-Cookie: Bedfellows make strange politicians.
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org
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


--3nyy0JRAQdDxWcrH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 06, 2022 at 05:44:40PM +0200, Lukasz Majewski wrote:
> Without this change, the wm8940 driver is not working when
> set_sysclk callback (wm8940_set_dai_sysclk) is called with
> freqency not listed in the switch clause.

> This change adjusts this driver to allow non-standard frequency
> set (just after the boot) being adjusted afterwards by the sound
> system core code.

I don't entirely follow the above - in what way might the core adjust
the clocking, and why would we want to allow the use of invalid clocks?
Surely that just makes error checking worse.

> Code in this commit is based on previous change done for wm8974
> (SHA1: 51b2bb3f2568e6d9d81a001d38b8d70c2ba4af99).

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--3nyy0JRAQdDxWcrH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKeKNkACgkQJNaLcl1U
h9CBzwf7Bsk4iYWK7ta6JUCjk6j2ZHCbZQHOMiN6efdBy834xrJCPOHTbaCz3KvO
Kye4CEAZP8dHX8/L8dHyOFnPlzcDTL2lbSoMJNOA9rP4IUjCGdCBIyPLQ/kzEi4t
Zcvy/aAB3tiR6rtlHP/3f/B+gqW+2b5vqJ2bjYMLL0QaK4xo8T4OZbUTtxPn+yOc
Wrm2qJGy1X2PFU+Rtoh/rE5wPyCzvhjW5GzJJ8i111MnFvLsVlfbB0ckZ1+zrYFY
JiP+ELOKT7USyUFugr3W12oV0RSGMQYa+uDqXSeMwZpos7U1WqbxSuEo3uRldgsB
gdAfowSaXfq1ayZwfjNAl4WtQWAakQ==
=RBse
-----END PGP SIGNATURE-----

--3nyy0JRAQdDxWcrH--

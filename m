Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A63F6646075
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Dec 2022 18:40:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C3AB185D;
	Wed,  7 Dec 2022 18:39:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C3AB185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670434840;
	bh=wIPK8Lo1xAG3OpzHn/xY1jvAEAat6BBZrKsVhqE9mCc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rb/r2du+uvDv3V6JXiFQXZjTV7BKx6AjAMJguqtD7OlBg9gCEbDymZbxUzgRs9Ia8
	 IEmxQR1T4yxFhjea/QAmXeuhXDhxhIFAxSGX2otNFDbKA6ToChtK9shjS7pROHylEP
	 TgGWSWLfpE/rjKIvk2vZJBJsXKIdohe00E6x2nfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E55DF80580;
	Wed,  7 Dec 2022 18:38:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4686CF8059F; Wed,  7 Dec 2022 18:38:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E677AF80580
 for <alsa-devel@alsa-project.org>; Wed,  7 Dec 2022 18:37:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E677AF80580
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BP0jVm+8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5066161B84;
 Wed,  7 Dec 2022 17:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C5ECC433C1;
 Wed,  7 Dec 2022 17:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670434675;
 bh=wIPK8Lo1xAG3OpzHn/xY1jvAEAat6BBZrKsVhqE9mCc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BP0jVm+8KSJqdzxK9MF1D18Zcm81PfNwU3RO/rNvLg8mTPE+53ekPBCUBMqrzDhJx
 Try7AXltMrm1ClQN8tC7smgdodyuQon/V7sQ2McNLGcl2ykuB8vzd6emkhl9RrWbZB
 0OBhI2zam3Ur0CeyO5UZFSaaO4842ZZtGfLp9zdAzB6kHLf4iV+EvFGTH1BDQEBD2d
 /Uk0KzX1f2fXBcbYP7pYC76pmJs2LxfJEXyGSSB5YTRfoFHgcd+Q/60JVFM3WLcoTN
 ClyAEhSyKL1BVZ3DCgeXtxBQDVUnuRCmSjidgqxrmtky71KjrTEGN8C/1t1UlnPC1F
 woZolBxapVGQw==
Date: Wed, 7 Dec 2022 17:37:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Subject: Re: Simple card and PLL/FLL
Message-ID: <Y5DPbhXQazD8OWX1@sirena.org.uk>
References: <4172f4b2-9198-dfc8-a2b0-d75a95265e14@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Of0uaj+ZrZYZV20x"
Content-Disposition: inline
In-Reply-To: <4172f4b2-9198-dfc8-a2b0-d75a95265e14@gmail.com>
X-Cookie: What!?  Me worry?
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 emanuele.ghidoli@toradex.com, Liam Girdwood <lgirdwood@gmail.com>
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


--Of0uaj+ZrZYZV20x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2022 at 01:41:24PM +0100, Emanuele Ghidoli wrote:

> I guess what is the "right/better" implementation? Have we to add the
> set_pll call in simple-card? Or have we to add it to e.g. fsl_sai driver?
> Or, in some way, the wm8904 codec driver is approaching in the right way?
>=20
> Is there any documentation that explain all of that (I have already looked
> at Documentation/sound)? Any driver that is considered well written and
> complete I should use as a reference?

It's kind of a taste thing.  There's some devices where the clocking is
sufficently complicated and flexible that definitely needs a set_pll()
operation and specific machine driver support, but for simpler devices
like the WM8904 where there's an obvious thing to do it's much easier to
just hide that from everything outside the driver and only deal with the
input clock.  I don't know what the clocking for the SAI looks like so
it's hard to comment specifically on what makes sense there.

--Of0uaj+ZrZYZV20x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOQz24ACgkQJNaLcl1U
h9BnvQgAgYd+5FrZNXMwqR5BkB8c0Uwft8CQXWAv4BA+n+qwMfhGQSWO7ug0B9N6
wDjaei/etwWDxe/FgAUAZxz1EIXtWnzSNqofNv9TCF0KXmrbKQrBdHDf6uwFh4U2
nxu3z73XySDJ9sA1eL/JewLlIqAGoxBysXysZUux7jM/+9SP+0odlImYflyH/Ga3
qw5FIt5CkP84gKiKu8mtSi4eSVS9JJfSQLsZ+l01b7847uXVrmpzpAFJ3GIWIwbS
j709c09VsHExrx5gr8oTueTi2mm+BTN4GeIHE7rDuNy1gDGPS+2/KmvM5uNFuDar
rNIzA/g4T+EF1jnZd/aN83kUTlh4Jw==
=dsUn
-----END PGP SIGNATURE-----

--Of0uaj+ZrZYZV20x--

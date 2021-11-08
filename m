Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B31447FF3
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 13:57:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C446165D;
	Mon,  8 Nov 2021 13:56:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C446165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636376264;
	bh=sHUzkFv4Hsm9d2ZykQINs6urj6ai6c6PP/T8+zHneuA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kLH0mHgK7errDKHQ3l3nSMGhTStmls1sI047o6mHUtUeyf9kL0FEunwjet4S9oCdf
	 QwyAERZkHHV4Z57q63JVmrvU0XgZEJIg5sA5eieZI9fpvICvshVCSf8yXNQYQMb9wV
	 odq7oJS8shoZPn6tSjzqsHsecvvhkTBi3biZbH8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB821F8007E;
	Mon,  8 Nov 2021 13:56:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 618D1F8049E; Mon,  8 Nov 2021 13:56:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3DB9F8007E
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 13:56:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3DB9F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZE4Fi2WX"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E7D5610C8;
 Mon,  8 Nov 2021 12:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636376174;
 bh=sHUzkFv4Hsm9d2ZykQINs6urj6ai6c6PP/T8+zHneuA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZE4Fi2WXKqU41O0yP4oFdly4C0HJytU41bf7HTVqAxwGMJdAhCd0NQlVBBGXDVUez
 b4WOlbts3LuevL8yYBOE0GCSHZeFFb+TM9wrAQBlvZ9JzV9K7sVnweTGCVFoSQA1ST
 bc1ff0l+PK0ZhABSGkz6tUR3XRuSIW4AYCNLbArAfZ50Ebz24ztO+8RyeGPm67qSoi
 TM8v6NkM7rjTWp15EelNPETz0SoI7yp5lKv3gc1akcfj6LrJnQ64ptR03kIsdDI/mA
 daytcpJq6aiYVIsg0CGm18/FPNL9wL1vT4hIvOpscR12yWd1x8t9pTxBUVRhUVKZfS
 X4ATUBGekgc3A==
Date: Mon, 8 Nov 2021 12:56:09 +0000
From: Mark Brown <broonie@kernel.org>
To: "Chiang, Mac" <mac.chiang@intel.com>
Subject: Re: [PATCH v2] ASoC: Intel: add sof-nau8825 machine driver
Message-ID: <YYkeaUfIOQZC03Cn@sirena.org.uk>
References: <20211101110050.28384-1-mac.chiang@intel.com>
 <31ae486f-7d0e-30a8-ea55-7cdf70a76020@linux.intel.com>
 <PH0PR11MB5832F3AFC273BB4FBE0812F484919@PH0PR11MB5832.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="unVRdwLPh28OZGZP"
Content-Disposition: inline
In-Reply-To: <PH0PR11MB5832F3AFC273BB4FBE0812F484919@PH0PR11MB5832.namprd11.prod.outlook.com>
X-Cookie: Kleeneness is next to Godelness.
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "CTLIN0@nuvoton.com" <CTLIN0@nuvoton.com>, "Liao, Bard" <bard.liao@intel.com>,
 "M R, Sathya Prakash" <sathya.prakash.m.r@intel.com>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
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


--unVRdwLPh28OZGZP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 08, 2021 at 10:28:22AM +0000, Chiang, Mac wrote:

> Add Mark for comments, CC: Mark Brown <broonie@kernel.org>
> Or I need to RESEND V2 with Acked-by:... in comment messages for your app=
lying?

As documented in submitting-patches.rst please send patches to the=20
maintainers for the code you would like to change.  The normal kernel
workflow is that people apply patches from their inboxes, if they aren't
copied they are likely to not see the patch at all and it is much more
difficult to apply patches.

--unVRdwLPh28OZGZP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGJHmgACgkQJNaLcl1U
h9DOCQf/emsG6M7uB1Gko/Ofqbzh7YPcGxxFSQSyCc7QzeSfSq4AK9/K7SUvG4D5
EC6SWwAY1GVEhXFrjo8eZ+POyGHWYj78x5sf60y+dDZ9DKvcPznCUT4LJDSBs0Lw
kT5bBdPwxugKExiH5Tb+Yz5JMKc5RpCbhNju8Lsg+N6rpJW0idmc+T9QckSqmPjN
igjbip1/TBNEtvXOOnqNXDqIgjuW+05HO4+ukbur9Y7YGyrtkfIv/uCKshwRXCfT
n2Wx7N8fxc5DgR97XrZ3BeAROgadUuLHWW44C1dMqZq8WwARkLz4M3ovhobkroCg
7f6JTeSwn7uFR3x0Mq6dYT1ZEosXrA==
=QW6w
-----END PGP SIGNATURE-----

--unVRdwLPh28OZGZP--

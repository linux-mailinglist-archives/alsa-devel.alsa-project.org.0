Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F4D64CF45
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 19:17:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEF662A5A;
	Wed, 14 Dec 2022 19:16:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEF662A5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671041835;
	bh=ng31iXQhKawiBXKC1+Kublzbonz8fQyZH1Nmxo6bePg=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Wf3mxS5+sFpKZPXcnuEskqLy80ZAoePk7NdGYDWu3W/gccycBhw601pY1LYVrv43V
	 XJVLOnwp5G9GP1lcRRdruREMIau5Sq7FOVSlStNANG6tpkgu20psI3QnhnW4wjYbQd
	 LZ5WEX708fkRZ2XKsCEcd5YZe7RFwxk+E309Kupo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4134F80310;
	Wed, 14 Dec 2022 19:16:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBCCAF80310; Wed, 14 Dec 2022 19:16:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36B76F80310
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 19:16:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36B76F80310
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=t54WnSv0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C86C161998;
 Wed, 14 Dec 2022 18:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF8AC433D2;
 Wed, 14 Dec 2022 18:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671041771;
 bh=ng31iXQhKawiBXKC1+Kublzbonz8fQyZH1Nmxo6bePg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t54WnSv0sRHPaJmCCm7xTDbksmTeQ3PTzxAY4qwNPKyvI4uAEisUU/MwQgIW8IPH3
 w9SbtdISPgNVMHumGAvmzG+evjHyxqmLWUG8Rmk1ffsSXdRNEO5UvUb9IsNOuv8i7b
 S/l09/3vH1bDB5aGnbQvrGrbuL/aE2TFOZe2D1f7gvUIsrAa7k7V7BW6V908iqD8yb
 H1b2vrwIg6lVYvzov/bLflgizG/dwDDXAX37DaTt1f8Wl+xL0BY4lDkdCv31vz2rkS
 OjP7xEx98oYJJ4NwuDpS11ILQmbmpw5C+1UYotceg1XsVX12AL+q3RZaQBv1AwLuth
 ZXNRUbfj/0ZAQ==
Date: Wed, 14 Dec 2022 18:16:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] Add HP Stream 8 to bytcr_rt5640.c
Message-ID: <Y5oS4vys3Mb/BSXk@sirena.org.uk>
References: <20221213173550.1567875-1-moisesmcardona@gmail.com>
 <08403fff-359b-b5f4-d039-18eeef660637@linux.intel.com>
 <92358ff1-86ca-76b0-c4f3-3d4e0dddc80a@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="A+xD78oh22A6e791"
Content-Disposition: inline
In-Reply-To: <92358ff1-86ca-76b0-c4f3-3d4e0dddc80a@redhat.com>
X-Cookie: I disagree with unanimity.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: oder_chiou@realtek.com, cezary.rojewski@intel.com,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 Moises Cardona <moisesmcardona@gmail.com>, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, liam.r.girdwood@linux.intel.com,
 alsa-devel@alsa-project.org, akihiko.odaki@gmail.com,
 peter.ujfalusi@linux.intel.com, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--A+xD78oh22A6e791
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 14, 2022 at 04:42:34PM +0100, Hans de Goede wrote:

> Mark, please merge the new version (which unfortunately
> was not marked as v2) which correctly drops
> the BYT_RT5640_MONO_SPEAKER flag.

It's already going through my queue.

--A+xD78oh22A6e791
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOaEuEACgkQJNaLcl1U
h9Cd5wf/cBMsjkQaxA6DsEBZoUFBHHtA9UIJEujMdDzw/Ln7v2qTx8yNdMCefPKk
Am2EGLl2ARc6Mzp0miEoybGl4hJPQxUZkSqF21OmLaDBDTbzVf4iPz/OuHqErzRB
6WgiSJwmg2JFhCJXGxJBwb0GHA+VG37Cn2Alh+QFhJcZ7Rs9D6QLUsEZB8EnYjSr
C3YYoADbjgw/Qoqjkl/jZ/mubQsq7vZbZFSE851g7IKxxHRqCTXvbWRPvxGjYJKw
e7YULkbwFsiewh5HaNys6kZjsw4CqM9tSUoqzbS0Fs64lEr9ZXUa/U3gdJxWaF4+
tseuvTdtJWQGF6rIfk4kYhea9mTlug==
=Clkm
-----END PGP SIGNATURE-----

--A+xD78oh22A6e791--

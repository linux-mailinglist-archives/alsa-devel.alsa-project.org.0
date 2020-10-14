Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9028728E6E0
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 21:04:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D55F21752;
	Wed, 14 Oct 2020 21:03:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D55F21752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602702261;
	bh=tiVZn7Uy6aKe/fKNIUCOYWaPAhUmavw7le8FCSbV6DA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nSRjYfHLTqBspWAFLOz77vU95+9/BdZlRo9cDTKBsx3GZGV6l1dbzQHHDj7kALI9e
	 sF47cVPGxHvHk0Ne2cadVUr9i/w/ebCgouKRX4rzKervQjL74/HV428ofwVoEkGiS5
	 INafQMxeISi+WWDSX0mZ9Y+Us2Knl+ivhUgnXlME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68C46F8021D;
	Wed, 14 Oct 2020 21:02:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EB31F80217; Wed, 14 Oct 2020 21:02:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F8F1F800F6
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 21:02:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F8F1F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AM3qqRs3"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA7A82078A;
 Wed, 14 Oct 2020 19:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602702153;
 bh=tiVZn7Uy6aKe/fKNIUCOYWaPAhUmavw7le8FCSbV6DA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AM3qqRs3fxoCLtIV80QDm6MedkQc1V4Gd9AmLRYNhh6hJmUp41RLmmGTmSEsaXYfq
 RVTtCwBR4ncHqZNHgAJMj3trSbtsxbxaFjvLWU8a/BDKXJlAnN30qW4mbcnEvv7KO5
 uwfSD5oaGRBifPN7jzp1UzVo81sMXX43iFj5aKDk=
Date: Wed, 14 Oct 2020 20:02:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH] ASoC: Intel: kbl_rt5663_max98927: Fix kabylake_ssp_fixup
 function
Message-ID: <20201014190226.GE4580@sirena.org.uk>
References: <20201014141624.4143453-1-tfiga@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cYtjc4pxslFTELvY"
Content-Disposition: inline
In-Reply-To: <20201014141624.4143453-1-tfiga@chromium.org>
X-Cookie: Take an astronaut to launch.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 =?utf-8?Q?=C5=81ukasz?= Majczak <lmajczak@google.com>,
 cujomalainey@chromium.org
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


--cYtjc4pxslFTELvY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 02:16:24PM +0000, Tomasz Figa wrote:

> Fixes a boot crash on a HP Chromebook x2:
>=20
> [   16.582225] BUG: kernel NULL pointer dereference, address: 00000000000=
00050
> [   16.582231] #PF: supervisor read access in kernel mode
> [   16.582233] #PF: error_code(0x0000) - not-present page
> [   16.582234] PGD 0 P4D 0
> [   16.582238] Oops: 0000 [#1] PREEMPT SMP PTI
> [   16.582241] CPU: 0 PID: 1980 Comm: cras Tainted: G         C        5.=
4.58 #1
> [   16.582243] Hardware name: HP Soraka/Soraka, BIOS Google_Soraka.10431.=
75.0 08/30/2018

Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative (it often is
for search engines if nothing else) then it's usually better to pull out
the relevant sections.

--cYtjc4pxslFTELvY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+HS0EACgkQJNaLcl1U
h9D8fwf9FvyHCTN7VxT8U5K/g01w3t4Oz9J2KNU29AFJcwQRN9tFkguWron/RH82
W4Hpmis1Hwcou3ECVp0K39jUq43kj7SEgsVMM8EU1498b9y8Y0oFXXmzWi7TBuXO
sbgHdVdS2QEsHmfTN06LY2MSDPcecOvKRYlEXrSSKs96+A1HL5b6wxBfNwFhuqaQ
RUa0mmJunCEyLH3s+RmjHXJ4YFCzcz5mc2TZmi92IZ6FDn1Ji4xZFHkulNZ5qzHZ
q3Rxx580TeC316jSAzO6PZ13ivKiQ/K5HwbvxpvpW7nKVPnBMXfYMGOv3mmyECaj
IxJGuJfes8NzHppDVT9C/xCnORqFWQ==
=PR0C
-----END PGP SIGNATURE-----

--cYtjc4pxslFTELvY--

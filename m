Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE4B63BFAB
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 13:04:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C383C16B5;
	Tue, 29 Nov 2022 13:04:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C383C16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669723495;
	bh=63J/YnDXq/ACyXdIg6KmYtgzhnBJ09vWSj+HtNFh0UI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qBrzKLWjNcBlctHy6rkQJwIuwq4eDzLQMARAF++aQ3E9tjoCgd6WgRGpdiUbfEllK
	 dXLXl7tqBxL5Tli9rAgctDJd1hh96c53cKF9zNWQi/mhyBDwCJ5gArNkgdm3LJ/CjY
	 OACYCcRQSiUlyd2YdN7rMAPRNAKwvDYyxVffamaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FE99F80212;
	Tue, 29 Nov 2022 13:04:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4495CF801F7; Tue, 29 Nov 2022 13:03:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35841F80137;
 Tue, 29 Nov 2022 13:03:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35841F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Dig0p38r"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 22BE9B81188;
 Tue, 29 Nov 2022 12:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90033C433D6;
 Tue, 29 Nov 2022 12:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669723419;
 bh=63J/YnDXq/ACyXdIg6KmYtgzhnBJ09vWSj+HtNFh0UI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dig0p38rYnVjeiB1Q3M316EajBfyFAxAMXCn8yhYP5O8iREhi56imPXZS9Oi1prcy
 uMy2q+5I6LmD7hubMhBfnXCvdyiLIB4kCFWrFoOaKLF6uvlxjLWO44umkom3iQxgeR
 PHI+C5d+bhvFaW/SbRME5W4IjPUr5Qfi3SdoXIrJ2otwrenhxVWHN1AD3r6ueWqswU
 vbkTprtz0EtWR7NRSgkzHseJHHPJpooA8+5UZerzDYjM/z6ljOoLPel3g5+1CAuwpE
 sgN9w3X6d8EKFT/5th180AjXMOboxYUNRyoqoL17bRpBBOIOhncN/BhN3UVuheWteU
 nwV6jJ8JcH5CA==
Date: Tue, 29 Nov 2022 12:03:32 +0000
From: Mark Brown <broonie@kernel.org>
To: V sujith kumar Reddy <vsujithkumar.reddy@amd.corp-partner.google.com>
Subject: Re: [PATCH v2 1/1] ASoC: SOF: Add DAI configuration support for AMD
 platforms.
Message-ID: <Y4X1FPSVxpFkEIrN@sirena.org.uk>
References: <20221129100102.826781-1-vsujithkumar.reddy@amd.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="w8MY03ubAP6sTL39"
Content-Disposition: inline
In-Reply-To: <20221129100102.826781-1-vsujithkumar.reddy@amd.corp-partner.google.com>
X-Cookie: An apple a day makes 365 apples a year.
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, venkataprasad.potturu@amd.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Chao Song <chao.song@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vijendar.Mukunda@amd.com, V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Rander Wang <rander.wang@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS"
 <sound-open-firmware@alsa-project.org>
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


--w8MY03ubAP6sTL39
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2022 at 03:30:59PM +0530, V sujith kumar Reddy wrote:

> Signed-off-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
>=20
> Changes since v1
>     -- Apply on latest broonie-git for-next
>=20
> ---

As covered in submitting-patches.rst any extra material like the per
version changes should go after the ---.  No need to resubmit for this
one.

--w8MY03ubAP6sTL39
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOF9RMACgkQJNaLcl1U
h9Abpwf/dvM9h5uM5L44r+YdBfM/2u7+nQiPr1dt2Akaq5HHIDI6d3RiCHqYYcAP
ajq5rUq2hqQwcyulxs7ODNvdSJiAGKSuHA0FMC1wPJ1s4lCuNllbeQDFIeNrQCRs
e18YXg7NO1Q47xzgNZbE34bED8TWQ+dK+zSkZP2nPupUJkRw3JIASHVSy7HAxTwJ
bwE3xc5U2HG7kmtii6GpZitRTEzPsZgb+c0kOHsOdbPdUkim7w4mPksAYGOkrKTn
bSp3dddQtRFc/0C+siDDpYTvOjSxIS+TUwkBlr1fvkz+ZxArZn/Q7nhmxs8UPSNS
y2pgHs1lZB5V9/KEX0OlXAH5v3QJ3w==
=c9Uq
-----END PGP SIGNATURE-----

--w8MY03ubAP6sTL39--

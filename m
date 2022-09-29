Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 895D75EF377
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 12:30:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E840384D;
	Thu, 29 Sep 2022 12:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E840384D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664447458;
	bh=Ct3rpu6jdxUMpNcwrqLEGWuHzOZd+t40yGCSzkMNywQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rlRc3MuG/MNUxw9fnPS7/iJ4G1czR2xrjkUUBaKNlTB5sS7933SvvtiVO7I8wxXf8
	 CVrj4R7ECmZ2VWzrbA9ZGaeinIm9SdNxTNfNTR+RVAyYcHAV6wO7ZIV+Id0R5vaXuC
	 AWWphfbH7stdxKI5coK5xQRrSv2CMdIgLUMYex3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F00BF80095;
	Thu, 29 Sep 2022 12:30:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E95AFF8023A; Thu, 29 Sep 2022 12:29:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4E5CF80109
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 12:29:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4E5CF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="poxnamR5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EFA7C60F4B;
 Thu, 29 Sep 2022 10:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0BF6C433D6;
 Thu, 29 Sep 2022 10:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664447388;
 bh=Ct3rpu6jdxUMpNcwrqLEGWuHzOZd+t40yGCSzkMNywQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=poxnamR56W7z9N/18lMs879J5ufX8i2zJa/w/DqL+L/GxfG6LqO7AyxiBdFTVB01x
 nbht1fRozh7kFBqqvejepcLLIOhASO4/+obkBKm1FjZTJ1DbCyF9RHuwjFMI//cIH+
 Vx5oZqoybi+7tT7nPFODRVy4bgvEjlRq7+vTZH/2jsMmsFFw4zbXB64QuD5H1eSo60
 xf8nRPoJG5lhZrvD6QN4rdgA8+IV/vg/mI+N933rGFczyjpzItHcs/Z2xoh89IQVHh
 yNdq3zGSbR3Lw22aIx1cOI3mrIEGqvohElgRs0Ly4i2X1dcaa/4keeq13DT7yaRibF
 K/sdOqlLHSFoA==
Date: Thu, 29 Sep 2022 11:29:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.corp-partner.google.com>
Subject: Re: [RESEND] ASoC: amd: acp: Add setbias level for rt5682s codec in
 machine driver
Message-ID: <YzVzlZ4LOwaLkzHo@sirena.org.uk>
References: <20220929070828.3950101-1-venkataprasad.potturu@amd.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SwTGG9bJqF3v2K7+"
Content-Disposition: inline
In-Reply-To: <20220929070828.3950101-1-venkataprasad.potturu@amd.corp-partner.google.com>
X-Cookie: Last week's pet, this week's special.
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jia-Ju Bai <baijiaju1990@gmail.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Vijendar.Mukunda@amd.com, vsujithkumar.reddy@amd.com,
 open list <linux-kernel@vger.kernel.org>
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


--SwTGG9bJqF3v2K7+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2022 at 12:38:22PM +0530, Venkata Prasad Potturu wrote:
> From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
>=20
> Add set_bais_level function for rt5682s codec to enable bclk and lrclk
> before codec widgets power on and disable bclk and lrclk after widgets
> power down, to avoid pop noise

Please allow a reasonable time for review...

--SwTGG9bJqF3v2K7+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmM1c5QACgkQJNaLcl1U
h9CfdQf+JNAC9Md2HFgBnBsxw6gz04oxAb/sihhvpSmvllsnbMTbgWFqOIEjad+P
JA05eh7PHjC+ljLmmNU+DqK9SABZsnTzGXmMgkCIB//RrqtDIb1KFNZBpN7mozWu
1UAEX7JdJAAhMU8n2qQTsho62/2g3IjZdwSiDKWK4zesQIDF6QiLNVUmQdyOuaUb
VZHRafBVF5/k1J02Sl3hulVT6cqVchJ6J9JkHqRbjBo6GAWfld0dXqJyZ5+z/uIY
P1dtk93LZYFkoDNZf/qcnkXDnC4nrLoU004qBz53EhePo3mB8HqDkzaI8OmCdD1o
56h27TtvY08e5m8zGV8LKrEii9aEGQ==
=33hd
-----END PGP SIGNATURE-----

--SwTGG9bJqF3v2K7+--

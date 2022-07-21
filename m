Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9266057D449
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 21:38:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4418180F;
	Thu, 21 Jul 2022 21:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4418180F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658432288;
	bh=6OaPjad8CpsXAI8nFwTOIOEWRf/cBjv265th+xKGvYI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sxcZF3ltED0EFm1zvE2/EZf6PEruTOCSJv9245ZXDmyNJvVrAoyi8xoDUrnEO2CQi
	 ahqw6qEFJn3ltSAKM/9P3QZtxWTND7KxyEPmkPYaYozip1GT8UTtGXZ1X2gYGm1ESR
	 wQEDi/lAMZgRm/o1nSRsiqMQ8ybK1rztu4UKNOHI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01461F800ED;
	Thu, 21 Jul 2022 21:37:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B015F8016D; Thu, 21 Jul 2022 21:37:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0530AF80166
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 21:36:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0530AF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nmEjm9lx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 39675CE2476;
 Thu, 21 Jul 2022 19:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A71C3411E;
 Thu, 21 Jul 2022 19:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658432213;
 bh=6OaPjad8CpsXAI8nFwTOIOEWRf/cBjv265th+xKGvYI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nmEjm9lxx24PzeOfyU7zOSG116WbulTXHfHMwKjjfMnJj57hfV52XWDqMi7ilNp/F
 fXN730jr9EKoKIyw25PIA0ZNUqP/Ls4qOliwI/CiZyxfXduydDw7/YzTSZS0qz8kzs
 +AcEI1SbselOAdiITdwH3gROf1s8mSK7gsjSvpwo5W4vYrcLE1eyQIJwbN+VzZlWm5
 bG5IJG1lL3QH0gwa2zmIgWPoX6OQHE5NZ3IWY3rsxgkyk2Tf07R8O2bQz8O/9kPWAb
 MoHmWRaEh0jZbt5uwnHLwO7kHyXfbEh4qJYY3C5ntGVa92k8BhhEN3ixWztBV2DITf
 xxP0AjSe3xvog==
Date: Thu, 21 Jul 2022 20:36:46 +0100
From: Mark Brown <broonie@kernel.org>
To: syed sabakareem <Syed.SabaKareem@amd.com>
Subject: Re: [PATCH 5/5] ASoC: amd: enable RPL Platform acp drivers build
Message-ID: <YtmqzkUjhKDIg0d2@sirena.org.uk>
References: <20220721061035.91139-1-Syed.SabaKareem@amd.com>
 <20220721061035.91139-5-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LCMckrGGq+4TFFQ6"
Content-Disposition: inline
In-Reply-To: <20220721061035.91139-5-Syed.SabaKareem@amd.com>
X-Cookie: Your domestic life may be harmonious.
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, vijendar.mukunda@amd.com,
 Alexander.Deucher@amd.com, Julian Braha <julianbraha@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Bard Liao <bard.liao@intel.com>
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


--LCMckrGGq+4TFFQ6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2022 at 11:40:02AM +0530, syed sabakareem wrote:
> From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
>=20
> RPL Platform drivers can be built by selecting necessary
> kernel config option.
> The patch enables build support of the same.

This breaks an x86 allmodconfig build:

/build/stage/linux/sound/soc/amd/acp/acp-platform.c: In function =E2=80=98i=
2s_irq_handle
r=E2=80=99:
/build/stage/linux/sound/soc/amd/acp/acp-platform.c:108:31: error: =E2=80=
=98struct acp_d
ev_data=E2=80=99 has no member named =E2=80=98stream=E2=80=99
  108 |                 stream =3D adata->stream[i];
      |                               ^~

--LCMckrGGq+4TFFQ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLZqs0ACgkQJNaLcl1U
h9B+sAf/Tzx8Dke3d/kShh/tPQ6OdU0qFsfYj5h7Z+hzW5NGEPPZpM7yYU9cXLoE
lfOcUlb/f7v8KotWgP5t39yVmEgKnAN0jIDJIyq6LH4sopnkCiaW0X4Lok8qiOYn
fbwdsWdbIvxIhGxTKDDWykpg6+u/wopxx1hmbCcru0+gImlZZp64D5C4r260jvgT
XPHXwvMjO46uo7GSmPX/NEbFKyBZgkGX8MeN3JA8WVu/rvjPxsDjlGtIY39b/8x8
wdX9dlCMqeQcgYDBvl15VGcg1UdjHkfFCM8wP4xIpOIPQr3KFQXtyZWAtBcmknqy
QZd7KK4NuOFEECRmZ5zv9cAMlGugvg==
=tJCh
-----END PGP SIGNATURE-----

--LCMckrGGq+4TFFQ6--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 097524D6768
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 18:18:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9102317D6;
	Fri, 11 Mar 2022 18:17:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9102317D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647019102;
	bh=443SiYGJGUDaMgpUN+vix0hHpSMSvx4CLDcgACriZt0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IC1RH63//6AGDw1Fh46OyUTmpr2dZN6lPBSYIlY/PJBRwYvboICF+Hbo9tRPTnaVi
	 L/aLPtUFgJ/pMACJmi3sbRxrdEMUHNm+2sUNlw43OPSnU4/09KuEE4xY2NkdYleGga
	 DoQtnAuJ/gpFD/i+p+NrRv8Moa0CpIWNAvgEb50o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF128F800D2;
	Fri, 11 Mar 2022 18:17:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F6D4F80227; Fri, 11 Mar 2022 18:17:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99EDEF8012C
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 18:17:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99EDEF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uu5+tGzY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B0FB1B82C88;
 Fri, 11 Mar 2022 17:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3049DC340F4;
 Fri, 11 Mar 2022 17:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647019023;
 bh=443SiYGJGUDaMgpUN+vix0hHpSMSvx4CLDcgACriZt0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uu5+tGzYAjUd7aKyPyz734orEl9bVHujIe/+7Bo9jR0kAOE27Kl2UJRQk8Ld24pRF
 ej8rmZOZzlHI58r1gyCGmlRH10ITP6M+gIZN0yujTAg9GcdP0C/dYsqN3g8+cPTASs
 rJKnGVycgSVxaV2JJMjDiaO24qZlvQ2vxkJNVWRDyay6u+0zr1fRS3/FAsaUmNEE1w
 7a9ynvFrgKpHqDsZidhlTtEhSMSWybAjMaoCoHLQeTcFPi6wUMEV2HdOpU9JufGlt6
 d5p2LR0Mk1UdCanpOlclbk1qSbGMDwZXysxKCKDTrVxanATa9xTFslNthHcHs6wcDZ
 h8/o//sAF+VWw==
Date: Fri, 11 Mar 2022 17:16:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Alifer Moraes <alifer.m@variscite.com>
Subject: Re: [PATCH 1/4] ASoC: fsl-asoc-card: add WM8904 support
Message-ID: <YiuECMoS3S54dfeF@sirena.org.uk>
References: <20220307141041.27538-1-alifer.m@variscite.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="b8SEATCHD1iXnOvu"
Content-Disposition: inline
In-Reply-To: <20220307141041.27538-1-alifer.m@variscite.com>
X-Cookie: PIZZA!!
Cc: pierluigi.p@variscite.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@gmail.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, eran.m@variscite.com,
 robh+dt@kernel.org, patches@opensource.cirrus.com, festevam@gmail.com
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


--b8SEATCHD1iXnOvu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2022 at 11:10:38AM -0300, Alifer Moraes wrote:
> From: Pierluigi Passaro <pierluigi.p@variscite.com>
>=20
> The codec WM8904 can use internal FLL as PLL source.
> Whenever the PLL source is not an external MCLK, this source
> must be setup during hw_params callback otherwise the BCLK
> could be wrongly evaluated.
> The SND_SOC_BIAS_PREPARE event is raised after the hw_params
> callback, so there is no need to set again PLL and SYSCLK and
> actually there's no need at all the set_bias_level function.
> Also, when esai is used, a dedicated snd_soc_dai_set_tdm_slot

> Signed-off by: Alifer Moraes <alifer.m@variscite.com>
>=20
> Signed-off-by: Pierluigi Passaro <pierluigi.p@variscite.com>

When you're sending a mail your signoff should come at the end of the
chain of signoffs - see submitting-patches.rst for details.

This breaks an arm64 defconfig build:

/mnt/kernel/sound/soc/fsl/fsl-asoc-card.c: In function 'fsl_asoc_card_hw_fr=
ee':
/mnt/kernel/sound/soc/fsl/fsl-asoc-card.c:265:37: error: 'struct snd_soc_pc=
m_runtime' has no member named 'cpu_dai'
  265 |   ret =3D snd_soc_dai_set_tdm_slot(rtd->cpu_dai, 0, 0, 2,
      |                                     ^~
/mnt/kernel/sound/soc/fsl/fsl-asoc-card.c:266:35: error: 'params' undeclare=
d (first use in this function); did you mean 'parameq'?
  266 |             params_physical_width(params));
      |                                   ^~~~~~
      |                                   parameq
/mnt/kernel/sound/soc/fsl/fsl-asoc-card.c:266:35: note: each undeclared ide=
ntifier is reported only once for each function it appears in


--b8SEATCHD1iXnOvu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIrhAcACgkQJNaLcl1U
h9CnVgf/Wr9SUVAFGV9OWF89sPv7dvpJRJTpALOk5PGWPIvkKsyMl54WVqeNMbb5
aRfcFiNedP7SPyS9WJlGAt7MOa3mSG9qaFM1EkPJhLcQ5Bx1MGOEmAPt+lIuXTMz
janQOk3NRv6wUBzS+RtQET2qCcjHkhLXJl24gvWoEQUX/qChPB3+Es3UBOkbIHWC
Zxx/O6wQZVPqsYzoqUoDQAXlXrIrvYSwEsJXFNptivsOxr/ZkmZQWEIZ12FsnRQF
wW1RquHMD1cr2Fx4CC9Yq8i9lgzJWFzd+k3+74c70kiHQXUJpXwdHVfIjZAvaAjk
Shq9tKOFh/8wv7exJK4Dd+n/1PZPkg==
=UvIJ
-----END PGP SIGNATURE-----

--b8SEATCHD1iXnOvu--

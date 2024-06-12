Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 880969057EF
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:02:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E77EA4D;
	Wed, 12 Jun 2024 18:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E77EA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718208139;
	bh=koJhvF9uRyo4fkWk7z9zsznr3icpU4UOgpXk1pXcWRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bx17cbIhM8xdg+7e7fW85lDEqJMGcWYsEZqLTJVbPX7QY1/fsYVXQj5DMOC1GqVra
	 IPSzOJ6p/kCE4ZTjSEmbpKyITCG/MHQfPvkFV9ZCbJyUpYR2o9HgPhzzO35RSxebNs
	 Y10cYcgoIBWtKFE/+uNtluBzYKeDyyfxrCifuiCY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 613B7F805BD; Wed, 12 Jun 2024 18:01:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9732FF805AC;
	Wed, 12 Jun 2024 18:01:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8034F8057A; Wed, 12 Jun 2024 18:01:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46B2FF8010C
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:01:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46B2FF8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=f+aevC0c
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4DC6A614BD;
	Wed, 12 Jun 2024 16:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2315DC116B1;
	Wed, 12 Jun 2024 16:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718208093;
	bh=koJhvF9uRyo4fkWk7z9zsznr3icpU4UOgpXk1pXcWRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f+aevC0c/6uTMbQ4l2iksrbcZQCXoh+0WiYKrF921TK+LAJ0BKaiN8JHG+sZTK0+E
	 eAKDF/M4UEV5T0KcXsS3zAI9wfUCYihuuX6zZ8/LU5j03HXtCxviwmEEzXN0zIrJRQ
	 Trm5h8m2jDnNw1ATBz6IwQlx6MQg7nYQ4qtUEuOHLDrJa1hKi/qcGEFoDE/d0OVDsJ
	 0U3OFOCLapZx6EN9tVfY6s4Ktb24J8SeJXs+FJNvPFjb7wV4TAqSi7icy33nQu8aEr
	 yydVCw/rOG08g3IXABt92exDSXeSa2G3l41Hqpvb4u4fLT8ypwV9SC7QubGJZ8pS3h
	 glsrl1x3HCM1Q==
Date: Wed, 12 Jun 2024 17:01:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 2/5] ASoC: SOF: Intel: add initial support for PTL
Message-ID: <ZmnGWdZ0GrE9lnk2@finisterre.sirena.org.uk>
References: <20240612065858.53041-1-pierre-louis.bossart@linux.intel.com>
 <20240612065858.53041-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QTJB/OyqEFSB6dAf"
Content-Disposition: inline
In-Reply-To: <20240612065858.53041-3-pierre-louis.bossart@linux.intel.com>
X-Cookie: A Smith & Wesson beats four aces.
Message-ID-Hash: 7XH4MS5GTYCZLX4GOCD5OOZWWBA5MX5J
X-Message-ID-Hash: 7XH4MS5GTYCZLX4GOCD5OOZWWBA5MX5J
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7XH4MS5GTYCZLX4GOCD5OOZWWBA5MX5J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--QTJB/OyqEFSB6dAf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 08:58:55AM +0200, Pierre-Louis Bossart wrote:
> Clone LNL for now.

There's a dependency somewhere I think:

In file included from /build/stage/linux/sound/soc/sof/intel/pci-ptl.c:10:
/build/stage/linux/include/linux/pci.h:1063:51: error: =E2=80=98PCI_DEVICE_=
ID_INTEL_HDA_
PTL=E2=80=99 undeclared here (not in a function); did you mean =E2=80=98PCI=
_DEVICE_ID_INTEL_HDA_
MTL=E2=80=99?
 1063 |         .vendor =3D PCI_VENDOR_ID_##vend, .device =3D PCI_DEVICE_ID=
_##vend##
_##dev, \
      |                                                   ^~~~~~~~~~~~~~
/build/stage/linux/sound/soc/sof/intel/pci-ptl.c:52:11: note: in expansion =
of ma
cro =E2=80=98PCI_DEVICE_DATA=E2=80=99
   52 |         { PCI_DEVICE_DATA(INTEL, HDA_PTL, &ptl_desc) }, /* PTL */
      |           ^~~~~~~~~~~~~~~

--QTJB/OyqEFSB6dAf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZpxlgACgkQJNaLcl1U
h9CAQgf9Hs8BaVfHcGEf8NBixx3jvjRXrQbsSmyieNXwrywCjaBi1XyuhcSVlm8x
9SLdzSgSwvRrfc/dJp9JZ6KPXCfy8Oa8eTig4d3fOdH1OTNzi0ozbujoBQJsK4Q+
FpOI5TgoPVTIyB83Jw5veJcBJ6z226XuBWLIuEolMXOxiGnEF36F2SWJR1YsoWvV
mb6AMh7Z0/24I59pKQkYtRMCNDUb+ZTVI5JpUZsY6eN2ZMpTemK0qVdQB73Js6rz
LKT9apbpusHbhINzUJhxlW0VUkvjCDwhwieHxiqc2PWJSm2O6eomkGQ68AeFCNo9
0VY870zURF8U1LbuEd1unijh8E75tA==
=CtkJ
-----END PGP SIGNATURE-----

--QTJB/OyqEFSB6dAf--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A2794C553
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 21:33:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03698B70;
	Thu,  8 Aug 2024 21:32:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03698B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723145589;
	bh=SzKzmpEu7GnyJJQGPutFmsrQXVrxKt8Z6WX3Zjdg/EI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MVTqV9h5XOj262ctQJH2mCt42GQiDl5+h+2r1XXaEhAYAMaGfDL3jxxaI2ydY5zPU
	 TxWOMknAhWEaf7vMobIsy6LfsL4hGZMarvp1n98/ZiXtk/R1t76UGUTE15fBmuiQCB
	 tivwcwY67JIzZ8YDz5by40eyntQ0UYKuuUs/E+Ok=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57A73F8058C; Thu,  8 Aug 2024 21:32:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE8D1F805B0;
	Thu,  8 Aug 2024 21:32:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACC54F802DB; Thu,  8 Aug 2024 21:32:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F0A2F80236;
	Thu,  8 Aug 2024 21:32:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F0A2F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Qbqh5C4Z
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 016C56118B;
	Thu,  8 Aug 2024 19:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5137EC32782;
	Thu,  8 Aug 2024 19:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723145538;
	bh=SzKzmpEu7GnyJJQGPutFmsrQXVrxKt8Z6WX3Zjdg/EI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qbqh5C4ZwsxZP9LipKvN64N8kS2kOIxptu0Bso46LZaQ6M3u7nUcOICyyUraYbPT2
	 srH4O//m3c70G+OxwFOB4uoOmdFTooKkuTG7tjY8dXXNApoT0IXf3xKJz0eyjqfkmm
	 gwqmdeqo5uCYLX99r7oJXEqLjZUWJQEdnEX/Flfr0qJNt9/gWNjeo1pgk3aCQxH86L
	 CPc3kHHNQBLwtjVCVyQAsI9Cncs60nPky6pb41/mjpoTd7zWFuZT52VTE3igKjYBeH
	 lAZ3uDg2TUG0m/0L4ZN/PahT4j95dVChveOilldY2b+CLKU3OWYDfKligcTcbQKmEW
	 rOw1tOQmI1djA==
Date: Thu, 8 Aug 2024 20:32:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/8] ASoC: SOF: amd: fix for acp error reason registers
 wrong offset
Message-ID: <ZrUdOyGiFRH0sRlt@finisterre.sirena.org.uk>
References: <20240807051341.1616925-1-Vijendar.Mukunda@amd.com>
 <20240807051341.1616925-2-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M8Dce5wO5cfW5jxQ"
Content-Disposition: inline
In-Reply-To: <20240807051341.1616925-2-Vijendar.Mukunda@amd.com>
X-Cookie: optimist, n:
Message-ID-Hash: 4XBW7RGCTFJBLNPDPJO4W4BTPQEYLFQU
X-Message-ID-Hash: 4XBW7RGCTFJBLNPDPJO4W4BTPQEYLFQU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4XBW7RGCTFJBLNPDPJO4W4BTPQEYLFQU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--M8Dce5wO5cfW5jxQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 07, 2024 at 10:43:14AM +0530, Vijendar Mukunda wrote:
> Fix the incorrect register offsets for acp error reason registers.
> Add 'acp_sw0_i2s_err_reason' as register field in acp descriptor structure
> and update the value based on the acp variant.
> ACP_SW1_ERROR_REASON register was added from Rembrandt platform onwards.
> Add conditional check for the same.
>=20
> Fixes: 96eb81851012 ("ASoC: SOF: amd: add interrupt handling for SoundWir=
e manager devices")

This breaks an x86 allmodconfig build:

/build/stage/linux/sound/soc/sof/amd/acp.c: In function =E2=80=98acp_irq_ha=
ndler=E2=80=99:
/build/stage/linux/sound/soc/sof/amd/acp.c:407:26: error: =E2=80=98struct a=
cp_dev_data=E2=80=99 h
as no member named =E2=80=98pci_rev=E2=80=99
  407 |                 if (adata->pci_rev >=3D ACP_RMB_PCI_ID)
      |                          ^~
/build/stage/linux/sound/soc/sof/amd/acp.c: In function =E2=80=98acp_power_=
on=E2=80=99:
/build/stage/linux/sound/soc/sof/amd/acp.c:444:22: error: =E2=80=98struct a=
cp_dev_data=E2=80=99 h
as no member named =E2=80=98pci_rev=E2=80=99
  444 |         switch (adata->pci_rev) {
      |                      ^~

--M8Dce5wO5cfW5jxQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma1HTgACgkQJNaLcl1U
h9Abvwf/VL1PihLf4mO0zdcK8agYvT3wWBXvBRWJ2sWWWiQbqgRYQdtAXdv5Lhlp
2y6m04AYARrGfqpZsTE74rXardMdxN7n7lyRj40LTENvPX/iSVh/94fe3Jw+fhfz
SAOgKy7E+7iBA2IMXTQLU0nbx0OkdFOkezZVU+YKAkIunFyDMLfrn/Ujr5tBUs34
b2tzZvFKDM7VYS/mEiFC42O3w3gscUye8RWA71Y1dsZEOa2C3D6lt2Uq32r/N4iT
K86GAsqPJJgGNS/GLxBWQdy2xluWn3zUPl60EYJ2bJMH/b26bctPkI4ABPzq/srY
UPyW4h7DsiWcY5Yp0GftrmXkYuB7cQ==
=SGMn
-----END PGP SIGNATURE-----

--M8Dce5wO5cfW5jxQ--

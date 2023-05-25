Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBD27111AE
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 19:08:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01C83204;
	Thu, 25 May 2023 19:08:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01C83204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685034532;
	bh=DNU4fQ+vudSHdI1LleI6ZcbJQBl+IJL2QbN82Q47QK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WDx0i4CpNkxoDSaH0Ufk4vcQBNDbhtTcygwxwVyyv+EsjU+MiTmEvEcm8bgBHRvR2
	 0P8a82dEeBERwrpFQ2/u2YjSg/6XGRsgo8nvlzOmnFtz1qTlmSw3qTVYxyYX3HkGnV
	 0kv/ldxBCv1nixe+VZ94gbFRf4daeU5LC0v7ApMU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56641F80542; Thu, 25 May 2023 19:08:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 147F6F8016A;
	Thu, 25 May 2023 19:08:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4D67F80249; Thu, 25 May 2023 19:07:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33FE3F80007
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 19:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33FE3F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=m6aMBjQv
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C4B9647AC;
	Thu, 25 May 2023 17:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E6CC433EF;
	Thu, 25 May 2023 17:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685034461;
	bh=DNU4fQ+vudSHdI1LleI6ZcbJQBl+IJL2QbN82Q47QK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m6aMBjQvdrAgMzmNDk7hWFfKS1dtDuOz8gvlN++/RKvf9AAQLUdxli42Dg9Ur+SZh
	 AyKrWrMwYGoqQkP8KQYRfMfvCr5bBcTYWvIzStOyPcLzIpKkBsftKEGLqi3H2NYsn/
	 3zI+KlWjbY3uMTAV4s7Xd/fTESDberIWiiNgKY10Fm5dHAh1NmxT6dpLjpjke9o/FK
	 opeu1ry0WMyvt2Rc9+o1VUvuLe4yj6PhYkUH0V+gCH66Go9lOd5aRHhSWTEzRjGCdJ
	 uPcPUyL5e2w/KhfVpA6phq/ZR+QjX1mfGR1UCQITzm6G9wXvOo5v3REzhhLN95BRV8
	 Rfq0KV6UKvbvg==
Date: Thu, 25 May 2023 18:07:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
	lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, daniel.baluta@gmail.com,
	kai.vehmanen@linux.intel.com, linux-imx@nxp.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: SOF: imx: Add OF machine descriptors for i.MX
 platforms
Message-ID: <69c2b7cd-f211-47ef-b42a-609ee792de11@sirena.org.uk>
References: <20230525122837.649627-1-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bsKLXEtTI1c6xDxo"
Content-Disposition: inline
In-Reply-To: <20230525122837.649627-1-daniel.baluta@oss.nxp.com>
X-Cookie: I demand IMPUNITY!
Message-ID-Hash: WUEYZZI6SUPWD27TBQKCI2UTG4SLSJCW
X-Message-ID-Hash: WUEYZZI6SUPWD27TBQKCI2UTG4SLSJCW
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WUEYZZI6SUPWD27TBQKCI2UTG4SLSJCW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--bsKLXEtTI1c6xDxo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 03:28:37PM +0300, Daniel Baluta wrote:

> +static struct snd_sof_of_mach sof_imx8_machs[] =3D {
> +	{
> +		.compatible =3D "fsl,imx8qxp",
> +		.drv_name =3D "asoc-simple-card",
> +		.sof_tplg_filename =3D "sof-imx8.tplg",
> +	},
> +	{
> +		.compatible =3D "fsl,imx8qm",
> +		.drv_name =3D "asoc-simple-card",
> +		.sof_tplg_filename =3D "sof-imx8.tplg",
> +	},
> +	{}

It seems a bit sad to be adding simple-card rather than audio-graph-card
at this point - is there some great reason for this? =20

--bsKLXEtTI1c6xDxo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRvldYACgkQJNaLcl1U
h9BQ2gf9F+zQnrSs7m+xrfMV/NzYq/C/oSC5PkOfwI4qM/pBbjKAzmM3fKu9DLZX
hFBuYscJN9qvcEkismhsI7RIH8bkPtXQjMol5fR5YCasuNZsQXTh6ZzJnqshFiqe
NeVJfLvMEp08sQolN0wyPru/Vnsb7nSVrk7YGStSQbePWZ5zaGMgDyz8REzCHK6g
L/yzjc7KMNa5JtXR86i6WUGiV/CPsH0xtP2FQ9A7u5szVYWAVYFGF8hxcNn7a7If
CHtKsu2yJOGVml5azHgEsY6CFAWMTJAx0sGqPNE1vMfxpklJyrb8s3MzodcY0kzX
8FjMRtmukvQIk8XQod2a1pDpXr7XVA==
=oqat
-----END PGP SIGNATURE-----

--bsKLXEtTI1c6xDxo--

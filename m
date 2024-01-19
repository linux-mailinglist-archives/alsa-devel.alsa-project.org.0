Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 048A3832552
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 08:58:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91D80825;
	Fri, 19 Jan 2024 08:58:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91D80825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705651105;
	bh=9UoP3WAV0HOIOYzSjVcxPb/Advh/Go4bggp68Bk23so=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tNN5+Ieh8DDQWhzfh8a8SoUXgQQ2a0ttt2cVoPP4Y2YzPSPeJZ38iGDWcJQ2hHZA5
	 KtSCiophQ4VIr7wIfO0wNumb/P89n3VMd5nZQwikBMgFw42r4xetFZ62Jg5sO+1fJU
	 mUORLYaeQreCB6AJSfGfmWdj9V0Vbp/rHsLKJFro=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 345A1F8057E; Fri, 19 Jan 2024 08:57:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 148F0F802E8;
	Fri, 19 Jan 2024 08:57:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B3F3F801F5; Fri, 19 Jan 2024 08:57:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11D9BF80074
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 08:57:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11D9BF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=j4XFtBMa
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7352CCE2199;
	Fri, 19 Jan 2024 07:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0767C433F1;
	Fri, 19 Jan 2024 07:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705651052;
	bh=9UoP3WAV0HOIOYzSjVcxPb/Advh/Go4bggp68Bk23so=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j4XFtBMaHE6f0ojR/EtSUrDoEmsE4c9t8vWfDtecKnlVSt0TKUCXU+0jNEnTX8DZr
	 bRNIvsEOmUoXZPwvFGL2wXG3y052GuIIOYhdgg5fzrMoHvAw598rUULJSoAd30CZTd
	 i6Lkg5fu5Sk9EwQgqoqYsmnGsqXX1J2isQAOT8Zh9igJDdZm9wPxNOb+bQqDWXNXjq
	 LmAx0LBLrodnSGnoDHWevTt3sohZlCLHjGik5FRLtlB/t5nhF137S7LOrf/bJdlDHK
	 wmczgEOS5WUYCMtWcH4CIjBV+hlvGmMAEUrn8BaAbC/sBs/sdbXUHD8p8TXZ0m9jxc
	 xZoSzVFAcMxaQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rQjkz-0004Xz-1Z;
	Fri, 19 Jan 2024 08:57:41 +0100
Date: Fri, 19 Jan 2024 08:57:41 +0100
From: Johan Hovold <johan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/5] ASoC: codecs: wsa883x: lower default PA gain
Message-ID: <Zaordb030PebNR8h@hovoldconsulting.com>
References: <20240118165811.13672-1-johan+linaro@kernel.org>
 <20240118165811.13672-3-johan+linaro@kernel.org>
 <dc33e198-e202-4287-960b-7826fb0b455c@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RhFKLX4iJBkji7y1"
Content-Disposition: inline
In-Reply-To: <dc33e198-e202-4287-960b-7826fb0b455c@sirena.org.uk>
Message-ID-Hash: 5PG3NMHWIRXXKU7AF6NKB5SVCECMBOW3
X-Message-ID-Hash: 5PG3NMHWIRXXKU7AF6NKB5SVCECMBOW3
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5PG3NMHWIRXXKU7AF6NKB5SVCECMBOW3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--RhFKLX4iJBkji7y1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 05:21:48PM +0000, Mark Brown wrote:
> On Thu, Jan 18, 2024 at 05:58:08PM +0100, Johan Hovold wrote:
> > The default PA gain is set to a pretty high level of 15 dB. Initialise
> > the register to the minimum -3 dB level instead.
> >=20
> > This is specifically needed to allow machine drivers to use the lowest
> > level as a volume limit.
>=20
> > @@ -722,7 +722,7 @@ static struct reg_default wsa883x_defaults[] =3D {
> >  	{ WSA883X_WAVG_PER_6_7, 0x88 },
> >  	{ WSA883X_WAVG_STA, 0x00 },
> >  	{ WSA883X_DRE_CTL_0, 0x70 },
> > -	{ WSA883X_DRE_CTL_1, 0x08 },
> > +	{ WSA883X_DRE_CTL_1, 0x1e },
>=20
> This is broken, the register defaults provided to regmap need to
> correspond to whatever the hardware default is since for example a
> register cache sync will not write back any default values (as they
> should already be there in the hardware).  Anything like this would need
> to be done by writes during init.

Bah, thanks for catching that. For some reason this was enough to have
the driver initialise the register at boot at least. I'll set it
explicitly at probe instead.

Johan

--RhFKLX4iJBkji7y1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCZaorcQAKCRALxc3C7H1l
CCbxAQC8arUlAl4+X7yMII2POu5dbvbL0CDcGhl8McRSrvN5rwEAhetPqtxYPMgE
WbDj4UoXmv5R/OuECqddhpj0oTehDQM=
=dVhB
-----END PGP SIGNATURE-----

--RhFKLX4iJBkji7y1--

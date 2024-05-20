Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D3E8C9E1B
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 15:25:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADCB1B76;
	Mon, 20 May 2024 15:24:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADCB1B76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716211499;
	bh=KmZVxGEYbyrP9V7WE809KECo6k1t051ppisGlj+zDQk=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dK5ui07XXiV5MpbvNU+jKpxP73by3zh1f57NUqNtTeG/trgdYDIlL/0EdVT7GTo7a
	 1szca8mZVuoyG8f9dePw0wTc+6zPwp7G6iKDvv9uliR9QevPxaIKG6N35jteFKuQ3t
	 4INRSx4bQEPJXAYamvAKtssOLxeZ8TGG8W1RW99o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68475F805BA; Mon, 20 May 2024 15:24:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEDA7F805D9;
	Mon, 20 May 2024 15:24:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8DECF805BF; Mon, 20 May 2024 15:24:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA2AFF80578;
	Mon, 20 May 2024 15:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA2AFF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pZqUX0+Q
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 76EFE61C4B;
	Mon, 20 May 2024 13:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1367C4AF08;
	Mon, 20 May 2024 13:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716211465;
	bh=KmZVxGEYbyrP9V7WE809KECo6k1t051ppisGlj+zDQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pZqUX0+QMkw5pTpm4DONwaNufkqX3zzWfwapwSgBpkV2TWxHsn+grw39j7Lk9LnXz
	 AKQRNqjcuPochJglbbEfrX6pcl+TYohqQUm5xtClM3jtnYZvMaTcRqQH3/gDSjKIhI
	 hZXHw6KGK1csT4XJK/nhON9zaHir+22pxLIQv4zDAtw3T09tos5Cl7DkE59O7AKmU4
	 qJXyyPd28EWmOZPVqZhGsaStx/28y0DbRTzH1m1lICPu1/t5M2LValnltn1dPD2nlY
	 34w2l9JfjJg7g8Ezosdoup1VX77pYUISsTmVm25Hnq/NBsijKCTybcfpvNDUXEQm3w
	 Z2M+KCBHjANSw==
Date: Mon, 20 May 2024 14:24:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 1/6] ASoC: topology: Constify an argument of
 snd_soc_tplg_component_load()
Message-ID: <baf1789a-a573-470f-b816-ca9bb0d7f299@sirena.org.uk>
References: 
 <f2f983e791d7f941a95556bb147f426a345d84d4.1715526069.git.christophe.jaillet@wanadoo.fr>
 <1fb69d24-03af-4742-9f44-5a93704f5cfb@sirena.org.uk>
 <b736e11e-430a-462b-898a-d5e1dcf7f74a@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3ra5j95P2SXUw+yS"
Content-Disposition: inline
In-Reply-To: <b736e11e-430a-462b-898a-d5e1dcf7f74a@wanadoo.fr>
X-Cookie: We are what we are.
Message-ID-Hash: FAW7FHTXFYJGUX44MBHH3CAYLOAW4IGG
X-Message-ID-Hash: FAW7FHTXFYJGUX44MBHH3CAYLOAW4IGG
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, tiwai@suse.com, cezary.rojewski@intel.com,
 pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, srinivas.kandagatla@linaro.org,
 bgoswami@quicinc.com, daniel.baluta@nxp.com, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--3ra5j95P2SXUw+yS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 18, 2024 at 10:34:33AM +0200, Christophe JAILLET wrote:
> Le 14/05/2024 =E0 12:21, Mark Brown a =E9crit=A0:

> > As mentioned in submitting-patches.rst when submitting a patch series
> > you should supply a cover letter for that patch series which describes
> > the overall content of the series.  This helps people understand what
> > they are looking at and how things fit together.

> Ok.
> I usually do, but I thought that the subjects were self-explanatory enough
> in this case.

> Do you want me to resend?

It's fine this time.

--3ra5j95P2SXUw+yS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZLTwIACgkQJNaLcl1U
h9Dgigf+O7QTQ4V66dmxfo81LtTtdJ9xws2tiMsQz2yhw40n6x/uUnAI/DpVsJBM
7bnp8/mWqL0S36pfO4c+ypaAOjI/V0BjVEsLBIEIcyWNHlvicUGTAE0UrkUfeUyt
zIomDWwKLYl6V7o3dUyUn/CASeVpft1esGq8jlyvp9woke55IKQJIp+iX2H/rfZY
4XZZ+c37WFAj1VsRKD3drP9PrXrVsVfhAzpcq2ZrPLj5llC0nltM7IgPEfZFXIjG
VkQ8GS2lNoTHiZHgg+lLtqD2l89Ri4Yl0IS4DT1S/iez2COuCZfadttzQxJbDNUa
ASeX6pfwcXFqRHE0F6YAYkSzaB53YA==
=rysW
-----END PGP SIGNATURE-----

--3ra5j95P2SXUw+yS--

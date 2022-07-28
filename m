Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF69583CEC
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jul 2022 13:15:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCD10165D;
	Thu, 28 Jul 2022 13:14:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCD10165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659006931;
	bh=oXhKn484H8C4pSVsSAWT8FrTdxHfNXnO2/Oj96hh46g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b53NPIJ/exPoX+jUHlH+vXDpfmik51b/O0UvNd9Ki0IxgbFyavobyLV7ZiVjoRoyN
	 Q7cVs926OXgJ1+H4TwWoSbBxl2RBJ9dlEaMM3wX/Xs4cJIIe6og8CZ9od3tQcLXGzL
	 mVASHFPHOm/82DS0gJELwSMdX8rMrN6R2I/jIg3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D3B6F804EC;
	Thu, 28 Jul 2022 13:14:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0068DF804EC; Thu, 28 Jul 2022 13:14:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA925F800FA
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 13:14:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA925F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ecLDfjwf"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CD556B82398;
 Thu, 28 Jul 2022 11:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 768CAC433D6;
 Thu, 28 Jul 2022 11:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659006865;
 bh=oXhKn484H8C4pSVsSAWT8FrTdxHfNXnO2/Oj96hh46g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ecLDfjwfJxwxl7WL4Paa0dE9dnRnnddjlcSZ5n7EytRN8TpOVVUzlbYgO5njHL4uL
 FCpXsWxfjmdoqcX8cwxnN+XMiJTBZPm2i7Bs1kv+jvtOEuJTQQoHcPXv3aAa47SE4G
 PkxRIClibkhbMKJTF3jxT62/AshODfms/IA+1zds2vSoRyci+nVCaaDeFPOYUM4ve9
 7ck3gppV/uCUadE3BN+hMbddSeqp0rBBOJg4EkYgO6ZvKsH0tC/qqSwFD/eU9psQCp
 m2Tr9bd4tRyt8OJR/TzHrrAM6sSQB/EecxcgLFp4rHrsZg1ZjsnbHttkz+XwA/5hDS
 8U+zgAsmgx8cQ==
Date: Thu, 28 Jul 2022 12:14:19 +0100
From: Mark Brown <broonie@kernel.org>
To: "Prasad, Prasad" <venkataprasad.potturu@amd.com>
Subject: Re: [PATCH v2] ASoC: amd: acp: Initialize list to store acp_stream
 during pcm_open
Message-ID: <YuJvi6IdbPyJWKUq@sirena.org.uk>
References: <20220722133530.3314087-1-venkataprasad.potturu@amd.com>
 <87h739464x.wl-tiwai@suse.de>
 <PH7PR12MB5951A322E8613E1A782ACCF3E9969@PH7PR12MB5951.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="djlTOc+vqayQK83P"
Content-Disposition: inline
In-Reply-To: <PH7PR12MB5951A322E8613E1A782ACCF3E9969@PH7PR12MB5951.namprd12.prod.outlook.com>
X-Cookie: People respond to people who respond.
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Dommati,
 Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.de>,
 open list <linux-kernel@vger.kernel.org>, "Hiregoudar,
 Basavaraj" <Basavaraj.Hiregoudar@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Yang Yingliang <yangyingliang@huawei.com>,
 "Saba Kareem, Syed" <Syed.SabaKareem@amd.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Reddy,
 V sujith kumar" <Vsujithkumar.Reddy@amd.com>
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


--djlTOc+vqayQK83P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2022 at 07:52:25AM +0000, Prasad, Prasad wrote:

> linked to multiple pcm device as we will have same dai->driver id
>=20
> or array index for multiple pcm open. Initialize new linked list
>=20
> stream_list to store opened pcm stream info dynamically.
>=20
>=20
>=20
> If an IRQ handler refers to the linked list, make sure that no list
>=20
> change will happen concurrently during the IRQ handling.  It seems
>=20
> that you have no protection for it yet.
> Yes, linked list may changes concurrently during IRQ handling, we will us=
e spin locks in the next version of patch.

Please fix your mail client to clearly identify quoted text, it's very
hard to read your mails since (among other things) it's hard to tell
what text you added.

--djlTOc+vqayQK83P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLib4oACgkQJNaLcl1U
h9CUMQf7BkXcYCSXzOPB2U5KyrOlXFxo/iePJ+LMnwXcK6XPHGwNqfIl3iQ2kBzz
HNgn7TA4mo7cKULBTZrXb3yx7Gn+lRYsZ/PfMQLbOX5hjUhGqEJEZA/6HxQkiP6J
++vIRGFtrqlNXV8emSJAurT1m6IikCD4PAmJOPyTzNHWHV9j1U7dfEwfY2XSxfSb
j9cB3geRNNb+jHxls+s8KTa/3E83/Krkyq1sAKH1UklL7X71KR4R9k1M3RU2ZP3o
4jAXneq6kLpEog7YnKsnASVbRZfdhxvO6WiISeHygrtESt5UvwTTWK68uh6QowvZ
cfDSAD0IJDBtvzFofrJ5HDbVfQgU4Q==
=/414
-----END PGP SIGNATURE-----

--djlTOc+vqayQK83P--

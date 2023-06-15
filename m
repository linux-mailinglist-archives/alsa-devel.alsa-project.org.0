Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EEC731810
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 14:02:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3460E826;
	Thu, 15 Jun 2023 14:01:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3460E826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686830554;
	bh=11zmR0StVAVkJ0mQiDAlSqvA8kNFaGN4qhaiINef3po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IVB89VwtWb8KzXdxeHqZdV14WeY3Dz+CrafBk6D+oo9+VWbjkzI54B7wRRKUM1y9o
	 ITWbrV4/XFLN/YwlfuXGKYZq47fbLV4syyGA0OCBBNwPUfxZ/ZkVioI2R/rUn/Tj7h
	 RUZvBnOtzpmROxPbBf6e28X1APcZhlM1VQ4Rgddg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C31F8F800BA; Thu, 15 Jun 2023 14:01:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34A9CF800BA;
	Thu, 15 Jun 2023 14:01:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43A6CF80149; Thu, 15 Jun 2023 14:01:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B540AF800BA
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 14:01:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B540AF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QwbWtJbc
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9EDA9611AE;
	Thu, 15 Jun 2023 12:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E6AC433C0;
	Thu, 15 Jun 2023 12:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686830493;
	bh=11zmR0StVAVkJ0mQiDAlSqvA8kNFaGN4qhaiINef3po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QwbWtJbcaCmxzUWtUEQZ07+iILmMqJ7tjKMA6OkV6m0VgBO+KYxGVrI++xgQ8KD/o
	 0X8K+iqIFLPY1Osj1G9gBBWpx8D2o/C9fVn7j/sMyoJBXjkbxxuoJVyjQRxedbmtSU
	 cqDkRv7RtiQZ8BFCzH4Rn2ro7m3gNU8LHo3vTiD1uye5NcB8AJ63pRUV4tr4oeArsi
	 qOdPbFGXi/dy7mBp5wxpqTBBc8tOv7rM3hFDYmz3Rdrl1zeD7wpbRFhuEloDVNP4iE
	 3dlPheD7OXUlGjj1DQz9dxWATNYfQ2nFkMgOhggLtjgQ2BlIAasYBcDsMDKgCLLJri
	 7XHCB8pRbry4g==
Date: Thu, 15 Jun 2023 13:01:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Mac Chiang <mac.chiang@intel.com>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH] ASoC: Intel: sof_rt5682: reorder quirk table
Message-ID: <80dfadca-a3c4-42f6-84e9-aaa7160529e2@sirena.org.uk>
References: <20230615115349.21993-1-mac.chiang@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZvTn3XQ43HgkMkgm"
Content-Disposition: inline
In-Reply-To: <20230615115349.21993-1-mac.chiang@intel.com>
X-Cookie: You are false data.
Message-ID-Hash: CL3G2MFKSGSLNWWGBUECFIIEXY5R4YMU
X-Message-ID-Hash: CL3G2MFKSGSLNWWGBUECFIIEXY5R4YMU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CL3G2MFKSGSLNWWGBUECFIIEXY5R4YMU/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ZvTn3XQ43HgkMkgm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2023 at 07:53:48AM -0400, Mac Chiang wrote:
> From: Terry Cheong <htcheong@chromium.org>
>=20
> Reorder the entries in quirk table to group entries with same platform.
>=20
> Signed-off-by: Terry Cheong <htcheong@chromium.org>
> ---
>  sound/soc/intel/boards/sof_rt5682.c | 52 ++++++++++++++---------------

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--ZvTn3XQ43HgkMkgm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSK/ZgACgkQJNaLcl1U
h9BhmAf8DnvgQkydYpHg+4o3mXerEBJNm94O9cgJ2ASyPijpGLpAApE+iCStVAhI
fl67uIHcQfYx1ZHwh0ksdKNIljD+DnUv7HcqZ/zofpqSg/ZX5FkSpwNKr4nZk7mi
w6XxFK9Au2gFhrHTvnc262oo6lwC8azzqc10+VoZ/7EPvur1ww5F5YHhc5kYnFke
8zJW6j95v+iOq20YLa7iF/7SWYb5fBVJ7BgEenk2eTIpWt6FOiraJB/of8qrnM/i
c/WtkDm0K3qv2R4UMi2ipBDXj73Cha/B0bJdsiIL8ZbWeCxxQDhL2DoARrG/lmfr
kgNtapRKW5bN4v8SHb9FRI4pcbcSxA==
=Jbao
-----END PGP SIGNATURE-----

--ZvTn3XQ43HgkMkgm--

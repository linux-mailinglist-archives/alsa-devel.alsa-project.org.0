Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B42306C6AA6
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 15:20:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79B90ECC;
	Thu, 23 Mar 2023 15:19:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79B90ECC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679581220;
	bh=rKJhtcWF5Sbv4BWK06vkFvdXqPI6Oa3L46gyDJuZXFQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m1dlgIEcyySakRw1At1DJ7f299SgsbdGTKVkR3DXCJzelU55O3oaEk4s2T7mxQoVj
	 2IUucsioVaclNoNNsQGaXic5dSIimgCoiGBgQmszpI5GURxoCdnLv/9DFIltZ9/C6D
	 vpIz4dou18+JPJf3HWAYMoBA7rYMu/gLlCK/Kdjg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADF4AF8051B;
	Thu, 23 Mar 2023 15:19:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 242D8F80520; Thu, 23 Mar 2023 15:19:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38850F804FE
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 15:19:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38850F804FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aHNaIbGL
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1D9A6B820D1;
	Thu, 23 Mar 2023 14:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0569CC433EF;
	Thu, 23 Mar 2023 14:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679581143;
	bh=rKJhtcWF5Sbv4BWK06vkFvdXqPI6Oa3L46gyDJuZXFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aHNaIbGLVewvMY2yAbCr24zRc80qFHyHIM+R7ZbSIeHa4G04XXTCTZe9rsepM1W6B
	 uuDmVPJtSqWmLJnMhOAG9n/Pv+cj2143cERJG5eApY4oTLy4/DkFZN/6miSFf16sYq
	 zu1RwtFzLyy1s5E7zrpNI/uJkH/ic76YpJaC8O7eBqSEnSEFgmap6Ril3f1w2mofLW
	 isxk6Y2vjpUGeOr1rOCKfhZh4NpVHMhRV8rX5cQkpn/hFcKC/SEdwbnEeYuHLuy6es
	 5vorGNTyvx6XZSS+ajbw3JKOHUsPfp2aGfVOBQaflr4Ut5MZZ95/2F0hS8jlNy4Z3s
	 sOT43yztiv1Sg==
Date: Thu, 23 Mar 2023 14:18:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 04/20] soundwire/ASOC: Intel: update offsets for LunarLake
Message-ID: <ea0ff833-5124-4438-a452-1b281b3fbc5a@sirena.org.uk>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
 <20230323054452.1543233-5-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VNygY43YA50jeNm4"
Content-Disposition: inline
In-Reply-To: <20230323054452.1543233-5-yung-chuan.liao@linux.intel.com>
X-Cookie: A lie in time saves nine.
Message-ID-Hash: RJFT4Q7XLMWP4CK2YLHIFJOQQV45PAFE
X-Message-ID-Hash: RJFT4Q7XLMWP4CK2YLHIFJOQQV45PAFE
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, vkoul@kernel.org, vinod.koul@linaro.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com, tiwai@suse.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RJFT4Q7XLMWP4CK2YLHIFJOQQV45PAFE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--VNygY43YA50jeNm4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 01:44:36PM +0800, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>=20
> The previous settings are not applicable, use a flag to determine what
> the register layout is.

Acked-by: Mark Brown <broonie@kernel.org>

--VNygY43YA50jeNm4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQcX9EACgkQJNaLcl1U
h9BfvAf+NahuxKYi8m2GUOc9HDxl3uBfiiJR25oj2vuLxSmq7ACpD1P92KacpNcx
AYtTP4y8bzoMAKuIxMuJhd7jQaRlYoKYo7gSi1anVoMbljFp95X02iKHaAd0BmfO
4ldvWLpLMMkw8RfNriAa/Z7Yn5fdlvDsXUPTteAMmRjbXE0405GZHNJKeZNYUhdP
TFven2IQ9xBf3fMuUAJfONVamhq5LxYKIFiQruRof9/SZCoPVXxJxWBqOT72VDmD
h3h04V9dp4U7YThmIpflHj4z2BNoBEDp/R+Lo93ZGRX4VTULHcOUJcVgwSxN7BZn
XHTIgj7pQ+r5aqWZvVngf7SkgY1lJA==
=ASuf
-----END PGP SIGNATURE-----

--VNygY43YA50jeNm4--

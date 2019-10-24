Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAC3E315E
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 13:50:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0799716B1;
	Thu, 24 Oct 2019 13:49:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0799716B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571917812;
	bh=ZnWqYEVP/I50VQL9VTjdNdRkQBpxWnHPMUBw3GIlTfw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gno1CujmaVmb+Oc24FYH16qgBN6QadB6WmYUEMAuSX9D0LuzxShOn62P8uUI+TilE
	 YmZbxzDS36R0DgvkyRxXT67hFLqvRotxLMjf0C4NCeiDoSVVrbf4qfk5wHFyycyeYE
	 pd9eeMGJfgk2nrjAYaZbUugH5uUG4v420/SEwOxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 989B2F80367;
	Thu, 24 Oct 2019 13:48:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECEF8F8036B; Thu, 24 Oct 2019 13:48:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52A75F80274
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 13:48:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52A75F80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Euzd/lJV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X26az6DjUp9FAr3pCXF0T5GHWh32vXz1IFhkP4UkjvQ=; b=Euzd/lJVxPijiN7/esNtascwW
 bG265e3CUdOzcTVTFZ+qgn2KFlJ9Gp8GPy3Y4CcNPgjGy79vdQkQMySmS2pw+VtVjDA6QigINSAj3
 wZF6wfzu24Ywvoy8mukwGCfzqfmkEHpGZ+yVfi9UCoJVkrM/d261Sc+mYoYmeOnCwo5P4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNbbK-0003QX-63; Thu, 24 Oct 2019 11:48:22 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 69546274293C; Thu, 24 Oct 2019 12:48:21 +0100 (BST)
Date: Thu, 24 Oct 2019 12:48:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20191024114821.GA46373@sirena.co.uk>
References: <87d0ey64n5.wl-kuninori.morimoto.gx@renesas.com>
 <8736fu64lm.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
In-Reply-To: <8736fu64lm.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Filmed before a live audience.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 07/22] ASoC: soc-core: tidyup
	soc_init_dai_link()
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
Content-Type: multipart/mixed; boundary="===============5377541831171057207=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5377541831171057207==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2019 at 12:59:49PM +0900, Kuninori Morimoto wrote:
>=20
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>=20
> soc_init_dai_link() is needed to be called before soc_bind_dai_link().

This doesn't apply against current code, please check and resend.

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2xj4QACgkQJNaLcl1U
h9CNogf+OdPQZByA4dnqpnMKIBtbgxsMW299yu5R3HdfgW16ox8nSzXrkZR0Tw26
cefMZS3D+aJG4pZlNCXptrBU2+B5R4HgDkeZo3N56+uWMLE/Ob9RHd3w69pChufa
hH1/IO3RqGRF3F9nTrlODbLeiK0ZhxaACfHWov1UyioKXlVVSkRo59YM/kPS9eN5
wpL16JZ81X6nOZYeybLaAinyHuI3S7WazubjySjM/2OBvudX7uJ5hA9Me/pHUuVy
NxGls3/ToHUyoZhR29JJLVkFM85kARv9z66BJfdFf/7xIRBsG179T5MTe+4NS3vh
+Uu8rMSS0dcML+r9B/FxpaJ/HZ7sLg==
=PKyy
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--

--===============5377541831171057207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5377541831171057207==--

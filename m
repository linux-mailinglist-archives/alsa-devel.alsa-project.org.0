Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3BD223A78
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 13:24:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A35A4886;
	Fri, 17 Jul 2020 13:23:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A35A4886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594985088;
	bh=tHXHufgWfuOBgCZPBB6jyf/yLEDUH1W1shg16H3v7oo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pnZdhCSvb7TmSuG1jE9A4kl++hIeHPudk4mqLf0XxKO+O+zYhJEK64rPfDZqo9uB/
	 CcJsV/Re+CZZ50k2TT5eEgii4spu6zNfFIRbdfvATznwvxuyJprjAtEm4d5w8q8RhN
	 R5W4JKE2hPcHItEUiW8T8GJu+cCnk3o4uB5mbzgw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25B02F80229;
	Fri, 17 Jul 2020 13:23:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE74CF80227; Fri, 17 Jul 2020 13:23:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB87BF80110
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 13:23:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB87BF80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gq9lPHEE"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C0FDC20734;
 Fri, 17 Jul 2020 11:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594985023;
 bh=tHXHufgWfuOBgCZPBB6jyf/yLEDUH1W1shg16H3v7oo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gq9lPHEEpQaLxHOStgtiCI2pUNXcy2laEW8wipENK9pH5okAPVZrhKvXEM387qmqS
 HlYsH6pAhSjcPyWc7GD0noMLJTYsLFYE2c2r79/ANCLKlHQR1wL04Tv/tUbbZ9QYfL
 op9rVDE7fZ7Nu0fgtzlsorkSRB6dp0AebMWdkeN8=
Date: Fri, 17 Jul 2020 12:23:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: wm8962: error at soc_component_read_no_lock
Message-ID: <20200717112332.GB4316@sirena.org.uk>
References: <CAOMZO5Bhhcmm6ex0nP6MnYq0Uf8EMYCMMFOMav-fCrVJvOY+vQ@mail.gmail.com>
 <87o8of2gb8.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline
In-Reply-To: <87o8of2gb8.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: No other warranty expressed or implied.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Nicolin Chen <nicoleotsuka@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>
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


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 17, 2020 at 08:26:33AM +0900, Kuninori Morimoto wrote:
> > wm8962 0-001a: ASoC: error at soc_component_read_no_lock on wm8962.0-001a: -16
> > wm8962 0-001a: ASoC: error at soc_component_read_no_lock on wm8962.0-001a: -16
> >  input: WM8962 Beep Generator as
> > /devices/platform/soc/2100000.bus/21a0000.i2c/i2c-0/0-001a/input/input3
> > wm8962 0-001a: ASoC: error at soc_component_read_no_lock on wm8962.0-001a: -16
> > wm8962 0-001a: ASoC: error at soc_component_read_no_lock on wm8962.0-001a: -16

> > Despite these errors, the codec probes fine.

> > What is the correct way to avoid such errors?

> New component function indicates above when error.
> It seems yours couldn't read because of busy.
> I think it had been happened, but didn't indicate it before.

Right, IIRC the wm8962 had some registers that weren't accessible all
the time and possibly also some volatile bits - the driver will need
updates to handle things better for these widgets.

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8RijMACgkQJNaLcl1U
h9BHDwf/Wdwzr1Wb01xlSjCW4OGxihAcj8ikmyVs47EOpLQO0WqJFm6Xb4mq+E4B
Gl2srn8xC5u6Bhz/X7msx9rZ+q6csCbP/qILWGgzvJddtErGNjGlqs2ggzfN3jQH
j3pNMsiWpG9KNO2vI7iAxaczX6zN8LJ164kAKRVqdE1z1kjyutt7XgYDIN1DAc5O
Az6xZ8SFnwWbBd5xJ6Hb3m3YsC10xTKKInr+t+CnzF/q/fEzuckVYSpXgQ3fGZ1u
w1wk08Qg2molOInrH73GygL9adXpd7pWVYFKl4HSwlrrpb34wFjegOK3GWB7031e
RSVgAFUQBNPfFf+LiKlhHEvgAiK2yw==
=21cK
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--

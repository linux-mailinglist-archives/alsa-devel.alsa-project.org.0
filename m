Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18993223F5F
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 17:20:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A47631607;
	Fri, 17 Jul 2020 17:19:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A47631607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594999204;
	bh=RS6zSbkIqqcGrPuQyhiXMkqSgHUJmTOSt6lcBsCETjs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FRka5ntSyrYits3A3jVVNiDpccSMV+7pQyERTFqjj79IYhtJv/oHl3uC+tVjuowEQ
	 1kWmRNCaHWt3e75rW/wr0qU6Be4EcbPHUvSI98mKdaKetIy1jXljTkxhdbj0pIbpro
	 jBE8YCwLsqIXQthbF4MSn78Tr5TaMydu5GMVE5Wo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEE61F800E4;
	Fri, 17 Jul 2020 17:18:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF08AF80217; Fri, 17 Jul 2020 17:18:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8EECF800E4
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 17:18:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8EECF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oLrCBcii"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 07735204EA;
 Fri, 17 Jul 2020 15:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594999088;
 bh=RS6zSbkIqqcGrPuQyhiXMkqSgHUJmTOSt6lcBsCETjs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oLrCBciiORmqncK64Bcq2D9T82vkHN7zZrUlDjFCoIKcbug3yhyuCXUSAycset3O2
 DiBTvjVgmkyZPX/bSP8BnCaDOS49xDlLFNQ+ZNnMCoqhUoQZDcO67op7OZgrVJ+DYD
 Ca/X4C8T9PqTPZdRutfxMzDa8bVX2TcYosgrETuQ=
Date: Fri, 17 Jul 2020 16:17:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: wm8962: error at soc_component_read_no_lock
Message-ID: <20200717151757.GA36674@sirena.org.uk>
References: <CAOMZO5Bhhcmm6ex0nP6MnYq0Uf8EMYCMMFOMav-fCrVJvOY+vQ@mail.gmail.com>
 <87o8of2gb8.wl-kuninori.morimoto.gx@renesas.com>
 <20200717112332.GB4316@sirena.org.uk>
 <CAOMZO5D1BMjNcf-2z11uzCc46yCA2-GTWh+V28Y7WhrSAM_+Cg@mail.gmail.com>
 <CAOMZO5CjMa0JHfSrMdntmj1_gHoZoqsJhdjU8xR9-1LPupcDAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline
In-Reply-To: <CAOMZO5CjMa0JHfSrMdntmj1_gHoZoqsJhdjU8xR9-1LPupcDAw@mail.gmail.com>
X-Cookie: hipatitis:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 17, 2020 at 10:01:30AM -0300, Fabio Estevam wrote:

> If I move WM8962_ADDITIONAL_CONTROL_4 to the non-volatile region, the
> two errors related to this register are gone:

IIRC that register really did have some volatile bits in it, I can't
remember what they were or if they were important though.  It's not
fundamentally wrong and if the volatile bits don't practically matter
for Linux it would be sensible enough.

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8RwSQACgkQJNaLcl1U
h9B7YQf/Z/PgQt8jy0qM0uwMXx6B0b9FMHkVQtyTGzNDN+lSZtKhFYgkd8aee3Mr
01TT5eunx9an6vQqjBAPafaYtlny/rSHRM1G40svhhl5HV/WoKdnneTr3dZUPl+D
5ahrihLBei6QgiQejWKqWwklgK1pMiyrrgur5cDosvNpEjPECBBBWgQ2Y17/CPwb
JZz/tck6hSGd5vkXjOZAEThB6G2SN49fiNiDRIZYtMv9/vqHZF9hUbTGs3qerWF8
n92d3bezd0/Zuemn19H6ONIpLIWW2DCmvGI62SRmmFe686sDf+UuNq3092fXFjKC
5siShfjkgpjjOtnUYiAkUmM0CJWSIQ==
=W1Ny
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--

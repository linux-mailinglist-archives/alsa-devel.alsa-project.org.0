Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9E460768B
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 13:54:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62F52959F;
	Fri, 21 Oct 2022 13:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62F52959F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666353299;
	bh=KJhnl0M5yBG2dD3JOiVvCDClcYtjP++x/Ni7GrtQW2k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bOgqPg85rJ+QcmdHbvf49uubV9QHI9ryFYq2j1DUUBy6MWmyLG7igZKE7apP0L/t3
	 VO90Zhv9Ca139IwAhI6G/87Y+TrnLrE3CTkG/+StHS+nHtjQKAhMgW9nVCnwl9U12V
	 quonH8ZukSU+m/n4f6K3G3UgR5jT05n8r83fpu/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1DDCF800B5;
	Fri, 21 Oct 2022 13:54:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 003FDF80134; Fri, 21 Oct 2022 13:54:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB12CF80134
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 13:54:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB12CF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t81YNIzD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 884B9B82A2D;
 Fri, 21 Oct 2022 11:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B40DC433D7;
 Fri, 21 Oct 2022 11:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666353238;
 bh=KJhnl0M5yBG2dD3JOiVvCDClcYtjP++x/Ni7GrtQW2k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t81YNIzDw5GjXfpGl7y1vzZy959OrQi2J3gywq6fAWQf9WgVWvLTqdAXKv6Zb3C5+
 yAze1TdE41wibkVTyT5B1IRhzTqXBFIDQ19OwRhH87adZZxQ5Ka5Pao3i0LPxLOeJq
 xaLFPEYzrIMzMJSvOAkEVVmWNVskQGZ8D2ghozaqODi32+f5Ymbv+jxOIn0glBSioy
 5Iay+9eK3JgR6eFRmZvYY0YipKkzclFJLSqqw6ttAN+sK/cWrlHEvuTFJUdwbVIqD0
 EvGLCY02aglGYrBmh0PK5Fklx+Qtreru6BRy/3lafQuDc0Ot7AhHQyKdLcEL5wK5he
 OeTM7tMiobvpA==
Date: Fri, 21 Oct 2022 12:53:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
Subject: Re: [PATCH 2/6] ASoC: samsung: i2s: configure PSR from sound card
Message-ID: <Y1KIT4nk7C8SQ45x@sirena.org.uk>
References: <20221014102151.108539-1-p.rajanbabu@samsung.com>
 <CGME20221014104857epcas5p2a275a1d606ca066227228d13bcf5b120@epcas5p2.samsung.com>
 <20221014102151.108539-3-p.rajanbabu@samsung.com>
 <Y0lPz91gbovAub9D@sirena.org.uk>
 <04a101d8e523$30804b80$9180e280$@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0NRq6XULMyp1OM7X"
Content-Disposition: inline
In-Reply-To: <04a101d8e523$30804b80$9180e280$@samsung.com>
X-Cookie: PURGE COMPLETE.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rcsekar@samsung.com, aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 alim.akhtar@samsung.com, linux-kernel@vger.kernel.org
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


--0NRq6XULMyp1OM7X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 21, 2022 at 01:30:25PM +0530, Padmanabhan Rajanbabu wrote:

> We can overcome this scenario to an extent if we can get a flexibility to
> Configure both PSR as well as RFS.

Why does it make sense for the machine driver to worry about this rather
than having the I2S controller driver configure the clock tree?

--0NRq6XULMyp1OM7X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNSiE4ACgkQJNaLcl1U
h9AGOgf+IEqa8qDBK4xEe3hcK5GsxodK66zuf2kT88FfCFha0D2TVSs+NPkpUn7L
pZwG9CQwoe46jn3+jqPpW4zRh+R16km+qTITXYDB47Q1nhWLfniJDVVTdPe1QH+/
8kdEv3iM6CHGUDqbQli1zATLN2a31b0BMEqRIgMacO9cjxTUYGZAjFxnh3CB9LAp
Chcs+uexRoy6Rm7hhJswsqSM7fvq5HkJDgaTD8hoyd/03jvUpkapl3TWF/mbDgKG
Tu8SyfBzJU1bmmc5NXKX+FSuywemGUsfYTLt+8A693mt/ogxKQROj1SIOi3Mbzgl
hJd7F0TXV8+UxhsaY8JDMmTv6W6MEQ==
=kBk6
-----END PGP SIGNATURE-----

--0NRq6XULMyp1OM7X--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF83A43B0B0
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 13:00:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C0A016F6;
	Tue, 26 Oct 2021 12:59:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C0A016F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635246034;
	bh=yZUz/QuYYkWO/01uS2IOg3PHpb2ceRrPEJDx6J1/EhU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IemrNNedphKxhBmkxF5wL2Qx7hMo+seTYhROSRbF7ZOeJ2swQtKsaXcZfqnfkpA9A
	 X6eS3ekemOlJ8mPtP3GWdtG18zn86f5mqn4fpOXlGP9jdPnMcIKDsRnbBzTSppsuci
	 tTpgjFF91DdeKW7gkEBittsqpHzWfCJh+hDOe6kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C141FF80105;
	Tue, 26 Oct 2021 12:59:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 598A6F802C8; Tue, 26 Oct 2021 12:59:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D19C2F8014D
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 12:59:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D19C2F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YvJlRdjZ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 35B4B60C4A;
 Tue, 26 Oct 2021 10:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635245950;
 bh=yZUz/QuYYkWO/01uS2IOg3PHpb2ceRrPEJDx6J1/EhU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YvJlRdjZ1OT6s5VvujzEnjLsub3bpXHGt75wPj+70H49YXS6H6Z1PMt3GMQfqXtA8
 M7KgC5VRuzD5yv3uNHwbOTmDWLyYT5DN3dYjKaByvpDks6KuhoOQZ2i13ANK4Fe5U3
 veuqa2I9gnM6ViitmS9X9ov/RxulfggeOc7ZqFTJ1izWs37bnHYe1woG5fFgTRPOZq
 umVI20PrvmoWXxcUGYsMio3ahZzqx1pXnYddGTjSMx3q4UABs/sWypZncHTJFhvL0y
 NgQhntxDQVqRe+gexyysowXmfA4iH/rWMt88GxaS6Ga6+7BINFsEJ8ncDD+UsEV/VE
 Gr72fCGuzE4kw==
Date: Tue, 26 Oct 2021 11:59:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [RESEND PATCH v10 00/17] ASoC: qcom: Add AudioReach support
Message-ID: <YXffedeNCJCDiI88@sirena.org.uk>
References: <20211026103815.19468-1-srinivas.kandagatla@linaro.org>
 <YXfc18+fqBNajHX8@sirena.org.uk>
 <ef6377b1-5cd4-dde2-b2ec-a7c0ccc17dd0@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ucFHcU21Z62t0xTd"
Content-Disposition: inline
In-Reply-To: <ef6377b1-5cd4-dde2-b2ec-a7c0ccc17dd0@linaro.org>
X-Cookie: Times approximate.
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, lgirdwood@gmail.com,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com,
 bjorn.andersson@linaro.org
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


--ucFHcU21Z62t0xTd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 26, 2021 at 11:55:37AM +0100, Srinivas Kandagatla wrote:

> No, this is not different to v10 which I send out Yesterday, v10 is meant to
> address the arm64 build error that you reported.

> For some reasons yesterday's patches did not reflect the changes that I
> wanted, so I RESEND v10 again.

OK, but that means that this v10 is different to the v10 that went out
yesterday, right/

--ucFHcU21Z62t0xTd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF333gACgkQJNaLcl1U
h9BFqQf+OzHPX9GaPX0JK2jeA+wWbLwPNaYivIANCZW9zdrl3j1xj+gsl/wnsX6J
hPLF5RT/Yz/SKWCzh0L4J5G+UHVJLVgXm+MMAAaOnomhg7krObJu3LsD1wq4c6ij
g7ps2brkVl68ZelWwPo40d8IZIlNVY3TgqHL/hA3O7qNIeoTm69eDJp9Kt08imvp
OkYJHYbMSzC5/irdEdnc7TQ0GnUP3920hMWpXU1xY8Ntbc7ob0zqz6bCN2RkKWif
7LUy+IYVH5XCTKN/uQ5OEgJR2XPtCicl+lhd+MSmQaJwhTDfBkVT7emET6cRAWZd
jt6b1uEnL414LODmVTj44rpCBGPWtw==
=4lT9
-----END PGP SIGNATURE-----

--ucFHcU21Z62t0xTd--

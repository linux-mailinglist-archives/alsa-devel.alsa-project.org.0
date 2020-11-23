Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D97C32C16AA
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 21:42:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69189167B;
	Mon, 23 Nov 2020 21:41:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69189167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606164154;
	bh=l4oI3EJf9twL417qKLDDDLHkuxNIhLOKXfN3lkF6Kxg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QfxFcR5SCm0pjZHIWhwUahpiTuhcbC+WbugsIo7R2ceHDnvHr2a7A7haIO4wlYiul
	 ZY4hbvd1a5oKntfCCotHZmNp3QzTNWIeWKs/XERuYtClVFw3sc+CdqXq+zHWBxCLaq
	 D2bHn5wGOx18uP3CLzmBcWqYEh/zHs9UA9reIynM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D90F9F80268;
	Mon, 23 Nov 2020 21:41:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80774F80268; Mon, 23 Nov 2020 21:40:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 984C8F8015F
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 21:40:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 984C8F8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dI6Y/FEB"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC74E204FD;
 Mon, 23 Nov 2020 20:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606164053;
 bh=l4oI3EJf9twL417qKLDDDLHkuxNIhLOKXfN3lkF6Kxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dI6Y/FEBhMomP9yXJDZL18c5N1fJUnSufmLsfsEErCEx1I73uujBVn+VmR2nTBil2
 7st2qM1JoV+aEr2XQJCNbg/JTowpnkJOkAAUW5m9jaxq8C/w1ZUMTqrjWm7inA4kgh
 US9uOR3tP2rC+WdSErFnKjZ9+DgugTP0ToQkJ/y8=
Date: Mon, 23 Nov 2020 20:40:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/4] ASoC: meson: depend on COMMON_CLK to fix compile tests
Message-ID: <20201123204030.GA21709@sirena.org.uk>
References: <20201116175133.402553-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
In-Reply-To: <20201116175133.402553-1-krzk@kernel.org>
X-Cookie: Will stain.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Olivier Moysan <olivier.moysan@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>, Takashi Iwai <tiwai@suse.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, kernel test robot <lkp@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
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


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 16, 2020 at 06:51:30PM +0100, Krzysztof Kozlowski wrote:
> The Meson SoC sound drivers use Common Clock Framework thus they cannot
> be built on platforms without it (e.g. compile test on MIPS with RALINK
> and SOC_RT305X):

This doesn't apply against current code, please check and resend.

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+8Hj0ACgkQJNaLcl1U
h9BQUQf/Zb+qnudCOxcpsy60ses8As7w+FYZS80ubduXvGWgILbXemT1oMzbNgmK
OBkiqTnFNc6tff+PV8KL223IYl0NE87wbj+TZtPLS2kwcmLzGYN5Nk6tOJ/BqNaL
NZGwQweuvCXNOZgVaqRuCp2am79NZzjniDlGELtbcdX1bnrbKQqrpfl+OQYOXBxs
u/xwWXzpd63eM4B4tN8a4S3TsUzJvuypdWshYHELUV5vsxSCXp1NWiire0N1SPO7
bnkqkZUg10ymAq75x5OE6laeMbsDfwWnS9tRnOJxnN4H8oTMcmzxTQiFD0922P0s
w0Jrqx6xOb9ZoR7U22kR1FHwhkpH8Q==
=Zs8x
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--

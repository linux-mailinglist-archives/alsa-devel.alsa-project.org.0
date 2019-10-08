Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B08CF784
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 12:53:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13B7B15E0;
	Tue,  8 Oct 2019 12:52:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13B7B15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570532010;
	bh=kicgS2dbkCNmQ4kj7ynuGAERCSlEswmHplJplqUvWL4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WkhHlpS5D5RtmrdpQx4fOZxz5f+n3IunjFMNlPgJf1PcIuDHBjntCFKMYba5/6/rE
	 Gx/33M6UtJ/UPLo1Kg/BHTMGkcwSFlFOPMmJZFi3tT0yQ1AiRlzacT9IGTUzFXB4H6
	 oog6OgWLxL9gtpHgFtaIuLRipVup+0NUN0Laev/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72505F8045E;
	Tue,  8 Oct 2019 12:51:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BA34F8038F; Tue,  8 Oct 2019 12:51:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFB63F80113
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 12:51:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFB63F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="KXdeDi3G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vh6UTjhIlpWT+aAXikn/Jf7Q8Ynjki6ezcQ4zBeo/Sc=; b=KXdeDi3GHvChI7w5u2JwEO05+
 CflLaov5hwYVLljNIFjlOEJX5jtcVjvFDyQnDgGrYtxInXA1HzZRPqTBQjC/KevmwahwKZa/Oft8k
 NWrF6QYb2fKuVPCPTI7jX0ZH49ZQgcRsz4W/swDKNc70sjLypiMcPpVryQ9Ged7rNF7b4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHn5f-000833-35; Tue, 08 Oct 2019 10:51:39 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A07712742998; Tue,  8 Oct 2019 11:51:38 +0100 (BST)
Date: Tue, 8 Oct 2019 11:51:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>
Message-ID: <20191008105138.GC4382@sirena.co.uk>
References: <8f933cee57fc4420875e1e2ba14f1937@realtek.com>
MIME-Version: 1.0
In-Reply-To: <8f933cee57fc4420875e1e2ba14f1937@realtek.com>
X-Cookie: Do not disturb.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "cychiang@google.com" <cychiang@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1011: export r0 and temperature
	config
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
Content-Type: multipart/mixed; boundary="===============7227531457770527490=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7227531457770527490==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sHrvAb52M6C8blB9"
Content-Disposition: inline


--sHrvAb52M6C8blB9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2019 at 09:33:24AM +0000, Shuming [=E8=8C=83=E6=9B=B8=E9=8A=
=98] wrote:

> In chromebook case, the machine driver will get the
> r0 calibration data and temperature from VPD.
> Therefore, the codec exports r0 and temperature config API for it.

Why will the machine driver do this?

--sHrvAb52M6C8blB9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2cajkACgkQJNaLcl1U
h9CnKgf/VNp/vGnJ+E2Hvsa9rFXRqofevj2MxVqn7uySU/c+SGl7yWtuDyT7s6jM
cZUAYNDdGKlZU4EEw64NLlFgtb41PJlRLpCKU4dXSZ2n0LG1ei5yQSfgDQXWYj0f
cJEFqe13fsa9mm93tAnP90VJv5vivwnS4YU0mf+6WXtA+h70pdmUr0MzNHVYM6vi
pb0MF5tQoSFGP0GKDAoaTwLLwSlGUNI0sRYSQkWyAZ6AtmIadcoCKFyBsVXdLN6i
IzzaxN1L2pzVm25I0rWSYx5eZNLYP8cwDawnlE6RulaczTGP/dzfjMT6VTLQgdMA
htuzsgJw8vzbZqEJiMDN/PDfbwf3Gw==
=RSd6
-----END PGP SIGNATURE-----

--sHrvAb52M6C8blB9--

--===============7227531457770527490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7227531457770527490==--

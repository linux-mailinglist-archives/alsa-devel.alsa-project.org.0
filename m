Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCE6AD739
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 12:49:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D42ED166B;
	Mon,  9 Sep 2019 12:48:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D42ED166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568026180;
	bh=r/jNkDT8vrQTFIY3eBP9SO7kEaetKhw0irPQdwMdo6Y=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iksge5l5VJa7AeI7cl5e/s4hankDKLNaguLKyoAUhypG+4zFnLvLSzqMyX6aYHDQJ
	 ok+fUpMEWfvrAvDaAKkIAm1KlOeoxeLsaOqTy+sqX1cp0Hxik+NB+raWdiYUZHqlfX
	 1T1cAH0w5IPNQAQKqttE1+Sr/21+r5ABJuvqP5wI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DED43F80736;
	Mon,  9 Sep 2019 12:38:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8889F80610; Mon,  9 Sep 2019 12:35:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9132AF805FA
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 12:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9132AF805FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="s8n7ysqp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bCoYPwoACOe1ADyWJMnXzh8Y3ZmiccgqhIqgWRM+fi4=; b=s8n7ysqpWFdjnZVdjT2OwgEbF
 LHAXtJjvXEdPw2djWmBim3ljJjWp8L/voTreb5oc4BZ+ufcaBjfwWpqC3C1pYzcGYXOcSDPJqeMxL
 UP73Y0RBm1qLREDpwxMw60zqPAGHexQLf8hsOJC/+xCiW/ztqDV/P3AdpzSPzB+EkZ7sY=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i7GN4-0001lL-OV; Mon, 09 Sep 2019 09:54:06 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 03C3ED02D18; Mon,  9 Sep 2019 10:54:05 +0100 (BST)
Date: Mon, 9 Sep 2019 10:54:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@chromium.org>
Message-ID: <20190909095405.GA24341@sirena.org.uk>
References: <20190906194636.217881-1-cujomalainey@chromium.org>
 <20190906194636.217881-3-cujomalainey@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20190906194636.217881-3-cujomalainey@chromium.org>
X-Cookie: Orders subject to approval.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ben Zhang <benzh@chromium.org>, Bard Liao <bardliao@realtek.com>
Subject: Re: [alsa-devel] [RFC 02/15] ASoC: rt5677: keep analog power
 register at SND_SOC_BIAS_OFF
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
Content-Type: multipart/mixed; boundary="===============8986060358094839908=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8986060358094839908==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 06, 2019 at 12:46:24PM -0700, Curtis Malainey wrote:
> From: Ben Zhang <benzh@chromium.org>
>=20
> Instead of clearing RT5677_PWR_ANLG2 (MX-64h) to 0 at SND_SOC_BIAS_OFF,
> we only clear the RT5677_PWR_CORE bit which is set at SND_SOC_BIAS_PREPAR=
E.
> MICBIAS control bits are left unchanged.

This is a bug fix so should have been at the start of the series
rather than depending on the naming changes you had as patch 1.

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl12IT0ACgkQJNaLcl1U
h9BB9Qf9GTyZiKm3ZoFd207G91+AW1WX7s1aLfMKq5VZFBO9xIOLLitSW3ZRBgyJ
AEcv+S6qbEeOiqWaVGHw5hVr9KNldEI2y00spU6rde8sd37bVtHN+XTJ0WFvHDWJ
v0GA7iVMEKzoAmCTKafR/pCd566g0Boc9OaBGPbwgW5f7Kyx0PpSnudvkb2PzB2V
9AA3zDTkV7a+qHtRSKCaArcNlaVtZpguXl/V/1IZihSL2ZOPhhoIfQFPwwUDFTTA
Ur59non4JoXxqxAMPdLBHONBRlQOGZyyYQxnVB5uNGPUjRzh2h8HVfjSsbTys3IL
q8Yu+QpwCx9nVDiODVDknrje/aT9fw==
=U1HG
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--

--===============8986060358094839908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8986060358094839908==--

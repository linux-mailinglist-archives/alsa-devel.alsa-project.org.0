Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B53435CFBD
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 14:47:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CAD1168A;
	Tue,  2 Jul 2019 14:46:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CAD1168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562071669;
	bh=Uz2scrkCb8piLZc11HcZfvCfU/m2dA3CnZcd7AJlMN4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OMg2NT41j0ipkerjhWwoUUEZ9HCdERzgurPXf6SQ6spaNmj8i/p9Bczsi5xS3J77e
	 aZlPPExL5Fa2UVQBApQSpBo2TZAufWJ1FcBi5zVy+EYS7r1GKt4Ygu7NN5kbGsympG
	 CyKDTXIixOS7kNbgtedDA9GsECo7l1H6TjLysPC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 734D1F800C9;
	Tue,  2 Jul 2019 14:46:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC21EF800C9; Tue,  2 Jul 2019 14:46:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A427F800C7
 for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2019 14:45:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A427F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="re+7Xkm5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m9vZZjftE6nrleq4XnFKIBeYiwMtLv7m0Et034N3p9w=; b=re+7Xkm5NFU6vFD7HVUwiMuUg
 eXbdUO7Q4EY06yIMC1xddiyJ/jw9Z1ICYuPOGpz61fBlRtV651jNcJuaWLE4EItvl3+Izm11Y2Nwm
 8OH1sXCq78tT6xqJAjLPzciwaTpTAKCeTGaeyEqK3yKkzch7cmPgtDGK35574xgAo3pEs=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hiIAY-0002LG-Fr; Tue, 02 Jul 2019 12:45:58 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id DAA0D440046; Tue,  2 Jul 2019 13:45:57 +0100 (BST)
Date: Tue, 2 Jul 2019 13:45:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190702124557.GL2793@sirena.org.uk>
References: <87blyitky2.wl-kuninori.morimoto.gx@renesas.com>
 <87lfxms66q.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
In-Reply-To: <87lfxms66q.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: This sentence no verb.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 18/23] ASoC: tegra: tegra20_i2s.c: use
 devm_snd_soc_register_component()
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
Content-Type: multipart/mixed; boundary="===============9160777682229144449=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============9160777682229144449==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RD6GsZsdEJvsf78O"
Content-Disposition: inline


--RD6GsZsdEJvsf78O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2019 at 01:10:40PM +0900, Kuninori Morimoto wrote:

>  	if (!pm_runtime_status_suspended(&pdev->dev))
>  		tegra20_i2s_runtime_suspend(&pdev->dev);
> =20
> -	snd_soc_unregister_component(&pdev->dev);
> -
>  	clk_put(i2s->clk_i2s);

Same thing with clk_get() here and for some of the others.

--RD6GsZsdEJvsf78O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0bUgUACgkQJNaLcl1U
h9B7lQf+I/eIcGxEDztFWUuOMBiZWGEc9NsHtgHoqoy9D163ZxGeVHXnTeyuA0xp
/hS74HOO2zJTVTsjtI/C3bJc2mVA4/8kmBtBNzmAdhZk8/VhC1Q5+7fmkrQ+wPuI
zpVVuIEIxlaZWX3mlI67I+F0GA4x2QICGUlSnhlAADxr8k+pfL3MI+xOlKoAfTNc
QipoindEdY6+pbfEh+Kljj2EDXMPyXtjt1wbQdquk++lmpMgWPLd7GtnQJYJ24YU
WKMznh983x9jvswdTG0hRL0LHdD/mpqe0B0ccL6Aej4xj+lINWKElaUGwtzCFWc1
3NIzMgjFdNDFCitmz9gAZyURFNCmKA==
=DHHF
-----END PGP SIGNATURE-----

--RD6GsZsdEJvsf78O--

--===============9160777682229144449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============9160777682229144449==--

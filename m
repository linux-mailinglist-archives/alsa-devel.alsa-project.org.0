Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2431D969D
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 14:48:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEED01763;
	Tue, 19 May 2020 14:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEED01763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589892504;
	bh=Wn7kODNP87IZf6dtuMn2zAhZvTFZFFR+j0VrIcOiyxw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q7HRzDdYvBJ9IukV4Zst/rRIKj8ZiQy7AnAaA/02MM97I2qg8Hp8y6CJVHuUN/GPV
	 8gRWIrbF8oa628YcO+C9kDnRfxaHHeM2Zmm/7x8RwjCZs991o5f++lKr6YDmI4WwQc
	 BekE054PK0EDpMW1YWbHK3dGbzh0N/wft1J7swKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72777F80256;
	Tue, 19 May 2020 14:47:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE10EF80229; Tue, 19 May 2020 14:47:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FA0AF80161
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 14:47:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FA0AF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="taffVJzC"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 601DC20657;
 Tue, 19 May 2020 12:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589892436;
 bh=Wn7kODNP87IZf6dtuMn2zAhZvTFZFFR+j0VrIcOiyxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=taffVJzCdPeEtwdctDn8/MnZeoZdx+teX9CrwsziO3D/ItvSp4IIOIxW4GbbaBlgr
 GeU0dkQQy7fcNlDFk9UjAaUdBSzRsPCThsAAhLalYteBisGF00e7Az5Bn53jaHZVMq
 v6/2FcbM/jmvzuQPnDnkS99JAbwUon6f4iSc0GsA=
Date: Tue, 19 May 2020 13:47:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] ASoC: fsi: Add missing properties to DT bindings
Message-ID: <20200519124714.GA45550@sirena.org.uk>
References: <20200519075858.27869-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline
In-Reply-To: <20200519075858.27869-1-geert+renesas@glider.be>
X-Cookie: Revenge is a form of nostalgia.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
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


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 09:58:58AM +0200, Geert Uytterhoeven wrote:
> make dtbs_check:
>=20
>     arch/arm/boot/dts/r8a7740-armadillo800eva.dt.yaml: sound@fe1f0000: '#=
sound-dai-cells', 'clocks', 'power-domains' do not match any of the regexes=
: 'pinctrl-[0-9]+'

This doesn't apply against current code, please check and resend.

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7D1VEACgkQJNaLcl1U
h9DCyAf+Mts3phRcq2EK6k0s7OwrITSyZjBcJSn14GIEgkGBkpkNQr+QPKPL+eo6
idw4I53ebOG/syRplLp/sOLf65GzGWjQOouCjygXM5g6sjIisoKQX8VrRuJLhrf1
V1XUO/SLkgA9So+6fmIib9UamvwkuwnABP2qrjNiKv0ZV9C5wLasbKs34hDYOuVd
U5WmBI8JGlRefRLM5NAE1kDVOtMbyM9UWh+t1X7Eoz2dKdObHhavKPiiFqOdqkrD
3+FQ/BiaP5TtCd7Cg72GQcz5iaFORB02pOUT+nf9/804g/hPqxAVKXnuMP2QuRlg
+bPQrkcD4c5VhPHNQrQHKdem1jVOEQ==
=CChR
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--

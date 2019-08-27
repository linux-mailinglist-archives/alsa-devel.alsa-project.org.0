Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1349E602
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 12:45:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1BB51664;
	Tue, 27 Aug 2019 12:44:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1BB51664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566902747;
	bh=5JJS6psLaQdutOvv/J3e0vK9InI0U5ND77fGDJVOdAA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hMAlZYZDJR8vY4NjM2ITabTQQllyuiCtSfo7YP4L6OUDGUhXIBDaySPhz8oiMJGuY
	 JT3TXuOxElFWoLTdL1Ri4xDYa/xjm3mdhsZ/U6U4R05BJrcr4hQhSQDE2p9c6EKJSF
	 iBnPRK5C2p4zlvQcq1JcV27EhwFY0Z9DpaNXoMg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F9A3F802A1;
	Tue, 27 Aug 2019 12:44:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C03DF80274; Tue, 27 Aug 2019 12:43:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A5E9F801ED
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 12:43:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A5E9F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jEwtKJ1Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UWpP6ASANjGbwqBx1gdjtA+jZ6LbnLc6oEyLnl6i6zA=; b=jEwtKJ1Y2lIRNkHGplE6Ps3ZH
 0JGFaedxuxOerP9ta8l3ibZ4633GzaanL+q2VhxSGuait022o7wFIUr9b1zdoh0GXJOG0hBrbXokg
 WB4IbMiMo9efixMQ6kj9pR/dzrY83khLeOo/TXZRbPC/nWk6RoOTnNoKL2xTxie/dtXb4=;
Received: from [92.54.175.117] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i2Yx6-0007sZ-Tm; Tue, 27 Aug 2019 10:43:52 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 6A743D02CE6; Tue, 27 Aug 2019 11:43:52 +0100 (BST)
Date: Tue, 27 Aug 2019 11:43:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Message-ID: <20190827104352.GY23391@sirena.co.uk>
References: <20190827093206.17919-1-mripard@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190827093206.17919-1-mripard@kernel.org>
X-Cookie: Don't SANFORIZE me!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, codekipper@gmail.com,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 1/2] Revert "ASoC: sun4i-i2s: Remove
 duplicated quirks structure"
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
Content-Type: multipart/mixed; boundary="===============8347077868024703932=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8347077868024703932==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="15k5Fuw+yLfT1d9X"
Content-Disposition: inline


--15k5Fuw+yLfT1d9X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2019 at 11:32:05AM +0200, Maxime Ripard wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>=20
> This reverts commit 3e9acd7ac6933cdc20c441bbf9a38ed9e42e1490.
>=20
> It turns out that while one I2S controller is described in the A83t
> datasheet, the driver supports another, undocumented, one that has been
> inherited from the older SoCs, while the documented one uses the new
> design.

Please use subject lines matching the style for the subsystem.  This
makes it easier for people to identify relevant patches.

--15k5Fuw+yLfT1d9X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1lCWUACgkQJNaLcl1U
h9BE5wf/e1I8LfUK6KLnXqxYzxIjCX6f4JtBiqFI99GurXQD/tNK1q7Ldszv3Cwc
diESenhKUbt+tMgtus6JWeI71/T2BN6A1fewE6n5rhLl/tny4kmlcIlBsZIPV2z6
WFmdU15AGyRSRBIRkQwGYBxA5ViTMQqeWKXtCenIkxypv06TsBqQr047rvlgFdEf
anti8BIGziPLJtyCkpU/iCV151N9K5priltDgw0FKN0nogcyUAUWXcaAjbQi0kQe
FYtUKi/Rl3XQKqGkL4h4Z80VTlXbq60QH1npUmR8Y0WpecEci92PJ3iOmqciwfe9
sbKc1Q/++txkY4XUgNv+RDvt9Q4/zg==
=bQV/
-----END PGP SIGNATURE-----

--15k5Fuw+yLfT1d9X--

--===============8347077868024703932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8347077868024703932==--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE62F15E7
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 13:15:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A11EA16A5;
	Wed,  6 Nov 2019 13:14:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A11EA16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573042509;
	bh=/xmlaQVXRhsgsxQPNad4ebNq3s7eu7r4vKgYNA9p4wg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lU9Y++h7xZIhRjzBMMGKVjR+ZWhPsMGvQw46nDTYrcyBr1K9xK4GJ+pymhUI55Nl6
	 A6v6AQicscKSJDJPTKCt5VL0lGgwtUwjoNFaI5EifPEnCInpD23kb1MGwPr+qxrVs1
	 D82Z/VqwNuqs/nrhEK+FIa/+4kR5AH/gJg5TWRRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4325CF8048D;
	Wed,  6 Nov 2019 13:13:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74F70F803D0; Wed,  6 Nov 2019 13:13:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00FC2F8015B;
 Wed,  6 Nov 2019 13:13:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00FC2F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="tyWGGmIg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8OkFhjqnHHDimjh3kNYigriAaDRNxTtnxl3F/wSWgO4=; b=tyWGGmIg5lpIkDPc1T4eRbPcf
 ukghfI+MIRb4nNzy7h1+MnZggP+iQhGQUNuhkzNo5+WDf6lI7ab7FXZXG6pIlJFFcPF5J3cvITG0k
 jJQI5958xcxrQvR1QzuEVQNvUt9XVa4ByY6caF8PZw1MlGI/miryb7AcwXCgb/fpDeepo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iSKBb-0001NJ-4e; Wed, 06 Nov 2019 12:13:19 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7A24D2743035; Wed,  6 Nov 2019 12:13:18 +0000 (GMT)
Date: Wed, 6 Nov 2019 12:13:18 +0000
From: Mark Brown <broonie@kernel.org>
To: syzbot <syzbot+f1048ebddb93befb085f@syzkaller.appspotmail.com>
Message-ID: <20191106121318.GB4544@sirena.co.uk>
References: <0000000000004dfaf005969d1755@google.com>
 <000000000000b9dd9c0596ac5b94@google.com>
MIME-Version: 1.0
In-Reply-To: <000000000000b9dd9c0596ac5b94@google.com>
X-Cookie: No line available at 300 baud.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alexandre.belloni@bootlin.com, alsa-devel@alsa-project.org,
 maxime.ripard@bootlin.com, tiwai@suse.com, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, alsa-devel-owner@alsa-project.org,
 lkundrak@v3.sk, peron.clem@gmail.com, tiwai@suse.de, bhelgaas@google.com,
 tglx@linutronix.de, kirr@nexedi.com, linux@roeck-us.net
Subject: Re: [alsa-devel] INFO: task hung in snd_timer_close
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
Content-Type: multipart/mixed; boundary="===============0630576507752654509=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0630576507752654509==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline


--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2019 at 04:05:00AM -0800, syzbot wrote:
> syzbot has bisected this bug to:
>=20
> commit b2045303147254d01b1db90a83e5df3832c4264b
> Author: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> Date:   Mon May 27 20:06:21 2019 +0000
>=20
>     dt-bindings: sound: sun4i-spdif: Add Allwinner H6 compatible
>=20
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D14acecb4e0=
0000
> start commit:   a99d8080 Linux 5.4-rc6

This bisection is clearly a false positive.

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3CuN0ACgkQJNaLcl1U
h9C/tgf+OL9uHYsC4lsb0+2dZcC9mIuU5eRO1OGKyj/Xs+3IQzoSdG8lmnAzGOnN
9u9rGTWJmcjpjdTI+ir/OvOuj3EiIVaHI74Sg7ZcByEr0VApnnGd3uWhWy+TwSBp
Q+hhd9YWbC/em3843B3lmwUq/OAj178uTaQ/ZrNxhiK3vZZlloiZg1OoKE3eGXIz
IGSjn8VRTmZZV4VBRZtlr6DkDzuujg2a0f8cdHboIN+UICCtav/4U5UJNKzqSBXV
+6kEZZxPeE//jOjMW3+DLwiGkh05BQuM1F010oVKUs6pDTBrKlZ3WI2mPgB5tZ5S
eESyKon52UVVzt8flxZuQ/UDWmbShw==
=Whut
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--

--===============0630576507752654509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0630576507752654509==--

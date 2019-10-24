Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3C3E3169
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 13:50:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ED941699;
	Thu, 24 Oct 2019 13:50:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ED941699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571917858;
	bh=iOkMdzuJKs1E4dk+Of8vp5QuPPjxy1DrAoWB5oPeKio=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C+ZxwpAWG8oMJwPHXnlHDeytDPB01ZmpO4ieVneyyG2k5yILLxzkrcZi6jB8GDJAl
	 mGQnFbtWrvgeMbqfCHhDly4NEyJPrSH4q+oJdzDWEwoCQMas9JUxDU0Gu6CrrwlqOX
	 CmFP4Nzt9F7Xhtf4U1SfBKE8UEx0nW66G/keF+ls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA616F80377;
	Thu, 24 Oct 2019 13:48:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE145F80377; Thu, 24 Oct 2019 13:48:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 539CAF80377
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 13:48:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 539CAF80377
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="TGKwTSId"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rya3DttOH7mGpBbYccvVcDmtBP1uPjK2Qmqfw3ceCVk=; b=TGKwTSIdFblunuhkY+f6Bfi00
 GTxrJlfklmPP8W2Hd8cfd/597oR1jUpVNrypPoQmpTBvZMb+4QCs7ti5oLHJLLyd5O2MN3FYZjxzA
 7721YxpFhYwjN+ew3EjkivvS8nSPljUfJ2rhmHKlgb6YsS3XP2sgZx70hCZw/RuE6iToI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNbbZ-0003Qd-Bp; Thu, 24 Oct 2019 11:48:37 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D4724274293C; Thu, 24 Oct 2019 12:48:36 +0100 (BST)
Date: Thu, 24 Oct 2019 12:48:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20191024114836.GB46373@sirena.co.uk>
References: <874l00yzxm.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
In-Reply-To: <874l00yzxm.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Filmed before a live audience.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pavel Machek <pavel@denx.de>, Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: soc-dpcm: tidyup for_each_dpcm_xx()
	macro
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
Content-Type: multipart/mixed; boundary="===============2470744408051668080=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2470744408051668080==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Content-Disposition: inline


--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2019 at 11:10:29AM +0900, Kuninori Morimoto wrote:
>=20
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>=20
> for_each_dpcm_xx() macro is using "dpcm" as parameter (1),
> but, it is also struct member (2).

This doesn't apply against current code, please check and resend.

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2xj5QACgkQJNaLcl1U
h9CDawf/ZojyJKkZvZPUlzXIwc3Njz3F6Am2uSfsQdQBuLm2Ia6Dwx8mKV1huj1g
dlPzxUzjrcY6CjkOWEKqKymKIk7lHC76a9DncdieBN0mLzI9UXsILItlxQg66POI
cKHkHnRKXVgpGpNlhi4089JCSMf926XEJ424MS20FdnYr64KeXAtbglmtpRGqUKM
pbtJNlgYivfrmCJa73Sx6SHqLMxJcvEdN5TsbzZUX1nurdBNPKdQRpxg6QMXIFeW
XrLa+Gh16W9a77XxnCjhN2Zm0YnLVQeX7UeBmuRYbixnF8umYquDey9pKPe/j8Dn
vvJfviXJ4xw2H0MU3hHA9IiNar4E9Q==
=ZM/x
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--

--===============2470744408051668080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2470744408051668080==--

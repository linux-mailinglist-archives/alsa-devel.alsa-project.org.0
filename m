Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38951A1CE4
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:35:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE3341694;
	Thu, 29 Aug 2019 16:34:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE3341694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567089304;
	bh=sw78fgX82rf0FrwDCDpzLk3mTvFUdPQ1IgQLvJ04HMo=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aPZ+q++Sxu+u7ltUXSOVB7xb9jVNTX6V2pNVoGlTKMMIPBv1eCMSiAKZxyH80xKxL
	 S5U/EaoWePqS2P2ybdj8hKrJu42yTsw+AcOmnRt3omAokNCDF6V614MyhyFQmgMzjH
	 PjSWms9OPEPIrLTt3/+IS3PWA/9ZdCyf7NPMGhaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E936F80792;
	Tue, 27 Aug 2019 22:28:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4825F80794; Tue, 27 Aug 2019 22:28:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D68F3F80792
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 22:28:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D68F3F80792
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="KieZtpl8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tzbApj91/4h0+MwW9ER2voR7yLuJqGh0Fb8MOhLu5tQ=; b=KieZtpl8vXpPIB5S37aY6Z6bq
 jWMoeIXrGy1pP4C/3WWossYtHVHGzUw5+m3ggiPQjju9D+Cm5AUidSVWxIRZZmDG1Q79twYtjflxe
 rPh0Sy/lM2SF6PYHBt3EQffJg+YezoazuUPc5sPE1UTbPTrSn8if2xyt0H/cfyGdoBUzg=;
Received: from 188.28.18.107.threembb.co.uk ([188.28.18.107]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i2i4p-0001HI-7U; Tue, 27 Aug 2019 20:28:27 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 5546ED02CE7; Tue, 27 Aug 2019 21:28:25 +0100 (BST)
Date: Tue, 27 Aug 2019 21:28:25 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org
Message-ID: <20190827202825.GP23391@sirena.co.uk>
MIME-Version: 1.0
X-Cookie: Don't SANFORIZE me!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: [alsa-devel] [ANNOUNCE] 2019 Linux Audio miniconference
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
Content-Type: multipart/mixed; boundary="===============1042747908503678484=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1042747908503678484==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sV6E+871crhbObqU"
Content-Disposition: inline


--sV6E+871crhbObqU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

As in previous years we're going to have an audio miniconference so we can
get together and talk through issues, especially design decisions, face to
face.  This year's event will be held on October 31st in Lyon, France,
the day after ELC-E.  This will be held at the Lyon Convention Center (the
ELC-E venue), generously sponsored by Intel.

As with previous years let's pull together an agenda through a mailing
list discussion - if people could reply to this mail with any topics
they'd like to discuss we can take it from there.  Of course if we can
sort things out more quickly via the mailing list that's even better!

If you're planning to attend please fill out the form here:

    https://docs.google.com/forms/d/e/1FAIpQLSd6FV-tWYZ1fHlCmyzQhG98OtYH9W9GX-1dQ88mnLxVRGyPww/viewform?usp=sf_link

This event will be covered by the same code of conduct as ELC-E.

Thanks again to Intel for supporting this event.

Thanks,
Mark

--sV6E+871crhbObqU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1lkmgACgkQJNaLcl1U
h9Cwggf/TW6VBkkm7wLN2V4enbv4Yemn7buOp13bEX+cX86221Cv4vtNOBne2Q6L
7mpr/ZI2EtYFeEBkL9ozg+UFErxtZyYw62Nd5NrI9R/UUDDsqsua2JuY4JWg6qDR
q8q9DKF0EyIyJ9KtcZo9dY04dl5Hp/0rGNS+9zME5GHBEF3rV8qm5lsNdyPje1mJ
nL0rIQ9tCWYMmijX2njVt1TbZ8aAWQpCJswiLvFAz5h5BeQqGbCPUN92iR8kOpOf
KqdY5vDGlIQmGgEEWrvNRoPdnYgExFUHsFDch9ZElMlNIwM14xP7mwc+q3nydvxn
Q7lguaSgjX0mR+my+1pW56PK6/CcJA==
=6tZV
-----END PGP SIGNATURE-----

--sV6E+871crhbObqU--

--===============1042747908503678484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1042747908503678484==--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 996C413D982
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 13:01:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37ED817DA;
	Thu, 16 Jan 2020 13:00:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37ED817DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579176091;
	bh=hCkg3z6MmNrzW37TFX03M8zePfACEklva9kyzfacAko=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n28flfMIpYjwWqn9f/KkXZTW9ZHYqhzBGJski6YYVc3hLEemF4KkJD31ECtk1W0li
	 yQx1pm8YEM2w1Kmh9NEfZ5ADhmk2233+omTghzZc6CkjD91LKxppXov9t/tMeW+foM
	 AsIX7J2mFGwTulvJWHLzr3P2RoU+OoiTr82iC1nM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB30CF8016F;
	Thu, 16 Jan 2020 12:59:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84A80F8022B; Thu, 16 Jan 2020 12:59:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A2C5F80086
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 12:59:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A2C5F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="DO1Pwyf4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WY91Y1chO1rhlZsmlGv7hgBfHrAmdcvCGj5Bo1EdVbM=; b=DO1Pwyf41cTN/Qp9X4ESJMzW/
 N0ZqJD3VpX2hQ0DE+O9TuYvu9eOtU6z3aRqK+JyjROyspk6odeP0Ep9/LskbG/jkbSqIcYbDnRNu+
 vQChdt4mGyBr7J3mITLuCvnSJiHGgkIXx+1G4eEJ5ZZQhxO0sgTICV+0IXqyzPCRaS+fI=;
Received: from [195.89.128.25] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1is3oP-00066D-4P; Thu, 16 Jan 2020 11:59:45 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id BDB48D02061; Thu, 16 Jan 2020 11:59:44 +0000 (GMT)
Date: Thu, 16 Jan 2020 11:59:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200116115944.GO3897@sirena.org.uk>
References: <20191220164450.1395038-1-marex@denx.de>
 <9fd0bdd7-4599-a84d-9807-c33541035b4a@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <9fd0bdd7-4599-a84d-9807-c33541035b4a@linux.intel.com>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Marek Vasut <marex@denx.de>, alsa-devel@alsa-project.org,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>, festevam@gmail.com
Subject: Re: [alsa-devel] [PATCH V2 1/2] regulator: core: Add
 regulator_is_equal() helper
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
Content-Type: multipart/mixed; boundary="===============4259576196666125326=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4259576196666125326==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MO4t1VgQTCtsHhID"
Content-Disposition: inline


--MO4t1VgQTCtsHhID
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2020 at 01:48:53PM -0600, Pierre-Louis Bossart wrote:
>=20
> > +static inline bool
> > +regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
> > +{
> > +	return false;
> > +}
> >   #endif
>=20
> this breaks my build... shouldn't this be:

Fixes were already sent for this.

--MO4t1VgQTCtsHhID
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4gUCYACgkQJNaLcl1U
h9BoKgf/bcPq388rMC99d+nfH39WBap0tqO/tKOuPN1Wep0+J35vJ4h638+QBDt1
imi6QCnG/IzxVLiv8UQZQQjCCJbxkd25pTe90z5UUV0gJRufRZ3FAG4vvPwO6MOr
hb0I0FbjmEf4VMoWrJHB7peRp3EhSS+CLFR6bFyraGw9tIKFE7ya2vk7UgXPto0g
nS2Hh7JmsCeePZQrBDXkp6LZlAspBTM493MFzb+bfRRinjWdHVZGEWQ5bcy/iyoq
fytq/49GCCj6e8+oTrrbiPOpLqrcOhI0sY+p9awzmukYkcmNXhIZkJrNFOHnYMXt
tTxga/63hMAXt7GLRa5x8qmW0TlcAg==
=cd4J
-----END PGP SIGNATURE-----

--MO4t1VgQTCtsHhID--

--===============4259576196666125326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4259576196666125326==--

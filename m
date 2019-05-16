Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 823812044F
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 13:14:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06A3216AB;
	Thu, 16 May 2019 13:14:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06A3216AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558005290;
	bh=ZhbGSdbceSvaSMw59/FtVI72CDtBCV12ZPAUWri4ZU4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CjNZiydAFKPU/Oc3R1vNNCgNdm3T0cpOJr/Bz08tWsIP17WWxluPr3Lzst2sWOLAX
	 9Q/twD/Tx5Cx1FmdEbB9zupLO2hfmCqh4kXgJgZbW9T9FzlgB/k5ZtyKbkYFO1JyyS
	 LyFOZKzHGbxNldPqWHpOKYNzW4Igv5WY/etjA+Ok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46B3AF896E0;
	Thu, 16 May 2019 13:12:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B001AF896E0; Thu, 16 May 2019 13:12:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A07DF806E7
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 13:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A07DF806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jv3sGed4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z2Z7+MFUvBPBnKh5hkeD2cTajetudgmw37iyLkzYbLw=; b=jv3sGed48h6DuIvtRuzJJnlJB
 KnLKxpPh5Uc/p7dSXShIZizO4MmSQ5Btmpo39FOmGYiyf4A0nTs16I6vzNr3m05bc04XTZQSOWkqc
 qp7N5cOb1rUrwd6deezf6NdJ5TCEpJkRWfKCT6B9uE4gQ2k8Dh44BNu7mdvE09ffEpRyU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hREJM-00066K-Lr; Thu, 16 May 2019 11:12:32 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 21D5A1126D45; Thu, 16 May 2019 12:12:32 +0100 (BST)
Date: Thu, 16 May 2019 12:12:32 +0100
From: Mark Brown <broonie@kernel.org>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Message-ID: <20190516111232.GE5598@sirena.org.uk>
References: <VE1PR04MB64790C7A0C1C068503038FDEE30A0@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <VE1PR04MB64790C7A0C1C068503038FDEE30A0@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-Cookie: <ahzz_> i figured 17G oughta be enough.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "brian.austin@cirrus.com" <brian.austin@cirrus.com>,
 "Paul.Handrigan@cirrus.com" <Paul.Handrigan@cirrus.com>,
 "tiwai@suse.com" <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH V2] ASoC: cs42xx8: Add reset gpio handling
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
Content-Type: multipart/mixed; boundary="===============7881342419051323337=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7881342419051323337==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n+lFg1Zro7sl44OB"
Content-Disposition: inline


--n+lFg1Zro7sl44OB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 16, 2019 at 11:09:27AM +0000, S.j. Wang wrote:

> > You also need a binding document update for this.
> ok, will send v3

Separate patch please, I already applied this and binding docs should be
separate patches anyway.

--n+lFg1Zro7sl44OB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzdRZ8ACgkQJNaLcl1U
h9DryQf/QN1WnlIxisEBv3q8UfSPHhd4YuCYO0Gzp7QK64Ei6KJL1BYr3LpneK9G
yjzhG4Ix4Diugig2rg/i9boPzcT8DskSS0GV28zhE0cvaSbxVRmQd2oQBMgK44AP
MuU7ZFZh6VQtmOYDUf8d9WQj7vcLs2kGwfiU32xA2865EwVarnwY3SRpmW4YYCc4
twMse4gvRuL4k5RoRvuT05whKNVKwigBzOmDXpIHpkHkg+dQA/pA1fUf7T7HM68f
UkBiRis8BbivxIiE6l+c14GaYamniawMmP17C+66uJCxtNfiiJa4nH7SscKOpmwI
6ZnItmz8SMwfphe48YkFJcvciCYghw==
=CqUE
-----END PGP SIGNATURE-----

--n+lFg1Zro7sl44OB--

--===============7881342419051323337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7881342419051323337==--

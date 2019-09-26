Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C14DBF5C3
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 17:21:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E2DD175E;
	Thu, 26 Sep 2019 17:21:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E2DD175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569511312;
	bh=NwFmIoAm/BsFeFYEm2bSs9eI4iuHUnVFqcnILyCEwhw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W0J9GjxFPwH49AjJi3VvhIt/PHkDivp5kWeNoDJbkQwpR3wfsiI2p30DXiiAW84nA
	 8u2ZnGr5TMwXXPqsYzScrK74bdcEOoIewkWREsP2yitf9fOmWtkQW+AwLrRjiYh5gO
	 m6HKRLHkvtvEzabMPowddp7n1/h99+Zv6v3tFrCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90FA1F8048D;
	Thu, 26 Sep 2019 17:20:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A97DCF80213; Thu, 26 Sep 2019 17:20:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AF65F80213
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 17:20:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AF65F80213
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="kx7Cbp6S"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CkcTAd4S96JpD35jbvDi6z+phIXmR7MSa7e/rGtaKb4=; b=kx7Cbp6SHnYTy5/8mkX9LsA03
 zoLd51jZwr4WSGElOynTrJjN7UAfjOJb3xbJMGIADPIs0hzoOzgssneeHyqelOdmdoaEtGmrPIvYq
 ylLR4W40pJuq0fW3zMz/i3G5SijHk9mWGGUAZD4FaiyO3147Mk3+wf1Ir569uYWdbEtMM=;
Received: from [12.157.10.118] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iDVYn-0003uG-8U; Thu, 26 Sep 2019 15:20:01 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id A5E6DD02CFF; Thu, 26 Sep 2019 16:19:59 +0100 (BST)
Date: Thu, 26 Sep 2019 08:19:59 -0700
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <20190926151959.GV2036@sirena.org.uk>
References: <1569542689-25512-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
In-Reply-To: <1569542689-25512-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: amd: Missing Initialization of
	IRQFLAGS
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
Content-Type: multipart/mixed; boundary="===============2275145261628944946=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2275145261628944946==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L0pirLHWQnJmYWnZ"
Content-Disposition: inline


--L0pirLHWQnJmYWnZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2019 at 05:34:47AM +0530, Ravulapati Vishnu vardhan rao wro=
te:
> Fix for missing initialization of IRQFLAGS in
> ACP-PCI driver and Missing Macro of ACP3x_DEVS.
>=20
> Follow up to IDb33df346

What is "IDb33df346"?

--L0pirLHWQnJmYWnZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2M1x4ACgkQJNaLcl1U
h9CzMQf8CW7bKL6E1DaPRcJ+5j/bmPxewThu9xmDy3QUSp98vzdVj2nsqQTwrE/n
2khiq4zkCK1f8ocT0C92+DNHMQN+1jUoMHSPDP4ZSiIBAIIGIbGJOilcvIx5TGEp
ZiHGBfXILiDBqeqnxX0wJ40RCgidP7gbGUUoliWt69KKIBYhuzlm7Rg0rWr/Zy0o
nPRZVY978qNnIDmIgKl6vMaRCPpwibYJl3XGls+Xg8ek4gUbfDYNY0fnK2J3wLTW
Hg1525ARow6o7PbjaGkqxlf7jilKlPYvClqWPU/qC5tdVG55HMxKsX191vV0iKTe
/TP/nMEQm1qvryDg0TKCyUKMVD6YGA==
=G7K2
-----END PGP SIGNATURE-----

--L0pirLHWQnJmYWnZ--

--===============2275145261628944946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2275145261628944946==--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9818CDAB02
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 13:14:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E67CB166E;
	Thu, 17 Oct 2019 13:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E67CB166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571310858;
	bh=pLPjQjLyfswdQ5OMBX+t7cD2GjKzIGE4DIR+MrqdrAk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FQxywvN9Ns7oAUdLCL/1z97OCk0LphZcXEMTVXfzHmOnUMBP0Jg6kj/h2W0wefkOY
	 ZnoQc+xn2EAEY4Aqx17pjLvLRybNm2ne8DNJK+IQ+J65GStLImpnxpAIEXiRDmKtWH
	 vfZmK8bt2+LxzbrUrUiGfF4imnGx5x55OFxGby2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F37DF805FF;
	Thu, 17 Oct 2019 13:12:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D94CDF805FD; Thu, 17 Oct 2019 13:12:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C348F802A0
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 13:12:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C348F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="CQzBlz5o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z16BzfTJRQyY4OaHhTth+R8GgLkwhum8TZacufHgBYo=; b=CQzBlz5ovZmQvv79SVJjnkSY/
 K83tjTFkwaDH3x7YI2kiyerEMKoPJdSK3jPxY1/cDPCKNvYKWMbR9nK/ib/HAd+rpLD3x2Iont/At
 2ZhgkmFlEPZZhgYkQXNkK1lWgcnYvci4YCNjumC53qRgMDTNT4Kro2F11L74oGlEARzuE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iL3hg-0000ms-ON; Thu, 17 Oct 2019 11:12:24 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 4C46427429C0; Thu, 17 Oct 2019 12:12:24 +0100 (BST)
Date: Thu, 17 Oct 2019 12:12:24 +0100
From: Mark Brown <broonie@kernel.org>
To: vishnu <vravulap@amd.com>
Message-ID: <20191017111224.GC4976@sirena.co.uk>
References: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <BN6PR12MB18093C8EDE60811B3D917DEAF79D0@BN6PR12MB1809.namprd12.prod.outlook.com>
 <20191001172941.GC4786@sirena.co.uk>
 <f9b1c3d5-6e02-354f-91b6-3b57e2f88bde@amd.com>
 <76668467-5edf-407a-a063-50f322fe785d@amd.com>
MIME-Version: 1.0
In-Reply-To: <76668467-5edf-407a-a063-50f322fe785d@amd.com>
X-Cookie: Shut off engine before fueling.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "RAVULAPATI,
 VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH 1/7] ASoC: amd: No need PCI-MSI interrupts
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
Content-Type: multipart/mixed; boundary="===============6506149359826035622=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6506149359826035622==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H8ygTp4AXg6deix2"
Content-Disposition: inline


--H8ygTp4AXg6deix2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 17, 2019 at 09:33:06AM +0000, vishnu wrote:

> Any updates on this patch.

I already negatively reviewed it?

--H8ygTp4AXg6deix2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2oTJcACgkQJNaLcl1U
h9BZ8Af/aItxQ/fzZbfWq7+sgVlfdqtTcaeA+CvcFEXbLtRyz07zrmSlpvF63bNl
FVNBlxmpPAJdoCoQMn+VLO7rZaXkGBwo9N/yGN9dcb73JVUL3qvF+fNmP0n85Oz4
maskfYtpX4+PGQqaIwPUVh1d2QBOoRwJ60rPincB7mYIgNuDhlXTkUqy8xViqCOx
VJJC5AmosnKW9ViuxAhBnJSIc0r3WgpF6TC5432+B0Ba/r2le0N1ftexI/8fXHnK
w3yhxTyJ907vh0O8tIRVo/ZP1UfxVhKH/+ktbXk7xV97G3EP7oH8oRsl0Buylj8H
T99jB4z9IozWpqazJPeSWSPtFaDnYw==
=hpgc
-----END PGP SIGNATURE-----

--H8ygTp4AXg6deix2--

--===============6506149359826035622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6506149359826035622==--

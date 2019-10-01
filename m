Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB196C3E9B
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 19:31:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 822D2167E;
	Tue,  1 Oct 2019 19:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 822D2167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569951093;
	bh=e+jTsBz26ZJGf1QZuXOtCY1XicEIRiL3RE0SRigEm1M=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J2x94v8G4Ts0i4tYvLu1/Owws3fcq5l2vDKKDrOn6GXOA9nTt8lb53Qawj0jYIua8
	 HcFkyC8586D+HjZAthI1o4NLG5dkUb7LyaSi03gT1Z28AOHZjalz7u55vgTsEAnahn
	 3uY/VXZOOTxxefh/jP+arfxTfAhheMDgy9W8dEew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67231F80518;
	Tue,  1 Oct 2019 19:29:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84A41F80506; Tue,  1 Oct 2019 19:29:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03E83F800D0
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 19:29:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03E83F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="vUbZIQnO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lTpgWj/lyGtni4J5FE3WcdA3ifqDB8F61MancmRFDZg=; b=vUbZIQnOOGi7W7s9lj1TMqWRC
 yO20baUmYZDsdtuApUVxVzFG5CbwY5MfFgLMA6Qa4kca7r1Ny1PULNyujxF0m2xtRYykLB/ktEWWv
 etnJvn7TtcqmdIx3UOpgg2Q/fqmt8gNunVeX03s9nTi0yWN4DIpUWzmPc10xDkKf1eO2Y=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFLy2-0005mV-JZ; Tue, 01 Oct 2019 17:29:42 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7977927429C0; Tue,  1 Oct 2019 18:29:41 +0100 (BST)
Date: Tue, 1 Oct 2019 18:29:41 +0100
From: Mark Brown <broonie@kernel.org>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Message-ID: <20191001172941.GC4786@sirena.co.uk>
References: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <BN6PR12MB18093C8EDE60811B3D917DEAF79D0@BN6PR12MB1809.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN6PR12MB18093C8EDE60811B3D917DEAF79D0@BN6PR12MB1809.namprd12.prod.outlook.com>
X-Cookie: Keep refrigerated.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "RAVULAPATI,
 VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>,
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
Content-Type: multipart/mixed; boundary="===============2255107037218985941=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2255107037218985941==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y5rl02BVI9TCfPar"
Content-Disposition: inline


--Y5rl02BVI9TCfPar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 01, 2019 at 05:23:43PM +0000, Deucher, Alexander wrote:

> > ACP-PCI controller driver does not depends msi interrupts.
> > So removed msi related pci functions which have no use and does not impact
> > on existing functionality.

> In general, however, aren't MSIs preferred to legacy interrupts?

As I understand it.  Or at the very least I'm not aware of any situation
where they're harmful.  It'd be good to have a clear explanation of why
we're removing the support.

> Doesn't the driver have to opt into MSI support?  As such, won't
> removing this code effectively disable MSI support?

Yes.

--Y5rl02BVI9TCfPar
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2TjQQACgkQJNaLcl1U
h9DC/gf8C6vOACPQWvbRJO9LfPWnIyOnAhpmiVNNeGV59bbMmSRSjT3zuIsVNoMe
6J498TvqIOcb2NxSsGukipQbrWSYomHT7+XmgDjXSQGPGkZ86bgiP95O+ZqKAXqT
1RjADLkZQpQMsmDSqFeWNJP0dlYrIs9uPmUCuhI+bHdtiF6Sc2cJL9wtiHZDXS3T
qmFaFOu4+1bGoKNDITbdLBEAsn7mSmLc0GolWCrf9BeymlF4Vuarm9fx6GP3JBlf
G/UN8F8FEfvNa+3dGj+TyU7D+0uErLvwhy+d0Cm5eiw//fgjQhrNyDp7EbRlvbrr
v/RCUHZ9c4/5k6QHNr8OUNcCB7rURw==
=5uDK
-----END PGP SIGNATURE-----

--Y5rl02BVI9TCfPar--

--===============2255107037218985941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2255107037218985941==--

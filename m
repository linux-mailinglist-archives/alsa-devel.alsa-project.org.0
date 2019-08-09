Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C4F878E0
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 13:40:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41C62823;
	Fri,  9 Aug 2019 13:39:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41C62823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565350808;
	bh=bZj6Nj/QoPvSi4jm1JuE/kU/T7d3tvwTPtLT+UxOg0Q=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=taQncxOm55J7pZ+zu7U2TCGc7KrM8QXJrFjODHEsbXscLRdY1+jXXZg9UMWGDdND8
	 VyNu9p8III48FxfVf9b9u10Nmg9mbzxn2ZKxyUbOAEQ5Ha9b0qkCZUx1lrb57+UW3A
	 qKZzXt9Pr9hxShc71u3fKQs3iJUA75+4hnqJ7X+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8269CF803F3;
	Fri,  9 Aug 2019 13:38:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCC82F803F3; Fri,  9 Aug 2019 13:38:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16AC2F8036B
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 13:38:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16AC2F8036B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="g94YYcQv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8TYCQKPGwblwaEM/Y4Gdkq0rqcYJ1EDRCHV3pZWQo+0=; b=g94YYcQvdTsIVeM5Ctf8aIV0Q
 8gUtfmkQ+4/Fe07KqumsTJ6rpCUVqizZC6K7gxbNH24a4lDgHH2svhZvY/rMic75q1gUrEbUwEwPN
 AVCsnXF8IqjNB3cP4zpAL4sKutzx3eqACcpP79KN/C7sRQX1ATneG/FnbV5rBpuTNORX8=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hw3Dm-0005qV-S5; Fri, 09 Aug 2019 11:38:10 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 4DD54274303D; Fri,  9 Aug 2019 12:38:09 +0100 (BST)
Date: Fri, 9 Aug 2019 12:38:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190809113809.GA3963@sirena.co.uk>
References: <20190808095715.29713-1-tiwai@suse.de>
 <ae7d32fe-a279-8309-2370-1832edcce413@linux.intel.com>
 <s5hr25vhg22.wl-tiwai@suse.de> <20190808190343.GK3795@sirena.co.uk>
 <s5hftmbie9i.wl-tiwai@suse.de> <20190808213311.GN3795@sirena.co.uk>
 <20190808222201.GQ3795@sirena.co.uk> <s5ha7cij2xd.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5ha7cij2xd.wl-tiwai@suse.de>
X-Cookie: Klatu barada nikto.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [alsa-devel] [PATCH 0/3] ALSA: hda: bus cleanup
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
Content-Type: multipart/mixed; boundary="===============5133428738027475751=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5133428738027475751==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 09, 2019 at 07:58:06AM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > Had to rebuild this since git has a bug with recording merge conflicts,
> > just pushing out a new version now - c2f16a94a80497e4b28c27f9ca2cd6cd60706fb6.

> Thanks, it looks good to me.

> And Stephen resolved the conflicts in today's linux-next, too, so
> let's compare later.

My tree didn't get updated in -next because there's some configurations
that don't build.

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1NWyAACgkQJNaLcl1U
h9B//Qf/Us96n2eBGQIi/DGDGnlSethohcl9KG1hdZrIG7bRn8CRinBpmvOfZ56B
t3IECdQkDOLAeesi1dIAtTGpIr7hHQ3l8TrVm4x/yRhEdNU2bJ6RwhpK/nECzwp+
bUoC8yCcVl5LBiuQh0KY0F5hgSSvCtrq4uSpq1bcmo3X2prPoikm71LAjEz4Dqq8
sF/XGRf8MqVDq9aLMYenGNljuMXuWNS4UnOh0VzQjuwsFuQoZQ8fNCCr1c0dWxT2
uzRBTkxUlYIviAZ3BcqXjWykdFxOAgMx+Vjw+uKmCFdUh8i/08jCVaK0J1pL9tju
K4hlvjcW2oXlziAADVrdFUAPlLAH6g==
=TQ0y
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--

--===============5133428738027475751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5133428738027475751==--

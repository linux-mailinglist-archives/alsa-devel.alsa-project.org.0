Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED12F1B40
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 17:31:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AB3916AF;
	Wed,  6 Nov 2019 17:30:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AB3916AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573057885;
	bh=M86JLVNYvTFDkd2sHqKduM8pFiK3c26ebM48DwYLvZY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L9FBGOtZEV1lFsDypaaFvEp/7f65pfI0R/Z3L+brEGJ0Rn1ptlJXGsdgb2caGRSM8
	 biXplfqb4kFKG+m2TzHP3uLKPFQWpKAtk46kDVxyYjiPRn49hMXBqZy73zm1A8GKCH
	 PYiXcwth1gPqHuAwVBPrIlbDMA2/UYJTaDnvEvDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5247CF8048D;
	Wed,  6 Nov 2019 17:29:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA068F803D0; Wed,  6 Nov 2019 17:29:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F62AF80291
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 17:29:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F62AF80291
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="AgUJ9MMh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w0A2Z9ic9NOch2we3Yklia3nDp3ukxX77gz1x+0PHxQ=; b=AgUJ9MMhLE3gOB+W+/C/lDHWU
 6dMPuThXH/Ds745PU7lCdEE8cwdo1/+64GJcYpYentIE7nGszFxtNy54536iybS+7WKErmWaMN4cK
 SG1O9tj6j6agYANzgHY4JAFtstqGKOLMBdWzJmztlGsKk3qgX3aixoyb39fT3hRmZf5Rw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iSOBU-0001q6-0z; Wed, 06 Nov 2019 16:29:28 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 4024C2743035; Wed,  6 Nov 2019 16:29:27 +0000 (GMT)
Date: Wed, 6 Nov 2019 16:29:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Dragos Tarcatu <dragos_tarcatu@mentor.com>
Message-ID: <20191106162927.GC11849@sirena.co.uk>
References: <20191106145816.9367-1-pierre-louis.bossart@linux.intel.com>
 <20191106162146.292802743193@ypsilon.sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20191106162146.292802743193@ypsilon.sirena.org.uk>
X-Cookie: Shah, shah!  Ayatollah you so!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Jaska Uimonen <jaska.uimonen@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] Applied "ASoC: SOF: topology: Fix bytes control
 size checks" to the asoc tree
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
Content-Type: multipart/mixed; boundary="===============6287171247908055939=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6287171247908055939==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Content-Disposition: inline


--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2019 at 04:21:46PM +0000, Mark Brown wrote:
> The patch
>=20
>    ASoC: SOF: topology: Fix bytes control size checks
>=20
> has been applied to the asoc tree at
>=20
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
5.4

It's not immediately obvious if something similar is needed for -next,
the relevant code has been redone since v5.4 was branched off.  If
something is needed someone will have to send something.

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3C9OYACgkQJNaLcl1U
h9DlVwf+MedmDnibo36sZLgPAL9R8fMxJkr4K7sMI+vFxKxggvFVksOLQZt443nl
x6/oa60+AHaUBS+BUyJAJhekd0Q0SDd1dg2NOKXwG8rAUj44mcZe8SMpyWKWVaHA
WMrg6JUnC/xlJE5s2ULaNtQvMIHfANeXjY67ffifgCK4v0h751Geh3N1SqQei5Es
zUmQQLhHQRM720LHy9PnyVdP7xB22PTNNSkNWwKTfDRDX+dfuht0NWZmIlfTP3eU
f2CREvdBmkEQu2KIbiy6OBivLTUX0SRnN0wdB8yHi5rbUpd3ALmyfxPfhuNn+MUI
3NuoyLyjSq3hA30l19J1pIHjWBoUrQ==
=/00N
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--

--===============6287171247908055939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6287171247908055939==--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9197250C17
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2019 15:35:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DA431615;
	Mon, 24 Jun 2019 15:34:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DA431615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561383336;
	bh=lXQM5MYs1D0iIitdAVUOhKXIZVdUERWvZUVUG/iQNqo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kzkKDIIaRVtmuQ4KKa89q0XBsQEcN9LajOmO+pRA2X6tUwZN3+x42c3mw+UFuIPrO
	 n4qIMf0hbQLkertgtZNGuwh7ZI8M37MJEHAuvvptkVNGV48wQQv3ffyonnnIHWUFUw
	 Qv+U0zqt8zZutLwjCxvmizEJy0lFKoEJVKKTT+DY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DD40F8065B;
	Mon, 24 Jun 2019 15:33:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CEEEF896B7; Mon, 24 Jun 2019 15:33:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79E0DF8065B
 for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2019 15:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79E0DF8065B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="KkIZOIao"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QgY6avb+vOWpTTUsRAZODkBXFK1GuhjqjhAFlq+sbCg=; b=KkIZOIao/TLGBdVTFaRAPjE3U
 gjC3aZjlb0/eTgDd6K1rqbx4lBehbFb8Yt9WtPCC1d8HLhD/QpYaEO+fLA3emqekfU1GtNMc8ng6A
 FvuvfEWeWNLMIC7NzlxgG3CRxe96KUw2PBai7VWJ2qhcCu//4+kcz4YEpXtYQulUhSSD4=;
Received: from 188.29.164.245.threembb.co.uk ([188.29.164.245]
 helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hfP6M-0001UU-Ja; Mon, 24 Jun 2019 13:33:42 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 43F84440046; Mon, 24 Jun 2019 14:33:36 +0100 (BST)
Date: Mon, 24 Jun 2019 14:33:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190624133336.GN5316@sirena.org.uk>
References: <20190614094756.2965-1-gregkh@linuxfoundation.org>
 <20190614094756.2965-2-gregkh@linuxfoundation.org>
 <f85fe797-f843-bf71-549a-00a169d527dd@intel.com>
 <s5h4l4hwe1c.wl-tiwai@suse.de>
 <20190624105334.GJ5316@sirena.org.uk>
 <s5htvcfxgy9.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5htvcfxgy9.wl-tiwai@suse.de>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 2/5] sound: soc: skylake: no need to check
 return value of debugfs_create functions
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
Content-Type: multipart/mixed; boundary="===============9084037110082583946=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============9084037110082583946==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="02TgiDMAH4DLwn5E"
Content-Disposition: inline


--02TgiDMAH4DLwn5E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 24, 2019 at 03:15:26PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > Currently debugfs doesn't report any errors other than via the return
> > codes (at least in the common creation stuff) so it's up to the callers
> > to do that.

> So this should be changed to follow a la sysfs creation error, IMO.
> At least, the name conflicts etc should be reported more obviously.

Indeed, that'd mitigate the problems with just making everything
silently fail a lot - so long as we say there's a problem people are a
lot less likely to be mislead if anything goes wrong.

--02TgiDMAH4DLwn5E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0Q0S8ACgkQJNaLcl1U
h9BWVQf9E8l2s4xvp6lqiI30M3mbXjCdZiFrDHm1K6g9YJaChL7wzVAezIG9QkJ0
CsrY3lv3PN9Bsr1SIKssmAT0TDYCkSh8fB2nT8vwuCzM9hait9zNHMMlsStig04s
D9KFfvui5J6l6H24iNAGpaRnDlfFyGfkDaiWWp20usOTB/hOgPTKkDNmE+a6bsjZ
AV0sn/FlBt1E1O5GOmuCTU2mbNQYdOGnYFLReRsB6rFJNYSfkwty0UhrY984hv3v
ekZi/VlW5Di84xs1pLmqnverk1YVp5bWZh7i10bvKsj5JWTNWsHVOZ2pRvqbOgTI
LkzgIggSD60RvGYVRciMwBQP6g3Haw==
=1+72
-----END PGP SIGNATURE-----

--02TgiDMAH4DLwn5E--

--===============9084037110082583946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============9084037110082583946==--

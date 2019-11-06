Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C721F1BC1
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 17:55:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22BA8169C;
	Wed,  6 Nov 2019 17:54:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22BA8169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573059344;
	bh=BrmGYfBKzy4FNiya37C1jvYVXsOyrGJyoQA3h7ztu7s=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SKlDQgNTMpbSJClEKjNWfy7K48ncVvXko+POxIyqdBGMIq8sOxUCYVNy00qWSGM66
	 dj8kY1XvYD6Jl8nhQ5zl0EIv3XQODRk83LnaWfaG0gn+N4MEVw6rFrXpU265In6MKN
	 dcDyrf9/Lk5bjX+zEC/55LsGgQrlp4FrpLqSfTnE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A4AEF800F3;
	Wed,  6 Nov 2019 17:54:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7237AF803D0; Wed,  6 Nov 2019 17:54:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FF69F800F3
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 17:54:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FF69F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="eLRnrU/7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E3Hll5dL+/IMt9t4UsCBdcofvR8QzlTa1YDfmDM7iPc=; b=eLRnrU/7XxJ+akTvreXZzGzS7
 PMwJpEvxFGtLxuAS4GoXAvPZkltj56IzKL3RAaorXYkycYQ6dsKGV+QgAuHtcfWbAqzvxW01dxQt+
 ZK6CJsB68VPxypKsHz+996D61FhFtt6zBUH6NjZs6DTygqZS2yrdfkPVXc3NYJJpJUMHM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iSOZl-0001s4-Hl; Wed, 06 Nov 2019 16:54:33 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 584032743035; Wed,  6 Nov 2019 16:54:32 +0000 (GMT)
Date: Wed, 6 Nov 2019 16:54:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191106165432.GD11849@sirena.co.uk>
References: <20191106145816.9367-1-pierre-louis.bossart@linux.intel.com>
 <20191106162146.292802743193@ypsilon.sirena.org.uk>
 <20191106162927.GC11849@sirena.co.uk>
 <14d026ab-a898-358e-34ea-4f73d6c0fc0a@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <14d026ab-a898-358e-34ea-4f73d6c0fc0a@linux.intel.com>
X-Cookie: Shah, shah!  Ayatollah you so!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>, tiwai@suse.de,
 alsa-devel@alsa-project.org, Jaska Uimonen <jaska.uimonen@intel.com>,
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
Content-Type: multipart/mixed; boundary="===============5365073765195420785=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5365073765195420785==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2iBwrppp/7QCDedR"
Content-Disposition: inline


--2iBwrppp/7QCDedR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 06, 2019 at 10:49:20AM -0600, Pierre-Louis Bossart wrote:
> On 11/6/19 10:29 AM, Mark Brown wrote:
> > On Wed, Nov 06, 2019 at 04:21:46PM +0000, Mark Brown wrote:

> > It's not immediately obvious if something similar is needed for -next,
> > the relevant code has been redone since v5.4 was branched off.  If
> > something is needed someone will have to send something.

> I checked that the patch applies even before Jaska's October rework, where
> the same bug was present. so in theory picking this fix for 5.2..5.4 would
> work as usual.

What I'm saying is that I did that and if the fix is still needed after
the rework someone will need to send a version that applies after the
rework.

--2iBwrppp/7QCDedR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3C+scACgkQJNaLcl1U
h9Aumwf9Gu1OzUsZ/Lluhv4aJwXcDBrAI7/0EQ0+hIcpxmrpO63JzMHzN1Ksjidm
43yPoYT8GEAb8smjfdSbYxsxI8SuFxUoiJCgtIijJDJN2MULbhVdau9CHFv6qlWa
97Tm1JXFveaFbucMQVu5ukW0GZtWZrTiNm60hJtP6loSCMThRL/Sek93sTxjzVF+
jTStVd4eSxS8xzYnhtEfOfEd3scGuPvQ50/21mLR3icKi42eCMC3cEMFC7tZ2J70
ramgN0+42gSH2acSF0dpn/EomSaAnUTnsFhorg3I98nh2+Anr+cXKG5ljPGEYuDA
JWbTGmep0ktEggFhJ+ReL9Bostyq3A==
=2mP5
-----END PGP SIGNATURE-----

--2iBwrppp/7QCDedR--

--===============5365073765195420785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5365073765195420785==--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDB58694C
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 21:05:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A93B1165F;
	Thu,  8 Aug 2019 21:04:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A93B1165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565291138;
	bh=8rRlHQ/5CxxsF82FdcR1kox3pTCShNaqz5zWJOWiqdw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G/7RB8azvniLVSopgZYgXFrzO8fv1dNwWlaiioGuq9hb5nJmQZhxB1vRbM9ChOGMq
	 BRn3/AZfX+rw2gkQJcDrvs/K5sFP00rv0IDxAJMm1ky62S7JgmeS/FSVXeyqHeAaa+
	 FfDFa40j2cwakzF1rolNlO9QTq11/QeWB6aBAzZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1C74F8053A;
	Thu,  8 Aug 2019 21:03:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAC84F80534; Thu,  8 Aug 2019 21:03:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B83EF800E3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 21:03:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B83EF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="CFTi4sw3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XlloOn3/u2RVgP4Z+/zSY0tDU+4idx2ZAtV1CB/8KXQ=; b=CFTi4sw3jHyDd24U0Um7WStlv
 ET5QY1ULmr9oEaM6HnZ/j5MS6E2MUwYmYIN3IhgFFEdbBzv2/rabJo099pO8Wchazae9+ZMW/2cA4
 23wyS6A0d+R2FXcnb9l0tGi19pvW/gkXoPy71BV9+osEEmsGpXilumHXwWzLNuK9cB8ok=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvnhQ-0003mX-E4; Thu, 08 Aug 2019 19:03:44 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 96FC52742B42; Thu,  8 Aug 2019 20:03:43 +0100 (BST)
Date: Thu, 8 Aug 2019 20:03:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190808190343.GK3795@sirena.co.uk>
References: <20190808095715.29713-1-tiwai@suse.de>
 <ae7d32fe-a279-8309-2370-1832edcce413@linux.intel.com>
 <s5hr25vhg22.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5hr25vhg22.wl-tiwai@suse.de>
X-Cookie: I think we're in trouble.
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
Content-Type: multipart/mixed; boundary="===============2272204297572513692=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2272204297572513692==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IA03tywDYuoVKXrw"
Content-Disposition: inline


--IA03tywDYuoVKXrw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 08, 2019 at 04:45:09PM +0200, Takashi Iwai wrote:

> I don't mind who actually merges.  I'm going to push out my topic
> branch once after gathering enough Ack's.  Then Mark can pull it into
> his tree (as well as topic/hda-dmic branch).

I can do that easily enough.

> Or if Mark can give me the branch, I can pull into my for-next
> branch, too.  Basically my for-next branch is persistent and not
> rebased, so you can work on it once when set.

> Mark, just let me know your preference.

Well, I don't have topic branches any more since Linus hates them and
it's always hard to write sensible summaries for the development when
it's half way through so...

--IA03tywDYuoVKXrw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1Mcg4ACgkQJNaLcl1U
h9Ciswf+LIQHuD1FFpYRf8ibMYcWDcoLna+z8NANkdKoVGcF6vPPVe8KOT8VM8d5
WorAhIPo3oV38q2LDXH8kjxtZ3O0jSnQ5RWUOzwzCaVMS37FnoEiK11BwVRWZh7J
MNwMQOorCnv8ZUUlH8ibV47MvevOpT6XBcD9jpaP7ezXA22k4Yeu1RZ9EgYiYppI
uaK2+8VzOgJzhyGnpU5DGU8BXtzepC8LNY2rNFmswtvjRU3BM9TB/D93fFUGM70l
R2AEN69YxotoDo12GrEOUjoKynVh2tx47+Y3GlT/PIbPcFm9JciI/8158FxoEOax
OdQkR3OuHIScR8dPy7d6PHTBMnWz2A==
=ARRp
-----END PGP SIGNATURE-----

--IA03tywDYuoVKXrw--

--===============2272204297572513692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2272204297572513692==--

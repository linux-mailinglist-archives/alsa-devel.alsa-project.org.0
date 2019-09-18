Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC1AB62C4
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 14:08:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22922167E;
	Wed, 18 Sep 2019 14:07:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22922167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568808483;
	bh=/gQ5V2yi0Lk+fyVzg3gUI1aDzL9NaodqOzwz5Z5fpSE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q3TEVXLKII6EP9nar8CIBIZvtSKTCeBcbQOz0EiNbvl+eZZg2iYvGVfjQS2f6+hsF
	 um5XV8ax23spY5JXYApkNO9oR4MLErqtt7Y3Lil0aAdF7VXg2ej8YutxRs/YgYepar
	 LWEpjBSVQEvNP2XSDL0oTSYyQR52KjqnlBpjXVxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8116EF80292;
	Wed, 18 Sep 2019 14:06:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF3F2F80506; Wed, 18 Sep 2019 14:06:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF3A2F80292
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 14:05:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF3A2F80292
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="prxV1W2p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MzATDNIERDtCE0amjUIhfbCd3EzA8xIdcEIzyZF2i9k=; b=prxV1W2pYwHHALb9Fs7LWIDl8
 tF+1UdnsA2D/gQLvHN4ghTOTfJ5nK7E7BC5KEZR96CPDuK0wLr26L5vUwwH02Nk2oQStQ+G/KiUsV
 KwJ7wQ0R4jwf/2XgmqZJ2S2QXq9uV4/3ONJuP0+am2UYrlzd7H8u47ZMOEfKdsbWU+/rQ=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iAYib-00053i-H9; Wed, 18 Sep 2019 12:05:57 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 940F42742927; Wed, 18 Sep 2019 13:05:56 +0100 (BST)
Date: Wed, 18 Sep 2019 13:05:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Message-ID: <20190918120553.GE2596@sirena.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-3-ben.dooks@codethink.co.uk>
 <077870b1-8856-9a28-dd13-f8bfb1418adb@linux.intel.com>
 <de15ea8e9d2c07a1253fd414b421efbe@codethink.co.uk>
 <20190918100828.GA2596@sirena.co.uk>
 <943c243563b4936a537b52b6c3b1fd99@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <943c243563b4936a537b52b6c3b1fd99@codethink.co.uk>
X-Cookie: The devil finds work for idle glands.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@lists.codethink.co.uk, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org,
 linux-tegra-owner@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 2/8] ASoC: tegra: Allow 24bit and 32bit
 samples
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
Content-Type: multipart/mixed; boundary="===============3727602889729791712=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3727602889729791712==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Content-Disposition: inline


--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 18, 2019 at 12:50:13PM +0100, Ben Dooks wrote:
> On 2019-09-18 11:08, Mark Brown wrote:

> > > Yes, will do when this series has been reviewed and modifications
> > > done.

> > I didn't look at it due to the lack of signoffs.

> Thanks, although you could have just flagged this and reviewed the rest
> anyway. I'll post a new version with signoff sorted at the end of the week
> as I cannot get in to the office to test any changes until Friday.

None of the patches I looked at had signoffs, Pierre had already told
you about that problem and there were a bunch of other review comments
anyway before I saw the series so it was fairly clear that a new version
is needed anyway.  Once you've got some review you shouldn't rely on
getting extra review explicitly since it's not generally useful to repeat
the same review comments others have already made.

--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2CHaEACgkQJNaLcl1U
h9Bfggf+KwyoUQbzbZdW85lkbYYzjdzcUvyz+11E+e1BPqECET8U0XyV3hBp0uAT
rcQ3ME6HGjxUDubR3fatWVg36HhkV54jmAitGld7v3zsDvEyC7KSR2a/i7OlxGmC
KmGqqqZR4iHwvnqrjJ+A2wC7HmuA/ZePVR6XCSt+pJ0EGrO/RlD2+mvjESUWDbtH
x37GNRGa6fMnBynxH0K4tKDNRyAtyRh3FKXYEDPC+Xi8m5kyIAmkn44BZT6n8KZq
zLAcAnsf1j+NiwihiJJdDauU8UFbOYNzm9Cw1VikWF4GOWI6RUagZugS+ZY6Q7WF
D1Ex0aYM7MFQF6xDCWziP3UjudCbfA==
=GnTn
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--

--===============3727602889729791712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3727602889729791712==--

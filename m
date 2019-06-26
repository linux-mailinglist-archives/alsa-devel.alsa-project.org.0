Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A7956911
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 14:28:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58248167B;
	Wed, 26 Jun 2019 14:27:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58248167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561552119;
	bh=ayFuHgb/aR9YnU/dHfr65uTp67ji2J5fONxnLbUgnz8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VLBHBq+ffmwPKdqQE33JDnDQkjEMBxiN3fOPp66vRfNWgFfQp5toL+u42bnzXOPzh
	 WHwhuBzrSBqt3kEFHuhBOsL9GuzL3zifXZM/MRnfsIdyHgSLJyoo8pC9kuz548GIRX
	 PE2uNu/YCZ/QCjYwmLuxsdFfgQ0FeRCmE8AfJxVo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADE5AF896CC;
	Wed, 26 Jun 2019 14:26:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25DC3F896B9; Wed, 26 Jun 2019 14:26:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1324EF806F0
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 14:26:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1324EF806F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="WnOodiXs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DvpFXGkn8D3TAMVnH/XfK8pie9+euDypEwPPovS+cDY=; b=WnOodiXsfD4fyL9Z5NzzOmO6b
 PshG1mD2SemWwT82Ewq0+W5sgLfgnN/7Wy2xLYIvLDJDTAOA7P6ilpPmInXPb6zKSPKJh7Km4YNhI
 c3mLQ4o36WI78rn3nKWKeBgqIxNUrHaHrWPGkunEuBsb4IXfVtTpLBkX0U4MiJDuloDRc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hg70f-0007qs-Sb; Wed, 26 Jun 2019 12:26:45 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 1ABC1440046; Wed, 26 Jun 2019 13:26:44 +0100 (BST)
Date: Wed, 26 Jun 2019 13:26:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Message-ID: <20190626122644.GD5316@sirena.org.uk>
References: <20190617113644.25621-1-amadeuszx.slawinski@linux.intel.com>
 <20190617113644.25621-6-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190617113644.25621-6-amadeuszx.slawinski@linux.intel.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 05/11] ASoC: Intel: Skylake: Remove
 static table index when parsing topology
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
Content-Type: multipart/mixed; boundary="===============6745765698763380007=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6745765698763380007==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="on+I5Kkc+zqLv55g"
Content-Disposition: inline


--on+I5Kkc+zqLv55g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 01:36:38PM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> Currently when we remove and reload driver we use previous ref_count
> value to start iterating over skl->modules which leads to out of table
> access. To fix this just inline the function and calculate indexes
> everytime we parse UUID token.

This doesn't apply against current code, please check and resend.

--on+I5Kkc+zqLv55g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0TZIQACgkQJNaLcl1U
h9CIkAf/XqlWXek/c2A2wcZGYAvrtlTTQ8sZ/0UuXaQmIjtdEo1DyARVUHh+Qssv
Fl4RPsk4Bs9kkVhKIpoBbIzonFCi37z9HmzixNEUG8ohCZZ4T5KP4zM/nkhXkrjC
dv/CrAIRGAL252YrJEaZHjHs15sKRP3vIKB2gdrgIQbDS/7CbQSo4e8kPc4gFzWp
iL14YeiHxQxadR9Vx3YkF5c0ArkbsCgHeUQB66a51ENNA9d4dA4J/kZHKczYawv6
lYiqS2cjv+e8KT1CgtPHEaTchKTOfsoxxDahf7uwzxg+MieeSyf8Q8e6YQVX5ZL5
qLrUTgT38tJxoRIHV1vLTaGIJ1it3w==
=H7fM
-----END PGP SIGNATURE-----

--on+I5Kkc+zqLv55g--

--===============6745765698763380007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6745765698763380007==--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10992113DB6
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2019 10:22:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A659B167C;
	Thu,  5 Dec 2019 10:21:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A659B167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575537758;
	bh=rwLgWN+Hge75W2cQ7tr/EarlikdbDJ+sjUwrpPvvtEM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gSlEvphZkfHeC5FkHA90NG6lWxiqA2nnKmNr1Reu2gDSwirk33ru/yUliI3hPWB/V
	 i7/7RDzKfdvI18H6YddhGMioaJNDeubhAZmn2kcd7vuzJZd8Dm1S0Imze6s7W95Qw5
	 qxDO7V5ZLQ492/gyKPh+vaKoQrzTlQbXI9vnvDcs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AC34F8015A;
	Thu,  5 Dec 2019 10:21:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2613F80229; Thu,  5 Dec 2019 10:20:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6C44F800F6
 for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2019 10:20:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6C44F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="nKDNThcu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VFtn0aFGOHNZSzdCQCh2Q9zVLZBu27qy9H6jEczKTM8=; b=nKDNThcu+ggO8/omrhG2DDCvp
 lcFm8LS8H32Ue11XDOUpV/XkvlSWETPoe2+wy+g1EHi/m0ezJVmBO9cXDyAiZdsvtkTS2RkncsmAX
 7FI41v9/uhTtz94tQuJfY4CitvutKemCRa7Ctqc5QstWvlJ9KxcDED3qNiduAtys4nlbQ=;
Received: from fw-tnat-cam4.arm.com ([217.140.106.52]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1icnJZ-0006OV-QO; Thu, 05 Dec 2019 09:20:49 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 340B5D00466; Thu,  5 Dec 2019 09:20:49 +0000 (GMT)
Date: Thu, 5 Dec 2019 09:20:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191205092049.GB1998@sirena.org.uk>
References: <20191205001605.229405-1-cujomalainey@chromium.org>
 <b2eb65e3-d9ee-f6ed-197b-c40d90ab1e8d@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <b2eb65e3-d9ee-f6ed-197b-c40d90ab1e8d@linux.intel.com>
X-Cookie: Cleanliness is next to impossible.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hui Wang <hui.wang@canonical.com>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mac Chiang <mac.chiang@intel.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Naveen Manohar <naveen.m@intel.com>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>, Jon Flatley <jflat@chromium.org>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: intel: Add Broadwell rt5650
	machine driver
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
Content-Type: multipart/mixed; boundary="===============6172957823281538691=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6172957823281538691==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mBuDz+cd8w/hvK2v"
Content-Disposition: inline


--mBuDz+cd8w/hvK2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 04, 2019 at 10:09:57PM -0600, Pierre-Louis Bossart wrote:
> On 12/4/19 6:15 PM, Curtis Malainey wrote:

> > Signed-off-by: Bard Liao <bardliao@realtek.com>

> Not sure what the recommendation is when an address is no longer valid?

Keep it as-is, remember that the goal with signoffs is tracking
for licensing purposes.

--mBuDz+cd8w/hvK2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3oy/AACgkQJNaLcl1U
h9A8Hwf/dbHqkFtsYMdZ312hNJBYRcqkla9rZXmCZGTwAJqUvuTXczzHWYBqaxuC
poikdTaxNMAD9ng4KRcKak5QFTYAJSsGHcvG31Yy10dkNJg+vA9luTbccUVBdWAv
Lt9rH9MyRkAQdG2j7XsR3IXUWeV0mc1n9PYZqj1lZUKzI9VsjOp18giCaFl/Hlb3
N5rX1gckWHMXNf/Vwg24z9fVFlV//aSpAyz5M/iC6DdhQ+SLGkcc3jX9TUsFG8ne
/6Isc0I5lEtnBh2hYUI3oGKG24oC8GY+B/PDl5Xubd1dHsF7NSBSl5GqorQU1VRh
n2GzwjLyf3QgD/h0+m+CI9RLt2wUcA==
=zNvz
-----END PGP SIGNATURE-----

--mBuDz+cd8w/hvK2v--

--===============6172957823281538691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6172957823281538691==--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E0C60AE07
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 16:46:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB06B2AF3;
	Mon, 24 Oct 2022 16:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB06B2AF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666622770;
	bh=3bi4ymNHo3Dvs2JQ0CRE+dxdRH544C2L9oaVHVE+Ee4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OBK8Vv2cKp4bu7dY37N5zoW84YDLRkeiQn8y5z+hpn2exm8Qa0dbcp6LFJtCgC5On
	 Nl/UB0KRAORUMGENiZxDx6XFTrsViAf6BSlTYv6auhS1wuLFe7a6WhTTqlfXZLkPLf
	 GqJvw/aCZ7FkxPXuTRjXbr7lz/Ls9uxCc4KXRp9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 311C2F80549;
	Mon, 24 Oct 2022 16:44:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23EB3F8021D; Fri, 21 Oct 2022 12:52:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB1E3F80118
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 12:52:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB1E3F80118
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BA6BEB82B96;
 Fri, 21 Oct 2022 10:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC6DC433D6;
 Fri, 21 Oct 2022 10:52:33 +0000 (UTC)
Date: Fri, 21 Oct 2022 11:52:30 +0100
From: Mark Brown <broonie@debian.org>
To: Adam Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH 0/6] a pile of randconfig fixes
Message-ID: <Y1J57jJ1+FTG7U9O@sirena.org.uk>
References: <20221020221749.33746-1-kilobyte@angband.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wWcrkmaG6Bl+vyW8"
Content-Disposition: inline
In-Reply-To: <20221020221749.33746-1-kilobyte@angband.pl>
X-Cookie: On the eighth day, God created FORTRAN.
X-Mailman-Approved-At: Mon, 24 Oct 2022 16:44:48 +0200
Cc: alsa-devel@alsa-project.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>,
 Takashi Iwai <tiwai@suse.com>, Khalil Blaiech <kblaiech@nvidia.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Yong Zhi <yong.zhi@intel.com>,
 Asmaa Mnebhi <asmaa@nvidia.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org,
 Dan Scally <djrscally@gmail.com>, linux-crypto@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@lists.debian.org,
 linux-media@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--wWcrkmaG6Bl+vyW8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 21, 2022 at 12:17:49AM +0200, Adam Borowski wrote:

> I've been doing randconfig build tests for quite a while, here's a pile of
> fixes.  I'm not sure what's the best way to submit these: do you folks
> prefer a series like this, or a number of individual submissions?

Individual submissions would cut down on the noise from the enormous CC
list.  If you were going to send as a patch series it should be a single
message per patch as covered in sumbitting-patches.rst.

--wWcrkmaG6Bl+vyW8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNSee4ACgkQJNaLcl1U
h9BDwgf+IkbiCFyXzVrO3F8yBx883iUJM3R8A5LPsrxScBUzS3Nu7PgzWmko3Bfa
wm/rXizNrMQPDqUakrtR8duh+w/eL6Lz3YrZEQEaM2fd8+MayJt9tXB4o/qfcrBc
B3o7lbqL9Hp0yqRKKG8orcvyiJDpOh2Z+zLAYqy+LuFLuiv6kSKu8h7c2vm7DKCw
+wGkRN5blfrYPHGOoU/r6oqjT2qx6BFUsXpnILPw2XRtXlkYv37BLu4rRgZ7qc+D
Afo+DwE5y6d9t9ebOL0UjvgveEysSY3VksxCcjtWru+wN/bjPbET1VFJUrfbMyGf
y+JN6EsaYWeKmGsk5T5pZ5XczMBC+A==
=kG7z
-----END PGP SIGNATURE-----

--wWcrkmaG6Bl+vyW8--

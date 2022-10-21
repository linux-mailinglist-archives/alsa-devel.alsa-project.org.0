Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF07E60AE10
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 16:47:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E39674E2;
	Mon, 24 Oct 2022 16:46:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E39674E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666622848;
	bh=dg+igT/kH5vNLile/55ugMghQ6bHOl5tdBoCQSBXYac=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L/RLRqMheqL3zCmoO8OU/xILsYlJxp1QbBhA4mM9IWDLNagmUpLcPsqCNTvl1oZoo
	 EgeMBnwdFv5fYnVezZQpqEidYv3ehaDF9lh7qxsieRGZuiNsiLFCHwxvLZPzqi0OBp
	 RfCOvXwKj9D9QNs9Ybw8ty63FU+cdr2vWMIo1miU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97926F80578;
	Mon, 24 Oct 2022 16:44:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EC36F8021D; Fri, 21 Oct 2022 08:44:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15B14F800B5
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 08:44:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15B14F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AGeMyJeg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3C70F61DD2;
 Fri, 21 Oct 2022 06:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC4FC433D7;
 Fri, 21 Oct 2022 06:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666334687;
 bh=dg+igT/kH5vNLile/55ugMghQ6bHOl5tdBoCQSBXYac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AGeMyJeg87UlxSe5k2XIw2g27XDq3ZEoGhJylOgn/Pc+deCE0ymZDPF3pyhTXbf62
 BkfHG3/Jo3vHInZD0+8lFJ/J32KahCu6OAm/wJgPFxd9F/HemwazCjH13UA8hJ60mM
 b7/YE//cHLp3hSWuNDGNIrsZr73GEPOrbsw5jMJf/PXtSzJrG6IggCpuVSgIjAuv7T
 mkRnUX2cWBckGEDpW/KQuEh4jbsZI+7HVNHZJlkU6jCmsTyk4td814k6t0S+O3WWSh
 8xaaW5CBclarLFx8oWJMBlgIHD63a03DVy9s1ojqs8YIrBNztmRJ02YHmW3QFs0F8Q
 AkwK4fKzudFJw==
Date: Fri, 21 Oct 2022 08:44:44 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Adam Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH 0/6] a pile of randconfig fixes
Message-ID: <Y1I/3KPxSI1voRHh@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Adam Borowski <kilobyte@angband.pl>, linux-kernel@lists.debian.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org,
 David Howells <dhowells@redhat.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 Yong Zhi <yong.zhi@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Dan Scally <djrscally@gmail.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org, Khalil Blaiech <kblaiech@nvidia.com>,
 Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Brent Lu <brent.lu@intel.com>
References: <20221020221749.33746-1-kilobyte@angband.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ASNnxeSggHlth0r3"
Content-Disposition: inline
In-Reply-To: <20221020221749.33746-1-kilobyte@angband.pl>
X-Mailman-Approved-At: Mon, 24 Oct 2022 16:44:49 +0200
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
 Asmaa Mnebhi <asmaa@nvidia.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
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


--ASNnxeSggHlth0r3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I've been doing randconfig build tests for quite a while, here's a pile of
> fixes.  I'm not sure what's the best way to submit these: do you folks
> prefer a series like this, or a number of individual submissions?

You sent the one for i2c-mlxbf seperately, which I applied now.


--ASNnxeSggHlth0r3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNSP9wACgkQFA3kzBSg
KbbjSg//Qpjk7lLoKdOzvsdmL0Mq2o5hT22qP9eF8TiQ3pE1B3B9C9AsdWQ7FjOB
ClXU5SlQmHPj//fgEfmr9Vj2bKBssiA4QkjiF/fcjthcBqG2j3tLeQPRmFr6qcd7
a873ogKipCuWcb7wHngTM9a7820xTtzm6AUCGCfWQHKiXjdCWsSdBoSEyHDocLiz
CVpTOsOeH+pC5Sa1WwXdONrrOMoA1Cttpxu8Y/ZCLzyqQ4M+WL5j17g/jMihywZ3
hg4uduAbJ9Oq2gWXAi8JvnNLPYE5RdYjk3d0j4jFxyxSD8DeIOjp1tw/UT6VSoWK
n+ygnkytK+33BTuEoIKKEfl3O5XTYtERfroHf3trO+xaIMKqa06p3+qPM5+2Rnqx
cZ9cfqYqw+vCs/zkbtzWArA81N4O/QBDhNe4ktHyFkChCAN8dJSf0Yx5QM1oY50f
Vkj0kWe6nA34LURe2MazhrLSQP7ht/8WkC1l1efH+2gHOdNBmxsr3fqOvYznCziB
BWT40k8BRRdByRFICeSeS001FW+AUlbpE8q637iYCR8sGyqxJmCCb541W35o2gdT
5ciiIlzkqA3NudtWem09SR8UuBv9wXaiLx8qQXd72b/Na86U8dT3Bc8DKthJFWn6
59ubRiZuumctWs6sE7kZ9aPXpPpci4isfJAhNOCtgJ7+pC+g65E=
=s3Uy
-----END PGP SIGNATURE-----

--ASNnxeSggHlth0r3--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6342CC1BE
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Dec 2020 17:10:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADAFA17E4;
	Wed,  2 Dec 2020 17:09:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADAFA17E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606925409;
	bh=SMOZs4KWCFhUFelF2nFn3dSKK/3uWlQNtrXQxM1GSFU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rnDDp9EKfqCu8A/+eMqOgpUbL1GZwjDtr1D/vYKhN9OveUqrN4l9NEdUjLOjbHCEM
	 YyOPk40yO1y66uk7IRmauvZkvqOBs1ov00ZWLzlG+bZHz0qilnWLXNs0ZI/Bl7TwEc
	 IpgO9qHtdPjqvLwusqHZEvfRGXL5iAAByUgunAfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2CF9F804AB;
	Wed,  2 Dec 2020 17:09:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03212F804AA; Wed,  2 Dec 2020 17:08:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87FE1F8026B
 for <alsa-devel@alsa-project.org>; Wed,  2 Dec 2020 17:08:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87FE1F8026B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IIvmcKTC"
Date: Wed, 2 Dec 2020 16:08:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606925334;
 bh=SMOZs4KWCFhUFelF2nFn3dSKK/3uWlQNtrXQxM1GSFU=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=IIvmcKTCr7A9yv6jcfchaxPeaZqQL9EbWkWuhQjD2SxCqO03A+5lioR7PcLqkCgfP
 ocCptkp9EhuP0tqbWJ3/JIMw2QkXFfQuzH14pJ8s9XbTU6iSBta0alWHuKEpGH0Nva
 5nJowwVcpgoM1VvOpW+4+eR7PYTcC99w2NTQfDgg=
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 0/5] regmap/SoundWire/ASoC: Add SoundWire SDCA support
Message-ID: <20201202160824.GH5560@sirena.org.uk>
References: <20201130144020.19757-1-yung-chuan.liao@linux.intel.com>
 <DM6PR11MB4074311B4E0B70F24383E754FFF40@DM6PR11MB4074.namprd11.prod.outlook.com>
 <20201201041138.GY8403@vkoul-mobl>
 <e9478e45-2a24-05f9-eb56-5905d54ab6a4@linux.intel.com>
 <20201201145322.GG5239@sirena.org.uk>
 <20201202071405.GG8403@vkoul-mobl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jRdC2OsRnuV8iIl8"
Content-Disposition: inline
In-Reply-To: <20201202071405.GG8403@vkoul-mobl>
X-Cookie: Sauron is alive in Argentina!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "jank@cadence.com" <jank@cadence.com>, "Kale,
 Sanyog R" <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "rander.wang@linux.intel.com" <rander.wang@linux.intel.com>, "Liao,
 Bard" <bard.liao@intel.com>
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


--jRdC2OsRnuV8iIl8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 02, 2020 at 12:44:05PM +0530, Vinod Koul wrote:

>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/=
soundwire-for-asoc-5.11
>=20
> for you to fetch changes up to b7cab9be7c16128a0de21ed7ae67211838813437:
>=20
>   soundwire: SDCA: detect sdca_cascade interrupt (2020-11-24 14:09:31 +05=
30)

Pulled in, thanks.

--jRdC2OsRnuV8iIl8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/Hu/cACgkQJNaLcl1U
h9CZVQf/VyX8InS9fyMv9fL3qL4IplBUxFs3X9fZ0WNOlJCZbvgR7RVTqbPiQ190
eWYCzrj3yJUms/PeITGoTW83BAqPx8v428eEL8H3oRSiw9L/k6fhY90UQKGR4nvm
4vSMD1hZFTI16vKY7Hx+6xymYKKXIMBKqJe11xnbMjyeVQGbuXKouHcBTX3eibCi
IZn4IDBs7PSal//yPj2yzu81DQSbKCleeT/aD5uCAL6UnFcn1IMUZcfeUvcDrp7r
oZH8XYjTlNyfsZ8WglyY6AawbuZe2icL2KbWx2y1O3ebey0bQVsUryFWRz7vNLu9
OuF3gtaVjaypTH+fExmNsxtEYDST1Q==
=KTtm
-----END PGP SIGNATURE-----

--jRdC2OsRnuV8iIl8--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E46C02CB592
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Dec 2020 08:15:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 792B9177F;
	Wed,  2 Dec 2020 08:15:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 792B9177F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606893354;
	bh=bZBa2d1ifgYO1IKstjWq161xhJX/TZBr4/AVkE/SnYI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V++egmn6Wi2bs8QelIR0buiSKPYMUh7u+nrOAyKKpEj8x24bcRX+dJWwZQ3DdDv8i
	 dldB4wiN9AP22Z6hX+IEFe3FOS3RhXXazGefpc1TsXptYVqvpFrOpkfZNCeFLoa+4H
	 6mG8lAgn7HCp32L+3wlNJTjKQFzlrJXCYoVGzHA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CE51F8049C;
	Wed,  2 Dec 2020 08:14:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9647F8026B; Wed,  2 Dec 2020 08:14:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D907F80158
 for <alsa-devel@alsa-project.org>; Wed,  2 Dec 2020 08:14:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D907F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qGyH40Fg"
Date: Wed, 2 Dec 2020 12:44:05 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606893250;
 bh=bZBa2d1ifgYO1IKstjWq161xhJX/TZBr4/AVkE/SnYI=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=qGyH40FgRMBCX7U2RVOKKAW+zUcdPBi2P9UESPAnuHqV+pp5U1mHsvcPHPqX77UbE
 rIgMbor+3loIZKUtpXddVDepXC0XlzcoGR8Iv5WftpPgPVKlmqKYa739TjAEAMyE5h
 02Cs0PxFYocWQrcDruFeNBGVd/Rh6tV4SDfE/pjs=
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 0/5] regmap/SoundWire/ASoC: Add SoundWire SDCA support
Message-ID: <20201202071405.GG8403@vkoul-mobl>
References: <20201130144020.19757-1-yung-chuan.liao@linux.intel.com>
 <DM6PR11MB4074311B4E0B70F24383E754FFF40@DM6PR11MB4074.namprd11.prod.outlook.com>
 <20201201041138.GY8403@vkoul-mobl>
 <e9478e45-2a24-05f9-eb56-5905d54ab6a4@linux.intel.com>
 <20201201145322.GG5239@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Content-Disposition: inline
In-Reply-To: <20201201145322.GG5239@sirena.org.uk>
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


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,=20

On 01-12-20, 14:53, Mark Brown wrote:
> On Tue, Dec 01, 2020 at 08:35:42AM -0600, Pierre-Louis Bossart wrote:
> > On 11/30/20 10:11 PM, Vinod Koul wrote:
>=20
> > > I see Mark has already applied 1-3 ..
>=20
> > Sorry, I thought Mark had reversed the entire series.
>=20
> Yeah, I just backed out the one change for the driver.
>=20
> > Vinod, would you mind providing a tag for Mark then? The following comm=
it is
> > needed to compile:
>=20
> > b7cab9be7c161 ('soundwire: SDCA: detect sdca_cascade interrupt')
>=20
> That'd work, looks like there's only one fix patch it's based off.

I have created the tag, please pull:

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/so=
undwire-for-asoc-5.11

for you to fetch changes up to b7cab9be7c16128a0de21ed7ae67211838813437:

  soundwire: SDCA: detect sdca_cascade interrupt (2020-11-24 14:09:31 +0530)

----------------------------------------------------------------
soundwire-for-asoc-5.11

Tag for asoc to resolve build dependency with commit b7cab9be7c16
("soundwire: SDCA: detect sdca_cascade interrupt")

----------------------------------------------------------------
Pierre-Louis Bossart (1):
      soundwire: SDCA: detect sdca_cascade interrupt

Srinivas Kandagatla (1):
      soundwire: Fix DEBUG_LOCKS_WARN_ON for uninitialized attribute

 drivers/soundwire/bus.c             | 28 +++++++++++++++++++++++++++-
 drivers/soundwire/sysfs_slave_dpn.c |  1 +
 include/linux/soundwire/sdw.h       |  4 ++++
 3 files changed, 32 insertions(+), 1 deletion(-)

--=20
~Vinod

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAl/HPr0ACgkQfBQHDyUj
g0fOXhAAtHuTdezJjLa1sw3J5N1SoRFserwjvAimvV87MVRgeKA9StiT7w/cn9lT
U/aGhOiSmIETd/Q6r+011DCDkbmsh2MmQOeytyBEz1rPZuT3KKXcun7swOJETZES
nz7wFwt2evjm9/uSmyVfJOskH5QHXKDLyYnMHC92Edpw8UJ8hIn+hmmv62o23zoo
B5ZKVaLuHKpArNfDhQVfl+bALN8Ev5mRDqkoFUAaP7TfXPP/er0RwR8TsseXTKri
k3mExh2PY4DG2rLT7CY/I3lZwNEDc1B7JxTyJ4oZZO5Gx1S5JYID+uUDpyLskxCS
/E07eTFoFUA5MZRWDrAn8OkqVU7v9s7qs08kEHfSawPkpmAwkEjCbIwjZ+nji3fM
pODnZ+Uy1nuYkqEMpwn7PgULcdC9lW+YiF7016U7x6EsH7m7MPS+s0G340jPwS1N
HzDzLtydUTEv+uDzUQKYfE2qfhndHYARj6H+NLZEFJj0R885prLOfhoXknwv0g3f
VlW8Swd8nflDLbg2Uu1eP+p5vHi5w8K9u1ZaPzgmsImm0m514hgclegz5azZPYQu
MLrL5ycCbYQcXMlC91pGsfx8M5OnohS/1NAjMypnrBaaaf+pHcSI/gJrJCoa5hJP
AKn1bCxGStbFS6X37zXvb2SuDdVgQ5qgi5N4vb53fYnef4u1msY=
=841k
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--

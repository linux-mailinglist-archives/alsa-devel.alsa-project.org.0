Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C8C2C8C7E
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Nov 2020 19:19:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C20FA1710;
	Mon, 30 Nov 2020 19:18:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C20FA1710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606760343;
	bh=tN5fsrJ08eQUu84BANI51m0Lex4+/PW8hjq6/8XCCgU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=asTMUZbVS0a9fQ7acFI8B9QDWSkfgw8bmUP306Mpb5F9DX7ioiTV+J5IbunO0dJEV
	 1FccVjP3xxRvqmU6APNEUnn3ZBpNoYFN4JZ8EXdhsaOISHlTh8u++TpRtzzUvQoCrO
	 d1d0G0ij694ycMoTp1c5ihfBbiKxQ/SiFicKcxBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A14CFF804AB;
	Mon, 30 Nov 2020 19:17:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A6E3F804AA; Mon, 30 Nov 2020 19:17:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CAD9F804A9
 for <alsa-devel@alsa-project.org>; Mon, 30 Nov 2020 19:17:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CAD9F804A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H6oD9FLj"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4ACE320705;
 Mon, 30 Nov 2020 18:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606760256;
 bh=tN5fsrJ08eQUu84BANI51m0Lex4+/PW8hjq6/8XCCgU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H6oD9FLj1GG2rZL9EFmQj70L653085AubiqJlmK0SQklrvj7X19HhTEjAT5JJT6sw
 emRyogggM99WpxHItY9nBVBfC0XkjPkXAzWfZ9YQTgRSrpuDAxR7alr0+PWdHL3Hu3
 /XH8f7IaFHeHPrCgvpZosGB8T8zmwHjx91hOK6HA=
Date: Mon, 30 Nov 2020 18:17:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 5/5] ASoC/SoundWire: rt711-sdca: Add RT711 SDCA
 vendor-specific driver
Message-ID: <20201130181708.GF4756@sirena.org.uk>
References: <20201103172226.4278-1-yung-chuan.liao@linux.intel.com>
 <20201103172226.4278-6-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TU+u6i6jrDPzmlWF"
Content-Disposition: inline
In-Reply-To: <20201103172226.4278-6-yung-chuan.liao@linux.intel.com>
X-Cookie: Space is limited.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, vkoul@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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


--TU+u6i6jrDPzmlWF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2020 at 01:22:26AM +0800, Bard Liao wrote:
> From: Shuming Fan <shumingf@realtek.com>
>=20
> This is the initial codec driver for rt711 SDCA version.

This and the rt1316 change are failing to build for me on both the
regmap tree and a merge of this branch into the ASoC tree in an x86
allmodconfig with the errors below, I assume this is a dependency on the
SoundWire tree which I guess I need a pull request for?

/mnt/kernel/sound/soc/codecs/rt1316-sdw.c: In function 'rt1316_read_prop':
/mnt/kernel/sound/soc/codecs/rt1316-sdw.c:83:6: error: 'struct sdw_slave_pr=
op' has no member named 'is_sdca'
  prop->is_sdca =3D true;
      ^~
/mnt/kernel/sound/soc/codecs/rt711-sdca-sdw.c: In function 'rt711_sdca_read=
_prop':
/mnt/kernel/sound/soc/codecs/rt711-sdca-sdw.c:182:6: error: 'struct sdw_sla=
ve_prop' has no member named 'is_sdca'
  prop->is_sdca =3D true;
      ^~
In file included from /mnt/kernel/include/linux/printk.h:409,
                 from /mnt/kernel/include/linux/kernel.h:16,
                 from /mnt/kernel/include/linux/delay.h:22,
                 from /mnt/kernel/sound/soc/codecs/rt711-sdca-sdw.c:9:
/mnt/kernel/sound/soc/codecs/rt711-sdca-sdw.c: In function 'rt711_sdca_inte=
rrupt_callback':
/mnt/kernel/sound/soc/codecs/rt711-sdca-sdw.c:245:31: error: 'struct sdw_sl=
ave_intr_status' has no member named 'sdca_cascade'
   status->control_port, status->sdca_cascade);
                               ^~
/mnt/kernel/include/linux/dynamic_debug.h:129:15: note: in definition of ma=
cro '__dynamic_func_call'
   func(&id, ##__VA_ARGS__);  \
               ^~~~~~~~~~~
/mnt/kernel/include/linux/dynamic_debug.h:161:2: note: in expansion of macr=
o '_dynamic_func_call'
  _dynamic_func_call(fmt,__dynamic_dev_dbg,   \
  ^~~~~~~~~~~~~~~~~~
/mnt/kernel/include/linux/dev_printk.h:123:2: note: in expansion of macro '=
dynamic_dev_dbg'
  dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
  ^~~~~~~~~~~~~~~
/mnt/kernel/sound/soc/codecs/rt711-sdca-sdw.c:243:2: note: in expansion of =
macro 'dev_dbg'
  dev_dbg(&slave->dev,
  ^~~~~~~
/mnt/kernel/sound/soc/codecs/rt711-sdca-sdw.c:308:12: error: 'struct sdw_sl=
ave_intr_status' has no member named 'sdca_cascade'
  if (status->sdca_cascade)
            ^~
make[4]: *** [/mnt/kernel/scripts/Makefile.build:283: sound/soc/codecs/rt13=
16-sdw.o] Error 1

--TU+u6i6jrDPzmlWF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/FNyMACgkQJNaLcl1U
h9CurQf/dC37HxzASt7AqvuCkJ5753Qh0YsZluT4wI82h2wobMpmWzhQ9IszSaGr
cXQOcGZgisQ0/O/Z30gtnucNy42ji6zsfQJQbwBawx9nR+pzufpR4dK8+GGG8cbf
I6P2MDd92DIHJOsqqFXTNRP33dvHcPJRHzpgWefyPOfwRk3veWLTWEVRz86CtIkF
5LVs0QYh/NTi9M2A+hYATFBlIOGBU2QP/7cwMq6Uop+QfjGDTP/Sbg3W3ksBfpz7
Bl8iUWmxyIJbuqrw/xfwFoJUHXSqlEtOyuryTzDBF09BppbzUU6DIRkDhEDH9Ak4
YydjxKIlbjLN1k1iaAvhZGNL8t0c+Q==
=7AgW
-----END PGP SIGNATURE-----

--TU+u6i6jrDPzmlWF--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB2B47E79E
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 19:28:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 308D317D9;
	Thu, 23 Dec 2021 19:27:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 308D317D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640284103;
	bh=4U8UtwVy0KszuMa67n1hL7aI5XZh6iDm1CqeBYOSGDU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=utnU3KthW/3oYT7aM8TtoooEB9GdkTUf+XBrEx9CAyzV387yfC0uNyKxPfj+jdofu
	 lo6I5TRv6wV1yN29UWxl77cguovsVAyRsN1N9mHey7Ui5i4/lKC1dkQQOxG6CyC5el
	 9foLPa7Mv2nEYML3OYoVjKNSayNRYiZeFYtxVkVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C926F80115;
	Thu, 23 Dec 2021 19:27:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CA8AF80105; Thu, 23 Dec 2021 19:27:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05E45F80084
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 19:27:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05E45F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MCyLkLPZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 56B8061F04;
 Thu, 23 Dec 2021 18:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 673BDC36AE5;
 Thu, 23 Dec 2021 18:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640284021;
 bh=4U8UtwVy0KszuMa67n1hL7aI5XZh6iDm1CqeBYOSGDU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MCyLkLPZupeIqlIzPLu8CFnZ+okNCpZea/S7RsWdAb/6lC1ohbhVoaPzCy9xgRnOb
 1N/yZGlSFEHdb2mvgGP9E2iKTm8Zaf+ZgwTm+FhjybeLoKStaLOYe+K7e8hYzesYPV
 aZoG1CbP59GpsSL+K5SZtpYTAaOePATQyAbXQZuJKnCqV/LM/V7IbeDERfCet4E5b5
 k8Xd276foRyBp/vjq2ZGHwA9hiByMtLnkQzMreRf3gPUc3NJ03xMttEeOSQsSojYLU
 Vi1j61JokYUPtQ7Xmvr4WREO/21kPvbXmfDDdjzSABP3mzX0XmwOh6vp9GktK908xM
 6crW5tp4dxOwQ==
Date: Thu, 23 Dec 2021 18:26:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 7/7] soundwire: intel: remove PDM support
Message-ID: <YcS/cPb0UXsc9SWm@sirena.org.uk>
References: <20211213054634.30088-1-yung-chuan.liao@linux.intel.com>
 <20211213054634.30088-8-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oH+CFB7uVqhnu6IS"
Content-Disposition: inline
In-Reply-To: <20211213054634.30088-8-yung-chuan.liao@linux.intel.com>
X-Cookie: A modem is a baudy house.
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, vkoul@kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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


--oH+CFB7uVqhnu6IS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 13, 2021 at 01:46:34PM +0800, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>=20
> While the hardware supports PDM streams, this capability has never
> been tested or enabled on any product, so this is dead-code. Let's
> remove all this.

This doesn't build with current code, I'm guessing due to a Soundwire
dependency I don't have:

/mnt/kernel/drivers/soundwire/intel.c:1142:3: error: 'const struct snd_soc_=
dai_ops' has no member named 'set_sdw_stream'; did you mean 'set_stream'?
 1142 |  .set_sdw_stream =3D intel_pdm_set_sdw_stream,
      |   ^~~~~~~~~~~~~~
      |   set_stream
/mnt/kernel/drivers/soundwire/intel.c:1142:20: error: initialization of 'in=
t (*)(struct snd_pcm_substream *, struct snd_pcm_hw_params *, struct snd_so=
c_dai *)' from incompatible pointer type 'int (*)(struct snd_soc_dai *, voi=
d *, int)' [-Werror=3Dincompatible-pointer-types]
 1142 |  .set_sdw_stream =3D intel_pdm_set_sdw_stream,
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~
/mnt/kernel/drivers/soundwire/intel.c:1142:20: note: (near initialization f=
or 'intel_pdm_dai_ops.hw_params')
/mnt/kernel/drivers/soundwire/intel.c:1143:3: error: 'const struct snd_soc_=
dai_ops' has no member named 'get_sdw_stream'; did you mean 'get_stream'?
 1143 |  .get_sdw_stream =3D intel_get_sdw_stream,
      |   ^~~~~~~~~~~~~~
      |   get_stream
/mnt/kernel/drivers/soundwire/intel.c:1143:20: error: initialization of 'in=
t (*)(struct snd_pcm_substream *, struct snd_soc_dai *)' from incompatible =
pointer type 'void * (*)(struct snd_soc_dai *, int)' [-Werror=3Dincompatibl=
e-pointer-types]
 1143 |  .get_sdw_stream =3D intel_get_sdw_stream,
      |                    ^~~~~~~~~~~~~~~~~~~~
/mnt/kernel/drivers/soundwire/intel.c:1143:20: note: (near initialization f=
or 'intel_pdm_dai_ops.hw_free')
cc1: all warnings being treated as errors
make[3]: *** [/mnt/kernel/scripts/Makefile.build:287: drivers/soundwire/int=
el.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/mnt/kernel/scripts/Makefile.build:549: drivers/soundwire] Er=
ror 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/mnt/kernel/Makefile:1846: drivers] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:219: __sub-make] Error 2

--oH+CFB7uVqhnu6IS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHEv28ACgkQJNaLcl1U
h9COhQf/XJITxI7uwmAdAs5euRIHx45jbk3mP4sDaiWxN/zxKpNsUhk9g1K/aBuo
Vcdo0H4FKTG5R/PvxRC14VTcDd3NexCOqmUgDxsR6WP0DLNqYPSYO+2RcHqWv/zb
MMpn3TIgNO4nGEmIrLaygph/u4t814+TUlCD8wjnXdkJgzXwwXk2EcrHfibCOetX
9WWWRB59W5ULjHVveRjxdYzRakTpLNAmthvU0R7OdfLcXW/u8v9rHmN4TAhXvx9w
wK7gabo+1fU16VIiNUSVLcwhVRbcyijIPPU6n0T7oiGbgQgVi0a/ihCUa+MHAYn5
4MZMyaEPEwOOaHmnZuS43gmkq7y8eQ==
=abL6
-----END PGP SIGNATURE-----

--oH+CFB7uVqhnu6IS--

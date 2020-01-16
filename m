Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C96EA13D9E8
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 13:27:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5440517CC;
	Thu, 16 Jan 2020 13:26:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5440517CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579177658;
	bh=tlBuKQzNwOlKcoKFdy5+bH9uwldqs2lDfmVnxrP8PJw=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o8QDaz1VFCLuuUkZu+RxM2LQxriaQUKlqIcbo+39SQ7mPHvLc+99X83Kx7/UJ+oB2
	 j383/sC7AY33KQwS5mTayQvoLsUOpvtQvP/qVm1E8pJltu1u911XJxEr0ubdGImSu5
	 4OWxj/03/zohyE4Q5F642F7uhvauuTkNZ5qEJENI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DCC0F8014E;
	Thu, 16 Jan 2020 13:25:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EEC1F8014E; Thu, 16 Jan 2020 13:25:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F49EF800B9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 13:25:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F49EF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="UBwbHAKU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BPV0oGY73ylkaC4Ml4aN5ti1wfr8CZ7L3wkQ2nFFh2A=; b=UBwbHAKUKTXSRtHFJmINH+wnO
 uH9ObCR86ZBWwLSrQZF2pWPmXQQq0nHhO+6YZ/ZXTs5M/HWovHf24VK/4RbDGbJvVbCzRnK+e8Dk2
 JWP4pW2gfdiieVSIK0v9yD2Ny3mF0rwsr0GQQrZGYl64sdJKct/cYBgwIoi65W3hiegwY=;
Received: from [195.89.128.25] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1is4Dc-0006TE-Lz; Thu, 16 Jan 2020 12:25:48 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 5BADFD01965; Thu, 16 Jan 2020 12:25:48 +0000 (GMT)
Date: Thu, 16 Jan 2020 12:25:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20200116122548.GP3897@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [GIT PULL] ASoC fixes for v5.5
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
Content-Type: multipart/mixed; boundary="===============7726612589993320232=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7726612589993320232==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X9OP1fpbq0KufMFh"
Content-Disposition: inline


--X9OP1fpbq0KufMFh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit ff3b57417012fcc963ec281f5705bed837e4b1ac:

  ASoC: Intel: boards: Fix compile-testing RT1011/RT5682 (2020-01-03 00:56:47 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.5-rc6

for you to fetch changes up to 85578bbd642f65065039b1765ebe1a867d5435b0:

  ASoC: msm8916-wcd-digital: Reset RX interpolation path after use (2020-01-13 15:12:28 +0000)

----------------------------------------------------------------
ASoC: Fixes for v5.5

This is mostly driver specific fixes, plus an error handling fix
in the core.  There is a rather large diffstat for the stm32 SAI
driver, this is a very large but mostly mechanical update which
wraps every register access in the driver to allow a fix to the
locking which avoids circular locks, the active change is much
smaller and more reasonably sized.

----------------------------------------------------------------
Arnaud Pouliquen (1):
      ASoC: sti: fix possible sleep-in-atomic

Bard liao (1):
      ASoC: SOF: Intel: lower print level to dbg if we will reinit DSP

Dmitry Osipenko (1):
      ASoC: rt5640: Fix NULL dereference on module unload

Hans de Goede (1):
      ASoC: Intel: bytcht_es8316: Fix Irbis NB41 netbook quirk

Kai Vehmanen (2):
      ASoC: SOF: Intel: fix HDA codec driver probe with multiple controllers
      ASoC: hdac_hda: Fix error in driver removal after failed probe

Olivier Moysan (2):
      ASoC: stm32: sai: fix possible circular locking
      ASoC: stm32: dfsdm: fix 16 bits record

Stephan Gerhold (3):
      ASoC: msm8916-wcd-analog: Fix selected events for MIC BIAS External1
      ASoC: msm8916-wcd-analog: Fix MIC BIAS Internal1
      ASoC: msm8916-wcd-digital: Reset RX interpolation path after use

Takashi Iwai (1):
      ASoC: Fix NULL dereference at freeing

Yu-Hsuan Hsu (1):
      ASoC: cros_ec_codec: Make the device acpi compatible

 sound/soc/codecs/cros_ec_codec.c       |   8 ++
 sound/soc/codecs/hdac_hda.c            |   4 +-
 sound/soc/codecs/msm8916-wcd-analog.c  |  20 +++-
 sound/soc/codecs/msm8916-wcd-digital.c |   6 +
 sound/soc/codecs/rt5640.c              |   7 ++
 sound/soc/intel/boards/bytcht_es8316.c |   3 +-
 sound/soc/soc-component.c              |   3 +
 sound/soc/sof/intel/hda-codec.c        |  19 ++--
 sound/soc/sof/intel/hda-loader.c       |   6 +-
 sound/soc/sti/uniperif_player.c        |   7 +-
 sound/soc/stm/stm32_adfsdm.c           |  12 +-
 sound/soc/stm/stm32_sai_sub.c          | 194 ++++++++++++++++++++++++---------
 12 files changed, 209 insertions(+), 80 deletions(-)

--X9OP1fpbq0KufMFh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4gVksACgkQJNaLcl1U
h9DbbQf9HjlD72t9RQpSEIbvOisJtSxDxy9QhRA8oUlbIfVHB6q6sH1aYqHkAWwq
KqEwAi3C2lD5sk575J2062sPTEW43z1/UcxcjXFFBajty0UTAoXdenrAYappF3cd
ew9DY4gMj+XhzpLoLSpPpPizqw4JylIEAxpA6FegY6AwSeI+RjiI7UHYF1p97Qih
1eYD4hB/b8S6QH2IgB86jw/A8Jv0hnVdkMjvuqkJl0bqjIKoEXdgTpKk9ZGhAzsV
33h70fhznr9H6ZA8H9EHQZzhCBq6uGLe9gtlkgESKOKg7/haZylc2NC049U//OCq
/uzEM3OaCH6ZQzisrqTsrfoaH0bQrA==
=ny38
-----END PGP SIGNATURE-----

--X9OP1fpbq0KufMFh--

--===============7726612589993320232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7726612589993320232==--

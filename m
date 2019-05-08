Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3111B1756B
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 11:47:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A46FD1A3B;
	Wed,  8 May 2019 11:47:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A46FD1A3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557308870;
	bh=nKk3Clisymb8+a6zd94Lr6YGRx4c1xcw4SLX9dnChRc=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cSus4l250wIT7sbzaVoUs9Lc69OMRkWWQKVfTHK8Hf8f5WdIpdl6RGrAvUKJjKtC+
	 VZ4GoO2g6SdIc5K8SR6cWrT/6yhN4B59+BIXEiJSh7Dxu2uZviz2M93CIKR6ZM724a
	 jlk1xcYTrYXBcjrd0QKK8UfqjuqM3ry0sPMeIc3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BD97F896F0;
	Wed,  8 May 2019 11:46:06 +0200 (CEST)
X-Original-To: alsa-devel@Alsa-project.org
Delivered-To: alsa-devel@Alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B972F896F0; Wed,  8 May 2019 11:46:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 881F7F8075E
 for <alsa-devel@Alsa-project.org>; Wed,  8 May 2019 11:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 881F7F8075E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="sNZT9xZI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2ZkTK2hp/5Ick8oa3gjtiCbsm95Jj9sQIC4xrciThyY=; b=sNZT9xZIqiONyIfnkCHHh/cJu
 FYjexMBm5WtLCcHo6MXxSpN7MH64QIJtFbKjl21Jv0JtwUDfe91fXxlTW5HcwfiQK9g5ILpHWyKwS
 GfA7u9bhO+jKXZ+F3ngGcfSVoN5cbOWePBaQOUR9s/OceMBRQfle7wOgd8OF4yeLvw+PI=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOJ9D-0007mX-QB; Wed, 08 May 2019 09:46:00 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id D051444000C; Wed,  8 May 2019 10:45:54 +0100 (BST)
Date: Wed, 8 May 2019 18:45:54 +0900
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190508094554.GK14916@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@Alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [GIT PULL] ASoC fix for v5.2
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
Content-Type: multipart/mixed; boundary="===============1746055777735181107=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1746055777735181107==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L7HOq7zyYWLAwxxS"
Content-Disposition: inline


--L7HOq7zyYWLAwxxS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit ce38a75089f70f6380fc63a5478a7659b4eb3f47:

  ASoC: SOF: core: fix undefined nocodec reference (2019-05-08 15:42:00 +0900)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v5.2-4

for you to fetch changes up to 2a79e3d342e4b8883ff7fe2cf1b3e9192c26f61a:

  ASoC: SOF: Fix unused variable warnings (2019-05-08 18:33:34 +0900)

----------------------------------------------------------------
ASoC: ...and one more

This didn't get applied as quickly as expected due to a missing list CC
and I didn't notice my scripts delaying it.

----------------------------------------------------------------
Emil Renner Berthing (1):
      spi: rockchip: turn down tx dma bursts

Libin Yang (1):
      ASoC: codec: hdac_hdmi: no checking monitor in hw_params

Olivier Moysan (1):
      ASoC: stm32: i2s: update pcm hardware constraints

Takashi Iwai (1):
      ASoC: SOF: Fix unused variable warnings

Tzung-Bi Shih (3):
      ASoC: mediatek: mt6358: initialize setting when ramping volume
      ASoC: mediatek: mt6358: save output volume for mixer controls
      ASoC: mediatek: mt6358: save PGA for mixer control

 drivers/spi/spi-rockchip.c   |   4 +-
 sound/soc/codecs/hdac_hdmi.c |  13 -----
 sound/soc/codecs/mt6358.c    | 131 +++++++++++++++++++++++++++----------------
 sound/soc/sof/core.c         |   2 +
 sound/soc/stm/stm32_i2s.c    |   3 +-
 5 files changed, 89 insertions(+), 64 deletions(-)

--L7HOq7zyYWLAwxxS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSpVEACgkQJNaLcl1U
h9CSEwf/TvTK7ZydmEd/YTZkM8eR17lsI4pKq1LKjXED7zKmH2PmhIsuIbORe6GN
RkjdvCDI39DN98oA3MRUEBDhNskeOfCXGCTsBjar4oamFioZH94MEyIgWjmc0WLx
cRImjrPfhDLHIDfdD6qEJ+ABhZrSA73vVGeb2+Gx53vhkGCFDmZPUiUiHZbmtBZG
inCCv7IN96x2lC8zV/BuYaKIF89gEQM+IN4zeaM31qgTtzFaCfshRGppa06I1NfM
SSiCLwJoVWYAr6JbuJGAqZgl/VnmY9GscdWvMh09yKWaWeQMIC8f5OYvPCIGB1Xz
VDNa57Xqb2HQvGb4yrfm/OnSygeZ6Q==
=1Nrj
-----END PGP SIGNATURE-----

--L7HOq7zyYWLAwxxS--

--===============1746055777735181107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1746055777735181107==--

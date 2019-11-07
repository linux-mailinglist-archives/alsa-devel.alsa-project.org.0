Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 670F1F2E62
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 13:47:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8309E167D;
	Thu,  7 Nov 2019 13:46:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8309E167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573130822;
	bh=mfAbUdKj9pHN172osgjspFx5cHfmMbFna83eKRljuSM=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KWMV46ezqgXoEETjdegNQi7y6lXPVBzQiCGFO7Oj2V1WX0eawDOKJRudov6i9EOAd
	 KrXlzc7wZ/ySp3o+46HlNw720f2/An1BW7VMavV+tnLukXAxOdgzzhd5lI90bi1x9w
	 WcBnebYoCB+cBBJcU8dIVaTaACyZfailWLiwsDq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8044F8049B;
	Thu,  7 Nov 2019 13:45:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 417F1F8049B; Thu,  7 Nov 2019 13:45:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_76,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D6C1F80111
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 13:45:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D6C1F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="g68YLdVs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TNdzVj2qdiWMarShm5661JJBb04Go3Rv1UR7mmsYOJc=; b=g68YLdVsA79na+pW2xqepM946
 X/ioO+4XkKpzSaOK8MUjGe25WqPqFQxsdpf3K/WSVfLk+NFBuBhWDyBNSTqlG1X6xZwicnIyB2Z9D
 rUsP6WqQ4G6vQiXQuYJPjkpKMZmmA26GDV2Z4HBwX4u9Q7DZE3tcpJjZvXpPuqfys+iMA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iSh9z-0004K6-BO; Thu, 07 Nov 2019 12:45:11 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 699EB27431AF; Thu,  7 Nov 2019 12:45:10 +0000 (GMT)
Date: Thu, 7 Nov 2019 12:45:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwait <tiwai@suse.de>
Message-ID: <20191107124510.GD6159@sirena.co.uk>
MIME-Version: 1.0
X-Cookie: I've read SEVEN MILLION books!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [GIT PULL] ASoC fixes for v5.4
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
Content-Type: multipart/mixed; boundary="===============3956586867505916449=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3956586867505916449==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pZs/OQEoSSbxGlYw"
Content-Disposition: inline


--pZs/OQEoSSbxGlYw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 95a32c98055f664f9b3f34c41e153d4dcedd0eff:

  ASoC: SOF: control: return true when kcontrol values change (2019-10-18 18:09:22 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.4-rc6

for you to fetch changes up to 9508ef5a980f5d847cad9b932b6ada8f2a3466c1:

  ASoC: SOF: topology: Fix bytes control size checks (2019-11-06 15:31:12 +0000)

----------------------------------------------------------------
ASoC: Fixes for v5.4

These are a collection of fixes since v5.4-rc4 that have accumilated,
they're all driver specific and there's nothing major in here so it's
probably not essential to actually send them but I'll leave that call to
you.

----------------------------------------------------------------

Actually I miseed the hdmi-codec fix, that one probably should be sent -
I can split that out if needed (unfortunately it's in the middle of the
branch due to a lack of topics...).

Cheng-Yi Chiang (1):
      ASoC: rockchip: rockchip_max98090: Enable SHDN to fix headset detection

Dragos Tarcatu (1):
      ASoC: SOF: topology: Fix bytes control size checks

Jerome Brunet (1):
      ASoC: hdmi-codec: drop mutex locking again

Jiada Wang (1):
      ASoC: rsnd: dma: fix SSI9 4/5/6/7 busif dma address

Kai Vehmanen (1):
      ASoC: hdac_hda: fix race in device removal

Keyon Jie (1):
      ASoC: SOF: Intel: hda-stream: fix the CONFIG_ prefix missing

Navid Emamdoost (2):
      ASoC: SOF: Fix memory leak in sof_dfsentry_write
      ASoC: SOF: ipc: Fix memory leak in sof_set_get_large_ctrl_data

Olivier Moysan (1):
      ASoC: stm32: sai: add restriction on mmap support

Peter Ujfalusi (1):
      ASoC: ti: sdma-pcm: Add back the flags parameter for non standard dma names

Russell King (2):
      ASoC: kirkwood: fix external clock probe defer
      ASoC: kirkwood: fix device remove ordering

Stephan Gerhold (1):
      ASoC: msm8916-wcd-analog: Fix RX1 selection in RDAC2 MUX

Xiaojun Sang (1):
      ASoC: compress: fix unsigned integer overflow check

Yong Zhi (1):
      ASoC: max98373: replace gpio_request with devm_gpio_request

 sound/core/compress_offload.c          |  2 +-
 sound/soc/codecs/hdac_hda.c            |  2 +-
 sound/soc/codecs/hdmi-codec.c          | 12 +++++-------
 sound/soc/codecs/max98373.c            |  4 ++--
 sound/soc/codecs/msm8916-wcd-analog.c  |  4 ++--
 sound/soc/kirkwood/kirkwood-i2s.c      | 11 ++++++-----
 sound/soc/rockchip/rockchip_max98090.c |  7 +++++--
 sound/soc/sh/rcar/dma.c                |  4 ++--
 sound/soc/sof/debug.c                  |  6 ++++--
 sound/soc/sof/intel/hda-stream.c       |  4 ++--
 sound/soc/sof/ipc.c                    |  4 +++-
 sound/soc/sof/topology.c               | 11 ++++++-----
 sound/soc/stm/stm32_sai_sub.c          | 12 +++++++++++-
 sound/soc/ti/sdma-pcm.c                |  2 +-
 14 files changed, 51 insertions(+), 34 deletions(-)

--pZs/OQEoSSbxGlYw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3EEdUACgkQJNaLcl1U
h9CrDQf6Asrf4wGLaGMQ7EKTtF8Q8hYsS7l+5vC5Q3hk472ncuhFEjzod+EqcvUy
PjDZUGyFmEDktxPNlmc5XTettLE1sTisqwEKUdq86+UwHFUTKXxpHdu7LiUw0Iy3
HQg/Gx5t1Pm0CfXqcbb+1lsdsOQKUB8wsxXvNnjL918qtkPrK7ThDje/bNX6EQ9s
LtmR5eQzylF3XpjwIgn2GcHHur1MLKMxOIt1rACBfMkd04P6iQhwhYOZ7nzrBVXJ
JtZ8OdJBe8ckP8hbtgTbP3bDIcdEnutVmZBhNj31g1VEtuIcsQbbfMw1rQ0eSc8v
xw9REFTBZ1bv+Xpy1w/hJkaf7q3mCQ==
=Si6a
-----END PGP SIGNATURE-----

--pZs/OQEoSSbxGlYw--

--===============3956586867505916449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3956586867505916449==--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F026FDEB8A
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 14:03:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 834C11660;
	Mon, 21 Oct 2019 14:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 834C11660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571659428;
	bh=XpsBzRRt8ZJVpjiB6f/aecJrM+E80s1vS7cy/WEaHDc=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LqSFzZh0DI926LQScqS7/1WzjBtUogfaQvbjXCCROnF+Ph8bRjfFpS9r2+u790zPx
	 FdCYgNaZxYUg71ZIaY6mBdiVW3cW7IoBWVbMloVI/q5G+KMoO/Ai+ZihxSXbHpjPlc
	 ohHa7C4cQMeAyjookbpYmfhYHSx4Fumwzte5dW8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0289F80368;
	Mon, 21 Oct 2019 14:02:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94C6EF80368; Mon, 21 Oct 2019 14:02:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D30C7F80112
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 14:01:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D30C7F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NjyJFc5I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xJ7KS58Ac8x8CpJX9lXvXh5q9Je5A2czt+/CbdSjeeM=; b=NjyJFc5I/B/yMEFe/Ti0Ijpom
 7dNFgw25FslKO3XnNGbcPeUdGPr67ALtTpmTXwckzrgrZW//uHg0NO8YeKuU3awd3WDaBz3VWlj/x
 Drzq6LI/2o60mKFM28l8JyDdZSgdXUJhM3EfDirAPyV7iVuOQRTryf2p0JCuY3T5v/flI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iMWNq-00045G-Rx; Mon, 21 Oct 2019 12:01:58 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 198DC274301C; Mon, 21 Oct 2019 13:01:58 +0100 (BST)
Date: Mon, 21 Oct 2019 13:01:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191021120157.GD4691@sirena.co.uk>
MIME-Version: 1.0
X-Cookie: Why are you so hard to ignore?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [GIT PULL] ASoC fixes for 5.4
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
Content-Type: multipart/mixed; boundary="===============2238492655158443108=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2238492655158443108==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C1iGAkRnbeBonpVg"
Content-Disposition: inline


--C1iGAkRnbeBonpVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 147162f575152db80000fb3de26358264768ee9f:

  ASoC: ti: fix SND_SOC_DM365_VOICE_CODEC dependencies (2019-09-20 12:06:48 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.4-rc4

for you to fetch changes up to 95a32c98055f664f9b3f34c41e153d4dcedd0eff:

  ASoC: SOF: control: return true when kcontrol values change (2019-10-18 18:09:22 +0100)

----------------------------------------------------------------
ASoC: Fixes for v5.4

A collection of fixes that have arrived since the merge window.  There
are a small number of core fixes here but they are smaller ones around
error handling.

----------------------------------------------------------------
Bard Liao (1):
      ASoC: intel: sof_rt5682: use separate route map for dmic

Chuhong Yuan (1):
      ASoC: Intel: sof-rt5682: add a check for devm_clk_get

Dan Carpenter (2):
      ASoC: soc-component: fix a couple missing error assignments
      ASoC: topology: Fix a signedness bug in soc_tplg_dapm_widget_create()

Daniel Baluta (1):
      ASoC: simple_card_utils.h: Fix potential multiple redefinition error

Dragos Tarcatu (1):
      ASoC: SOF: control: return true when kcontrol values change

Hans de Goede (1):
      ASoC: core: Fix pcm code debugfs error

Jaska Uimonen (3):
      ASoC: rt5682: add NULL handler to set_jack function
      ASoC: intel: sof_rt5682: add remove function to disable jack
      ASoC: intel: bytcr_rt5651: add null check to support_button_press

Junya Monden (1):
      ASoC: rsnd: Reinitialize bit clock inversion flag for every format setting

Kai Vehmanen (2):
      ASoC: SOF: pcm: fix resource leak in hw_free
      ASoC: SOF: Intel: hda: fix warnings during FW load

Keyon Jie (1):
      ASoC: SOF: topology: fix parse fail issue for byte/bool tuple types

Li Xu (1):
      ASoC: wm_adsp: Fix theoretical NULL pointer for alg_region

Liam Girdwood (1):
      ASoC: SOF: Intel: initialise and verify FW crash dump data.

Olivier Moysan (1):
      ASoC: stm32: sai: fix sysclk management on shutdown

Pan Xiuli (1):
      ASoC: SOF: pcm: harden PCM STOP sequence

Pierre-Louis Bossart (1):
      ASoC: SOF: loader: fix kernel oops on firmware boot failure

Ranjani Sridharan (1):
      ASoC: SOF: Intel: hda: Disable DMI L1 entry during capture

Robin Murphy (1):
      ASoc: rockchip: i2s: Fix RPM imbalance

Sathyanarayana Nujella (1):
      ASoC: max98373: check for device node before parsing

Srinivas Kandagatla (1):
      ASoC: msm8916-wcd-digital: add missing MIX2 path for RX1/2

Stuart Henderson (1):
      ASoC: wm_adsp: Don't generate kcontrols without READ flags

Sylwester Nawrocki (2):
      ASoC: samsung: arndale: Add missing OF node dereferencing
      ASoC: wm8994: Do not register inapplicable controls for WM1811

 include/sound/simple_card_utils.h      |  8 ++---
 sound/soc/codecs/max98373.c            | 20 +++++++-----
 sound/soc/codecs/msm8916-wcd-digital.c | 22 +++++++++++++
 sound/soc/codecs/rt5651.c              |  3 ++
 sound/soc/codecs/rt5682.c              | 12 +++++--
 sound/soc/codecs/wm8994.c              | 43 ++++++++++++++----------
 sound/soc/codecs/wm_adsp.c             | 10 ++++--
 sound/soc/intel/boards/sof_rt5682.c    | 60 +++++++++++++++++++++++++++++++---
 sound/soc/rockchip/rockchip_i2s.c      |  2 +-
 sound/soc/samsung/arndale_rt5631.c     | 34 ++++++++++++++++---
 sound/soc/sh/rcar/core.c               |  1 +
 sound/soc/soc-pcm.c                    | 17 +++++++---
 sound/soc/soc-topology.c               |  2 +-
 sound/soc/sof/control.c                | 26 ++++++++++-----
 sound/soc/sof/intel/Kconfig            | 10 ++++++
 sound/soc/sof/intel/bdw.c              |  7 ++++
 sound/soc/sof/intel/byt.c              |  6 ++++
 sound/soc/sof/intel/hda-ctrl.c         | 12 +++----
 sound/soc/sof/intel/hda-loader.c       |  1 +
 sound/soc/sof/intel/hda-stream.c       | 45 +++++++++++++++++++++----
 sound/soc/sof/intel/hda.c              |  7 ++++
 sound/soc/sof/intel/hda.h              |  5 ++-
 sound/soc/sof/loader.c                 |  4 +--
 sound/soc/sof/pcm.c                    | 35 +++++++++++++-------
 sound/soc/sof/topology.c               |  4 ++-
 sound/soc/stm/stm32_sai_sub.c          | 21 ++++++------
 26 files changed, 320 insertions(+), 97 deletions(-)

--C1iGAkRnbeBonpVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2tnjUACgkQJNaLcl1U
h9CtyAf43D8Bx1gH+vw8LGfqzBsK2bLErjld0Y0x8nSTok9SP8rYlvcNZ4hNTFIv
jf07f2S/bXD0T+Zq2bSNp/mC9IEMckVNKm+0S9vcpTpC86wKHnLEUo0xLBg3ddxI
RS9ldshsj6Zuc6cA9/9iYQmjhWUkq9hdmvHSO0Cb0Edcwrr4W2e53zKWB0xJeLJZ
13bKaRk9EkdMUnEm9gc8MH6yB/EzO3gBOxH6gFHfFweeEH7pPRpgohH2FOzxF6ND
BC5RIWDlT+/i0KjPOgz7xmy5jcgzMSrbF61DKohWSCmM0lVMCsxcdEsRd+zQGW99
2LIwfcKBsEVs/LRnsjusMvxMUfUF
=dKM0
-----END PGP SIGNATURE-----

--C1iGAkRnbeBonpVg--

--===============2238492655158443108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2238492655158443108==--

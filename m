Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C53E5280572
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 19:35:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB862193E;
	Thu,  1 Oct 2020 19:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB862193E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601573719;
	bh=lSsdI6bHK0ftfwXz1I+3SDyH8SmFbuYaJ8AM+iOG4IQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JH6tM4wHJZdthF0+zi7LawueafamIEyzBbHKE7xPPLn56JKwcTAvC0mtwrJ9epLsS
	 7XJ3M4Kg2U+ndDSj8tdCnIDqvP4425kxY4cJ+RMHAfVyvU/6VafHUAojQBopR7os/A
	 3aA8/CF3sK8M+ScCRDJHQjjo58MmbxebsZk3NV5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4478F800AB;
	Thu,  1 Oct 2020 19:33:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFBB7F801F5; Thu,  1 Oct 2020 19:33:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3591F800AB
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 19:33:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3591F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="msj1eZRe"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7612d50004>; Thu, 01 Oct 2020 10:33:09 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 17:33:20 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 1 Oct 2020 17:33:15 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>, <pierre-louis.bossart@linux.intel.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <thierry.reding@gmail.com>,
 <jonathanh@nvidia.com>
Subject: [PATCH v3 00/13] Audio graph card updates and usage with Tegra210
 audio
Date: Thu, 1 Oct 2020 23:02:54 +0530
Message-ID: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601573589; bh=zIvUzbc372htqDG/kgYhVBEV7XV+PVNNp5+Sxf3SNgs=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Type;
 b=msj1eZReDZtL2j2G91y9txTk98M5l8Wv36m5qqRHxQvAJnI0aYkX7BGwQTJTqG/78
 RrPMpvDF5v5uGKYkKOSImbU36Hu8Xe9UHvlJ7dSt5t1pwQRGPaYYWpF4VQR/qWs69i
 rLbEEf2HGyQk4uadJgI7id70udcfP8S865fOzcWBOCf30p0yU4OynNKWkBgW58Vufm
 REpiIkOMX0tKqnUmsGcbYUw6e+Haa9wvZ27mExyLfZm7EO1RbL8UwaW7GfxuYCkvFS
 lHIjMmMC7UhmP5pmYfSwU5jivdbi8egSpeMCqXfKusW91Ezqa+jWmbeOeRjBVPH74T
 JFDrya9M8/Osg==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 nicoleotsuka@gmail.com, swarren@nvidia.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, atalambedu@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, nwartikar@nvidia.com, linux-tegra@vger.kernel.org,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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

Summary of changes:
 * Support multiple instances of a component. For example there can be
   multiple I2S devices which can use the same component driver.

 * Support open platforms with empty Codec endpoint. Customers can plug
   their own HW and can populate codec endpoint.

 * In a component model there can be many components which can be
   connected togethe. In such cases Identify no-pcm DPCM DAI links which
   can be used in BE<->BE connections.

 * Add Tegra audio graph driver which is based on generic audio graph
   driver and specific customizations are done in Tegra driver.

 * This pushes DT support for Tegra210 based platforms which uses
   audio-graph card and above enhancements.

The series is based on following references where DPCM usgae for Tegra
Audio and simple-card driver proposal were discussed.

 * https://lkml.org/lkml/2020/4/30/519 (DPCM for Tegra)
 * https://lkml.org/lkml/2020/6/27/4 (simple-card driver)

Changelog
=========

v1 -> v2
--------
 * Re-organized ports/endpoints description for ADMAIF and XBAR.
   Updated DT patches accordingly.
 * After above change, multiple Codec endpoint support is not
   required and hence dropped for now. This will be considered
   separately if at all required in future.
 * Re-ordered patches in the series.


v2 -> v3
--------
 * Dropped new compatible addition in generic graph driver
   after reviewing it with Morimoto-san. Instead added Tegra
   audio graph driver and new compatibles are added in the same.
 * Added new patches to expose new members for customization
   in audio graph driver.
 * Added new patch for Tegra audio graph driver and related
   documentation.
 * Minor change in below commit where mutex version of helper is used
   "ASoC: audio-graph: Identify 'no_pcm' DAI links for DPCM"
 * DT binding is updated to use the newly exposed compatibles
 * No changes in other patches


Sameer Pujar (13):
  ASoC: soc-core: Fix component name_prefix parsing
  ASoC: soc-pcm: Get all BEs along DAPM path
  ASoC: audio-graph: Use of_node and DAI for DPCM DAI link names
  ASoC: audio-graph: Identify 'no_pcm' DAI links for DPCM
  ASoC: audio-graph: Support empty Codec endpoint
  ASoC: simple-card-utils: Expose new members for asoc_simple_priv
  ASoC: audio-graph: Update driver as per new exposed members
  ASoC: audio-graph: Expose helpers from audio graph
  ASoC: dt-bindings: tegra: Add schema for audio graph card
  ASoC: tegra: Add audio graph based card driver
  arm64: defconfig: Enable Tegra audio graph card driver
  arm64: tegra: Audio graph header for Tegra210
  arm64: tegra: Audio graph sound card for Jetson Nano and TX1

 .../sound/nvidia,tegra-audio-graph-card.yaml       |  67 +++++
 .../boot/dts/nvidia/tegra210-audio-graph.dtsi      | 138 ++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 219 ++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 124 +++++++++
 arch/arm64/configs/defconfig                       |   1 +
 include/sound/graph_card.h                         |  19 ++
 include/sound/simple_card_utils.h                  |   4 +
 include/sound/soc.h                                |   1 +
 sound/soc/generic/audio-graph-card.c               |  92 +++++--
 sound/soc/soc-core.c                               |   3 +-
 sound/soc/soc-pcm.c                                |   3 +-
 sound/soc/tegra/Kconfig                            |   9 +
 sound/soc/tegra/Makefile                           |   2 +
 sound/soc/tegra/tegra_audio_graph_card.c           | 291 +++++++++++++++++++++
 14 files changed, 955 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi
 create mode 100644 include/sound/graph_card.h
 create mode 100644 sound/soc/tegra/tegra_audio_graph_card.c

-- 
2.7.4


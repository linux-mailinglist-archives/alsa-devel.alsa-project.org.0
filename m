Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3899F95C121
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2024 00:50:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37F3D827;
	Fri, 23 Aug 2024 00:50:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37F3D827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724367041;
	bh=SnP+p7B2K/jsXcPIXgKabjOTm7gWb3UxAWuZDgAsclw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FaRzuDWKIP7NDC0TQ3HgRTfoZ5oV4qK7fc6Il6/rya0zdJ+/53G6tCO2mGlPxggZF
	 ZYXGv1ORQXBjoHRGFjTSPXopGvyqzku1pyhbxoqWJzOVk3cwFbAkBsRYw1AD1hZFcW
	 FcDCW7suFNblXJaWr+jpGqnn4faR1E+0c2QOcuDE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8949CF80580; Fri, 23 Aug 2024 00:50:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 933E8F805AF;
	Fri, 23 Aug 2024 00:50:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67F43F80496; Fri, 23 Aug 2024 00:50:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D489F80107
	for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2024 00:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D489F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WPWnlEAG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 62398A41DBF;
	Thu, 22 Aug 2024 22:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B8CC32782;
	Thu, 22 Aug 2024 22:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724366993;
	bh=SnP+p7B2K/jsXcPIXgKabjOTm7gWb3UxAWuZDgAsclw=;
	h=From:To:Cc:Subject:Date:From;
	b=WPWnlEAGBx2Lv0QCV7BeE0UtHcx5pPtYbOfSm6euv2mITdSiPAA/0NHCZ9Z8eoTvN
	 oTREiwrDW8+cMLBk52459ZyAYxg+VOtVoaz9XW0FmZW8KzaHzt8rjZbXyjZoWnGppJ
	 vBwduhlE0X+xvY+cO9lh7djaIB4l4G1i8a6H3pgRrkyKsI3X8aOpliD0t6X2gJgDQq
	 9rZslunyl3CVkEyTNCCo/4qYmbi02291TBcnhGkD/PmN3lKEs1x2HHb7X+ojebF1rg
	 /G5GW5pFaagR/fVAlhqkBlXuPChuT8TyrSGDpongMofG3QROuSCeVPqWmCXOHGQAH5
	 H8/nhspKbv7vg==
Message-ID: <9bc5cbb9307d2b9bb73ea897f34867f2.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.11-rc3
Date: Thu, 22 Aug 2024 23:47:29 +0100
Message-ID-Hash: BHWFZMV5SFL6N6H4A6M3SX3RKNCBGIJV
X-Message-ID-Hash: BHWFZMV5SFL6N6H4A6M3SX3RKNCBGIJV
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BHWFZMV5SFL6N6H4A6M3SX3RKNCBGIJV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 72776774b55bb59b7b1b09117e915a5030110304:

  ASoC: cs35l56: Patch CS35L56_IRQ1_MASK_18 to the default value (2024-08-08 20:34:56 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.11-rc3

for you to fetch changes up to bb4485562f5907708f1c218b5d70dce04165d1e1:

  ASoC: cs-amp-lib: Ignore empty UEFI calibration entries (2024-08-22 17:52:26 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.11

A relatively large collection of fixes here, all driver specific and
none of them particularly major, plus one MAINTAINERS update.  There's
been a bunch of work on module autoloading from several people.

----------------------------------------------------------------
Albert Jakieła (1):
      ASoC: SOF: mediatek: Add missing board compatible

Dmitry Baryshkov (2):
      ASoC: codecs: lpass-macro: fix version strings returned for 1.x codecs
      ASoC: codecs: lpass-va-macro: warn on unknown version

Hongbo Li (2):
      ASoC: allow module autoloading for table db1200_pids
      ASoC: allow module autoloading for table board_ids

Krzysztof Kozlowski (2):
      ASoC: MAINTAINERS: Drop Banajit Goswami from Qualcomm sound drivers
      ASoC: codecs: wcd937x: Fix missing de-assert of reset GPIO

Mark Brown (1):
      ASoC: codecs: warn on unknown codec version

Richard Fitzgerald (2):
      ASoC: cs-amp-lib-test: Force test calibration blob entries to be valid
      ASoC: cs-amp-lib: Ignore empty UEFI calibration entries

Vijendar Mukunda (3):
      ASoC: SOF: amd: move iram-dram fence register programming sequence
      ASoC: SOF: amd: Fix for incorrect acp error register offsets
      ASoC: SOF: amd: Fix for acp init sequence

YR Yang (1):
      ASoC: mediatek: mt8188: Mark AFE_DAC_CON0 register as volatile

Yuntao Liu (1):
      ASoC: amd: acp: fix module autoloading

 MAINTAINERS                                |  1 -
 sound/soc/amd/acp/acp-legacy-mach.c        |  2 ++
 sound/soc/amd/acp/acp-sof-mach.c           |  2 ++
 sound/soc/au1x/db1200.c                    |  1 +
 sound/soc/codecs/cs-amp-lib-test.c         |  9 ++++++
 sound/soc/codecs/cs-amp-lib.c              |  7 +++-
 sound/soc/codecs/lpass-macro-common.h      |  6 ++++
 sound/soc/codecs/lpass-va-macro.c          |  4 +++
 sound/soc/codecs/wcd937x.c                 |  5 ++-
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c |  1 +
 sound/soc/sof/amd/acp-dsp-offset.h         |  6 ++--
 sound/soc/sof/amd/acp.c                    | 52 ++++++++++++++++++++----------
 sound/soc/sof/amd/acp.h                    |  9 ++++--
 sound/soc/sof/amd/pci-acp63.c              |  2 ++
 sound/soc/sof/amd/pci-rmb.c                |  2 ++
 sound/soc/sof/amd/pci-rn.c                 |  2 ++
 sound/soc/sof/mediatek/mt8195/mt8195.c     |  3 ++
 17 files changed, 88 insertions(+), 26 deletions(-)

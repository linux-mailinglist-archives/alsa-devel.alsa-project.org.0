Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 049078D4F75
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2024 17:52:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FD34852;
	Thu, 30 May 2024 17:52:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FD34852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717084336;
	bh=1+tYZTdbJPcBhwpeBGcD2hP+j8RIsasvPjIjKgbrkyY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iNZ7GvkzQvIvvoLaF8nKgRTdh7tcKEjdBzLqqlvHs64bIdNg1i282qHqVOjAPVJD7
	 S/ZrfFSx0JTBU951XsMRv5+13JWR+s2AeiXxYUXQUyWQqNzKHRiMY49L0790g5hof1
	 tUEkh6zAL1nVccyNS1nYDLuat9qwr7Z+e0aw209Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3BBBF8055C; Thu, 30 May 2024 17:51:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93E38F8026D;
	Thu, 30 May 2024 17:51:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73323F80149; Thu, 30 May 2024 17:51:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E343F800BA
	for <alsa-devel@alsa-project.org>; Thu, 30 May 2024 17:51:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E343F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CxYMaOvv
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D08F261179;
	Thu, 30 May 2024 15:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F004C32781;
	Thu, 30 May 2024 15:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717084298;
	bh=1+tYZTdbJPcBhwpeBGcD2hP+j8RIsasvPjIjKgbrkyY=;
	h=From:To:Cc:Subject:Date:From;
	b=CxYMaOvv42iCartNbk24HpCfZhKZHMOQCjqaFW3933OMJP2vp4OEsIwZQrd/WTDnp
	 TAQ3hqTJZXLjOj+yEo/meGM/K/pORF+GQJEWkiPbphoEcbSYK4rT4X8BvpnS2tNfGL
	 r2H8SfI+PO9mGBdYT7gwwsoxchtLYDPWYyFTZ4SM9HDIAqT7pHY0SUSMP1XEi+GhRW
	 8WUH74jiu3ZC85A6Tq//qnpIqHdVPyiDeM8d4IpcVyqPDjY7/Ht1FfBK0sqMQReUEw
	 RaelOyUWgVtoIrJPLEmPDWDBHWmdXjCcHYHALUFHVX9RAywVBOhgtNUXJlVhJE4bKR
	 XdTCm7B5KnP8g==
Message-ID: <742f0e8936b9a37840105c7169a63f0a.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.10-rc1
Date: Thu, 30 May 2024 16:51:32 +0100
Message-ID-Hash: 4NEWBF2XLGZZQ6LDCCSYHB2PXTPKOFTH
X-Message-ID-Hash: 4NEWBF2XLGZZQ6LDCCSYHB2PXTPKOFTH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4NEWBF2XLGZZQ6LDCCSYHB2PXTPKOFTH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.10-rc1

for you to fetch changes up to c85578e730135d47271ca874e4436dd87e87f252:

  ASoC: SOF: ipc4-topology: Fix nhlt configuration blob (2024-05-30 14:33:14 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.10

Several serieses of fixes that have come in since the merge window,
mostly for Intel systems.  The biggest thing is some updates from Peter
which fix support for a series of Intel laptops which have been found to
use 16 bit rather than 32 bit DMIC configuration blobs in their firmware
descriptions.  We also have a bunch of fixes for module annotations, and
some smaller single patch fixes.

----------------------------------------------------------------
Charles Keepax (3):
      ASoC: cs42l43: Only restrict 44.1kHz for the ASP
      ASoC: wm_adsp: Add missing MODULE_DESCRIPTION()
      MAINTAINERS: Remove James Schulman from Cirrus audio maintainers

Mark Brown (2):
      ASoC: SOF: add missing MODULE_DESCRIPTION
      ASoC: SOF: ipc4-topology: Fix nhlt configuration blob

Peter Ujfalusi (6):
      ASoC: SOF: ipc4-topology: Fix input format query of process modules without base extension
      ASoC: SOF: ipc4-topology: Add support for NHLT with 16-bit only DMIC blob
      ASoC: SOF: ipc4-topology: Print out the channel count in sof_ipc4_dbg_audio_format
      ASoC: SOF: ipc4-topology/pcm: Rename sof_ipc4_copier_is_single_format()
      ASoC: SOF: ipc4-topology: Improve readability of sof_ipc4_prepare_dai_copier()
      ASoC: SOF: ipc4-topology: Adjust the params based on DAI formats

Pierre-Louis Bossart (5):
      ASoC: SOF: stream-ipc: remove unnecessary MODULE_LICENSE
      ASoC: SOF: AMD: group all module related information
      ASoC: SOF: reorder MODULE_ definitions
      ASoC: SOF: add missing MODULE_DESCRIPTION()
      ASoC: Intel: sof-sdw: fix missing SPI_MASTER dependency

 MAINTAINERS                                    |   1 -
 sound/soc/codecs/cs42l43.c                     |   5 +-
 sound/soc/codecs/wm_adsp.c                     |   1 +
 sound/soc/intel/boards/Kconfig                 |   2 +-
 sound/soc/sof/amd/acp-common.c                 |   4 +-
 sound/soc/sof/amd/acp.c                        |   2 +-
 sound/soc/sof/amd/acp63.c                      |   4 -
 sound/soc/sof/amd/pci-acp63.c                  |   1 +
 sound/soc/sof/amd/pci-rmb.c                    |   1 +
 sound/soc/sof/amd/pci-rn.c                     |   1 +
 sound/soc/sof/amd/pci-vangogh.c                |   1 +
 sound/soc/sof/amd/rembrandt.c                  |   4 -
 sound/soc/sof/amd/renoir.c                     |   4 -
 sound/soc/sof/amd/vangogh.c                    |   4 -
 sound/soc/sof/core.c                           |   2 +-
 sound/soc/sof/imx/imx-common.c                 |   1 +
 sound/soc/sof/imx/imx8.c                       |   3 +-
 sound/soc/sof/imx/imx8m.c                      |   3 +-
 sound/soc/sof/imx/imx8ulp.c                    |   3 +-
 sound/soc/sof/intel/atom.c                     |   1 +
 sound/soc/sof/intel/bdw.c                      |   1 +
 sound/soc/sof/intel/byt.c                      |   1 +
 sound/soc/sof/intel/hda-codec.c                |   1 +
 sound/soc/sof/intel/hda-ctrl.c                 |   1 +
 sound/soc/sof/intel/hda-mlink.c                |   1 +
 sound/soc/sof/intel/hda.c                      |   1 +
 sound/soc/sof/intel/pci-apl.c                  |   1 +
 sound/soc/sof/intel/pci-cnl.c                  |   1 +
 sound/soc/sof/intel/pci-icl.c                  |   1 +
 sound/soc/sof/intel/pci-lnl.c                  |   1 +
 sound/soc/sof/intel/pci-mtl.c                  |   1 +
 sound/soc/sof/intel/pci-skl.c                  |   1 +
 sound/soc/sof/intel/pci-tgl.c                  |   1 +
 sound/soc/sof/intel/pci-tng.c                  |   1 +
 sound/soc/sof/ipc4-pcm.c                       |  12 +-
 sound/soc/sof/ipc4-topology.c                  | 163 +++++++++++++++++--------
 sound/soc/sof/ipc4-topology.h                  |   6 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c         |   3 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c         |   3 +-
 sound/soc/sof/mediatek/mtk-adsp-common.c       |   1 +
 sound/soc/sof/nocodec.c                        |   2 +-
 sound/soc/sof/sof-acpi-dev.c                   |   1 +
 sound/soc/sof/sof-client-ipc-flood-test.c      |   2 +-
 sound/soc/sof/sof-client-ipc-kernel-injector.c |   2 +-
 sound/soc/sof/sof-client-ipc-msg-injector.c    |   2 +-
 sound/soc/sof/sof-client-probes.c              |   2 +-
 sound/soc/sof/sof-of-dev.c                     |   1 +
 sound/soc/sof/sof-pci-dev.c                    |   1 +
 sound/soc/sof/sof-utils.c                      |   1 +
 sound/soc/sof/stream-ipc.c                     |   2 -
 sound/soc/sof/xtensa/core.c                    |   2 +-
 51 files changed, 173 insertions(+), 95 deletions(-)

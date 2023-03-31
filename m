Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F4A6D24E0
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 18:12:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 202CB1F7;
	Fri, 31 Mar 2023 18:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 202CB1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680279150;
	bh=9itkFxGGN6LywHIeFabmroiKFs/uH5MJXwsOPa/n07M=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LUrJi5r9nuUHkJz1InLGNAVfG8kINQf/PiqdUcGmcn74Rx5OStAwYCVrwBVYHW/Mz
	 AxWizqredJtozAqruY4QA/NIRTacA7MEb607qeGIm2UHrWR0ptK7TGm2EBhMIfIPi0
	 V/jzKlTmYWoSMyf9mllFeD1iNy3Hc2zztvE0X0Mk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8669DF8032D;
	Fri, 31 Mar 2023 18:11:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B0FDF80290; Fri, 31 Mar 2023 18:11:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6481F800C9
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 18:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6481F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gfM3Dd34
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 087D4CE2F30;
	Fri, 31 Mar 2023 16:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF223C4339B;
	Fri, 31 Mar 2023 16:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680279073;
	bh=9itkFxGGN6LywHIeFabmroiKFs/uH5MJXwsOPa/n07M=;
	h=From:To:Cc:Subject:Date:From;
	b=gfM3Dd342wd7ZqIIKr6QdgFLCJPXBSRYsEWPO9lbiKzJvTHqMPw+H8PeRjS32REc7
	 QpUdLMaMLyCNIs+JThZ6vD69lgHxovWNJlvWp8B2bI4xhi3m3BYMVQqmtK0TrPBO8e
	 6hGNDvHS0h7Mq2XF2MuDr4cP7Ra9V/E/LeFM6xSmbhIIWQsdKKP4gAu+1qNMwwSCVw
	 AueGvBcmVTsCj33kA1VkKylEwRS3nLKODlYL7VbZlFi7iE5XVCayI9ojdqtEz3I2us
	 W/Wgua7c780a1vCHek8hpuCStDEKJTJA+D4h7H+BjKnk6FKS922YSZtKioktCQgWgC
	 4HwgWD2QwzO3Q==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v6.3-rc4
Date: Fri, 31 Mar 2023 17:11:00 +0100
Message-Id: <20230331161112.DF223C4339B@smtp.kernel.org>
Message-ID-Hash: JU2ENGVTDSMCN62VDMLQOOVTWFLF2A6K
X-Message-ID-Hash: JU2ENGVTDSMCN62VDMLQOOVTWFLF2A6K
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JU2ENGVTDSMCN62VDMLQOOVTWFLF2A6K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.3-rc4

for you to fetch changes up to e3720f92e0237921da537e47a0b24e27899203f8:

  ASoC: SOF: avoid a NULL dereference with unsupported widgets (2023-03-29 14:40:18 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.3

More fixes for v6.3, plus a few new trivial device ID additions.
Almost all of this is for the Intel drivers, though there is one
core fix from Shengjiu which ensures that format constraints are
correctly applied in some cases where they were missed.

----------------------------------------------------------------
Duy Nguyen (1):
      ASoC: da7213.c: add missing pm_runtime_disable()

Eugene Huang (2):
      ASOC: Intel: sof_sdw: add quirk for Intel 'Rooks County' NUC M15
      ASoC: Intel: soc-acpi: add table for Intel 'Rooks County' NUC M15

Ge-org Brohammer (1):
      ASoC: amd: yc: Add DMI entries to support Victus by HP Laptop 16-e1xxx (8A22)

Guennadi Liakhovetski (1):
      ASoC: SOF: avoid a NULL dereference with unsupported widgets

Hans de Goede (1):
      ASoC: Intel: bytcr_rt5640: Add quirk for the Acer Iconia One 7 B1-750

Jason Montleon (1):
      ASoC: hdac_hdmi: use set_stream() instead of set_tdm_slots()

Mark Brown (2):
      Merge tag 'v6.3-rc2' into asoc-6.3 to fix clock related failures
      ASOC: Intel: add quirk for Intel 'Rooks County' NUC

Ranjani Sridharan (1):
      ASoC: SOF: ipc4: Ensure DSP is in D0I0 during sof_ipc4_set_get_data()

Shengjiu Wang (1):
      ASoC: soc-pcm: fix hw->formats cleared by soc_pcm_hw_init() for dpcm

Srinivas Kandagatla (1):
      ASoC: codecs: lpass: fix the order or clks turn off during suspend

 sound/soc/amd/yc/acp6x-mach.c                     |  7 +++++
 sound/soc/codecs/da7213.c                         |  6 ++++
 sound/soc/codecs/da7219-aad.c                     |  2 ++
 sound/soc/codecs/hdac_hdmi.c                      | 17 ++++++++----
 sound/soc/codecs/hdmi-codec.c                     | 11 ++++++++
 sound/soc/codecs/lpass-rx-macro.c                 |  4 +--
 sound/soc/codecs/lpass-tx-macro.c                 | 15 +++++-----
 sound/soc/codecs/lpass-wsa-macro.c                |  4 +--
 sound/soc/fsl/Kconfig                             |  4 +++
 sound/soc/intel/avs/boards/da7219.c               | 21 ++++++++++++++
 sound/soc/intel/avs/boards/max98357a.c            | 22 +++++++++++++++
 sound/soc/intel/avs/boards/nau8825.c              | 14 +++++-----
 sound/soc/intel/avs/boards/rt5682.c               | 22 +++++++++++++++
 sound/soc/intel/avs/boards/ssm4567.c              | 31 ---------------------
 sound/soc/intel/boards/bytcr_rt5640.c             | 12 ++++++++
 sound/soc/intel/boards/sof_sdw.c                  | 11 ++++++++
 sound/soc/intel/common/soc-acpi-intel-adl-match.c | 22 ++++++++++++++-
 sound/soc/qcom/qdsp6/q6prm.c                      |  4 +--
 sound/soc/soc-pcm.c                               |  4 +++
 sound/soc/sof/intel/hda-ctrl.c                    |  3 ++
 sound/soc/sof/intel/hda-dsp.c                     | 12 ++++++++
 sound/soc/sof/intel/pci-apl.c                     |  1 +
 sound/soc/sof/intel/pci-cnl.c                     |  2 ++
 sound/soc/sof/intel/pci-icl.c                     |  1 +
 sound/soc/sof/intel/pci-mtl.c                     |  1 +
 sound/soc/sof/intel/pci-skl.c                     |  2 ++
 sound/soc/sof/intel/pci-tgl.c                     |  7 +++++
 sound/soc/sof/intel/pci-tng.c                     |  6 +---
 sound/soc/sof/ipc3-topology.c                     | 32 +++++++++++++++++++--
 sound/soc/sof/ipc3.c                              |  5 ++--
 sound/soc/sof/ipc4-control.c                      |  3 +-
 sound/soc/sof/ipc4-topology.c                     | 29 +++++++++++++++----
 sound/soc/sof/ipc4-topology.h                     |  8 ++++--
 sound/soc/sof/ipc4.c                              |  8 ++++++
 sound/soc/sof/sof-audio.c                         | 32 +++++++++++++++++----
 sound/soc/sof/topology.c                          | 34 +++++++++++------------
 36 files changed, 321 insertions(+), 98 deletions(-)

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D1FA34DDC
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2025 19:41:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC50960276;
	Thu, 13 Feb 2025 19:41:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC50960276
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739472096;
	bh=te1TuWOD++nfAKB+DOXAxxvDnflgOSKCnwhbYRDUQrg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iUybQdatJU9LUZ4PS/d62BoYv+ID/vsTFJfgq6QllH6ixXaKrLxGW1+h7z+XgVj7T
	 F6zo/MCOVzPW+UIvNXqiLuim0OeaG14+3eAs6OrTeImAGceqe4NG24DaRe0kZ51ijR
	 S3s/MHNiK2OOOnaX2j1YYj9WJBd0hJmqV1/3ZFVs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 343E0F805B3; Thu, 13 Feb 2025 19:41:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B306F805B3;
	Thu, 13 Feb 2025 19:41:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CB9AF80269; Thu, 13 Feb 2025 19:40:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF56CF80185
	for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2025 19:40:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF56CF80185
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Cu6C/y8i
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D7C265C4BDB;
	Thu, 13 Feb 2025 18:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD161C4CEE4;
	Thu, 13 Feb 2025 18:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739472044;
	bh=te1TuWOD++nfAKB+DOXAxxvDnflgOSKCnwhbYRDUQrg=;
	h=From:To:Cc:Subject:Date:From;
	b=Cu6C/y8i+4S+8s29Ey2XHFINhki03yD3waferFKduM4kaR+VAb7Qo3/rJeyMQBKtg
	 yk4gx7iPl/DkPc2G1kZl3UDfgP9WclRbw3QhNRYMqDwn7oD3WopLOlNc/fCt3kUqT4
	 AKz+6jYuIkcZegguuoohavq40tVTZrg8JaFo/A8ttRDq/RqXQUfPOSm7mwlHaTP3DK
	 9B27CT28Mi4XbGInozkBFhyVM9CvnPzfi/KI1MMhy8zEpJgVztxOIgvEpMvfreBmWo
	 R0SUyzO6Yljwrom0WlHD6L0eVAvvEhsWJ2/mRFkFs5QwCVttegHD7CL3CLm2UV5mtR
	 LiRxalqxb1+yQ==
Message-ID: <6a7865dfe2acc782da9c7aed79deeffe.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.14-rc2
Date: Thu, 13 Feb 2025 18:40:36 +0000
Message-ID-Hash: 7JB52DB4MEPJZ566DHIREVBAZALMTZY4
X-Message-ID-Hash: 7JB52DB4MEPJZ566DHIREVBAZALMTZY4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7JB52DB4MEPJZ566DHIREVBAZALMTZY4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.14-rc2

for you to fetch changes up to 571b69f2f9b1ec7cf7d0e9b79e52115a87a869c4:

  ASoC: imx-audmix: remove cpu_mclk which is from cpu dai device (2025-02-13 11:34:32 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.14

More fixes and deviec quirks, most of them driver specific including a
few SOF robustness fixes.  Nothing super remarkable individually.

----------------------------------------------------------------
Bard Liao (2):
      ASoC: Intel: soc-acpi-intel-tgl-match: declare adr as ull
      ASoC: Intel: soc-acpi-intel-mtl-match: declare adr as ull

Cristian Ciocaltea (4):
      ASoC: SOF: amd: Add post_fw_run_delay ACP quirk
      ASoC: SOF: amd: Drop unused includes from Vangogh driver
      ASoC: SOF: amd: Handle IPC replies before FW_BOOT_COMPLETE
      ASoC: SOF: amd: Add branch prediction hint in ACP IRQ handler

John Keeping (1):
      ASoC: rockchip: i2s-tdm: fix shift config for SND_SOC_DAIFMT_DSP_[AB]

Kuninori Morimoto (4):
      ASoC: simple-card-utils.c: add missing dlc->of_node
      ASoC: rsnd: indicate unsupported clock rate
      ASoC: rsnd: don't indicate warning on rsnd_kctrl_accept_runtime()
      ASoC: rsnd: adjust convert rate limitation

Mark Brown (5):
      ASoC: Intel: soc-acpi-intel-tgl/mtl-match: declare adr
      ASoC: rsnd: adjust convert rate in 1%
      ASoC: SOF: Correct sps->stream and cstream nullity
      ASoC: Intel: sof_sdw: Add support for new devices
      ASoC: Intel: soc-acpi-intel-ptl-match typo fixups

Nikita Zhandarovich (1):
      ASoC: fsl_micfil: Enable default case in micfil_set_quality()

Peter Ujfalusi (5):
      ASoC: SOF: stream-ipc: Check for cstream nullity in sof_ipc_msg_data()
      ASoC: SOF: pcm: Clear the susbstream pointer to NULL on close
      ASoC: SOF: ipc4-topology: Harden loops for looking up ALH copiers
      ASoC: Intel: soc-acpi-intel-ptl-match: revise typo of rt712_vb + rt1320 support
      ASoC: Intel: soc-acpi-intel-ptl-match: revise typo of rt713_vb_l2_rt1320_l13

Richard Fitzgerald (2):
      ASoC: Intel: sof_sdw: Add lookup of quirk using PCI subsystem ID
      ASoC: Intel: sof_sdw: Add quirk for Asus Zenbook S14

Shenghao Ding (1):
      ASoC: tas2781: drop a redundant code

Shengjiu Wang (1):
      ASoC: imx-audmix: remove cpu_mclk which is from cpu dai device

Stefan Binding (2):
      ASoC: cs35l41: Fallback to using HID for system_name if no SUB is available
      ASoC: cs35l41: Fix acpi_device_hid() not found

Terry Cheong (1):
      ASoC: SOF: Intel: hda: add softdep pre to snd-hda-codec-hdmi module

Uday M Bhat (1):
      ASoC: Intel: sof_sdw: Add support for Fatcat board with BT offload enabled in PTL platform

Vitaly Rodionov (1):
      ASoC: arizona/madera: use fsleep() in up/down DAPM event delays.

 sound/soc/codecs/arizona.c                        |  14 +--
 sound/soc/codecs/cs35l41.c                        |  30 ++++--
 sound/soc/codecs/madera.c                         |  10 +-
 sound/soc/codecs/tas2781-i2c.c                    |   4 +-
 sound/soc/codecs/wm5110.c                         |   8 +-
 sound/soc/fsl/fsl_micfil.c                        |   2 +
 sound/soc/fsl/imx-audmix.c                        |  31 ------
 sound/soc/generic/simple-card-utils.c             |   1 +
 sound/soc/intel/boards/sof_sdw.c                  |  41 ++++++--
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c |   2 +-
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c |  12 +--
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c |  16 +--
 sound/soc/renesas/rcar/core.c                     |  14 ---
 sound/soc/renesas/rcar/rsnd.h                     |   1 -
 sound/soc/renesas/rcar/src.c                      | 116 +++++++++++++++++-----
 sound/soc/renesas/rcar/ssi.c                      |   3 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c             |   4 +-
 sound/soc/sof/amd/acp-ipc.c                       |  25 +++--
 sound/soc/sof/amd/acp.c                           |   1 +
 sound/soc/sof/amd/acp.h                           |   1 +
 sound/soc/sof/amd/pci-vangogh.c                   |   2 -
 sound/soc/sof/amd/vangogh.c                       |  22 +++-
 sound/soc/sof/intel/hda-codec.c                   |   1 +
 sound/soc/sof/ipc4-topology.c                     |  12 ++-
 sound/soc/sof/pcm.c                               |   2 +
 sound/soc/sof/stream-ipc.c                        |   6 +-
 26 files changed, 245 insertions(+), 136 deletions(-)

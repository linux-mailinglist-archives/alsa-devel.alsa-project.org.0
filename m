Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E9A7BB5A9
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 12:51:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE1001E4;
	Fri,  6 Oct 2023 12:50:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE1001E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696589480;
	bh=FQ4/p2Ler0n2nSRXXiiuuoSBZ7y5uOPC4uhWqkuZU8k=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DTloantIceGyQrQpPA1QD/wP+53f28KneR5j8On/XeUQewHZXKaZuWGPFoV9waNMJ
	 S5EkU26CVS3n/V/jxp6Vk1ESXq7DCJdK7NSgstRhHbK7CpsrhOYWGWbW/8xUSYPCbQ
	 9BjsWVi0bqknH47nm6CXStDxT8K+0drNm1RpALf8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9173FF80557; Fri,  6 Oct 2023 12:50:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C77BF801EB;
	Fri,  6 Oct 2023 12:50:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3096AF80549; Fri,  6 Oct 2023 12:50:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9009CF801EB
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 12:50:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9009CF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QcDYxM+H
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 75E90B82899;
	Fri,  6 Oct 2023 10:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6783DC43395;
	Fri,  6 Oct 2023 10:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696589387;
	bh=FQ4/p2Ler0n2nSRXXiiuuoSBZ7y5uOPC4uhWqkuZU8k=;
	h=From:To:Cc:Subject:Date:From;
	b=QcDYxM+HEDh3Jn2LNtNWrKaqOCqQAOoU6eWJwQX52+ZUnDo1bkKh1gvl4jF3+82/V
	 p1sqxRSQeylm/WHDz/GMv2rIo1WmzTam+OZaJ+6KHzw6KZEme3Od58gMxnCkrVM2cm
	 tepc7NJdw4VWkSF7Xq2ct/G8eqLGBpIH+JCkaNtE307tjf+uaMeZFSkTRlEnRIQB9x
	 L/itGz7N4OrIc+spw0xLe8lKzk//gq+fLjB5QhxSeg2J2oKbxmoVXQO8nWA0vWCPpg
	 sqnOtYYvzxAjs5RBgvLcvdVSJlxegwwwmQ+k3AvWMO9vSSpVmnsMUqxrILJIK2DSBF
	 6ki2Tmpx50whA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.6-rc5
Date: Fri, 06 Oct 2023 11:49:38 +0100
Message-Id: <20231006104947.6783DC43395@smtp.kernel.org>
Message-ID-Hash: SRPRYAMET5TU7ZFTX4P767K2XXRXWYQU
X-Message-ID-Hash: SRPRYAMET5TU7ZFTX4P767K2XXRXWYQU
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SRPRYAMET5TU7ZFTX4P767K2XXRXWYQU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 31bb7bd9ffee50d09ec931998b823a86132ab807:

  ASoC: SOF: core: Only call sof_ops_free() on remove if the probe was successful (2023-09-15 17:14:22 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.6-rc5

for you to fetch changes up to 1426b9ba7c453755d182ebf7e7f2367ba249dcf4:

  ASoC: dt-bindings: fsl,micfil: Document #sound-dai-cells (2023-10-04 13:58:54 +0100)

----------------------------------------------------------------
ASoC: More fixes for v6.6

Some additional fixes for v6.6, some fairly unremarkable driver specific
ones and a couple of minor core fixes for error handling and improved
logging.

----------------------------------------------------------------
Alex Bee (1):
      dt-bindings: ASoC: rockchip: Add compatible for RK3128 spdif

Amadeusz Sławiński (2):
      ASoC: core: Print component name when printing log
      ASoC: core: Do not call link_exit() on uninitialized rtd objects

Antoine Gennart (1):
      ASoC: tlv320adc3xxx: BUG: Correct micbias setting

Balamurugan C (2):
      ASoC: Intel: soc-acpi: Add entry for sof_es8336 in MTL match table.
      ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in MTL match table

Fabio Estevam (1):
      ASoC: dt-bindings: fsl,micfil: Document #sound-dai-cells

Kuninori Morimoto (2):
      ASoC: simple-card-utils: fixup simple_util_startup() error handling
      ASoC: simple-card: fixup asoc_simple_probe() error handling

Mark Brown (1):
      ASoC: Intel: soc-acpi: Adding Es83x6 codec entry and

Matthias Reichl (1):
      ASoC: hdmi-codec: Fix broken channel map reporting

Miquel Raynal (1):
      ASoC: soc-generic-dmaengine-pcm: Fix function name in comment

Pierre-Louis Bossart (2):
      ASoC: Intel: soc-acpi: fix Dell SKU 0B34
      ASoC: Intel: sof_sdw: add support for SKU 0B14

Shengjiu Wang (2):
      ASoC: fsl_sai: Don't disable bitclock for i.MX8MP
      ASoC: fsl-asoc-card: use integer type for fll_id and pll_id

Sven Frotscher (1):
      ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM

Vijendar Mukunda (1):
      ASoC: SOF: amd: fix for firmware reload failure after playback

Zhang Shurong (1):
      ASoC: rt5682: Fix regulator enable/disable sequence

 .../devicetree/bindings/sound/fsl,micfil.yaml      |  3 +++
 .../devicetree/bindings/sound/rockchip-spdif.yaml  |  1 +
 include/sound/soc.h                                |  2 ++
 sound/soc/amd/yc/acp6x-mach.c                      |  7 ++++++
 sound/soc/codecs/hdmi-codec.c                      |  5 ++++-
 sound/soc/codecs/rt5682-i2c.c                      | 10 ++++-----
 sound/soc/codecs/tlv320adc3xxx.c                   |  4 ++--
 sound/soc/fsl/fsl-asoc-card.c                      | 12 +++++++----
 sound/soc/fsl/fsl_sai.c                            |  9 ++++++--
 sound/soc/generic/simple-card-utils.c              |  3 ++-
 sound/soc/generic/simple-card.c                    |  6 ++++--
 sound/soc/intel/boards/sof_es8336.c                | 10 +++++++++
 sound/soc/intel/boards/sof_sdw.c                   | 10 +++++++++
 sound/soc/intel/common/soc-acpi-intel-adl-match.c  | 12 +++++------
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  | 25 ++++++++++++++++++++++
 sound/soc/soc-core.c                               | 24 +++++++++++++++------
 sound/soc/soc-generic-dmaengine-pcm.c              |  4 ++--
 sound/soc/sof/amd/pci-rmb.c                        |  1 -
 18 files changed, 115 insertions(+), 33 deletions(-)

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD3F807111
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 14:44:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1466283A;
	Wed,  6 Dec 2023 14:44:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1466283A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701870261;
	bh=ZpWprhcqOZfTUDEdKhTKsUtp8FWHb9ksHdtItFcAdKM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XBHHZUwOQ3KN1rnyNVuxzqHBn426LY7YURWUwcI0Rih/rt+PlZ6uO3dTHTsiagJ+3
	 VBtcZyY5fQyc1C0+b+0BrWAP7g8ta0SvYDh/bjyFsVtGlGR+yKRtBH4a/DYOZ+OuJS
	 SQyw5i8lhpoFw8i726RM+j4qUoON5avOiOOqeTnk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD52FF80580; Wed,  6 Dec 2023 14:43:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ACF2F80579;
	Wed,  6 Dec 2023 14:43:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 810B6F8024E; Wed,  6 Dec 2023 14:43:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CA9EF800AC
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 14:43:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CA9EF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qrB1Wsfv
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 82974CE1E66;
	Wed,  6 Dec 2023 13:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A21C433C7;
	Wed,  6 Dec 2023 13:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701870203;
	bh=ZpWprhcqOZfTUDEdKhTKsUtp8FWHb9ksHdtItFcAdKM=;
	h=From:To:Cc:Subject:Date:From;
	b=qrB1WsfvCUINNlwwcA1qZwXyVSqCwIi76K2b0nfPe5VKA4o5qDGR1OPdKTJqb/5eq
	 dT74P/qNrPlpbkehFoarEeY9kZrzqR9Q9Z0uVpS2ehRm6hC+Xd/Dzuvy40ZPbMd8bT
	 6b7cwaPvt+/Jo4XQJXYubSF9zzD0h+SJd76Ov3h2oiJmWvgvMzvW/Mu40KZTWuciO2
	 i8DVE3oJZkSkcZ1j7FurLsdqbWth6Pvv/RwRykU1VsXg3xX1Hx4StrAld794H6Haon
	 NHN9poJnmyTT7O+5Uqwo9rWk2IpP6t38Djk8ncz0HbfP07CbKApCkDNSZVqmXJ6q/4
	 yJnlFf+bUoAeg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.7-rc4
Date: Wed, 06 Dec 2023 13:43:15 +0000
Message-Id: <20231206134322.E1A21C433C7@smtp.kernel.org>
Message-ID-Hash: OIINSL2QUC25WO4WJ3YXW7NFNHLYBRFA
X-Message-ID-Hash: OIINSL2QUC25WO4WJ3YXW7NFNHLYBRFA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OIINSL2QUC25WO4WJ3YXW7NFNHLYBRFA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.7-rc4

for you to fetch changes up to 0a10d15280a385e5971fb58a6d2eddbf7c0aa9f3:

  ASoC: qcom: Limit Digital gains on speaker (2023-12-04 21:42:29 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.7

A crop of fixes for v6.7, one core fix for a merge issue and a bunch of
driver specific fixes and new IDs, mostly for x86 platforms.

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      ASoC: SOF: mediatek: mt8186: Add Google Steelix topology compatible

Chancel Liu (1):
      ASoC: imx-rpmsg: SND_SOC_IMX_RPMSG should depend on OF and I2C

Charles Keepax (1):
      ASoC: wm8974: Correct boost mixer inputs

David Lin (1):
      ASoC: nau8822: Fix incorrect type in assignment and cast to restricted __be16

David Rau (1):
      ASoC: da7219: Support low DC impedance headset

Dinghao Liu (1):
      ASoC: wm_adsp: fix memleak in wm_adsp_buffer_populate

Jeremy Soller (1):
      ASoC: amd: yc: Add DMI entry to support System76 Pangolin 13

Johan Hovold (1):
      ASoC: soc-pcm: fix up bad merge

Kamil Duljas (3):
      ASoC: Intel: Skylake: Fix mem leak in few functions
      ASoC: SOF: topology: Fix mem leak in sof_dai_load()
      ASoC: Intel: Skylake: mem leak in skl register function

Maciej Strozek (2):
      ASoC: cs43130: Fix the position of const qualifier
      ASoC: cs43130: Fix incorrect frame delay configuration

Malcolm Hart (1):
      ASoC: amd: yc: Fix non-functional mic on ASUS E1504FA

Marian Postevca (1):
      ASoC: amd: acp: Add support for a new Huawei Matebook laptop

Mark Brown (3):
      ASoC: Fixes for cs43130
      ASoC: SOF: Extend the enabled DSP core handling
      ASoC: qcom: Limit Digital gains on speaker

Matus Malych (1):
      ASoC: amd: yc: Add HP 255 G10 into quirk table

Neil Armstrong (1):
      ASoC: codecs: lpass-tx-macro: set active_decimator correct default value

Peter Ujfalusi (5):
      ASoC: Intel: skl_hda_dsp_generic: Drop HDMI routes when HDMI is not available
      ASoC: Intel: sof_sdw: Always register the HDMI dai links
      ASoC: hdac_hda: Conditionally register dais for HDMI and Analog
      ASoC: SOF: ipc4-topology: Correct data structures for the SRC module
      ASoC: SOF: ipc4-topology: Correct data structures for the GAIN module

Ranjani Sridharan (2):
      ASoC: SOF: ipc4-topology: Add core_mask in struct snd_sof_pipeline
      ASoC: SOF: sof-audio: Modify logic for enabling/disabling topology cores

Shengjiu Wang (3):
      ASoC: fsl_sai: Fix no frame sync clock issue on i.MX8MP
      ASoC: fsl_xcvr: Enable 2 * TX bit clock for spdif only case
      ASoC: fsl_xcvr: refine the requested phy clock frequency

Shuming Fan (1):
      ASoC: rt5650: add mutex to avoid the jack detection failure

Srinivas Kandagatla (2):
      ASoC: ops: add correct range check for limiting volume
      ASoC: qcom: sc8280xp: Limit speaker digital volumes

 sound/soc/amd/acp-config.c                   | 14 ++++++
 sound/soc/amd/yc/acp6x-mach.c                | 21 +++++++++
 sound/soc/codecs/cs43130.c                   |  6 +--
 sound/soc/codecs/da7219-aad.c                |  2 +-
 sound/soc/codecs/hdac_hda.c                  | 23 ++++++++--
 sound/soc/codecs/lpass-tx-macro.c            |  5 +++
 sound/soc/codecs/nau8822.c                   |  9 ++--
 sound/soc/codecs/rt5645.c                    | 10 ++++-
 sound/soc/codecs/wm8974.c                    |  6 +--
 sound/soc/codecs/wm_adsp.c                   |  8 +++-
 sound/soc/fsl/Kconfig                        |  1 +
 sound/soc/fsl/fsl_sai.c                      | 21 +++++++++
 sound/soc/fsl/fsl_xcvr.c                     | 14 +++++-
 sound/soc/intel/boards/skl_hda_dsp_generic.c |  2 +
 sound/soc/intel/boards/sof_sdw.c             | 17 ++++----
 sound/soc/intel/skylake/skl-pcm.c            |  9 +++-
 sound/soc/intel/skylake/skl-sst-ipc.c        |  4 +-
 sound/soc/qcom/sc8280xp.c                    | 17 ++++++++
 sound/soc/soc-ops.c                          |  2 +-
 sound/soc/soc-pcm.c                          | 11 ++---
 sound/soc/sof/ipc3-topology.c                |  2 +
 sound/soc/sof/ipc4-control.c                 | 20 ++++-----
 sound/soc/sof/ipc4-topology.c                | 61 +++++++++++++++-----------
 sound/soc/sof/ipc4-topology.h                | 34 +++++++++++----
 sound/soc/sof/mediatek/mt8186/mt8186.c       |  3 ++
 sound/soc/sof/sof-audio.c                    | 65 ++++++++++++++++++----------
 sound/soc/sof/sof-audio.h                    |  2 +
 sound/soc/sof/topology.c                     |  4 +-
 28 files changed, 286 insertions(+), 107 deletions(-)

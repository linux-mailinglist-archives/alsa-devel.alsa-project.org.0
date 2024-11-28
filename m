Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 206399DB91A
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2024 14:55:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E33B2C62;
	Thu, 28 Nov 2024 14:55:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E33B2C62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732802112;
	bh=y2uSPVkkbKBQ+7iApZXcE5h2UG9ASi4HvlxqCKqZcwU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mvB4BjJ8DI55AvJ0HLFzqAvSJ0Cllh72d12Jt4GL/cUUtf/phFlpZiiOMcKzYookr
	 pJVMO5IHzKV8WPCOcsKEyASzVGckBRClFLQX03/diu2KlG/DStmq8H1seXkrsJXvnk
	 4lgUicXtAPdiktElw62MhpDILNtbFeleNuROrwAk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DA24F80236; Thu, 28 Nov 2024 14:54:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30A7AF805BE;
	Thu, 28 Nov 2024 14:54:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0981CF80236; Thu, 28 Nov 2024 14:54:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	PP_MIME_FAKE_ASCII_TEXT,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F86CF80073
	for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2024 14:54:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F86CF80073
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kFTpjmOX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 723A75C5C9F;
	Thu, 28 Nov 2024 13:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF9FC4CED2;
	Thu, 28 Nov 2024 13:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732802071;
	bh=y2uSPVkkbKBQ+7iApZXcE5h2UG9ASi4HvlxqCKqZcwU=;
	h=From:To:Cc:Subject:Date:From;
	b=kFTpjmOXffdETrdKowQjuDfc0458HEG4FO1Ex8rKz0lsd2hEvcKF08bcTXnM+1BMF
	 xoC9EnKb40o/OfRYY1zdU0F4ZdEAqRl5zCSDpDsWOzrjUi0v7xOzNgkmLFhOKlc4uG
	 weeNq5Jt/AcPTIc+Fooz2XdN/NkpMltu4Djghtnul1k/EH9Stab5Tjn1omyWVv/AXg
	 V2vfcDfni1Evo4CTmQnu+kl3HW8IjNR33RYRLQnRPYh0uxS9/dIZvYh4ivXsumzQy0
	 MrKuVBOvGyde4+z8oXr8EK1FMjxgIchU4LiwZ7GmCa7dJP7qksztN/eEl8SwB9FL5o
	 tTsvmdHU2zGTA==
Message-ID: <ff3c03fcb18cf5f9ea197a775b771867.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.13-merge-window
Date: Thu, 28 Nov 2024 13:54:23 +0000
Message-ID-Hash: KJAR62XGVMPWMKQDD734VDNBZ65VBCVW
X-Message-ID-Hash: KJAR62XGVMPWMKQDD734VDNBZ65VBCVW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KJAR62XGVMPWMKQDD734VDNBZ65VBCVW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 82ff5abc2edcfba0c0f1a1be807795e2876f46e9:

  ASoC: hdmi-codec: reorder channel allocation list (2024-11-15 13:43:00 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.13-merge-window

for you to fetch changes up to b682aa788e5f9f1ddacdfbb453e49fd3f4e83721:

  ASoC: amd: yc: Add a quirk for microfone on Lenovo ThinkPad P14s Gen 5 21MES00B00 (2024-11-27 13:45:45 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.13

A pile of driver specific quirks and fixes that came in since the merge
window.  One of the AMD fixes is a bit broken for some systems, I'm
expecting an incremental change to fix that but it seems better overall
to merge the rest of the fixes.

There's also one small documentation update that seemed sensible to
apply now, pointing to the dapm-graph tool.

----------------------------------------------------------------
Alex Far (1):
      ASoC: amd: yc: fix internal mic on Redmi G 2022

Bard Liao (1):
      ASoC: SOF: ipc3-topology: Convert the topology pin index to ALH dai index

Charles Han (1):
      ASoC: imx-audmix: Add NULL check in imx_audmix_probe

Ilya Zverev (1):
      ASoC: amd: yc: Add a quirk for microfone on Lenovo ThinkPad P14s Gen 5 21MES00B00

Mario Limonciello (1):
      ASoC: amd: Fix build dependencies for `SND_SOC_AMD_PS`

Nícolas F. R. A. Prado (1):
      ASoC: mediatek: Check num_codecs is not zero to avoid panic during probe

Uwe Kleine-König (1):
      ASoC: amd: yc: Add quirk for microphone on Lenovo Thinkpad T14s Gen 6 21M1CTO1WW

Venkata Prasad Potturu (1):
      ASoC: amd: yc: Fix for enabling DMIC on acp6x via _DSD entry

anish kumar (1):
      ASoC: doc: dapm: Add location information for dapm-graph tool

liujing (1):
      ASoC: apple: Fix the wrong format specifier

 Documentation/sound/soc/dapm.rst                   |  3 ++
 sound/soc/amd/Kconfig                              |  1 +
 sound/soc/amd/yc/acp6x-mach.c                      | 39 +++++++++++++++++++++-
 sound/soc/apple/mca.c                              |  2 +-
 sound/soc/fsl/imx-audmix.c                         |  3 ++
 sound/soc/mediatek/mt8188/mt8188-mt6359.c          |  9 +++--
 .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c  |  4 +--
 sound/soc/mediatek/mt8195/mt8195-mt6359.c          |  9 +++--
 sound/soc/sof/ipc3-topology.c                      | 26 +++++++++++++--
 9 files changed, 86 insertions(+), 10 deletions(-)

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CEE8C2594
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2024 15:21:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE7791DF;
	Fri, 10 May 2024 15:21:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE7791DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715347276;
	bh=TUWfu+YxY8cxHvvUihma0S9kguppxI7al5kEuZ8dmtQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Y4jbZbpDHsfiisosRfpFznLH7AXh4K05l6cLrMOSymC9pBXZHtnJg0TGOAm95spH+
	 Ti18BUUMn2xqxE6Lc3VmO2rgQuIbdDAEzis2jeKkqLbkLiWDFZtrFzh9fuyLfTOHKi
	 OjmpPFhwh6jMNc18PXJviH+ogVTh3KX6/qFY2BMc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7A95F80578; Fri, 10 May 2024 15:20:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1249BF80570;
	Fri, 10 May 2024 15:20:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89464F8049C; Fri, 10 May 2024 15:20:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E80EF8003A
	for <alsa-devel@alsa-project.org>; Fri, 10 May 2024 15:20:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E80EF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UQn4zV9Q
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 77F1ACE1DAC;
	Fri, 10 May 2024 13:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F8BC113CC;
	Fri, 10 May 2024 13:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715347228;
	bh=TUWfu+YxY8cxHvvUihma0S9kguppxI7al5kEuZ8dmtQ=;
	h=From:To:Cc:Subject:Date:From;
	b=UQn4zV9QD/M/eAXU4yyeX7x5Cmmk2Y6vxAgo7d/a14GJOCNSYiMrWAM3NL5uJLHMU
	 qezbJIviOP8a6BPGogpRgxnWkSzBh8olKA9h50aU51w3L/mVcYlu///Qk84hvU7FSH
	 Id1WOIUadcmD0A2CxLJboObPdk0LOafjBNKEBG53YRpKmqp4wMyf3SgEwDUB/5ss+2
	 NJCP//gyEdcdO6OypYSAIlugXv5jExcbtVSEqrkvuwboeThwHeZo4LAeJy1bqGdFKh
	 GT+Vdtw7uEplx2Vw5uekusknIpthceSWNWuA/X0SMPedBYYGb0/Qzt5qseyr3/KHLm
	 DjTQ4NYo9zCKQ==
Message-ID: <054c6ec1c792661eddd2dfb8c505585a.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.9-rc7-2
Date: Fri, 10 May 2024 14:20:15 +0100
Message-ID-Hash: LAWXUNSMLQ33Q3YOS2X5OZYTPMYGYRWG
X-Message-ID-Hash: LAWXUNSMLQ33Q3YOS2X5OZYTPMYGYRWG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LAWXUNSMLQ33Q3YOS2X5OZYTPMYGYRWG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit c5782bb5468acf86d8ca8e161267e8d055fb4161:

  ASoC: meson: tdm fixes (2024-04-30 23:36:23 +0900)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.9-rc7-2

for you to fetch changes up to e54f128b0c2fe543816941342e085e21f49c5b6c:

  ASoC: audio-graph-card2: call of_node_get() before of_get_next_child() (2024-05-10 10:08:08 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.9

A couple more minor fixes for ASoC, one incremental fix for earlier
issues and a minor formatting issue in the Makefile.

----------------------------------------------------------------
Amadeusz Sławiński (1):
      ASoC: Intel: avs: boards: Properly name input device

Hsin-Te Yuan (1):
      ASoC: mediatek: mt8192: fix register configuration for tdm

Kuninori Morimoto (1):
      ASoC: audio-graph-card2: call of_node_get() before of_get_next_child()

Takashi Iwai (1):
      ASoC: SOF: amd: Correct spaces in Makefile

Vijendar Mukunda (1):
      ASoC: amd: acp: fix for acp platform device creation failure

 sound/soc/amd/acp/acp-legacy-common.c      | 96 +++++++++++++++++++++++++-----
 sound/soc/amd/acp/acp-pci.c                |  9 ++-
 sound/soc/amd/acp/amd.h                    | 10 +++-
 sound/soc/amd/acp/chip_offset_byte.h       |  1 +
 sound/soc/generic/audio-graph-card2.c      |  2 +-
 sound/soc/intel/avs/boards/es8336.c        |  2 +-
 sound/soc/intel/avs/boards/nau8825.c       |  2 +-
 sound/soc/intel/avs/boards/rt274.c         |  3 +-
 sound/soc/intel/avs/boards/rt286.c         |  4 +-
 sound/soc/intel/avs/boards/rt298.c         |  4 +-
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c |  4 +-
 sound/soc/sof/amd/Makefile                 |  8 +--
 12 files changed, 110 insertions(+), 35 deletions(-)

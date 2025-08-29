Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4230BB3B6BA
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Aug 2025 11:10:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90655602B8;
	Fri, 29 Aug 2025 11:10:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90655602B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756458630;
	bh=gp0NkXAwsaMNEVMt9E7wsKeDRKCegVjSnZ5p9RsWRWc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qK85TjcCb5kIu7sDVnnFZYXpXBYS7df16wUH9nffKCw6lyQNZR0BhTPbA9zInGApo
	 sUxZqlyUu9PG9BpvY/u8hOsgaoBUJeGZiE3iU62+whClkrqSTuLGsuDHMqtsmTQzeM
	 ZnYDkwpoyI5SXawJqxd1yptnK/aKng/tVaXQHp7U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA906F805CB; Fri, 29 Aug 2025 11:09:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51B44F805C9;
	Fri, 29 Aug 2025 11:09:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EB8CF80171; Fri, 29 Aug 2025 11:09:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47FCCF80072
	for <alsa-devel@alsa-project.org>; Fri, 29 Aug 2025 11:09:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47FCCF80072
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ftCtH7MH
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C9B4F60051;
	Fri, 29 Aug 2025 09:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC4DC4CEF0;
	Fri, 29 Aug 2025 09:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756458583;
	bh=gp0NkXAwsaMNEVMt9E7wsKeDRKCegVjSnZ5p9RsWRWc=;
	h=From:To:Cc:Subject:Date:From;
	b=ftCtH7MHq2jfFxHFtxnzWKrOjDwMCfRFzPFsfwgGoBF0JhaC8q2h41L/VD45tFEag
	 hhIfFYnqUEgzHKvV8hxtxyN83SFFORxElC4PJGa1YAIfXMhaSBpbMTEwysXlP50W39
	 eJm5SmgBwtqrbQeN7W0U5bogdShcvIaM8c3bzVToaI7ENj466o+0rEPJaT/8yvwvNt
	 mJt7k/FItQcMEVmSCX/BkRszV0hlj1gbY50d3uSh090DfaarFXTqt0XUIcfzjwK6eT
	 YaVAsXL5Mn36Z4kIe/31kucGRx7a/3uqdeFLdsuNB0igJl06cZUa//tn1uRim/CCbe
	 4Z7DqwQ7CxhVw==
Message-ID: <b8dbfe9e97c69e8307375219e714c823@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.17-rc3
Date: Fri, 29 Aug 2025 11:09:33 +0200
Message-ID-Hash: HWDMX7S6XXGYABH65VWFC7ZYAGO3EWDE
X-Message-ID-Hash: HWDMX7S6XXGYABH65VWFC7ZYAGO3EWDE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HWDMX7S6XXGYABH65VWFC7ZYAGO3EWDE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 1b237f190eb3d36f52dffe07a40b5eb210280e00:

  Linux 6.17-rc3 (2025-08-24 12:04:12 -0400)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.17-rc3

for you to fetch changes up to 3e7fd1febc3156d3d98fba229399a13b12d69707:

  ASoC: SOF: Intel: WCL: Add the sdw_process_wakeen op (2025-08-28 21:15:49 +0200)

----------------------------------------------------------------
ASoC: Fixes for v6.17

The main fixes here are for some of the cleanups done in the core in
this release, we had broken component lookup in the case with a single
bus and DMA controller.  Otherwise it's driver specific changes, the
shortlogs for the Intel WCL and rsnd drivers look like minor cleanups
but are actually bugfixes (adding an op needed for correct functionality
and reverting an inappropriate helper usage).

----------------------------------------------------------------
Ajye Huang (1):
      ASoC: SOF: Intel: WCL: Add the sdw_process_wakeen op

Cryolitia PukNgae (1):
      ASoC: codecs: idt821034: fix wrong log in idt821034_chip_direction_output()

Kuninori Morimoto (3):
      ASoC: soc-core: care NULL dirver name on snd_soc_lookup_component_nolocked()
      ASoC: soc-core: tidyup snd_soc_lookup_component_nolocked()
      ASoC: rsnd: tidyup direction name on rsnd_dai_connect()

Mark Brown (1):
      ASoC: fixup snd_soc_lookup_component_nolocked()

 sound/soc/codecs/idt821034.c  |  2 +-
 sound/soc/renesas/rcar/core.c |  2 +-
 sound/soc/soc-core.c          | 25 +++++++++++++++----------
 sound/soc/sof/intel/ptl.c     |  1 +
 4 files changed, 18 insertions(+), 12 deletions(-)

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB23BB25410
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Aug 2025 21:47:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDAE860203;
	Wed, 13 Aug 2025 21:47:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDAE860203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755114459;
	bh=/8GBopGctd7ROLW5s7uQq/RaW7OuHdELmXU9Ltqdl7g=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=H3wJ0A1aOfxBzvEwxUBcfGRNmCnGpjJV6UyRgS06+owsQCeaSzC6sqg6XvxrwLUBk
	 JR2pydWwx9EqTMGL5wbiqs389LDFCnLwgdBCmUVTDpqh3ypBwZb4tpBgjTRsJG73lC
	 tQ8eRXtt/DY7BPGs0VraQ5S6/0uXJFVWm+Ywy3TQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87C95F805D3; Wed, 13 Aug 2025 21:47:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C943F805C1;
	Wed, 13 Aug 2025 21:47:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A74ACF8021D; Wed, 13 Aug 2025 21:46:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5742CF800F3
	for <alsa-devel@alsa-project.org>; Wed, 13 Aug 2025 21:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5742CF800F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WgnSZTwS
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE91C601D6;
	Wed, 13 Aug 2025 19:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23972C4CEEB;
	Wed, 13 Aug 2025 19:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755114408;
	bh=/8GBopGctd7ROLW5s7uQq/RaW7OuHdELmXU9Ltqdl7g=;
	h=From:To:Cc:Subject:Date:From;
	b=WgnSZTwSETUEu/h7nicYifJetu9VnL3pDmPI1LWzi2WgPSGWYiln6DVClUsPldILk
	 Hh+t4G5Nc1S5jRlxHBvq4YKcLif0DBwyYpOWQfCnGxloN0wgTnljb0ZEWJPeVT/vQw
	 2IaYdEEM8a9yYDSNtyabIzphzWNE8lVw2bGIdDsOFQCnzeqHEVXR+hDfU4/ucDvpgw
	 GoelD1XJlkG0ntXxR1UnRP8z+VP5SpAVDBcVYh5UbMRnwJmbcXgiWAR61oIrpzVmGS
	 SreBNvnJNMCzmfWVhTlGZi2kSTj8PzHGy/RNfXyLiE9avQuQ8dgpoYl/Q2ofd94p3p
	 iciw5r6Ruyjyw==
Message-ID: <c50400ae698f3d9f5d0a46ad05fbd0fa.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.17-rc1
Date: Wed, 13 Aug 2025 20:46:40 +0100
Message-ID-Hash: KXHUBHTMXIVNOVKTQOG47X2WH7LP2DLQ
X-Message-ID-Hash: KXHUBHTMXIVNOVKTQOG47X2WH7LP2DLQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KXHUBHTMXIVNOVKTQOG47X2WH7LP2DLQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.17-rc1

for you to fetch changes up to 47ed64db8c17eb16541098add865178fb7e68744:

  ASoC: tas2781: Normalize the volume kcontrol name (2025-08-13 15:52:53 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.17

A reasonably small collection of fixes that came in since the merge
window, mostly small and driver specific plus a cleanup of the menu
reorganisation to address some user confusion with the way the generic
drivers had been handled.

----------------------------------------------------------------
Alexey Klimov (1):
      ASoC: codecs: tx-macro: correct tx_macro_component_drv name

Baojun Xu (1):
      ASoC: tas2781: Normalize the volume kcontrol name

Colin Ian King (2):
      ASoC: codec: sma1307: replace spelling mistake with new error message
      ASoC: tas2781: Fix spelling mistake "dismatch" -> "mismatch"

Kuninori Morimoto (1):
      ASoC: generic: tidyup standardized ASoC menu for generic

Sergio Perez Gonzalez (1):
      ASoC: stm: stm32_i2s: Fix calc_clk_div() error handling in determine_rate()

Shengjiu Wang (1):
      ASoC: fsl_sai: replace regmap_write with regmap_update_bits

Shuming Fan (2):
      ASoC: rt721: fix FU33 Boost Volume control not working
      ASoC: rt1320: fix random cycle mute issue

Thorsten Blum (1):
      ASoC: codecs: Call strscpy() with correct size argument

 sound/soc/Kconfig                  |  4 +++-
 sound/soc/codecs/aw87390.c         |  8 +++-----
 sound/soc/codecs/aw88081.c         |  5 ++---
 sound/soc/codecs/aw88166.c         |  8 +++-----
 sound/soc/codecs/aw88261.c         |  8 +++-----
 sound/soc/codecs/aw88395/aw88395.c |  8 +++-----
 sound/soc/codecs/aw88399.c         |  8 +++-----
 sound/soc/codecs/lpass-tx-macro.c  |  2 +-
 sound/soc/codecs/rt1320-sdw.c      |  3 ++-
 sound/soc/codecs/rt721-sdca.c      |  2 ++
 sound/soc/codecs/rt721-sdca.h      |  4 ++++
 sound/soc/codecs/sma1307.c         |  2 +-
 sound/soc/codecs/tas2781-i2c.c     |  6 +++---
 sound/soc/fsl/fsl_sai.c            | 20 ++++++++++----------
 sound/soc/stm/stm32_i2s.c          |  7 ++-----
 15 files changed, 45 insertions(+), 50 deletions(-)

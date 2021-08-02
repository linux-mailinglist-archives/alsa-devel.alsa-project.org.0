Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2B43DDFD5
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 21:07:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1B46172E;
	Mon,  2 Aug 2021 21:06:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1B46172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627931235;
	bh=hkaaGUj6LD92fLf2eKN3+HpYv9SsLiKngPrIRD0KtlM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hROZlFbKQmfDQksG4n10OTrN9wxsKrU5e1Pw/vYkx4990pxYINo4cSg3YBi5mR9fu
	 pOyMWHzCG1IUYXJv/TTLT3kzVuTml9/9zIA+5NoRKZ82RLMgCPyhjHmSvx5ma2zo5j
	 oBmVTseoZHu8oZabcoVW35tT6eBl/V1NARAN2YY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 207BAF800BF;
	Mon,  2 Aug 2021 21:05:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1974F80268; Mon,  2 Aug 2021 21:05:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A6D8F800BF
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 21:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A6D8F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BZpOPWEX"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 430A3610FE;
 Mon,  2 Aug 2021 19:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627931134;
 bh=hkaaGUj6LD92fLf2eKN3+HpYv9SsLiKngPrIRD0KtlM=;
 h=From:To:Cc:Subject:Date:From;
 b=BZpOPWEXpoS4JqwJKBQ3WW6TKoUs/O6B6fl0X2XqIDOPhRAIczQ2sRhOjDSi+TUpZ
 UJwoRdWOn4u58xoJdyE6wk57hHHSuFCrZ9Qwd0RvcD75fcBO4KixsiDiBKR4PGNRoy
 d8ts/TqUVVkHMaPyKnZRDXZkj7ajNFBo4S4tm+Ls63YwceeGSJ1dLT5c+6CZqD5lRq
 K+E01boePl76Fie14FgcUnD12fGdZ9LKDqCuX2tHSjA0s9OlwlYp3WHfML1h2BcbY3
 6x/elMge61OQoubmsLtlaiTCfKyv17WzALhkWVY+Mtg5MjBlUGMYs/tP0UJvVYfNA5
 3cVxMw4iOSCDA==
From: Nathan Chancellor <nathan@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Intel: boards: Fix CONFIG_SND_SOC_SDW_MOCKUP select
Date: Mon,  2 Aug 2021 12:03:52 -0700
Message-Id: <20210802190351.3201677-1-nathan@kernel.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When CONFIG_SND_SOC_INTEL_SOUNDWIRE_SOF_MACH is enabled without
CONFIG_EXPERT, there is a Kconfig warning about unmet dependencies:

WARNING: unmet direct dependencies detected for SND_SOC_SDW_MOCKUP
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] &&
EXPERT [=n] && SOUNDWIRE [=y]
  Selected by [y]:
  - SND_SOC_INTEL_SOUNDWIRE_SOF_MACH [=y] && ...

Selecting a symbol does not account for dependencies so if symbol A
selects symbol B which depends on symbol C, symbol B or its select of
symbol A should depend on symbol C as well.

Make the CONFIG_SND_SOC_SDW_MOCKUP select in
CONFIG_SND_SOC_INTEL_SOUNDWIRE_SOF_MACH depend on CONFIG_EXPERT as the
help text for CONFIG_SND_SOC_SDW_MOCKUP indicates it is intended to be a
development option.

Fixes: 0ccac3bcf356 ("ASoC: Intel: boards: sof_sdw: add SoundWire mockup codecs for tests")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---

An alternative here is if CONFIG_SND_SOC_INTEL_SOUNDWIRE_SOF_MACH wants
to unconditionally select CONFIG_SND_SOC_SDW_MOCKUP, the "depends on
EXPERT" can be moved to the prompt (tristate "..." if EXPERT). I am
happy to send a new patch if that is what is desired.

 sound/soc/intel/boards/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 046955bf717c..8284c46d7435 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -602,7 +602,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
-	select SND_SOC_SDW_MOCKUP
+	select SND_SOC_SDW_MOCKUP if EXPERT
 	help
 	  Add support for Intel SoundWire-based platforms connected to
 	  MAX98373, RT700, RT711, RT1308 and RT715

base-commit: 170c0d7460fc4aa522995ae4096b5a442f50a1fc
-- 
2.32.0.264.g75ae10bc75


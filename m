Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A19FA3FF314
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Sep 2021 20:15:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16B9E17C7;
	Thu,  2 Sep 2021 20:14:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16B9E17C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630606510;
	bh=fgmXveWCM05mSbllKfAaxxlHFe2iMk5xtIxQopJphow=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MCHMOe2Zs1Au/xnpDpLVxauq8gnVBNeQD28d4scQgcprm0tls2Uuwxx/c1PSgcBoT
	 HUaKd0K7C95fvaJ2d8+REABdKjvU28X0nmQM/GsvC25BTsaeT4Bfua4nvWvI6BJXq3
	 tpxB6al8HeibEHYJSeUHkrFi3A65slXxes3gkd9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CC5FF8028D;
	Thu,  2 Sep 2021 20:13:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0494F80269; Thu,  2 Sep 2021 20:13:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C56BF8020D
 for <alsa-devel@alsa-project.org>; Thu,  2 Sep 2021 20:13:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C56BF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="l1PtFlT2"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 075FC6109E;
 Thu,  2 Sep 2021 18:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630606420;
 bh=fgmXveWCM05mSbllKfAaxxlHFe2iMk5xtIxQopJphow=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l1PtFlT2H4GNdOvcM1dANKRnyhtzuXVeLC1RT+AVVdmZwN7szaUM1p6yCqj/yV5GO
 yrDAmt6nHda48xj5MaKQ//bSob8YAqRK5kChyMO+3EDgCzbaWrTYNBk1uNXYiknQKi
 b/Ue1LZG4gNOaLL8hI62aMopH4trFp1J0wjGPWwJQ0Pvq6Nj5H13mEGvHcQ8+arYXt
 JtdG8rPQ4OyNif2EXjktsFZmGabN9rbCVAj0goVsdDhRpKRumGh5FhwlPAhECQAiYD
 bT7AmyzHqJY56kNWCk2cG5BcNsRVqQtacgV9GMK1FuNL3JRGBzqbNY5/mPzPqvymH/
 AeNBjoGWLvBbg==
From: Nathan Chancellor <nathan@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH for-5.15 v3] ASoC: Intel: boards: Fix
 CONFIG_SND_SOC_SDW_MOCKUP select
Date: Thu,  2 Sep 2021 11:12:18 -0700
Message-Id: <20210902181217.2958966-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210802212409.3207648-1-nathan@kernel.org>
References: <20210802212409.3207648-1-nathan@kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Fabio Aiuto <fabioaiuto83@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>
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

Selecting a symbol does not account for dependencies. There are three
ways to resolve this:

1. Make CONFIG_SND_SOC_INTEL_SOUNDWIRE_SOF_MACH select
   CONFIG_SND_SOC_SDW_MOCKUP only if CONFIG_EXPERT is set.

2. Make CONFIG_SND_SOC_SDW_MOCKUP's prompt depend on CONFIG_EXPERT so
   that it can be selected by options that only depend on
   CONFIG_SOUNDWIRE but still appear as a prompt to the user when
   CONFIG_EXPERT is set.

3. Make CONFIG_SND_SOC_INTEL_SOUNDWIRE_SOF_MACH imply
   CONFIG_SND_SOC_SDW_MOCKUP, which will select
   CONFIG_SND_SOC_SDW_MOCKUP when its dependencies are enabled but still
   allow the user to disable it.

Go with the third option as it gives the most flexibility while
retaining the original intent of the select.

Fixes: 0ccac3bcf356 ("ASoC: Intel: boards: sof_sdw: add SoundWire mockup codecs for tests")
Suggested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---

v2 -> v3:

* Rebase on current for-5.15.

* Add Ack tag from Pierre-Louis.

v1 -> v2:

* Switch to imply rather than select ... if ... (Pierre-Louis).

* Reword commit message to explain different solutions rather than
  explain the problem in depth.

 sound/soc/intel/boards/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 046955bf717c..61b71d6c44cf 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -602,7 +602,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
-	select SND_SOC_SDW_MOCKUP
+	imply SND_SOC_SDW_MOCKUP
 	help
 	  Add support for Intel SoundWire-based platforms connected to
 	  MAX98373, RT700, RT711, RT1308 and RT715

base-commit: 4f89ff026ddbaab49dba993ad2dc757920d0ad49
-- 
2.33.0


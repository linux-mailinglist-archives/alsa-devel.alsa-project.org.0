Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0916D195A14
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:41:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3E5015F9;
	Fri, 27 Mar 2020 16:40:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3E5015F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585323684;
	bh=KpWX9Sk1k5d8cMTrttrMzaO/BCoePR6X+FO2T8JW1ig=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ntLEqbIqF1usWKK4cMnBsYb2FxVoFfHrM35Ksx198zgyNHPklRNaCnwuGtC+ua2i3
	 aLrOJfJ1ANuaITY9sU696HlLxzUyTNRqmg5Ttwg/gWFPSrcLtfzB4T0V7KUK5gtpQo
	 aoqDnOz2kDrs6XYeJ7tS5Dt7+hIgQ+mOKxkZsrmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB629F802FD;
	Fri, 27 Mar 2020 16:34:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85B47F80303; Fri, 27 Mar 2020 16:34:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 2247AF802EC
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:34:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2247AF802EC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E1321FB;
 Fri, 27 Mar 2020 08:34:12 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C63AE3F71F;
 Fri, 27 Mar 2020 08:34:11 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:34:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Applied "ASoC: SOF: IPC: dai-intel: move ALH declarations in header
 file" to the asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

The patch

   ASoC: SOF: IPC: dai-intel: move ALH declarations in header file

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From f8e25018801548314b3d908315cbf271e8eceba8 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Wed, 25 Mar 2020 16:50:19 -0500
Subject: [PATCH] ASoC: SOF: IPC: dai-intel: move ALH declarations in header
 file

ALH was inserted in the wrong place during integration, add after DMIC
to mirror the file used by SOF firmware.

No functional change, just text move in the same file to better track
changes, if any.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200325215027.28716-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof/dai-intel.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/sound/sof/dai-intel.h b/include/sound/sof/dai-intel.h
index 5f1ef5565be6..04e48227f542 100644
--- a/include/sound/sof/dai-intel.h
+++ b/include/sound/sof/dai-intel.h
@@ -87,6 +87,15 @@ struct sof_ipc_dai_hda_params {
 	uint32_t link_dma_ch;
 } __packed;
 
+/* ALH Configuration Request - SOF_IPC_DAI_ALH_CONFIG */
+struct sof_ipc_dai_alh_params {
+	struct sof_ipc_hdr hdr;
+	uint32_t stream_id;
+
+	/* reserved for future use */
+	uint32_t reserved[15];
+} __packed;
+
 /* DMIC Configuration Request - SOF_IPC_DAI_DMIC_CONFIG */
 
 /* This struct is defined per 2ch PDM controller available in the platform.
@@ -179,13 +188,4 @@ struct sof_ipc_dai_dmic_params {
 	struct sof_ipc_dai_dmic_pdm_ctrl pdm[0];
 } __packed;
 
-/* ALH Configuration Request - SOF_IPC_DAI_ALH_CONFIG */
-struct sof_ipc_dai_alh_params {
-	struct sof_ipc_hdr hdr;
-	uint32_t stream_id;
-
-	/* reserved for future use */
-	uint32_t reserved[15];
-} __packed;
-
 #endif
-- 
2.20.1


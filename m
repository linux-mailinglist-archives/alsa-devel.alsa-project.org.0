Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0DAD2C7D
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 16:28:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA1F2168E;
	Thu, 10 Oct 2019 16:27:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA1F2168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570717710;
	bh=oXBl+ck8PI1KNuiCUa62m5sJbq5ZUKaH2qxiqILkG4E=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qQoVZMxm2TkMutTWfMljlXiEpg4OskZhLzN3uw17N3ERXIy+ZtVHJLCBiL3Z28jIA
	 /K+um7yGIOSOHbeFSxv9nwEGeKLYXwWQ50TddtAacQ1WlqM3QUE+cbOww/HDBQJw43
	 pb/kUi0/mLsXbS+CQcB0HKVjYoM+0fsLPHVydkIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C46E5F80659;
	Thu, 10 Oct 2019 16:22:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F5C1F805FF; Thu, 10 Oct 2019 16:22:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B6E0F8058C
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 16:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B6E0F8058C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="BUJfO5yx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=6Gm/abNPetZXAUHM0GbkD5WLrN7q8SYd3vr7pXqm0ZA=; b=BUJfO5yxqgnz
 KtSZYGNJ+jYOlrOvFARa+U5fpSNt1AAXIJe/Xl6+snV+pT3ly3mlDMa8avOboV45uqBTabik6GTDl
 qwy+N62Uz1r+pJXSoe0N27dU6tVjVhqwiXRmxUJXahp7fcpXiDj7Eco6YF0tvHLjjBWcFnzPq6NAM
 Q72QI=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iIZKp-0001ZZ-LN; Thu, 10 Oct 2019 14:22:31 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 4B492D0003A; Thu, 10 Oct 2019 15:22:31 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20191008164443.1358-6-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191010142231.4B492D0003A@fitzroy.sirena.org.uk>
Date: Thu, 10 Oct 2019 15:22:31 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: imx: Describe ESAI parameters to
	be sent to DSP" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: imx: Describe ESAI parameters to be sent to DSP

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From b4be427683cf6debda331a5d6a4af34885851d19 Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Tue, 8 Oct 2019 11:44:39 -0500
Subject: [PATCH] ASoC: SOF: imx: Describe ESAI parameters to be sent to DSP

Introduce sof_ipc_dai_esai_params to keep information that
we get from topology and we send to DSP FW.

Also bump the ABI minor to reflect the changes on DSP FW.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191008164443.1358-6-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof/dai-imx.h     | 34 +++++++++++++++++++++++++++++++++
 include/sound/sof/dai.h         |  2 ++
 include/uapi/sound/sof/abi.h    |  2 +-
 include/uapi/sound/sof/tokens.h |  3 +--
 4 files changed, 38 insertions(+), 3 deletions(-)
 create mode 100644 include/sound/sof/dai-imx.h

diff --git a/include/sound/sof/dai-imx.h b/include/sound/sof/dai-imx.h
new file mode 100644
index 000000000000..e02fb0b0fae1
--- /dev/null
+++ b/include/sound/sof/dai-imx.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Copyright 2019 NXP
+ *
+ * Author: Daniel Baluta <daniel.baluta@nxp.com>
+ */
+
+#ifndef __INCLUDE_SOUND_SOF_DAI_IMX_H__
+#define __INCLUDE_SOUND_SOF_DAI_IMX_H__
+
+#include <sound/sof/header.h>
+
+/* ESAI Configuration Request - SOF_IPC_DAI_ESAI_CONFIG */
+struct sof_ipc_dai_esai_params {
+	struct sof_ipc_hdr hdr;
+
+	/* MCLK */
+	uint16_t reserved1;
+	uint16_t mclk_id;
+	uint32_t mclk_direction;
+
+	uint32_t mclk_rate;	/* MCLK frequency in Hz */
+	uint32_t fsync_rate;	/* FSYNC frequency in Hz */
+	uint32_t bclk_rate;	/* BCLK frequency in Hz */
+
+	/* TDM */
+	uint32_t tdm_slots;
+	uint32_t rx_slots;
+	uint32_t tx_slots;
+	uint16_t tdm_slot_width;
+	uint16_t reserved2;	/* alignment */
+} __packed;
+
+#endif
diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
index 0f1235022146..c229565767e5 100644
--- a/include/sound/sof/dai.h
+++ b/include/sound/sof/dai.h
@@ -11,6 +11,7 @@
 
 #include <sound/sof/header.h>
 #include <sound/sof/dai-intel.h>
+#include <sound/sof/dai-imx.h>
 
 /*
  * DAI Configuration.
@@ -73,6 +74,7 @@ struct sof_ipc_dai_config {
 		struct sof_ipc_dai_dmic_params dmic;
 		struct sof_ipc_dai_hda_params hda;
 		struct sof_ipc_dai_alh_params alh;
+		struct sof_ipc_dai_esai_params esai;
 	};
 } __packed;
 
diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
index a0fe0d4c4b66..ebfdc20ca081 100644
--- a/include/uapi/sound/sof/abi.h
+++ b/include/uapi/sound/sof/abi.h
@@ -26,7 +26,7 @@
 
 /* SOF ABI version major, minor and patch numbers */
 #define SOF_ABI_MAJOR 3
-#define SOF_ABI_MINOR 10
+#define SOF_ABI_MINOR 11
 #define SOF_ABI_PATCH 0
 
 /* SOF ABI version number. Format within 32bit word is MMmmmppp */
diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index 8f996857fb24..da18c9de1056 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -111,7 +111,6 @@
 /* TODO: Add SAI tokens */
 
 /* ESAI */
-#define SOF_TKN_IMX_ESAI_FIRST_TOKEN		1100
-/* TODO: Add ESAI tokens */
+#define SOF_TKN_IMX_ESAI_MCLK_ID		1100
 
 #endif
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

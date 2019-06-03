Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DAE3379C
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:14:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACFFA1665;
	Mon,  3 Jun 2019 20:13:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACFFA1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559585663;
	bh=TAak6sf71QS+69DTt6aQRow5prXVT+D5ddc56jS+l68=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=i5b/gY9dRQPiDVuHBkHdF1PAHuPmH9JWAnb9tsp139mUO7zbS896cHvhtZ0td7iEh
	 g/SU9yBDNt30UYyEAVR7MuH26yED/yelwW9ca5Olg/7TMqMUKakS4f9bNvG6L+iert
	 A+ok1w+aS1HbwXxbFQ9L4Z/+N6iazJ9gXzI8gfPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 759D8F8978B;
	Mon,  3 Jun 2019 20:02:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23A21F8974C; Mon,  3 Jun 2019 20:02:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BEBBF8973C
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:02:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BEBBF8973C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="S9AkX02Z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=DtJJI9x8/7sEpQ1WozuFLry8fqTKm8o0iivP2277m4w=; b=S9AkX02ZC/gZ
 GjlhbnsAdzbSogkRx7HiOLEp8h4nJlreRbZL+fe8eoUAMOMFCggQIUTN3S6HV46yo8PyxPVYxR5RV
 mBts+qQwcpYy8UsACT0X0cNvBjAJK3wt0fvXTKPR3r+9n7vbH0RfWkb/LJZhYDJqw3ie4FcBsF7yx
 LvBvQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hXrHY-0003ZS-25; Mon, 03 Jun 2019 18:02:04 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 51D96440049; Mon,  3 Jun 2019 19:02:03 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Slawomir Blauciak <slawomir.blauciak@linux.intel.com>
In-Reply-To: <20190603162032.7626-9-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190603180203.51D96440049@finisterre.sirena.org.uk>
Date: Mon,  3 Jun 2019 19:02:03 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: ipc: replace fw ready bitfield
	with explicit bit ordering" to the asoc tree
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

   ASoC: SOF: ipc: replace fw ready bitfield with explicit bit ordering

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From 347d1c4b0779cbeabaebb9b8e9967afe28db22f1 Mon Sep 17 00:00:00 2001
From: Slawomir Blauciak <slawomir.blauciak@linux.intel.com>
Date: Mon, 3 Jun 2019 11:20:32 -0500
Subject: [PATCH] ASoC: SOF: ipc: replace fw ready bitfield with explicit bit
 ordering

Previously the structure used bitfields, which do not guarantee bit
ordering.

This change makes sure the order is clearly defined.  It also renames
and repurposes the field for general use.

Signed-off-by: Slawomir Blauciak <slawomir.blauciak@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof/info.h | 20 ++++++++++----------
 sound/soc/sof/ipc.c      | 11 +++++++----
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/include/sound/sof/info.h b/include/sound/sof/info.h
index 21dae04d8183..16528d2b4a50 100644
--- a/include/sound/sof/info.h
+++ b/include/sound/sof/info.h
@@ -18,6 +18,14 @@
 
 #define SOF_IPC_MAX_ELEMS	16
 
+/*
+ * Firmware boot info flag bits (64-bit)
+ */
+#define SOF_IPC_INFO_BUILD		BIT(0)
+#define SOF_IPC_INFO_LOCKS		BIT(1)
+#define SOF_IPC_INFO_LOCKSV		BIT(2)
+#define SOF_IPC_INFO_GDB		BIT(3)
+
 /* extended data types that can be appended onto end of sof_ipc_fw_ready */
 enum sof_ipc_ext_data {
 	SOF_IPC_EXT_DMA_BUFFER = 0,
@@ -49,16 +57,8 @@ struct sof_ipc_fw_ready {
 	uint32_t hostbox_size;
 	struct sof_ipc_fw_version version;
 
-	/* Miscellaneous debug flags showing build/debug features enabled */
-	union {
-		uint64_t reserved;
-		struct {
-			uint64_t build:1;
-			uint64_t locks:1;
-			uint64_t locks_verbose:1;
-			uint64_t gdb:1;
-		} bits;
-	} debug;
+	/* Miscellaneous flags */
+	uint64_t flags;
 
 	/* reserved for future use */
 	uint32_t reserved[4];
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 10304a90cf25..2414640a32d1 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -763,16 +763,19 @@ int snd_sof_ipc_valid(struct snd_sof_dev *sdev)
 		}
 	}
 
-	if (ready->debug.bits.build) {
+	if (ready->flags & SOF_IPC_INFO_BUILD) {
 		dev_info(sdev->dev,
 			 "Firmware debug build %d on %s-%s - options:\n"
 			 " GDB: %s\n"
 			 " lock debug: %s\n"
 			 " lock vdebug: %s\n",
 			 v->build, v->date, v->time,
-			 ready->debug.bits.gdb ? "enabled" : "disabled",
-			 ready->debug.bits.locks ? "enabled" : "disabled",
-			 ready->debug.bits.locks_verbose ? "enabled" : "disabled");
+			 ready->flags & SOF_IPC_INFO_GDB ?
+				"enabled" : "disabled",
+			 ready->flags & SOF_IPC_INFO_LOCKS ?
+				"enabled" : "disabled",
+			 ready->flags & SOF_IPC_INFO_LOCKSV ?
+				"enabled" : "disabled");
 	}
 
 	/* copy the fw_version into debugfs at first boot */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7233833777
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:04:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0201D165D;
	Mon,  3 Jun 2019 20:04:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0201D165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559585093;
	bh=7hFxm8j9r/oxxRPHC60kcmrCjDeQYQQdEX2FQvh0lpo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=t8pF1uUdA9qgsZCBvgi7Z0kr+FSbye5dgSVCp5t5gLNWpBteHijKWkozN8I5PRgcJ
	 SMpqYCGenpth1auz+6IETCNasz8AmRadqbsDGZryRNEZLrfy2EhUwj8AOsKhaSfs3q
	 MLdacNu1L1qYa5GulO7bpgCDtDFbPDGqDlGw2dcg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EC6EF8973B;
	Mon,  3 Jun 2019 20:02:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6BC1F8972F; Mon,  3 Jun 2019 20:01:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C094BF896DD
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:01:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C094BF896DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="l7kdbk8Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=r2l+fg6QGWclpCXo18GxvehOw6wSUxfHOsRVn+JFz2w=; b=l7kdbk8QPmnV
 PKHlQ1riwTmSiTwjwDySwsyv7x+URIQ+M5z5d4al6h+6KjvFAA25qNAmR0aGZBXSoLSHEU6J/fiIX
 3bA11bDdch+5b6GG2ur7xYWPWUwwcRjoeMKUDegWEdz040ao3wyK7VGFYsV7CFsrP8bw4wboCZWch
 bgHGQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hXrHO-0003Xx-1W; Mon, 03 Jun 2019 18:01:54 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 4A6ED440049; Mon,  3 Jun 2019 19:01:53 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20190603161821.7486-8-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190603180153.4A6ED440049@finisterre.sirena.org.uk>
Date: Mon,  3 Jun 2019 19:01:53 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: ipc: Introduce
	SOF_IPC_GLB_TEST_MSG IPC command" to the asoc tree
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

   ASoC: SOF: ipc: Introduce SOF_IPC_GLB_TEST_MSG IPC command

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 53b22d25ec36cebc2f5888a0bd5fba84b05f3dee Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Mon, 3 Jun 2019 11:18:19 -0500
Subject: [PATCH] ASoC: SOF: ipc: Introduce SOF_IPC_GLB_TEST_MSG IPC command

Add a new class of IPC command along with the first
test type, IPC_FLOOD, which will be used for flooding the DSP
with IPCs.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof/header.h | 6 +++++-
 sound/soc/sof/ipc.c        | 9 +++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index ab5862d80afe..12867bbd4372 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -49,6 +49,7 @@
 #define SOF_IPC_GLB_DAI_MSG			SOF_GLB_TYPE(0x8U)
 #define SOF_IPC_GLB_TRACE_MSG			SOF_GLB_TYPE(0x9U)
 #define SOF_IPC_GLB_GDB_DEBUG                   SOF_GLB_TYPE(0xAU)
+#define SOF_IPC_GLB_TEST_MSG			SOF_GLB_TYPE(0xBU)
 
 /*
  * DSP Command Message Types
@@ -99,11 +100,14 @@
 #define SOF_IPC_STREAM_VORBIS_PARAMS		SOF_CMD_TYPE(0x010)
 #define SOF_IPC_STREAM_VORBIS_FREE		SOF_CMD_TYPE(0x011)
 
-/* trace and debug */
+/* trace */
 #define SOF_IPC_TRACE_DMA_PARAMS		SOF_CMD_TYPE(0x001)
 #define SOF_IPC_TRACE_DMA_POSITION		SOF_CMD_TYPE(0x002)
 #define SOF_IPC_TRACE_DMA_PARAMS_EXT		SOF_CMD_TYPE(0x003)
 
+/* debug */
+#define SOF_IPC_TEST_IPC_FLOOD                  SOF_CMD_TYPE(0x001)
+
 /* Get message component id */
 #define SOF_IPC_MESSAGE_ID(x)			((x) & 0xffff)
 
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 2414640a32d1..558b596e2133 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -175,6 +175,15 @@ static void ipc_log_header(struct device *dev, u8 *text, u32 cmd)
 		break;
 	case SOF_IPC_GLB_TRACE_MSG:
 		str = "GLB_TRACE_MSG"; break;
+	case SOF_IPC_GLB_TEST_MSG:
+		str = "GLB_TEST_MSG";
+		switch (type) {
+		case SOF_IPC_TEST_IPC_FLOOD:
+			str2 = "IPC_FLOOD"; break;
+		default:
+			str2 = "unknown type"; break;
+		}
+		break;
 	default:
 		str = "unknown GLB command"; break;
 	}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

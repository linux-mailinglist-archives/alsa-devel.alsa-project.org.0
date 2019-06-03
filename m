Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C375337AA
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:16:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18CA015E0;
	Mon,  3 Jun 2019 20:15:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18CA015E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559585790;
	bh=amOae0xLVfDf7d0jBm+7/P75gP+148JJKc7qTa2sAHQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bUSk+UGi8E13iEDVrWluwT247EdNLOAlq1oz4HMZEUljNc8yCocEXWQXPZmd9V2HO
	 7uzvK6EzvAquehhc1JrbyoI/9rrAdaYx8ZgnSL0zHASAhK8LMRlJOEIoieKXDS9ttC
	 83IDIXnvFqQytwEnHEGXK58Tkx6Xkwpev1HEiVQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95F01F897A0;
	Mon,  3 Jun 2019 20:02:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 079B6F89750; Mon,  3 Jun 2019 20:02:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10B83F8973F
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:02:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10B83F8973F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ugMQmX47"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=dCXvGuBQQDxS9q7BHOus/WA0LmpFs64Lef0jT4rQMPQ=; b=ugMQmX47gZlD
 MFrsupKElRD31DWHWh7iKf1fjVJdr+ZEWj3yl/Rz6x7uOTdNcqpTkQUgl+H/2GWhSVzz1QmCNUQ+F
 9PLCFT3jrk2olr1zA9rWlOVHsjls3XDMfMNFCDmsrbOlj1EVTN35UIqfm3KkQObsuPjggq7HTxzi9
 z6G/M=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hXrHb-0003Zz-F1; Mon, 03 Jun 2019 18:02:07 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id CC1E1440049; Mon,  3 Jun 2019 19:02:06 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190603161821.7486-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190603180206.CC1E1440049@finisterre.sirena.org.uk>
Date: Mon,  3 Jun 2019 19:02:06 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: uapi: mirror firmware changes" to
	the asoc tree
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

   ASoC: SOF: uapi: mirror firmware changes

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

From 59be197354496b87869792bfa15477e8798462da Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 3 Jun 2019 11:18:13 -0500
Subject: [PATCH] ASoC: SOF: uapi: mirror firmware changes

We missed these two definitions for GDB support and component
notifications, they are defined for the SOF firmware. Since they are
not used by the kernel so far, we can still add them without any ABI
change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof/header.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index ccb6a004b37b..0aeb2c8ad6fd 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -48,6 +48,7 @@
 #define SOF_IPC_FW_READY			SOF_GLB_TYPE(0x7U)
 #define SOF_IPC_GLB_DAI_MSG			SOF_GLB_TYPE(0x8U)
 #define SOF_IPC_GLB_TRACE_MSG			SOF_GLB_TYPE(0x9U)
+#define SOF_IPC_GLB_GDB_DEBUG                   SOF_GLB_TYPE(0xAU)
 
 /*
  * DSP Command Message Types
@@ -78,6 +79,7 @@
 #define SOF_IPC_COMP_GET_VALUE			SOF_CMD_TYPE(0x002)
 #define SOF_IPC_COMP_SET_DATA			SOF_CMD_TYPE(0x003)
 #define SOF_IPC_COMP_GET_DATA			SOF_CMD_TYPE(0x004)
+#define SOF_IPC_COMP_NOTIFICATION		SOF_CMD_TYPE(0x005)
 
 /* DAI messages */
 #define SOF_IPC_DAI_CONFIG			SOF_CMD_TYPE(0x001)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

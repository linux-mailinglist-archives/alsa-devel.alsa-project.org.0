Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E56E7484
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 16:09:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83B051FEF;
	Mon, 28 Oct 2019 16:08:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83B051FEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572275382;
	bh=casmlX6p2s/P0iicNVm+26qg3YNOY+3r+9THwT8EfpM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=tlWzaIoklq3wW16KR8+bvaXCDNTxtO4ROaeoKX3ZIibU4x7CrLuCbqoLoMdyn3tEg
	 O4EIGronnloXxeduTA3iy64Uaru7IfZGz2IFjVmh/GHisVM/rC5dfqw0URW9RoKc88
	 46kqiNASOoy1KjD2hXi/T77hdRAkrkU0p2uk5beo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAF20F8075E;
	Mon, 28 Oct 2019 15:57:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38F0FF806ED; Mon, 28 Oct 2019 15:56:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27F96F8060F
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:56:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27F96F8060F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Mu81y9wE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=e4k1cHXpxzu9viD5e1zh55PgY9dJhyihsYWxFCkUdBw=; b=Mu81y9wEtdsZ
 QXuJQei+7FzWMWk5fPdCEUWntD2LWienGNGBVhFpYNO1G62V8VD24OXSCMHhMUdMgHuoil9e1gOue
 +W8sAXz7jUZDFW4F8NUzcsS7853BBrxetkqcS++tIBT0hxbK+RL4xW40XqyWM7PKZSMnV8RVMzhIe
 cH798=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iP6Rc-0008PA-8z; Mon, 28 Oct 2019 14:56:32 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id DD2A427403EE; Mon, 28 Oct 2019 14:56:30 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20191025224122.7718-14-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191028145630.DD2A427403EE@ypsilon.sirena.org.uk>
Date: Mon, 28 Oct 2019 14:56:30 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: ipc: introduce message for DSP
	power gating" to the asoc tree
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

   ASoC: SOF: ipc: introduce message for DSP power gating

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

From 10992004e1e960c7e256ec70c7ab22895a7003d7 Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Fri, 25 Oct 2019 17:41:09 -0500
Subject: [PATCH] ASoC: SOF: ipc: introduce message for DSP power gating

Add new ipc messages which will be sent from driver to FW, to ask FW to
enter specific power saving state.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191025224122.7718-14-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof/header.h | 1 +
 include/sound/sof/pm.h     | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index 332143ff7278..bf3edd9c08b4 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -75,6 +75,7 @@
 #define SOF_IPC_PM_CLK_GET			SOF_CMD_TYPE(0x005)
 #define SOF_IPC_PM_CLK_REQ			SOF_CMD_TYPE(0x006)
 #define SOF_IPC_PM_CORE_ENABLE			SOF_CMD_TYPE(0x007)
+#define SOF_IPC_PM_GATE				SOF_CMD_TYPE(0x008)
 
 /* component runtime config - multiple different types */
 #define SOF_IPC_COMP_SET_VALUE			SOF_CMD_TYPE(0x001)
diff --git a/include/sound/sof/pm.h b/include/sound/sof/pm.h
index 003879401d63..3cf2e0f39d94 100644
--- a/include/sound/sof/pm.h
+++ b/include/sound/sof/pm.h
@@ -45,4 +45,12 @@ struct sof_ipc_pm_core_config {
 	uint32_t enable_mask;
 } __packed;
 
+struct sof_ipc_pm_gate {
+	struct sof_ipc_cmd_hdr hdr;
+	uint32_t flags;	/* platform specific */
+
+	/* reserved for future use */
+	uint32_t reserved[5];
+} __packed;
+
 #endif
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

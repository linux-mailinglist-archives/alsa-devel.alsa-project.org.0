Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B667117CBE
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 01:55:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBA9F166B;
	Tue, 10 Dec 2019 01:54:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBA9F166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575939304;
	bh=F12uQdua6etxN9+PS3UVpcyXr5uZtxWi1CSLuVoN0Qc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jssepYlkcS00P0mHRpv8QG5Ju7j0j+yfsgM/ltgPbSBvSbfkobdmdO1GsxQR10PQz
	 MKvDwDJ1MGpqQkXFLyH/ZR9QcRr3SBUPu2b2tM2spMrDlBQvXzYqq7tPsqC69A2hNX
	 xcjwPl7hS8vfG5Nu4R7TPrj9S2drxhr0SyQoyegQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBBFEF8028D;
	Tue, 10 Dec 2019 01:49:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D204F80260; Tue, 10 Dec 2019 01:49:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D043F800C4
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 01:49:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D043F800C4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 16:49:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,297,1571727600"; d="scan'208";a="215398963"
Received: from sneuhier-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.188.78])
 by orsmga003.jf.intel.com with ESMTP; 09 Dec 2019 16:49:08 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 18:48:52 -0600
Message-Id: <20191210004854.16845-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210004854.16845-1-pierre-louis.bossart@linux.intel.com>
References: <20191210004854.16845-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Curtis Malainey <cujomalainey@chromium.org>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 6/8] ASoC: SOF: Intel: split cht and byt debug
	window sizes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Curtis Malainey <cujomalainey@chromium.org>

Turns out SSP 3-5 are only available on cht, to avoid dumping on
undefined registers let's split the definition.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/byt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index b3a40d9ef7ce..d0db581348af 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -25,7 +25,8 @@
 #define DRAM_OFFSET		0x100000
 #define DRAM_SIZE		(160 * 1024)
 #define SHIM_OFFSET		0x140000
-#define SHIM_SIZE		0x100
+#define SHIM_SIZE_BYT		0x100
+#define SHIM_SIZE_CHT		0x118
 #define MBOX_OFFSET		0x144000
 #define MBOX_SIZE		0x1000
 #define EXCEPT_OFFSET		0x800
@@ -76,7 +77,7 @@ static const struct snd_sof_debugfs_map byt_debugfs[] = {
 	 SOF_DEBUGFS_ACCESS_D0_ONLY},
 	{"dram", BYT_DSP_BAR, DRAM_OFFSET, DRAM_SIZE,
 	 SOF_DEBUGFS_ACCESS_D0_ONLY},
-	{"shim", BYT_DSP_BAR, SHIM_OFFSET, SHIM_SIZE,
+	{"shim", BYT_DSP_BAR, SHIM_OFFSET, SHIM_SIZE_BYT,
 	 SOF_DEBUGFS_ACCESS_ALWAYS},
 };
 
@@ -103,7 +104,7 @@ static const struct snd_sof_debugfs_map cht_debugfs[] = {
 	 SOF_DEBUGFS_ACCESS_D0_ONLY},
 	{"dram", BYT_DSP_BAR, DRAM_OFFSET, DRAM_SIZE,
 	 SOF_DEBUGFS_ACCESS_D0_ONLY},
-	{"shim", BYT_DSP_BAR, SHIM_OFFSET, SHIM_SIZE,
+	{"shim", BYT_DSP_BAR, SHIM_OFFSET, SHIM_SIZE_CHT,
 	 SOF_DEBUGFS_ACCESS_ALWAYS},
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

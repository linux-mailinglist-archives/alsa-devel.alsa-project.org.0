Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4327B1AB280
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 22:31:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 684591657;
	Wed, 15 Apr 2020 22:30:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 684591657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586982691;
	bh=2RzYSMVFbG7S9fAry1BE2+nyfMgLGc+M+cTEIXIxW58=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eCGCIKam2w4j/q0BmLHt4Ed527+o8RbV0MCnUJrXsSx/ori2v2OBC756RULGPs72g
	 9WSwfM+YnGu1cDMxsaHr5sooGzx8QQmbVk3saHhZHrZr6vDuEqxRg5DCH7Erm0EsYc
	 LIzSwXXaIrjkS19/foPMk3Y3hZxVPhWMjL8wqxMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4DF1F80264;
	Wed, 15 Apr 2020 22:29:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8A6DF8028A; Wed, 15 Apr 2020 22:29:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EADFBF80229
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 22:28:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EADFBF80229
IronPort-SDR: kX64dAFGZ79bjDF7zTpCZXU7ujbRycIAgJLdPgCti0vCL1Z9rDZAByWid2cBgmmHge6ZBxODAD
 Wqvlyc7KyqGg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 13:28:52 -0700
IronPort-SDR: RqMRnrGeYuOOc0vdLpyhbBY+PrstijtnHsaH3Hvq7MwUB9x75SW3bzk/Q6GUUJrPWcENMnLTVf
 1XuPxMUD80XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="288656231"
Received: from jplam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.82.197])
 by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2020 13:28:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/24] ASoC: SOF: Mark get_ext* function ext_hdr arguments as
 const
Date: Wed, 15 Apr 2020 15:27:54 -0500
Message-Id: <20200415202816.934-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
References: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Karol Trzcinski <karolx.trzcinski@linux.intel.com>
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

From: Karol Trzcinski <karolx.trzcinski@linux.intel.com>

This pointer can be mark as const to indicate that it is read
only pointer.

Signed-off-by: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/loader.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 64af08293daa..312f7fffcb2c 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -15,9 +15,9 @@
 #include "ops.h"
 
 static int get_ext_windows(struct snd_sof_dev *sdev,
-			   struct sof_ipc_ext_data_hdr *ext_hdr)
+			   const struct sof_ipc_ext_data_hdr *ext_hdr)
 {
-	struct sof_ipc_window *w =
+	const struct sof_ipc_window *w =
 		container_of(ext_hdr, struct sof_ipc_window, ext_hdr);
 
 	if (w->num_windows == 0 || w->num_windows > SOF_IPC_MAX_ELEMS)
@@ -33,11 +33,11 @@ static int get_ext_windows(struct snd_sof_dev *sdev,
 }
 
 static int get_cc_info(struct snd_sof_dev *sdev,
-		       struct sof_ipc_ext_data_hdr *ext_hdr)
+		       const struct sof_ipc_ext_data_hdr *ext_hdr)
 {
 	int ret;
 
-	struct sof_ipc_cc_version *cc =
+	const struct sof_ipc_cc_version *cc =
 		container_of(ext_hdr, struct sof_ipc_cc_version, ext_hdr);
 
 	dev_dbg(sdev->dev, "Firmware info: used compiler %s %d:%d:%d%s used optimization flags %s\n",
-- 
2.20.1


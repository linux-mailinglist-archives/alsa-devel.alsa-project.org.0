Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 959C0423C31
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 13:12:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33A87846;
	Wed,  6 Oct 2021 13:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33A87846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633518743;
	bh=wjCTbi9mN0SyyOKEVNjsiNYgEhtd9uRb45AiZGoNZ/0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hk7YexdeJzTJWy5XeXzYnZ3aWmx0ppO2nioXeVLIZlnAvnpA1bTu4zZ8u9YxglwGC
	 LlBm4NBtSCxzX/vZ4f3aHiiCBhfUlRjlsGixE8I988joIxQ1QIUnkoszPfcIxUkN52
	 LalCpv2H3ThdX6Q9VmyCi+v39yxvsjs9VXeJyI+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDB6BF804ED;
	Wed,  6 Oct 2021 13:07:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C28DAF8054A; Wed,  6 Oct 2021 13:07:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BE4BF8052D
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 13:07:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BE4BF8052D
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="223366498"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="223366498"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:07:20 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="439081207"
Received: from byurovit-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.39.239])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:07:18 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 16/19] ASoC: SOF: core: Clean up snd_sof_get_status() prints
Date: Wed,  6 Oct 2021 14:06:42 +0300
Message-Id: <20211006110645.26679-17-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006110645.26679-1-peter.ujfalusi@linux.intel.com>
References: <20211006110645.26679-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

Clean up the error prints when decoding the status in snd_sof_get_status():
Drop the "error:" prefixes from the prints,
Use %# to print hexadecimal numbers,
Reword some of the messages to be more precise,
For a known error print out the panic code as well,
For unknown error print only the panic code without the magic

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 22a1c5090ae0..2c3de295f11f 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -67,7 +67,7 @@ void snd_sof_get_status(struct snd_sof_dev *sdev, u32 panic_code,
 
 	/* is firmware dead ? */
 	if ((panic_code & SOF_IPC_PANIC_MAGIC_MASK) != SOF_IPC_PANIC_MAGIC) {
-		dev_err(sdev->dev, "error: unexpected fault 0x%8.8x trace 0x%8.8x\n",
+		dev_err(sdev->dev, "unexpected fault %#010x trace %#010x\n",
 			panic_code, tracep_code);
 		return; /* no fault ? */
 	}
@@ -76,20 +76,20 @@ void snd_sof_get_status(struct snd_sof_dev *sdev, u32 panic_code,
 
 	for (i = 0; i < ARRAY_SIZE(panic_msg); i++) {
 		if (panic_msg[i].id == code) {
-			dev_err(sdev->dev, "error: %s\n", panic_msg[i].msg);
-			dev_err(sdev->dev, "error: trace point %8.8x\n",
-				tracep_code);
+			dev_err(sdev->dev, "reason: %s (%#x)\n", panic_msg[i].msg,
+				code & SOF_IPC_PANIC_CODE_MASK);
+			dev_err(sdev->dev, "trace point: %#010x\n", tracep_code);
 			goto out;
 		}
 	}
 
 	/* unknown error */
-	dev_err(sdev->dev, "error: unknown reason %8.8x\n", panic_code);
-	dev_err(sdev->dev, "error: trace point %8.8x\n", tracep_code);
+	dev_err(sdev->dev, "unknown panic code: %#x\n", code & SOF_IPC_PANIC_CODE_MASK);
+	dev_err(sdev->dev, "trace point: %#010x\n", tracep_code);
 
 out:
-	dev_err(sdev->dev, "error: panic at %s:%d\n",
-		panic_info->filename, panic_info->linenum);
+	dev_err(sdev->dev, "panic at %s:%d\n", panic_info->filename,
+		panic_info->linenum);
 	sof_oops(sdev, oops);
 	sof_stack(sdev, oops, stack, stack_words);
 }
-- 
2.33.0


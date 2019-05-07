Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3F8167FA
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 18:35:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2745A17D0;
	Tue,  7 May 2019 18:35:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2745A17D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557246955;
	bh=7zVz2BhDUqWk8E64fNRwIpu8DCorcQJMo8YT3JS6+uA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WSA8E9/+hRTnDmhB85pEG3MJP6lI7Safurxoew3M7NEh5THB4iVKmWl8RfCyRf+8/
	 SejRIWU/BgWxRXS+sVpSoH31YudW0DL2L04PnZCLClJZNH0QuOPZloca3U4MYvaXr4
	 KAdgvqiTiC9GwgCQxlRPfovyRMGVO3XsvriEFz0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A7F7F89726;
	Tue,  7 May 2019 18:32:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB9BEF896EC; Tue,  7 May 2019 18:32:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49F8FF80726
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 18:32:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49F8FF80726
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 May 2019 09:32:42 -0700
X-ExtLoop1: 1
Received: from jcsedaya-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.228.16])
 by orsmga001.jf.intel.com with ESMTP; 07 May 2019 09:32:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue,  7 May 2019 11:32:36 -0500
Message-Id: <20190507163236.8783-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507163236.8783-1-pierre-louis.bossart@linux.intel.com>
References: <20190507163236.8783-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, broonie@kernel.org, kbuild-all@01.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/2] ASoC: SOF: core: fix undefined nocodec
	reference
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

The existing code mistakenly uses IS_ENABLED in C code instead of as
in conditional compilation, leading to the following error:

ld: sound/soc/sof/core.o: in function `sof_machine_check':
sound/soc/sof/core.c:279: undefined reference to `sof_nocodec_setup'

Fix by using #if !IS_ENABLED()

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 39cbd84ff9c8..5ddbfa8f1a28 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -265,11 +265,10 @@ static int sof_machine_check(struct snd_sof_dev *sdev)
 	if (plat_data->machine)
 		return 0;
 
-	if (!IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC)) {
-		dev_err(sdev->dev, "error: no matching ASoC machine driver found - aborting probe\n");
-		return -ENODEV;
-	}
-
+#if !IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC)
+	dev_err(sdev->dev, "error: no matching ASoC machine driver found - aborting probe\n");
+	return -ENODEV;
+#else
 	/* fallback to nocodec mode */
 	dev_warn(sdev->dev, "No ASoC machine driver found - using nocodec\n");
 	machine = devm_kzalloc(sdev->dev, sizeof(*machine), GFP_KERNEL);
@@ -284,6 +283,7 @@ static int sof_machine_check(struct snd_sof_dev *sdev)
 	plat_data->machine = machine;
 
 	return 0;
+#endif
 }
 
 static int sof_probe_continue(struct snd_sof_dev *sdev)
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

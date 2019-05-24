Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC93529EDD
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 21:12:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E5A4172D;
	Fri, 24 May 2019 21:11:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E5A4172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558725127;
	bh=qBRt3q+VwUOIXfqFfvCygnBLtreov//v7cj98n7eLLQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EYcabiFhhbupEVhjOGdUd4AErX19ZWgjGpgGF2MYv/wGnyfu45r+bkNwdzQqmCUTu
	 BTn7KjX7hdVBE/UfHjFZDIchvk3+gIJXtyAGSwT82QGgDxZ5qvF4z5i1aBtdbCm405
	 vNTE9LAi62+FA+JvQEaC1zzpVhv2wO0y/5YCNNvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 042C9F89625;
	Fri, 24 May 2019 21:09:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E70BAF89673; Fri, 24 May 2019 21:09:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 616B1F89625
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 21:09:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 616B1F89625
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2019 12:09:31 -0700
X-ExtLoop1: 1
Received: from tattafos-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.178.85])
 by fmsmga004.fm.intel.com with ESMTP; 24 May 2019 12:09:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 24 May 2019 14:09:18 -0500
Message-Id: <20190524190925.5931-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524190925.5931-1-pierre-louis.bossart@linux.intel.com>
References: <20190524190925.5931-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v3 2/9] ASoC: SOF: core: remove
	snd_soc_unregister_component in case of error
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

No need to call snd_soc_unregister_component in case of error
because the component device is resource-managed.

Fixes: c16211d6226 ("ASoC: SOF: Add Sound Open Firmware driver core")
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 0bc4a8472c10..693ad83bffc9 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -382,7 +382,7 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 
 	if (IS_ERR(plat_data->pdev_mach)) {
 		ret = PTR_ERR(plat_data->pdev_mach);
-		goto comp_err;
+		goto fw_run_err;
 	}
 
 	dev_dbg(sdev->dev, "created machine %s\n",
@@ -393,8 +393,6 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 
 	return 0;
 
-comp_err:
-	snd_soc_unregister_component(sdev->dev);
 fw_run_err:
 	snd_sof_fw_unload(sdev);
 fw_load_err:
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

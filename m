Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD231E3025
	for <lists+alsa-devel@lfdr.de>; Tue, 26 May 2020 22:41:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB8611786;
	Tue, 26 May 2020 22:40:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB8611786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590525664;
	bh=/Y+Qf5nEhadpL7hIpnNGKWARqHov6eDMzBkbjLAyCnk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a12M4DxPmxmmFdozYkkbWOwKZNSbIGCicyNCIwNKywfQaaOiFQx5Axt6XaFC8yVyE
	 P4yTwsNoyQAIHGn/he+7joEDibVIhOW8YBxppRQFha3Mu1JO4QmstaI/WXsDP041dq
	 +qIFW//cjxRx0GCnc4+Qg5JOCefOdnjadps3y9q4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE120F8026A;
	Tue, 26 May 2020 22:37:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60B8EF8029A; Tue, 26 May 2020 22:37:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5378FF8014A
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 22:36:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5378FF8014A
IronPort-SDR: Z7F/9lHVA1caTTfntg4HZprjIpmc3XBCTSzhaDeBi6Kl9ysMW+L9lpP25SnWqpMNcUqeG8f2DY
 xHaEV8jbLCXA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 13:36:48 -0700
IronPort-SDR: VgiVt8uNGcf0s1hdCCuAyJUOi1D+8GB7+TU56+DiQyjTUSrbiTmW0dgRXQ4/7pGppEno7hpz6n
 jsOKNkYJnr3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,437,1583222400"; d="scan'208";a="270208871"
Received: from lfnguyen-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.61])
 by orsmga006.jf.intel.com with ESMTP; 26 May 2020 13:36:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/8] ASoC: SOF: pm: handle resume on legacy Intel platforms
Date: Tue, 26 May 2020 15:36:34 -0500
Message-Id: <20200526203640.25980-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200526203640.25980-1-pierre-louis.bossart@linux.intel.com>
References: <20200526203640.25980-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add new case when set_power_state() is not supported, e.g. for Intel
Baytrail/Cherrytrail legacy platforms.

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 5e804a7728f5..92e5f9b15f3a 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -114,8 +114,12 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 		return ret;
 	}
 
-	/* Nothing further to do if resuming from a low-power D0 substate */
-	if (!runtime_resume && old_state == SOF_DSP_PM_D0)
+	/*
+	 * Nothing further to be done for platforms that support the low power
+	 * D0 substate.
+	 */
+	if (!runtime_resume && sof_ops(sdev)->set_power_state &&
+	    old_state == SOF_DSP_PM_D0)
 		return 0;
 
 	sdev->fw_state = SOF_FW_BOOT_PREPARE;
-- 
2.20.1


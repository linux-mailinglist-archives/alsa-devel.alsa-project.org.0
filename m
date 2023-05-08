Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9FB6FA866
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 12:40:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D465A122B;
	Mon,  8 May 2023 12:39:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D465A122B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683542411;
	bh=nzYwOM4J+rUoG6e4vx4I1T40A9eqFOzlrLKgr1GlAus=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=QqWBF1yCrhscuxpxus8+IjeiSAgc9veSXqY39je6d//BgjsVGy8p9WeqV38PjaPgI
	 o7NzdMB2fOX6yOWrcZSz4cuhN4/S75PpnQVwYf3P+hoGp9VfiJ0HSd2iNrbagVmSsm
	 IjiK1blOZFjJSv8eVrhRywG45/8Wit12Fe8Y8X2g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1590AF80310;
	Mon,  8 May 2023 12:39:21 +0200 (CEST)
To: <vkoul@kernel.org>, <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] soundwire: intel: Make DEV_NUM_IDA_MIN a module param
Date: Mon, 8 May 2023 11:39:01 +0100
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JUZGCAQEYLLIKJQE372KSH5ACCQEAWYN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168354236012.26.18372481370341690989@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D17ADF8032D; Mon,  8 May 2023 12:39:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80F27F8014C
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 12:39:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80F27F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=AP3UEY2x
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3489EmkA028057;
	Mon, 8 May 2023 05:39:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=GndCEdzK1snefdFRYVEkK8R4R1g8K0x/+ofecHZlDn4=;
 b=AP3UEY2x4slF7flmnqfWGrDWKWt3hEX6gXgE0YteQ05jmVw3Y3AljJQzbzjUpArLXqfY
 d8xMcma5cap0OCe4f9GuJjHUheFwZ0FJSknpCNjwbiq9CtC/g1g2LYuVS6JathPHubKp
 eZ9Y8jAkMIGEIZxvhgbptTeOxh86XflN+u1bMYjCMGkX0ffBFpsNKxkkF2Mf80hJERMr
 jOdV0Jy8xH3Y0Fwida6/LYYnvTwh870DehUgTwerTVXdUPQQ0x50FehX/qQQ2ZQlFm29
 Y+93Dy+j6p8pLZDb8g6l1Q4wd83Vmj5aTjisr2xImqusZKe+mdY5luNmTgG+c+HtK3oe 8Q==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qdkaqt25u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 05:39:05 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Mon, 8 May
 2023 05:39:04 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 8 May 2023 05:39:04 -0500
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.221])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BD87B475;
	Mon,  8 May 2023 10:39:03 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] soundwire: intel: Make DEV_NUM_IDA_MIN a module param
Date: Mon, 8 May 2023 11:39:01 +0100
Message-ID: <20230508103901.7840-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 4RI7U7Hf5yYf6td2Ckif9-tZ5xmGGciR
X-Proofpoint-GUID: 4RI7U7Hf5yYf6td2Ckif9-tZ5xmGGciR
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: JUZGCAQEYLLIKJQE372KSH5ACCQEAWYN
X-Message-ID-Hash: JUZGCAQEYLLIKJQE372KSH5ACCQEAWYN
X-MailFrom: prvs=0492ffa445=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JUZGCAQEYLLIKJQE372KSH5ACCQEAWYN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a module param so that globally-unique peripheral ID
allocation is only enabled if wanted.

The globally-unique IDs were introduced by
commit c60561014257
("soundwire: bus: allow device number to be unique at system level")

and
commit 1f2dcf3a154a ("soundwire: intel: set dev_num_ida_min")

Assigning globally-unique IDs limits the total number of
peripherals in a system, and the above two commits limit to a
maximum of 8 peripherals. We now have hardware with more than
8 peripherals in total, so this limit is a problem. As the
original commit says that it is only for debug it can be made
optional.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/intel_auxdevice.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index b21e86084f7b..9ebbf652e47a 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -23,8 +23,13 @@
 #include "intel.h"
 #include "intel_auxdevice.h"
 
-/* IDA min selected to avoid conflicts with HDaudio/iDISP SDI values */
-#define INTEL_DEV_NUM_IDA_MIN           4
+/*
+ * sdw_dev_num_min: Set to non-zero to enable globally-unique peripheral IDs.
+ * The value is the minimum ID that will be allocated.
+ */
+static int intel_dev_num_ida_min;
+module_param_named(sdw_dev_num_min, intel_dev_num_ida_min, int, 0444);
+MODULE_PARM_DESC(sdw_dev_num_min, "SoundWire Intel Master min globally-unique ID (0 to disable)");
 
 #define INTEL_MASTER_SUSPEND_DELAY_MS	3000
 
@@ -148,7 +153,7 @@ static int intel_link_probe(struct auxiliary_device *auxdev,
 	cdns->msg_count = 0;
 
 	bus->link_id = auxdev->id;
-	bus->dev_num_ida_min = INTEL_DEV_NUM_IDA_MIN;
+	bus->dev_num_ida_min = intel_dev_num_ida_min;
 	bus->clk_stop_timeout = 1;
 
 	sdw_cdns_probe(cdns);
-- 
2.30.2


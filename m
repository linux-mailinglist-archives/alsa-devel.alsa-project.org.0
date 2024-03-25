Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0056188AF73
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 20:10:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AD7914DD;
	Mon, 25 Mar 2024 20:10:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AD7914DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711393825;
	bh=OUTG06nJDlO6TyRUnO74rozzjf6s+aA5Hb3q1CX7FjU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CiFJxKkGbA7EYiZsvX5PDVi4Q58peMHh9jBkcM7O/W5uIEzHpB7s7BwdX7ZKbJwHW
	 nOrN7NGXOkdsmb8vul6CgS8/iLnNlgmCytgigYvtCkGaWWQiT6EXy3TJv+PZ1V0lmC
	 z9a/BwnF2tYgMPidTgu+YoRrqiwLXaufWDyMSxk4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27234F805AE; Mon, 25 Mar 2024 15:55:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BAF26F805C4;
	Mon, 25 Mar 2024 15:55:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EA3FF805AE; Mon, 25 Mar 2024 15:55:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79005F80564
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 15:55:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79005F80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=UA6FZVGf
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42P3P0eY021761;
	Mon, 25 Mar 2024 09:55:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=W
	iglk1r0cdxZ5D6UfXZHUlMlHakoY8HthLuTK4xjf0k=; b=UA6FZVGfwAyKfRlaD
	L4L8q2mSseLEdZFSrCj4C811itT4Nnraulv3reSfs2WweNpX6I6rigQT9K1qibYQ
	wGUj3kxdKkVx7d/V4F6hljpO6luHX+zZAOScrs9YUA21ibGr7Wx3C7VITJfkzqwE
	Zv30KrEsV8WX8+XXbCkJTBb7jTrS3YPMy+yJEp0pmZigIGGeAZOzbO+4ahnVDihX
	zrE/09DPZ7rA/1OmIeasmBo1LSt4wVeBchPbT6YdVzTbJ/0vXIE7s1fzbxQ3jHdK
	DpStjGZG0RJyiB0skkq9RgZY6QuwZjM3RRWBGYkZZvru3JV8v8pIG4L4nsb6J+sO
	GXA+g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3x1vfybjc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 09:55:13 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 25 Mar
 2024 14:55:11 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.4 via Frontend Transport; Mon, 25 Mar 2024 14:55:11 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id EEEE2820244;
	Mon, 25 Mar 2024 14:55:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda: cs35l56: Set the init_done flag before
 component_add()
Date: Mon, 25 Mar 2024 14:55:10 +0000
Message-ID: <20240325145510.328378-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: xYezW5GbRV6U63GUk9w_nk9e9zLQz_H-
X-Proofpoint-GUID: xYezW5GbRV6U63GUk9w_nk9e9zLQz_H-
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ZKRZPCOTEB6O7J53CFUODXWU2TA3ILGZ
X-Message-ID-Hash: ZKRZPCOTEB6O7J53CFUODXWU2TA3ILGZ
X-MailFrom: prvs=081491209a=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZKRZPCOTEB6O7J53CFUODXWU2TA3ILGZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

Initialization is completed before adding the component as that can
start the process of the device binding and trigger actions that check
init_done.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
---
 sound/pci/hda/cs35l56_hda.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index f3c5715f5e02..1a3f84599cb5 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -1045,14 +1045,14 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int hid, int id)
 	pm_runtime_mark_last_busy(cs35l56->base.dev);
 	pm_runtime_enable(cs35l56->base.dev);
 
+	cs35l56->base.init_done = true;
+
 	ret = component_add(cs35l56->base.dev, &cs35l56_hda_comp_ops);
 	if (ret) {
 		dev_err(cs35l56->base.dev, "Register component failed: %d\n", ret);
 		goto pm_err;
 	}
 
-	cs35l56->base.init_done = true;
-
 	return 0;
 
 pm_err:
-- 
2.39.2


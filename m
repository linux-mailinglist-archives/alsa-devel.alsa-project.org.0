Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B1498A5A5
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 15:42:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E164F1923;
	Mon, 30 Sep 2024 15:42:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E164F1923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727703773;
	bh=psflkMB7qAoxkqd7N5cq7XptZw+Bu7fKgW5KThNEWLI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tavgOHlvPBTAhz18tetLYeH8FCsoXwmYy4s1HbJMie9u5NKf1bwRiz3jRt89IYo2y
	 kTNevLNiq4hjDNNIfRTuvUd58gvfAT7X2RSpEpeo0X8eK9VqfcDuBEQXbxldykOGCf
	 d4kHtB6WO4YfP1vLnNX3oijx1Db0a9DEW2vHVfLs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 346A8F805B5; Mon, 30 Sep 2024 15:42:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 728E7F805D9;
	Mon, 30 Sep 2024 15:42:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47DC5F80517; Mon, 30 Sep 2024 15:41:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E53CFF80508
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 15:41:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E53CFF80508
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Y95oEEOz
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 48U6Q4fu032180;
	Mon, 30 Sep 2024 08:41:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=VZysMvcsbI8t6faO3feAXmy83HgYNlD9s1w99EWS4u4=; b=
	Y95oEEOze0PaOAKYVFcK+lVdbp32i4voJomnG//GblRVdBO/db1kjf9iSRZgFYn+
	FyqLACh5cc4sv7cO5zhVzU5R/CpyEsrBzomv8H2+7KcDJG3HlxQS94Mqn03/2mfI
	v9P00j6h6PyOHrMyP4FCawW+/AYIXir89p+r/vFJXxCmlMqp2/6T21lXsfAzvhNU
	qScsSStSLSa/60w4ZlchudBfIfwxN/5a3QiRJ9t+1zvwvczQv2YbdcsxXf1CnRgy
	Le5AGDa7yyw5bks+jAyJFs3m5GFWwVCNqitoMaJcAdaMrGgBDAHSOEEuNXo3QWe2
	KBBsDkewK8ivz+55i/gqCw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 41xf6xadxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 08:41:45 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Sep
 2024 14:41:43 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 30 Sep 2024 14:41:43 +0100
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 0949B820248;
	Mon, 30 Sep 2024 13:41:43 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        "Maciej
 Strozek" <mstrozek@opensource.cirrus.com>
Subject: [PATCH alsa-ucm-conf 2/2] sof-soundwire: Add sequence for controlling
 Mic Mute LED
Date: Mon, 30 Sep 2024 14:41:18 +0100
Message-ID: <20240930134118.2640509-2-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240930134118.2640509-1-mstrozek@opensource.cirrus.com>
References: <20240930134118.2640509-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 0AZERI__mDqdFETE9JGhBm1s4vUrI7vM
X-Proofpoint-GUID: 0AZERI__mDqdFETE9JGhBm1s4vUrI7vM
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: OA7G7NJOBRPFQD5JFNLPOC4QGBVT4RJB
X-Message-ID-Hash: OA7G7NJOBRPFQD5JFNLPOC4QGBVT4RJB
X-MailFrom: prvs=700313c41c=mstrozek@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OA7G7NJOBRPFQD5JFNLPOC4QGBVT4RJB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 ucm2/codecs/cs42l43/init.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/ucm2/codecs/cs42l43/init.conf b/ucm2/codecs/cs42l43/init.conf
index cf61833..fad41dd 100644
--- a/ucm2/codecs/cs42l43/init.conf
+++ b/ucm2/codecs/cs42l43/init.conf
@@ -12,3 +12,9 @@ LibraryConfig.remap.Config {
 		}
 	}
 }
+
+FixedBootSequence [
+        exec "-/sbin/modprobe snd_ctl_led"
+        sysw "-/class/sound/ctl-led/mic/card${CardNumber}/attach:cs42l43 Decimator 3 Switch"
+        sysw "-/class/sound/ctl-led/mic/card${CardNumber}/attach:cs42l43 Decimator 4 Switch"
+]
-- 
2.39.5


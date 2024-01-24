Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7646C83ACEA
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 16:13:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24201E0F;
	Wed, 24 Jan 2024 16:13:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24201E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706109231;
	bh=8fSzUVey984nMEt+aAXA7c16HLFwu6d7XSq7GXLETks=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bpu7k57h0xfl+l6nDgACXKlRu8tZBL/ycyrCFo1wKANK5MAVaOUE8/ORpd0kpkg8q
	 A8QKjFeKNFlU7eJSn5qsNTyYnYXRIYdueoPqmkqTTCb0uHtQ3/lJq5UU13ij5nUtwg
	 wdehb+Y83vtA8BJ+HgFe49Hppw4+lwvTQ3+zY2Ns=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E29B6F805FF; Wed, 24 Jan 2024 16:12:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1187FF805F2;
	Wed, 24 Jan 2024 16:12:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC706F802E8; Wed, 24 Jan 2024 16:12:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9BC8F8028D
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 16:12:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9BC8F8028D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=fZLq6Zj0
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40O8PstE007460;
	Wed, 24 Jan 2024 09:12:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=xqockhO3PC0w8zteR8DQgwdzsYaq2lS11Dt4dduvSI4=; b=
	fZLq6Zj0KpSFrjCQCa7XA5r9C+aAkPNzuD7IZSYXYlTPws6C3OoL0nhQQC2VeQjD
	cexHOq8T4TC0UKMjpGUZDg8ULpSuflfQBnUkkBHLmGiInIlskMDp8WNeCDBD9fvy
	MER/ZAxr34t+ggBDFfbMhO4+jfkvry5upd7t/pWpmCYUG08UT7/sCg02KmC8gvox
	bo2cjZOhJXmdmalwafvlA2RmZwP2gmVOBvCqjixlvFzZKb72FmUJlQpu5etxy/vS
	6AkNejLlwKHcjhXt4EaASd3J9jxmzjjZSwC68x7s3dq87ORy/ZrpGbmKC/RjWQy9
	BJn40LEbvo5PdgF2SWgrXA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhgxx8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 09:12:25 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 15:12:22 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 15:12:22 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 5386882024A;
	Wed, 24 Jan 2024 15:12:22 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <lee@kernel.org>, <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH 5/6] mfd: cs42l43: Handle error from devm_pm_runtime_enable
Date: Wed, 24 Jan 2024 15:12:21 +0000
Message-ID: <20240124151222.1448570-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240124151222.1448570-1-ckeepax@opensource.cirrus.com>
References: <20240124151222.1448570-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ht3Mncp21og942O5GIgF56txXAIWH9sr
X-Proofpoint-GUID: ht3Mncp21og942O5GIgF56txXAIWH9sr
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: JBOSZFZBGTFON5MEAYD4FR6JLHNTTL6W
X-Message-ID-Hash: JBOSZFZBGTFON5MEAYD4FR6JLHNTTL6W
X-MailFrom: prvs=8753590469=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JBOSZFZBGTFON5MEAYD4FR6JLHNTTL6W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As it devm_pm_runtime_enable can fail due to memory allocations, it is
best to handle the error.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/mfd/cs42l43.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index aea0f8f485785..56bd9dbbe10b0 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -1065,7 +1065,9 @@ int cs42l43_dev_probe(struct cs42l43 *cs42l43)
 	 * the boot work runs.
 	 */
 	pm_runtime_get_noresume(cs42l43->dev);
-	devm_pm_runtime_enable(cs42l43->dev);
+	ret = devm_pm_runtime_enable(cs42l43->dev);
+	if (ret)
+		return ret;
 
 	queue_work(system_long_wq, &cs42l43->boot_work);
 
-- 
2.30.2


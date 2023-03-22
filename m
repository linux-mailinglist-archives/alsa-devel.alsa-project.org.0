Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA98B6C5135
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 17:50:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43BEFE9F;
	Wed, 22 Mar 2023 17:50:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43BEFE9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679503856;
	bh=QMjdqCWhHIFQBUyZ4RwyuU08U3jWcuVanO6+lwemZ8k=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=ec9qJG7F2gDPKk26QxMAxcQD8Q5HeASaEpqxwvZqI1/ZB5OZHGIl8149rphI4cZHj
	 LCP8jHeNoPdJGtBEtNMaP2/bLE0sYaIQIkvtXD5x6zQBFttgSWW9XLkXTOlYnrJN2s
	 nW4qmNV0+CXCvGHxTxLSyvZoN4pLAcMScjA3rEHo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED2CFF8024E;
	Wed, 22 Mar 2023 17:50:05 +0100 (CET)
To: <vkoul@kernel.org>
Subject: [PATCH v2 1/3] soundwire: bus: Remove now outdated comments on no_pm
 IO
Date: Wed, 22 Mar 2023 16:49:46 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WVBEATUXMRGMGZ6RRZTANV2QQZYJUS6V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: <167950380457.26.354462390199652578@mailman-core.alsa-project.org>
From: Charles Keepax via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81C89F80482; Wed, 22 Mar 2023 17:50:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2EE7F8024E
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 17:49:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2EE7F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=QT3qIW7b
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32MFxWd0007640;
	Wed, 22 Mar 2023 11:49:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=xU77L1DhmwOBMrIJK1CMd8sTafQKeSs0GDkVlRY+tSA=;
 b=QT3qIW7bdl5pgA1a/1V+pRuZNBKN5j5NjM9szi9BpongkQUebBKjYMPrXpmICbTLXSgh
 aqldc7+Bzs9gQTBUdOJMfqjzP4BfjbU0bShfA2RpQBCLWWC7jvUkkyI83Jo5FB6SAkHL
 uKchwkgvRYWgdgs4IoZCX2+c/tWYKAzo7bW/V68LdJvscsnIbx3LwEtr5iPwGlPo6P1l
 zP6+8gJp2rY1LL+uvwYn6WH0iGAfmt5oGcwLAclYN8A5Nkd6HEH3VENmRzra8kzQB7mS
 NvvhF+Ca/9159YAr9tdh1FNZPq6apUZU+nTzLrFBHFFJR7UcryykfesXf5XFlstGG3Mp YA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3pdaq35kar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Mar 2023 11:49:50 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Wed, 22 Mar
 2023 11:49:48 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Wed, 22 Mar 2023 11:49:48 -0500
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8CD3211AD;
	Wed, 22 Mar 2023 16:49:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>
Subject: [PATCH v2 1/3] soundwire: bus: Remove now outdated comments on no_pm
 IO
Date: Wed, 22 Mar 2023 16:49:46 +0000
Message-ID: <20230322164948.566962-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: gc9VZvqwApyLX6zgr3M4Hfdy5AD5emev
X-Proofpoint-GUID: gc9VZvqwApyLX6zgr3M4Hfdy5AD5emev
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: WVBEATUXMRGMGZ6RRZTANV2QQZYJUS6V
X-Message-ID-Hash: WVBEATUXMRGMGZ6RRZTANV2QQZYJUS6V
X-MailFrom: prvs=8445e31b45=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WVBEATUXMRGMGZ6RRZTANV2QQZYJUS6V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Things have moved more towards end drivers using the no_pm versions of
the IO functions. See commits:

commit 167790abb90f ("soundwire: export sdw_write/read_no_pm functions")
commit 62dc9f3f2fd0 ("soundwire: bus: export sdw_nwrite_no_pm and
                      sdw_nread_no_pm functions")

As such this comment is now misleading, so remove it.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v1.

 drivers/soundwire/bus.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index b6aca59c31300..3c67266f94834 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -384,9 +384,6 @@ int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
 
 /*
  * Read/Write IO functions.
- * no_pm versions can only be called by the bus, e.g. while enumerating or
- * handling suspend-resume sequences.
- * all clients need to use the pm versions
  */
 
 int sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
-- 
2.30.2


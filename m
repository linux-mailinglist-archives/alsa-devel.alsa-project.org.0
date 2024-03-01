Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A33D86DF17
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Mar 2024 11:16:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E4B986F;
	Fri,  1 Mar 2024 11:16:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E4B986F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709288200;
	bh=6Agnyi8DLedM+Z6EYzVyW6OwLNrz92tvZUbDuL+GHwY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ktT5U/oS6Ok47GOQT2kxgZ0qPWu5bDA4OVKaqjzAnzzSfxFa8ulsSVrpoXy2PUGzo
	 XUisT9yUTdotwvmNIlLIBM+okjO47+uvJkYw/sDdNokCrRXGvs7XCtWp/bE1BB4edU
	 s+U2eDc7yenTjL4LwSQEtqnpfQTComYrEdU/UUsE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD64EF80587; Fri,  1 Mar 2024 11:16:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6672DF805A1;
	Fri,  1 Mar 2024 11:16:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C98B4F801C0; Fri,  1 Mar 2024 11:15:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 443BEF80087
	for <alsa-devel@alsa-project.org>; Fri,  1 Mar 2024 11:15:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 443BEF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Q5LiiEHx
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4214rwHV014460;
	Fri, 1 Mar 2024 04:15:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=f
	UoFHpE8arqzQuv1VUMK76N/vXq5gSpbs+hWP4zYhQQ=; b=Q5LiiEHxNLjWedBUt
	xofHsz+eNIxlDIF5SLa6x/sHtAuk/V8gVLGjT3gqkOO69LntWMvTMRveCY1n6Fcr
	/PdThwBDaiASORSwq14rFXQbqikcSe2o4aQmj6wrKD7jldjBhO62UQMTBD7J63/w
	efyfKn5qyqKoYun2lEw0FyxIiqQzLzK5ptTKD7FuFFRkrp9/MrNtCDsDyW1yeoBs
	rlXwTq2k8B0NQwfWGtifNb6GZlJ+102cqvF7u4dTUwujGvl+t5ZyVu1LjLRiE9Ad
	pyd74W7N8VpNr1gIaNtC0m4dwwPXw/ZzMz2Y8d71zOXyoeGq5Sa1dJpXCupuyvOP
	TkWCw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wje8h23cc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 04:15:50 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Mar
 2024 10:15:49 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 1 Mar 2024 10:15:49 +0000
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id EA6B4820241;
	Fri,  1 Mar 2024 10:15:48 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        Maciej Strozek
	<mstrozek@opensource.cirrus.com>
Subject: [PATCH] mfd: cs42l43: Fix wrong GPIO_FN_SEL and SPI_CLK_CONFIG1
 defaults
Date: Fri, 1 Mar 2024 10:15:47 +0000
Message-ID: <20240301101547.2136948-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: _DQfhOcg-vxb4Zl5wF253C9eCruaktL5
X-Proofpoint-GUID: _DQfhOcg-vxb4Zl5wF253C9eCruaktL5
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: UUHKZXUX6JMDUATKTWXQZAWPXPMW577G
X-Message-ID-Hash: UUHKZXUX6JMDUATKTWXQZAWPXPMW577G
X-MailFrom: prvs=07900c2a65=mstrozek@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UUHKZXUX6JMDUATKTWXQZAWPXPMW577G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Two regs have wrong values in existing fields, change them to match
the datasheet.

Fixes: ace6d1448138 ("mfd: cs42l43: Add support for cs42l43 core driver")

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 drivers/mfd/cs42l43.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 73c88ee6a866..1cea3f8f467d 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -84,7 +84,7 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_DRV_CTRL_5,				0x136C00C0 },
 	{ CS42L43_GPIO_CTRL1,				0x00000707 },
 	{ CS42L43_GPIO_CTRL2,				0x00000000 },
-	{ CS42L43_GPIO_FN_SEL,				0x00000000 },
+	{ CS42L43_GPIO_FN_SEL,				0x00000004 },
 	{ CS42L43_MCLK_SRC_SEL,				0x00000000 },
 	{ CS42L43_SAMPLE_RATE1,				0x00000003 },
 	{ CS42L43_SAMPLE_RATE2,				0x00000003 },
@@ -217,7 +217,7 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_CTRL_REG,				0x00000006 },
 	{ CS42L43_FDIV_FRAC,				0x40000000 },
 	{ CS42L43_CAL_RATIO,				0x00000080 },
-	{ CS42L43_SPI_CLK_CONFIG1,			0x00000000 },
+	{ CS42L43_SPI_CLK_CONFIG1,			0x00000001 },
 	{ CS42L43_SPI_CONFIG1,				0x00000000 },
 	{ CS42L43_SPI_CONFIG2,				0x00000000 },
 	{ CS42L43_SPI_CONFIG3,				0x00000001 },
--
2.30.2


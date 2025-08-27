Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83666B37931
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Aug 2025 06:35:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EDA460293;
	Wed, 27 Aug 2025 06:35:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EDA460293
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756269353;
	bh=aWTOvqQJqVhvq0kHlay3cBgBEi9sg0yCfPp/3mN63Z0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=r45++uPhLjwLAwr0bKzHLAt2dHLxUTs14coFMLF8NOJPPYczepSKpp7za+m7TRP8/
	 wgrdSDCV79UBw0Aicj30xoMcTnBKcWhF2lzD77Hi7NjnqPMGMFDCTFHiT19/vmB93i
	 QtSnDldA2m/Xe6ijNehKabJxg5tv2S95iq6bY9Ws=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 604F6F805C1; Wed, 27 Aug 2025 06:35:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A161FF805C4;
	Wed, 27 Aug 2025 06:35:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96A7DF80495; Wed, 27 Aug 2025 06:34:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35888F800DF
	for <alsa-devel@alsa-project.org>; Wed, 27 Aug 2025 06:34:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35888F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=ut96wx9A
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57R4YDq41200925;
	Tue, 26 Aug 2025 23:34:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756269253;
	bh=onUPctksx9v/T9fvKGxi3HtsF9f2imEu14eR2p3XkFc=;
	h=From:To:CC:Subject:Date;
	b=ut96wx9A473TuRqqNBG65MitpI0YYiuShzfK6RlQxrdiURnOpdQLH4vjYI7DynHmO
	 3eEQqMEI2oyPEH14Kk0/p69rnQ8vGTGiYILTEU03wPKXY2cNcJafglwii3lYIPJbtA
	 UGmw0D64l2gTeO00jQGeht4y4130oSKOVG2RUPJs=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57R4YCG72192944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 26 Aug 2025 23:34:12 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 26
 Aug 2025 23:34:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 26 Aug 2025 23:34:11 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.79])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57R4Y8S92555052;
	Tue, 26 Aug 2025 23:34:08 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <13564923607@139.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>, <Baojun.Xu@fpt.com>, <jesse-ji@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v3] ALSA: hda/tas2781: Fix EFI name for calibration beginning
 with 1 instead of 0
Date: Wed, 27 Aug 2025 12:34:03 +0800
Message-ID: <20250827043404.644-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: 6RIDC3QAW6NUB2GL644R52O2723EH3U3
X-Message-ID-Hash: 6RIDC3QAW6NUB2GL644R52O2723EH3U3
X-MailFrom: shenghao-ding@ti.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6RIDC3QAW6NUB2GL644R52O2723EH3U3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A bug reported by one of my customers that EFI name beginning with 0
instead of 1.

Fixes: 4fe238513407 ("ALSA: hda/tas2781: Move and unified the calibrated-data getting function for SPI and I2C into the tas2781_hda lib")
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v3:
 - remove unrelated change
v1:
 - Fix EFI name beginning with 1 instead of 0
 - Add extra comments on EFI name for calibration
---
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index ed7771ab9475..dbd71e173119 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -340,8 +340,8 @@ static int tas2563_save_calibration(struct tas2781_hda *h)
 		data[offset] = i;
 		offset++;
 		for (j = 0; j < TASDEV_CALIB_N; ++j) {
-			ret = snprintf(var8, sizeof(var8), vars[j], i);
-
+			/* EFI name for calibration started with 1, not 0 */
+			ret = snprintf(var8, sizeof(var8), vars[j], i + 1);
 			if (ret < 0 || ret >= sizeof(var8) - 1) {
 				dev_err(p->dev, "%s: Read %s failed\n",
 					__func__, var8);
-- 
2.43.0


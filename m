Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 409E4B3593F
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Aug 2025 11:42:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E397360231;
	Tue, 26 Aug 2025 11:42:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E397360231
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756201330;
	bh=vLjLwr94q3rSj4G25/68U6jKI9ri/x/KD4FRifqWx14=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=o/1jPnHjvsMRkDGzZqgtHQHxZ4YNVHVqM07+g8ySMb2SrQc60ClCV2Piuo9NDOAvo
	 soqBcgo8CXV23agqnzHYwxqCc1+qHhEI5vf5H7+0znpCRqkTd2YqrQ+jjKFZRjsoUW
	 1nrUM1ix+96KMw+pruYKMZvbD4OQ9dX8u2xZuOK4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36244F805C8; Tue, 26 Aug 2025 11:41:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3D50F805C7;
	Tue, 26 Aug 2025 11:41:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 527F5F8051F; Tue, 26 Aug 2025 11:41:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DEF70F80153
	for <alsa-devel@alsa-project.org>; Tue, 26 Aug 2025 11:41:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEF70F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=FjIxHJfe
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57Q9fGFk1488907;
	Tue, 26 Aug 2025 04:41:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756201276;
	bh=JZgmDGp+9Nh8DudvfY3ViWKUhhZhmNY8uji+3z7DO0g=;
	h=From:To:CC:Subject:Date;
	b=FjIxHJfeOSg3YJGpeoA2kTi6hESe3cd8Ywwn0718HaCqYf9Ls3bLqJi/bVw/CHtij
	 HOhkm3RF2dNCEG26ZT8TsDxcdgNuEMRhKrSSjtL0wZqExBJ1VgKQ2ESjyZT9BOjH7z
	 V3qnXBfkFSlzZjNYJD8fBJ7t9JNLyTCsLrw+tuVY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57Q9fFaa1590905
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 26 Aug 2025 04:41:15 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 26
 Aug 2025 04:41:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 26 Aug 2025 04:41:14 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.79])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57Q9fAo91229666;
	Tue, 26 Aug 2025 04:41:11 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <13564923607@139.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>, <Baojun.Xu@fpt.com>, <jesse-ji@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v2] ALSA: hda/tas2781: Fix EFI name for calibration beginning
 with 1 instead of 0
Date: Tue, 26 Aug 2025 17:41:05 +0800
Message-ID: <20250826094105.1325-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: 2ECLGASMAWP5CJDAIS5ZFFG3NXCGHAGC
X-Message-ID-Hash: 2ECLGASMAWP5CJDAIS5ZFFG3NXCGHAGC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ECLGASMAWP5CJDAIS5ZFFG3NXCGHAGC/>
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
v2:
 - remove unrelated change
v1:
 - Fix EFI name beginning with 1 instead of 0
 - Add extra comments on EFI name for calibration
 - Remove an extra space
---
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index ed7771ab9475..635cbd8820ac 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -340,7 +340,8 @@ static int tas2563_save_calibration(struct tas2781_hda *h)
 		data[offset] = i;
 		offset++;
 		for (j = 0; j < TASDEV_CALIB_N; ++j) {
-			ret = snprintf(var8, sizeof(var8), vars[j], i);
+			/* EFI name for calibration started with 1, not 0 */
+			ret = snprintf(var8, sizeof(var8), vars[j], i + 1);
 
 			if (ret < 0 || ret >= sizeof(var8) - 1) {
 				dev_err(p->dev, "%s: Read %s failed\n",
@@ -349,7 +350,7 @@ static int tas2563_save_calibration(struct tas2781_hda *h)
 			}
 			/*
 			 * Our variable names are ASCII by construction, but
-			 * EFI names are wide chars.  Convert and zero-pad.
+			 * EFI names are wide chars. Convert and zero-pad.
 			 */
 			memset(efi_name, 0, sizeof(efi_name));
 			for (k = 0; k < sizeof(var8) && var8[k]; k++)
-- 
2.43.0


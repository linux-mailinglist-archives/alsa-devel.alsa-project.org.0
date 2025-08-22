Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E174B31A34
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Aug 2025 15:51:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DEBA6025C;
	Fri, 22 Aug 2025 15:51:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DEBA6025C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755870710;
	bh=PoKu8cetijpbo+YzllTWuCf4Q4G3t0TM8w0o7LKcXZE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=be0Hr7YP+7O+/bnAKX/Dem4cHEgzITpjeEUMvaz2ELbAF9dGpV+I3gHuN5e9KjdcT
	 wU+iFFjepWuD8ILYBla85u240Pw/1fAcPfIamICHdnpZeEu8/4Nbeog2YEi9afVsXL
	 LTb2n3Q8zl74d1q9ZekD3qhmVrLuHZVLic39m/z0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D34FEF805C8; Fri, 22 Aug 2025 15:51:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F23AF805C4;
	Fri, 22 Aug 2025 15:51:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAE0AF804FF; Fri, 22 Aug 2025 15:51:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17456F80246
	for <alsa-devel@alsa-project.org>; Fri, 22 Aug 2025 15:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17456F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=otWE+VW1
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57MDoq52730853;
	Fri, 22 Aug 2025 08:50:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755870652;
	bh=vQpJb33UAMvr55isOHCAnuBgcUtJ7lvapZEPEFi8rGA=;
	h=From:To:CC:Subject:Date;
	b=otWE+VW1+KmfubKRMmslDNvfL171KXOwAEaqG+dzUKYW7iKnd+ZhdkhH0Mmj9EjjF
	 OYUStcTy1oWcag1JomHw4HzZAeDAw+UWc8Uf2rkdLFS2IFZJI66SVC5OTq1Bh12ziW
	 pjtfUl7TYFQUd9q3hkTnzjDl1DBrXlZRVkOpv6HY=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57MDop833317935
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 08:50:51 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 08:50:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 08:50:51 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.79])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57MDolZ13918264;
	Fri, 22 Aug 2025 08:50:47 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <13564923607@139.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>, <Baojun.Xu@fpt.com>, <jesse-ji@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Fix EFI name for calibration beginning
 with 1 instead of 0
Date: Fri, 22 Aug 2025 21:50:42 +0800
Message-ID: <20250822135043.517-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: GZVRHEGC5Z7XN57CQEL3K6ESKGXBY4P7
X-Message-ID-Hash: GZVRHEGC5Z7XN57CQEL3K6ESKGXBY4P7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GZVRHEGC5Z7XN57CQEL3K6ESKGXBY4P7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A bug reported by one of my customers that EFI name beginning with 0
instead of 1, and code clean for the string checking.

Fixes: 4fe238513407 ("ALSA: hda/tas2781: Move and unified the calibrated-data getting function for SPI and I2C into the tas2781_hda lib")
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v1:
 - Fix EFI name beginning with 1 instead of 0
 - Code clean for the string checking
 - Add extra comments on EFI name for calibration
 - Remove an extra space
---
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index ed7771ab9475..fecd5eac739b 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -340,16 +340,17 @@ static int tas2563_save_calibration(struct tas2781_hda *h)
 		data[offset] = i;
 		offset++;
 		for (j = 0; j < TASDEV_CALIB_N; ++j) {
-			ret = snprintf(var8, sizeof(var8), vars[j], i);
+			/* EFI name for calibration started with 1, not 0 */
+			ret = snprintf(var8, sizeof(var8), vars[j], i + 1);
 
-			if (ret < 0 || ret >= sizeof(var8) - 1) {
+			if (ret != strlen(var8)) {
 				dev_err(p->dev, "%s: Read %s failed\n",
 					__func__, var8);
 				return -EINVAL;
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


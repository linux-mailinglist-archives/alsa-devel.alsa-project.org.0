Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7C79EC413
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 05:40:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E7A422A8;
	Wed, 11 Dec 2024 05:39:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E7A422A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733892001;
	bh=HL6ack+5CGIxYn9KlAblirIQVNzTWySyAIZ3CVH68Oo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gGDEGHd+rVpf00E0uwXASdFCau1AcDFkXcG8JTqzoe1hbl0I60ZBOr882faAdnPMe
	 iLpfmZyJNYeisSD5NTIW6PKPGDUeuzFeebZHCGmZJwiAiX28F2hTt2YbEzMLwLo237
	 MN6pVHmkfcU4Ologq+6vtJJDNaqlo627m/PNe5lU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E83D6F805B4; Wed, 11 Dec 2024 05:39:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15A2DF805C3;
	Wed, 11 Dec 2024 05:39:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0232F80482; Wed, 11 Dec 2024 05:39:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F80FF8016C
	for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2024 05:39:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F80FF8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=C+AxQ3+w
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BB4d8QZ2776726
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Dec 2024 22:39:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733891948;
	bh=ATvEdCpQABPHWAnljbiRS+SwKA1c6QoUlHHYaQ8R4qI=;
	h=From:To:CC:Subject:Date;
	b=C+AxQ3+wuJEHLE3vdIgIpZ2q87JTveL/Qjn1hM2Tjln6WSui9K0V4z2S447UxQWG9
	 veFJuQoowYnYdW765Ek2ctVlAO9o+r762t/T02BQ2AgSQGU4UCJU09Qq4Hz0H+3IDt
	 1oEiIoHqZJXy/XezOPplwaZigbRm4a3djGXxhSLw=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BB4d8VF009571
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 10 Dec 2024 22:39:08 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Dec 2024 22:39:07 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Dec 2024 22:39:07 -0600
Received: from LT5CG31242FY.dhcp.ti.com (lt5cg31242fy.dhcp.ti.com
 [10.85.14.200])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BB4d3xw086812;
	Tue, 10 Dec 2024 22:39:04 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <tiwai@suse.de>, <baojun.xu@ti.com>,
        <Baojun.Xu@fpt.com>, Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Fix calibration issue in stress test
Date: Wed, 11 Dec 2024 12:38:59 +0800
Message-ID: <20241211043859.1328-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: QZDWYCXDOOPQGZR2SUEYZ34OBQJPSN23
X-Message-ID-Hash: QZDWYCXDOOPQGZR2SUEYZ34OBQJPSN23
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QZDWYCXDOOPQGZR2SUEYZ34OBQJPSN23/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

One specific test condition: the default registers of p[j].reg ~
p[j+3].reg are 0, TASDEVICE_REG(0x00, 0x14, 0x38)(PLT_FLAG_REG),
TASDEVICE_REG(0x00, 0x14, 0x40)(SINEGAIN_REG), and
TASDEVICE_REG(0x00, 0x14, 0x44)(SINEGAIN2_REG). After first calibration,
they are freshed to TASDEVICE_REG(0x00, 0x1a, 0x20), TASDEVICE_REG(0x00,
0x16, 0x58)(PLT_FLAG_REG), TASDEVICE_REG(0x00, 0x14, 0x44)(SINEGAIN_REG),
and TASDEVICE_REG(0x00, 0x16, 0x64)(SINEGAIN2_REG) via "Calibration Start"
kcontrol. In second calibration, the p[j].reg ~ p[j+3].reg have already
become tas2781_cali_start_reg. However, p[j+2].reg, TASDEVICE_REG(0x00,
0x14, 0x44)(SINEGAIN_REG), will be freshed to TASDEVICE_REG(0x00, 0x16,
0x64), which is the third register in the input params of the kcontrol.
This is why only first calibration can work, the second-time, third-time
or more-time calibration always failed without reboot. Of course, if no
p[j].reg is in the list of tas2781_cali_start_reg, this stress test can
work well.

Fixes: 49e2e353fb0d ("ASoC: tas2781: Add Calibration Kcontrols for Chromebook")
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 sound/soc/codecs/tas2781-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index be2ca5eb6c93..fb8cd2284fe8 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -370,7 +370,7 @@ static void sngl_calib_start(struct tasdevice_priv *tas_priv, int i,
 			tasdevice_dev_read(tas_priv, i, p[j].reg,
 				(int *)&p[j].val[0]);
 		} else {
-			switch (p[j].reg) {
+			switch (tas2781_cali_start_reg[j].reg) {
 			case 0: {
 				if (!reg[0])
 					continue;
-- 
2.34.1


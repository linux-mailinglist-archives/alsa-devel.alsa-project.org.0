Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67443B46AAD
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Sep 2025 11:22:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C486601F9;
	Sat,  6 Sep 2025 11:21:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C486601F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757150523;
	bh=9bNmYoNLsFa8unIWulNLAELWJUoXGwU8yuTvkUzNN1s=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EGj1uoDsoMVws0cSVoTMzXw+rUGGDXsfRmckWdLpQVY9O5DxPXFxz+5ia26outcap
	 2sZjXCsGpEIUlTSylvyhK1HUGC9cZ4RgPzkHlICxYqDmEZSuzhwj3X+DKeBdDehy/N
	 x+zT2ku5u+VOSgdQCfBBjWLxlYny+FHlPHvg4+qQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA269F805D3; Sat,  6 Sep 2025 11:21:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58918F805BF;
	Sat,  6 Sep 2025 11:21:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78BADF804FC; Sat,  6 Sep 2025 11:20:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9641DF8010B
	for <alsa-devel@alsa-project.org>; Sat,  6 Sep 2025 11:19:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9641DF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=s3j3gS3j
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5869JW8t3925761;
	Sat, 6 Sep 2025 04:19:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757150372;
	bh=YLNYxp/FSpxPNcyK6bIyluYzJiMr2F1DgAnGcWIhwgM=;
	h=From:To:CC:Subject:Date;
	b=s3j3gS3jzpe1YJY636MxtJ+jpXCJm8H8wMdfGSJxNyzztPY5G2W/NwIo9AlEFr64L
	 UH3uESkHtLPlKpFGkQkiKS1hLQbGd/+0wVNfV2NL2Mye1AxLL61RcYiMVk2F/mQD8o
	 Y0TTLhTUrjmOtQhlwinjbBvXnvbl6UAheS86tTEY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5869JVhv1518945
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 6 Sep 2025 04:19:31 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 6
 Sep 2025 04:19:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sat, 6 Sep 2025 04:19:31 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.79])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5869JRgP2028007;
	Sat, 6 Sep 2025 04:19:28 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <13564923607@139.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>, <Baojun.Xu@fpt.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v3] ALSA: hda/tas2781: Fix the order of TAS2781
 calibrated-data
Date: Sat, 6 Sep 2025 17:19:23 +0800
Message-ID: <20250906091923.1760-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: TY7NWKTNVCYJQUDPDFVDKW2GHIJMAGFX
X-Message-ID-Hash: TY7NWKTNVCYJQUDPDFVDKW2GHIJMAGFX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TY7NWKTNVCYJQUDPDFVDKW2GHIJMAGFX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A bug reported by one of my customers that the order of TAS2781
calibrated-data is incorrect, the correct way is to move R0_Low
and insert it between R0 and InvR0.

Fixes: 4fe238513407 ("ALSA: hda/tas2781: Move and unified the calibrated-data getting function for SPI and I2C into the tas2781_hda lib")
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v3:
 - Take Tiwai's advice on cali_cnv() to make it more simpler.
v2:
 - Submit to sound branch maintianed by Tiwai instead of linux-next branch
 - Drop other fix
---
 sound/hda/codecs/side-codecs/tas2781_hda.c | 25 +++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda.c b/sound/hda/codecs/side-codecs/tas2781_hda.c
index f46d2e06c64f..f4a44c6b0234 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda.c
@@ -33,6 +33,23 @@ const efi_guid_t tasdev_fct_efi_guid[] = {
 };
 EXPORT_SYMBOL_NS_GPL(tasdev_fct_efi_guid, "SND_HDA_SCODEC_TAS2781");
 
+/*
+ * The order of calibrated-data writing function is a bit different from the
+ * order in UEFI. Here is the conversion to match the order of calibrated-data
+ * writing function.
+ */
+static void cali_cnv(unsigned char *data, unsigned int base, int offset)
+{
+	struct cali_reg reg_data;
+
+	memcpy(&reg_data, data, sizeof(reg_data));
+	/* the data order has to be swapped between r0_low_reg and inv0_reg */
+	swap(reg_data.r0_low_reg, reg_data.invr0_reg);
+
+	cpu_to_be32_array((__force __be32 *)(data + offset + 1),
+		(u32 *)&reg_data, TASDEV_CALIB_N);
+}
+
 static void tas2781_apply_calib(struct tasdevice_priv *p)
 {
 	struct calidata *cali_data = &p->cali_data;
@@ -103,8 +120,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 
 				data[l] = k;
 				oft++;
-				for (i = 0; i < TASDEV_CALIB_N * 4; i++)
-					data[l + i + 1] = data[4 * oft + i];
+				cali_cnv(data, 4 * oft, l);
 				k++;
 			}
 		}
@@ -130,9 +146,8 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 
 		for (j = p->ndev - 1; j >= 0; j--) {
 			l = j * (cali_data->cali_dat_sz_per_dev + 1);
-			for (i = TASDEV_CALIB_N * 4; i > 0 ; i--)
-				data[l + i] = data[p->index * 5 + i];
-			data[l+i] = j;
+			cali_cnv(data, cali_data->cali_dat_sz_per_dev * j, l);
+			data[l] = j;
 		}
 	}
 
-- 
2.43.0


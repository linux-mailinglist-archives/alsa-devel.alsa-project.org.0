Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E5BC4751F
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 15:47:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0374602A9;
	Mon, 10 Nov 2025 15:47:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0374602A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762786066;
	bh=gbR2TSMQbckrmpa/ceAxtHBUo755C4BIsl+4HfZBDjs=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LMOwQY1Psn2BHCDqgogkOD3LoDtktv6g5Z1WIPH1DUXuD54HXmOl71W8L4CA6XoNV
	 GYASTXQ3IVleZI9FwOYzn3O7jJcuOZuLW3hun2QIMkdIag4MF1ue0MppbdJ0Z2NZj9
	 W4JHUqgtex4q3/UhIeHYj7Wi8kMy2PXMZDDU6R+I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17B7CF89758; Mon, 10 Nov 2025 15:41:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1B03F89753;
	Mon, 10 Nov 2025 15:41:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65C17F804FC; Fri, 26 Sep 2025 06:34:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98153F8011B
	for <alsa-devel@alsa-project.org>; Fri, 26 Sep 2025 06:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98153F8011B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=exU1Zv5i
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58Q4YLKM1603549;
	Thu, 25 Sep 2025 23:34:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758861261;
	bh=a9CuTCH8YiWQ/wckmvFOcN7KFtv7UGLibRXcbhugvWQ=;
	h=From:To:CC:Subject:Date;
	b=exU1Zv5ijqNpbQXYCyYdDdnsIM3mhGs6TWQqcBIFT3Tjxf0hJ9n5rbR4DdSb/u3zV
	 jUFAYrMl6dTprvZc3FN3nFVv2UB56A5wg210UEwMWgQQZts4veReSsdEQ2zrfl1Vxh
	 AQaRhLZEBioDG2nVpBh47D0vpRtfXs7MShrdifFo=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58Q4YLAn4070702
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 25 Sep 2025 23:34:21 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 25
 Sep 2025 23:34:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 25 Sep 2025 23:34:20 -0500
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58Q4Y72M685509;
	Thu, 25 Sep 2025 23:34:11 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>, <tiwai@suse.de>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <shenghao-ding@ti.com>,
        <baojun.xu@ti.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lgirdwood@gmail.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <k-yi@ti.com>, <henry.lo@ti.com>,
        <robinchen@ti.com>, <jesse-ji@ti.com>, <will-wang@ti.com>,
        <jim.shil@goertek.com>, <toastcheng@google.com>,
        <chinkaiting@google.com>
Subject: [PATCH v2 1/2] ASoC: tas2781: Add tas5828 support
Date: Fri, 26 Sep 2025 12:33:38 +0800
Message-ID: <20250926043339.8419-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3MN5W5G2O262DYGGIJQKWUX6UXL6KVQZ
X-Message-ID-Hash: 3MN5W5G2O262DYGGIJQKWUX6UXL6KVQZ
X-Mailman-Approved-At: Mon, 10 Nov 2025 14:39:58 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3MN5W5G2O262DYGGIJQKWUX6UXL6KVQZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

TAS5828 have on-chip DSP without current/voltage feedback.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>

---
v2:
 - Update description for TAS5828
 - Change commit tree to .../tiwai/sound.git.
---
 include/sound/tas2781.h        | 1 +
 sound/soc/codecs/tas2781-i2c.c | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index ddd997ac3..a37b4d67c 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -122,6 +122,7 @@ enum audio_device {
 	TAS2781,
 	TAS5825,
 	TAS5827,
+	TAS5828,
 	TAS_OTHERS,
 };
 
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 1539b7088..f62a71dca 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -110,6 +110,7 @@ static const struct i2c_device_id tasdevice_id[] = {
 	{ "tas2781", TAS2781 },
 	{ "tas5825", TAS5825 },
 	{ "tas5827", TAS5827 },
+	{ "tas5828", TAS5828 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tasdevice_id);
@@ -126,6 +127,7 @@ static const struct of_device_id tasdevice_of_match[] = {
 	{ .compatible = "ti,tas2781" },
 	{ .compatible = "ti,tas5825" },
 	{ .compatible = "ti,tas5827" },
+	{ .compatible = "ti,tas5828" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tasdevice_of_match);
@@ -1665,7 +1667,7 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 	}
 	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
 
-	/* There is no calibration required for TAS5825/TAS5827. */
+	/* There is no calibration required for TAS5825/TAS5827/TAS5828. */
 	if (tas_priv->chip_id < TAS5825) {
 		ret = tasdevice_create_cali_ctrls(tas_priv);
 		if (ret) {
@@ -1722,6 +1724,7 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 		case TAS2781:
 		case TAS5825:
 		case TAS5827:
+		case TAS5828:
 			/* If DSP FW fail, DSP kcontrol won't be created. */
 			tasdevice_dsp_remove(tas_priv);
 		}
@@ -1884,6 +1887,7 @@ static int tasdevice_codec_probe(struct snd_soc_component *codec)
 		break;
 	case TAS5825:
 	case TAS5827:
+	case TAS5828:
 		p = (struct snd_kcontrol_new *)tas5825_snd_controls;
 		size = ARRAY_SIZE(tas5825_snd_controls);
 		break;
@@ -2056,6 +2060,7 @@ static const struct acpi_device_id tasdevice_acpi_match[] = {
 	{ "TXNW2781", TAS2781 },
 	{ "TXNW5825", TAS5825 },
 	{ "TXNW5827", TAS5827 },
+	{ "TXNW5828", TAS5828 },
 	{},
 };
 
-- 
2.25.1


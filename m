Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 058CA91CC10
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jun 2024 12:14:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4568D238D;
	Sat, 29 Jun 2024 12:14:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4568D238D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719656078;
	bh=mVb24fnuRVL8X+zLFAfCADvfEPJ+TVtgExoeRQHI38k=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Z0k6iFq0zHrWMiV4qpmyOAVHZjv3iz5Iip/v3L3Nq0wux+lLnWt1D4NZYVdgtf3iY
	 bs0yGd7WHXSl2lYMxd2ztUUECUFeaVh5akTnGQb3pvOR4aUT5kQH53LBXY1w6nV23U
	 H/ZehSODCTXOqgmTuDrH3wlkNcmp6Of+MMFZv90I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EB9DF805BB; Sat, 29 Jun 2024 12:14:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13C3FF805B0;
	Sat, 29 Jun 2024 12:14:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 696B8F80423; Sat, 29 Jun 2024 12:11:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67C9FF80154
	for <alsa-devel@alsa-project.org>; Sat, 29 Jun 2024 12:11:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67C9FF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=VptIlpJk
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45TABWGL075947;
	Sat, 29 Jun 2024 05:11:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719655892;
	bh=j+35sZloQtOncQRrC2TQVPifEH/ctuOisMlfiAP9d5Q=;
	h=From:To:CC:Subject:Date;
	b=VptIlpJkn+NFmFYIRl2THRZ+eRJptDnn+04i7BymHc5Uu0hPFEJytzNfEiqh+C6r7
	 tszNwSMj/b/T62ElZ6kOa+qoCDvcdVXW/9iyt/qe+BjlMYMPrHXobkhhfPt31QZHsz
	 ZU6JIbxXYhG165Kbu7/GbEkE7Rhz07XK+6wh9DQE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45TABWrU127666
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 29 Jun 2024 05:11:32 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 29
 Jun 2024 05:11:31 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 29 Jun 2024 05:11:31 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.158])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45TABLfH074877;
	Sat, 29 Jun 2024 05:11:22 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <13916275206@139.com>, <zhourui@huaqin.com>,
        <alsa-devel@alsa-project.org>, <i-salazar@ti.com>,
        <linux-kernel@vger.kernel.org>, <j-chadha@ti.com>,
        <liam.r.girdwood@intel.com>, <jaden-yue@ti.com>,
        <yung-chuan.liao@linux.intel.com>, <dipa@ti.com>,
 <yuhsuan@google.com>,
        <henry.lo@ti.com>, <tiwai@suse.de>, <baojun.xu@ti.com>,
 <soyer@irl.hu>,
        <Baojun.Xu@fpt.com>, <judyhsiao@google.com>, <navada@ti.com>,
        <cujomalainey@google.com>, <aanya@ti.com>, <nayeem.mahmud@ti.com>,
        <savyasanchi.shukla@netradyne.com>, <flaviopr@microsoft.com>,
        <jesse-ji@ti.com>, <darren.ye@mediatek.com>,
        Shenghao Ding
	<shenghao-ding@ti.com>
Subject: [PATCH v1] ASoc: tas2781: Add name_prefix as the prefix name of DSP
 firmwares and calibrated data files
Date: Sat, 29 Jun 2024 18:11:10 +0800
Message-ID: <20240629101112.628-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: YOXLAC32LNZ3XY7VS5WVEWWTGNRY7FR5
X-Message-ID-Hash: YOXLAC32LNZ3XY7VS5WVEWWTGNRY7FR5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YOXLAC32LNZ3XY7VS5WVEWWTGNRY7FR5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add name_prefix as the prefix name of DSP firmwares
and calibrated data files which stored speaker
calibrated impedance.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 sound/soc/codecs/tas2781-i2c.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 4d1a0d836e77..cc765d45c6b5 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -394,8 +394,12 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 	 * failing to load DSP firmware is NOT an error.
 	 */
 	tas_priv->fw_state = TASDEVICE_RCA_FW_OK;
-	scnprintf(tas_priv->coef_binaryname, 64, "%s_coef.bin",
-		tas_priv->dev_name);
+	if (tas_priv->name_prefix)
+		scnprintf(tas_priv->rca_binaryname, 64, "%s-%s_coef.bin",
+			tas_priv->name_prefix, tas_priv->dev_name);
+	else
+		scnprintf(tas_priv->coef_binaryname, 64, "%s_coef.bin",
+			tas_priv->dev_name);
 	ret = tasdevice_dsp_parser(tas_priv);
 	if (ret) {
 		dev_err(tas_priv->dev, "dspfw load %s error\n",
@@ -418,8 +422,15 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 	 * calibrated data inside algo.
 	 */
 	for (i = 0; i < tas_priv->ndev; i++) {
-		scnprintf(tas_priv->cal_binaryname[i], 64, "%s_cal_0x%02x.bin",
-			tas_priv->dev_name, tas_priv->tasdevice[i].dev_addr);
+		if (tas_priv->name_prefix)
+			scnprintf(tas_priv->cal_binaryname[i], 64,
+				"%s-%s_cal_0x%02x.bin", tas_priv->name_prefix,
+				tas_priv->dev_name,
+				tas_priv->tasdevice[i].dev_addr);
+		else
+			scnprintf(tas_priv->cal_binaryname[i], 64,
+				"%s_cal_0x%02x.bin", tas_priv->dev_name,
+				tas_priv->tasdevice[i].dev_addr);
 		ret = tas2781_load_calibration(tas_priv,
 			tas_priv->cal_binaryname[i], i);
 		if (ret != 0)
-- 
2.34.1


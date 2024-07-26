Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F042E93CFD3
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2024 10:49:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B211BE72;
	Fri, 26 Jul 2024 10:49:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B211BE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721983778;
	bh=jjMAGvAXsuj8WjN8s6I2unqYPvI7u35OjRVTW2Yi94U=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dnMvaa1e0/6UxyuGdkw0p26B5jy/Q3oavhbp7YGOMfqIATmZpp5oc9vQ7eWKUfd7Q
	 68K6I8JzgwSlAZmz33BM38AzipUDX3fcMgOMCJkJddpxY82jNkjlhJukgrFdSWXLcQ
	 1cgsvsPYu5j+Ip5CUsf72L8v64T4vnVRxqBY9/nQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FE5BF805AA; Fri, 26 Jul 2024 10:49:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 056C5F805B0;
	Fri, 26 Jul 2024 10:49:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0127F801F5; Fri, 26 Jul 2024 10:48:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07B5FF800AE
	for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2024 10:48:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07B5FF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=o014dP2/
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46Q8mCuV064983;
	Fri, 26 Jul 2024 03:48:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721983692;
	bh=GISLvp4dDAKp1Qp+fEZN9Z52V4oYAqvOQjWSnlO04EE=;
	h=From:To:CC:Subject:Date;
	b=o014dP2/e6KNPTS9dvzhI/1dPoxBWUz+FLA1aBRKg2n80sprme5DoolEvcnmDMJjR
	 Cgk3rix5EjDpXcPi2vcuUrbsE2MKTSHuA5G3YS86bigFH0fOfeuX5vejzrLct0uqud
	 gh1B74gCQOE0M8f8YLq6BW+4UwvT2iCmtF9fporY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46Q8mBSj012733
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Jul 2024 03:48:11 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 Jul 2024 03:48:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 Jul 2024 03:48:11 -0500
Received: from LT5CG31242FY.dhcp.ti.com (lt5cg31242fy.dhcp.ti.com
 [10.85.14.174])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46Q8m1G0058830;
	Fri, 26 Jul 2024 03:48:01 -0500
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
        <jesse-ji@ti.com>, <darren.ye@mediatek.com>, <antheas.dk@gmail.com>,
        <Jerry2.Huang@lcfuturecenter.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoc: tas2781: Add Calibration Kcontrols for Chromebook
Date: Fri, 26 Jul 2024 16:47:55 +0800
Message-ID: <20240726084757.369-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: MJ4WZTO75KUQNAXIR2MUKDAQW3IBRVE6
X-Message-ID-Hash: MJ4WZTO75KUQNAXIR2MUKDAQW3IBRVE6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MJ4WZTO75KUQNAXIR2MUKDAQW3IBRVE6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add calibration related kcontrol for speaker impedance calibration and
speaker leakage check for Chromebook

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v1:
 - Add TAS2563 into the Header of tas2781-comlib.c
 - Add channel no into the log for error debug
 - | Reported-by: kernel test robot <lkp@intel.com>
   | Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/202407131659.uSVINfrZ-lkp@intel.com/__;!!G3vK!QyZeGtz-H
 - Create tas2563-tlv.h into include/sound
 - Move tas2563_dvc_table from tas2781-tlv.h to tas2563-tlv.h
 - Add "#include <sound/tas2563-tlv.h>" into tas2781-i2c.c
 - Correct the filename in the header comments of tas2781-comlib.c,
   remove the wrong file name.
 - renamae tasdevice_chn_switch to put it in a single line
 - With inverted check this entire function becomes neater in
   tasdev_chn_switch.
 - With all possible restrictions this can be on a single line besides the fact
   that the second one currently has a broken indentation.
 - remove unnecessary parentheses.
 - linux/* followed by asm/* as the latter is not so generic as the former.
 - leave the trailing comma
 - replace scnprintf with strscpy if necessary.
 - Add registers for TAS2563 and TAS2781 calibration.
 - Add cali_data_restore for regsiter restore after calibration.
 - Add is_user_space_calidata to store the flag where the calibrated
   from, user space or bin file from driver parsing.
 - Add TASDEVICE_RCA_FW_OK to support only register setting bin in the
   device.
 - Add tas2563_dvc_table for relationship between tas2563 digtial gains
   and register values.
 - tasdevice_chn_switch for chip switch among multiple chips(tas2563
   or tas2781)
 - Add loading the calibrated values from user space in
   tasdev_load_calibrated_data
 - Correct no dsp no work, it can still work in bypass mode.
 - Add calibrated register setting for tas2563&tas2781.
 - Add mutex into each kcontrol.
 - Rename tas2781_force_fwload_get, tas2781_force_fwload_put-->
   tasdev_force_fwload_get, tasdev_force_fwload_put
 - Define tas2781_snd_control and tas2563_snd_control for volume
 - Define tas2781_cali_control and tas2563_cali_control for calibration
---
 include/sound/tas2563-tlv.h       | 279 +++++++++
 include/sound/tas2781-tlv.h       | 260 ---------
 include/sound/tas2781.h           |  72 +++
 sound/soc/codecs/tas2781-comlib.c |  32 +-
 sound/soc/codecs/tas2781-fmwlib.c |  39 +-
 sound/soc/codecs/tas2781-i2c.c    | 907 ++++++++++++++++++++++++++++--
 6 files changed, 1267 insertions(+), 322 deletions(-)
 create mode 100644 include/sound/tas2563-tlv.h

diff --git a/include/sound/tas2563-tlv.h b/include/sound/tas2563-tlv.h
new file mode 100644
index 000000000000..2dab81a4c359
--- /dev/null
+++ b/include/sound/tas2563-tlv.h
@@ -0,0 +1,279 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+//
+// ALSA SoC Texas Instruments TAS2563 Audio Smart Amplifier
+//
+// Copyright (C) 2022 - 2024 Texas Instruments Incorporated
+// https://www.ti.com
+//
+// The TAS2563 driver implements a flexible and configurable
+// algo coefficient setting for one, two, or even multiple
+// TAS2563 chips.
+//
+// Author: Shenghao Ding <shenghao-ding@ti.com>
+//
+
+#ifndef __TAS2563_TLV_H__
+#define __TAS2563_TLV_H__
+
+static const DECLARE_TLV_DB_SCALE(tas2563_dvc_tlv, -12150, 50, 1);
+
+/* pow(10, db/20) * pow(2,30) */
+static const unsigned char tas2563_dvc_table[][4] = {
+	{ 0X00, 0X00, 0X00, 0X00 }, /* -121.5db */
+	{ 0X00, 0X00, 0X03, 0XBC }, /* -121.0db */
+	{ 0X00, 0X00, 0X03, 0XF5 }, /* -120.5db */
+	{ 0X00, 0X00, 0X04, 0X31 }, /* -120.0db */
+	{ 0X00, 0X00, 0X04, 0X71 }, /* -119.5db */
+	{ 0X00, 0X00, 0X04, 0XB4 }, /* -119.0db */
+	{ 0X00, 0X00, 0X04, 0XFC }, /* -118.5db */
+	{ 0X00, 0X00, 0X05, 0X47 }, /* -118.0db */
+	{ 0X00, 0X00, 0X05, 0X97 }, /* -117.5db */
+	{ 0X00, 0X00, 0X05, 0XEC }, /* -117.0db */
+	{ 0X00, 0X00, 0X06, 0X46 }, /* -116.5db */
+	{ 0X00, 0X00, 0X06, 0XA5 }, /* -116.0db */
+	{ 0X00, 0X00, 0X07, 0X0A }, /* -115.5db */
+	{ 0X00, 0X00, 0X07, 0X75 }, /* -115.0db */
+	{ 0X00, 0X00, 0X07, 0XE6 }, /* -114.5db */
+	{ 0X00, 0X00, 0X08, 0X5E }, /* -114.0db */
+	{ 0X00, 0X00, 0X08, 0XDD }, /* -113.5db */
+	{ 0X00, 0X00, 0X09, 0X63 }, /* -113.0db */
+	{ 0X00, 0X00, 0X09, 0XF2 }, /* -112.5db */
+	{ 0X00, 0X00, 0X0A, 0X89 }, /* -112.0db */
+	{ 0X00, 0X00, 0X0B, 0X28 }, /* -111.5db */
+	{ 0X00, 0X00, 0X0B, 0XD2 }, /* -111.0db */
+	{ 0X00, 0X00, 0X0C, 0X85 }, /* -110.5db */
+	{ 0X00, 0X00, 0X0D, 0X43 }, /* -110.0db */
+	{ 0X00, 0X00, 0X0E, 0X0C }, /* -109.5db */
+	{ 0X00, 0X00, 0X0E, 0XE1 }, /* -109.0db */
+	{ 0X00, 0X00, 0X0F, 0XC3 }, /* -108.5db */
+	{ 0X00, 0X00, 0X10, 0XB2 }, /* -108.0db */
+	{ 0X00, 0X00, 0X11, 0XAF }, /* -107.5db */
+	{ 0X00, 0X00, 0X12, 0XBC }, /* -107.0db */
+	{ 0X00, 0X00, 0X13, 0XD8 }, /* -106.5db */
+	{ 0X00, 0X00, 0X15, 0X05 }, /* -106.0db */
+	{ 0X00, 0X00, 0X16, 0X44 }, /* -105.5db */
+	{ 0X00, 0X00, 0X17, 0X96 }, /* -105.0db */
+	{ 0X00, 0X00, 0X18, 0XFB }, /* -104.5db */
+	{ 0X00, 0X00, 0X1A, 0X76 }, /* -104.0db */
+	{ 0X00, 0X00, 0X1C, 0X08 }, /* -103.5db */
+	{ 0X00, 0X00, 0X1D, 0XB1 }, /* -103.0db */
+	{ 0X00, 0X00, 0X1F, 0X73 }, /* -102.5db */
+	{ 0X00, 0X00, 0X21, 0X51 }, /* -102.0db */
+	{ 0X00, 0X00, 0X23, 0X4A }, /* -101.5db */
+	{ 0X00, 0X00, 0X25, 0X61 }, /* -101.0db */
+	{ 0X00, 0X00, 0X27, 0X98 }, /* -100.5db */
+	{ 0X00, 0X00, 0X29, 0XF1 }, /* -100.0db */
+	{ 0X00, 0X00, 0X2C, 0X6D }, /* -99.5db */
+	{ 0X00, 0X00, 0X2F, 0X0F }, /* -99.0db */
+	{ 0X00, 0X00, 0X31, 0XD9 }, /* -98.5db */
+	{ 0X00, 0X00, 0X34, 0XCD }, /* -98.0db */
+	{ 0X00, 0X00, 0X37, 0XEE }, /* -97.5db */
+	{ 0X00, 0X00, 0X3B, 0X3F }, /* -97.0db */
+	{ 0X00, 0X00, 0X3E, 0XC1 }, /* -96.5db */
+	{ 0X00, 0X00, 0X42, 0X79 }, /* -96.0db */
+	{ 0X00, 0X00, 0X46, 0X6A }, /* -95.5db */
+	{ 0X00, 0X00, 0X4A, 0X96 }, /* -95.0db */
+	{ 0X00, 0X00, 0X4F, 0X01 }, /* -94.5db */
+	{ 0X00, 0X00, 0X53, 0XAF }, /* -94.0db */
+	{ 0X00, 0X00, 0X58, 0XA5 }, /* -93.5db */
+	{ 0X00, 0X00, 0X5D, 0XE6 }, /* -93.0db */
+	{ 0X00, 0X00, 0X63, 0X76 }, /* -92.5db */
+	{ 0X00, 0X00, 0X69, 0X5B }, /* -92.0db */
+	{ 0X00, 0X00, 0X6F, 0X99 }, /* -91.5db */
+	{ 0X00, 0X00, 0X76, 0X36 }, /* -91.0db */
+	{ 0X00, 0X00, 0X7D, 0X37 }, /* -90.5db */
+	{ 0X00, 0X00, 0X84, 0XA2 }, /* -90.0db */
+	{ 0X00, 0X00, 0X8C, 0X7E }, /* -89.5db */
+	{ 0X00, 0X00, 0X94, 0XD1 }, /* -89.0db */
+	{ 0X00, 0X00, 0X9D, 0XA3 }, /* -88.5db */
+	{ 0X00, 0X00, 0XA6, 0XFA }, /* -88.0db */
+	{ 0X00, 0X00, 0XB0, 0XDF }, /* -87.5db */
+	{ 0X00, 0X00, 0XBB, 0X5A }, /* -87.0db */
+	{ 0X00, 0X00, 0XC6, 0X74 }, /* -86.5db */
+	{ 0X00, 0X00, 0XD2, 0X36 }, /* -86.0db */
+	{ 0X00, 0X00, 0XDE, 0XAB }, /* -85.5db */
+	{ 0X00, 0X00, 0XEB, 0XDC }, /* -85.0db */
+	{ 0X00, 0X00, 0XF9, 0XD6 }, /* -84.5db */
+	{ 0X00, 0X01, 0X08, 0XA4 }, /* -84.0db */
+	{ 0X00, 0X01, 0X18, 0X52 }, /* -83.5db */
+	{ 0X00, 0X01, 0X28, 0XEF }, /* -83.0db */
+	{ 0X00, 0X01, 0X3A, 0X87 }, /* -82.5db */
+	{ 0X00, 0X01, 0X4D, 0X2A }, /* -82.0db */
+	{ 0X00, 0X01, 0X60, 0XE8 }, /* -81.5db */
+	{ 0X00, 0X01, 0X75, 0XD1 }, /* -81.0db */
+	{ 0X00, 0X01, 0X8B, 0XF7 }, /* -80.5db */
+	{ 0X00, 0X01, 0XA3, 0X6E }, /* -80.0db */
+	{ 0X00, 0X01, 0XBC, 0X48 }, /* -79.5db */
+	{ 0X00, 0X01, 0XD6, 0X9B }, /* -79.0db */
+	{ 0X00, 0X01, 0XF2, 0X7E }, /* -78.5db */
+	{ 0X00, 0X02, 0X10, 0X08 }, /* -78.0db */
+	{ 0X00, 0X02, 0X2F, 0X51 }, /* -77.5db */
+	{ 0X00, 0X02, 0X50, 0X76 }, /* -77.0db */
+	{ 0X00, 0X02, 0X73, 0X91 }, /* -76.5db */
+	{ 0X00, 0X02, 0X98, 0XC0 }, /* -76.0db */
+	{ 0X00, 0X02, 0XC0, 0X24 }, /* -75.5db */
+	{ 0X00, 0X02, 0XE9, 0XDD }, /* -75.0db */
+	{ 0X00, 0X03, 0X16, 0X0F }, /* -74.5db */
+	{ 0X00, 0X03, 0X44, 0XDF }, /* -74.0db */
+	{ 0X00, 0X03, 0X76, 0X76 }, /* -73.5db */
+	{ 0X00, 0X03, 0XAA, 0XFC }, /* -73.0db */
+	{ 0X00, 0X03, 0XE2, 0XA0 }, /* -72.5db */
+	{ 0X00, 0X04, 0X1D, 0X8F }, /* -72.0db */
+	{ 0X00, 0X04, 0X5B, 0XFD }, /* -71.5db */
+	{ 0X00, 0X04, 0X9E, 0X1D }, /* -71.0db */
+	{ 0X00, 0X04, 0XE4, 0X29 }, /* -70.5db */
+	{ 0X00, 0X05, 0X2E, 0X5A }, /* -70.0db */
+	{ 0X00, 0X05, 0X7C, 0XF2 }, /* -69.5db */
+	{ 0X00, 0X05, 0XD0, 0X31 }, /* -69.0db */
+	{ 0X00, 0X06, 0X28, 0X60 }, /* -68.5db */
+	{ 0X00, 0X06, 0X85, 0XC8 }, /* -68.0db */
+	{ 0X00, 0X06, 0XE8, 0XB9 }, /* -67.5db */
+	{ 0X00, 0X07, 0X51, 0X86 }, /* -67.0db */
+	{ 0X00, 0X07, 0XC0, 0X8A }, /* -66.5db */
+	{ 0X00, 0X08, 0X36, 0X21 }, /* -66.0db */
+	{ 0X00, 0X08, 0XB2, 0XB0 }, /* -65.5db */
+	{ 0X00, 0X09, 0X36, 0XA1 }, /* -65.0db */
+	{ 0X00, 0X09, 0XC2, 0X63 }, /* -64.5db */
+	{ 0X00, 0X0A, 0X56, 0X6D }, /* -64.0db */
+	{ 0X00, 0X0A, 0XF3, 0X3C }, /* -63.5db */
+	{ 0X00, 0X0B, 0X99, 0X56 }, /* -63.0db */
+	{ 0X00, 0X0C, 0X49, 0X48 }, /* -62.5db */
+	{ 0X00, 0X0D, 0X03, 0XA7 }, /* -62.0db */
+	{ 0X00, 0X0D, 0XC9, 0X11 }, /* -61.5db */
+	{ 0X00, 0X0E, 0X9A, 0X2D }, /* -61.0db */
+	{ 0X00, 0X0F, 0X77, 0XAD }, /* -60.5db */
+	{ 0X00, 0X10, 0X62, 0X4D }, /* -60.0db */
+	{ 0X00, 0X11, 0X5A, 0XD5 }, /* -59.5db */
+	{ 0X00, 0X12, 0X62, 0X16 }, /* -59.0db */
+	{ 0X00, 0X13, 0X78, 0XF0 }, /* -58.5db */
+	{ 0X00, 0X14, 0XA0, 0X50 }, /* -58.0db */
+	{ 0X00, 0X15, 0XD9, 0X31 }, /* -57.5db */
+	{ 0X00, 0X17, 0X24, 0X9C }, /* -57.0db */
+	{ 0X00, 0X18, 0X83, 0XAA }, /* -56.5db */
+	{ 0X00, 0X19, 0XF7, 0X86 }, /* -56.0db */
+	{ 0X00, 0X1B, 0X81, 0X6A }, /* -55.5db */
+	{ 0X00, 0X1D, 0X22, 0XA4 }, /* -55.0db */
+	{ 0X00, 0X1E, 0XDC, 0X98 }, /* -54.5db */
+	{ 0X00, 0X20, 0XB0, 0XBC }, /* -54.0db */
+	{ 0X00, 0X22, 0XA0, 0X9D }, /* -53.5db */
+	{ 0X00, 0X24, 0XAD, 0XE0 }, /* -53.0db */
+	{ 0X00, 0X26, 0XDA, 0X43 }, /* -52.5db */
+	{ 0X00, 0X29, 0X27, 0X9D }, /* -52.0db */
+	{ 0X00, 0X2B, 0X97, 0XE3 }, /* -51.5db */
+	{ 0X00, 0X2E, 0X2D, 0X27 }, /* -51.0db */
+	{ 0X00, 0X30, 0XE9, 0X9A }, /* -50.5db */
+	{ 0X00, 0X33, 0XCF, 0X8D }, /* -50.0db */
+	{ 0X00, 0X36, 0XE1, 0X78 }, /* -49.5db */
+	{ 0X00, 0X3A, 0X21, 0XF3 }, /* -49.0db */
+	{ 0X00, 0X3D, 0X93, 0XC3 }, /* -48.5db */
+	{ 0X00, 0X41, 0X39, 0XD3 }, /* -48.0db */
+	{ 0X00, 0X45, 0X17, 0X3B }, /* -47.5db */
+	{ 0X00, 0X49, 0X2F, 0X44 }, /* -47.0db */
+	{ 0X00, 0X4D, 0X85, 0X66 }, /* -46.5db */
+	{ 0X00, 0X52, 0X1D, 0X50 }, /* -46.0db */
+	{ 0X00, 0X56, 0XFA, 0XE8 }, /* -45.5db */
+	{ 0X00, 0X5C, 0X22, 0X4E }, /* -45.0db */
+	{ 0X00, 0X61, 0X97, 0XE1 }, /* -44.5db */
+	{ 0X00, 0X67, 0X60, 0X44 }, /* -44.0db */
+	{ 0X00, 0X6D, 0X80, 0X60 }, /* -43.5db */
+	{ 0X00, 0X73, 0XFD, 0X65 }, /* -43.0db */
+	{ 0X00, 0X7A, 0XDC, 0XD7 }, /* -42.5db */
+	{ 0X00, 0X82, 0X24, 0X8A }, /* -42.0db */
+	{ 0X00, 0X89, 0XDA, 0XAB }, /* -41.5db */
+	{ 0X00, 0X92, 0X05, 0XC6 }, /* -41.0db */
+	{ 0X00, 0X9A, 0XAC, 0XC8 }, /* -40.5db */
+	{ 0X00, 0XA3, 0XD7, 0X0A }, /* -40.0db */
+	{ 0X00, 0XAD, 0X8C, 0X52 }, /* -39.5db */
+	{ 0X00, 0XB7, 0XD4, 0XDD }, /* -39.0db */
+	{ 0X00, 0XC2, 0XB9, 0X65 }, /* -38.5db */
+	{ 0X00, 0XCE, 0X43, 0X28 }, /* -38.0db */
+	{ 0X00, 0XDA, 0X7B, 0XF1 }, /* -37.5db */
+	{ 0X00, 0XE7, 0X6E, 0X1E }, /* -37.0db */
+	{ 0X00, 0XF5, 0X24, 0XAC }, /* -36.5db */
+	{ 0X01, 0X03, 0XAB, 0X3D }, /* -36.0db */
+	{ 0X01, 0X13, 0X0E, 0X24 }, /* -35.5db */
+	{ 0X01, 0X23, 0X5A, 0X71 }, /* -35.0db */
+	{ 0X01, 0X34, 0X9D, 0XF8 }, /* -34.5db */
+	{ 0X01, 0X46, 0XE7, 0X5D }, /* -34.0db */
+	{ 0X01, 0X5A, 0X46, 0X27 }, /* -33.5db */
+	{ 0X01, 0X6E, 0XCA, 0XC5 }, /* -33.0db */
+	{ 0X01, 0X84, 0X86, 0X9F }, /* -32.5db */
+	{ 0X01, 0X9B, 0X8C, 0X27 }, /* -32.0db */
+	{ 0X01, 0XB3, 0XEE, 0XE5 }, /* -31.5db */
+	{ 0X01, 0XCD, 0XC3, 0X8C }, /* -31.0db */
+	{ 0X01, 0XE9, 0X20, 0X05 }, /* -30.5db */
+	{ 0X02, 0X06, 0X1B, 0X89 }, /* -30.0db */
+	{ 0X02, 0X24, 0XCE, 0XB0 }, /* -29.5db */
+	{ 0X02, 0X45, 0X53, 0X85 }, /* -29.0db */
+	{ 0X02, 0X67, 0XC5, 0XA2 }, /* -28.5db */
+	{ 0X02, 0X8C, 0X42, 0X3F }, /* -28.0db */
+	{ 0X02, 0XB2, 0XE8, 0X55 }, /* -27.5db */
+	{ 0X02, 0XDB, 0XD8, 0XAD }, /* -27.0db */
+	{ 0X03, 0X07, 0X36, 0X05 }, /* -26.5db */
+	{ 0X03, 0X35, 0X25, 0X29 }, /* -26.0db */
+	{ 0X03, 0X65, 0XCD, 0X13 }, /* -25.5db */
+	{ 0X03, 0X99, 0X57, 0X0C }, /* -25.0db */
+	{ 0X03, 0XCF, 0XEE, 0XCF }, /* -24.5db */
+	{ 0X04, 0X09, 0XC2, 0XB0 }, /* -24.0db */
+	{ 0X04, 0X47, 0X03, 0XC1 }, /* -23.5db */
+	{ 0X04, 0X87, 0XE5, 0XFB }, /* -23.0db */
+	{ 0X04, 0XCC, 0XA0, 0X6D }, /* -22.5db */
+	{ 0X05, 0X15, 0X6D, 0X68 }, /* -22.0db */
+	{ 0X05, 0X62, 0X8A, 0XB3 }, /* -21.5db */
+	{ 0X05, 0XB4, 0X39, 0XBC }, /* -21.0db */
+	{ 0X06, 0X0A, 0XBF, 0XD4 }, /* -20.5db */
+	{ 0X06, 0X66, 0X66, 0X66 }, /* -20.0db */
+	{ 0X06, 0XC7, 0X7B, 0X36 }, /* -19.5db */
+	{ 0X07, 0X2E, 0X50, 0XA6 }, /* -19.0db */
+	{ 0X07, 0X9B, 0X3D, 0XF6 }, /* -18.5db */
+	{ 0X08, 0X0E, 0X9F, 0X96 }, /* -18.0db */
+	{ 0X08, 0X88, 0XD7, 0X6D }, /* -17.5db */
+	{ 0X09, 0X0A, 0X4D, 0X2F }, /* -17.0db */
+	{ 0X09, 0X93, 0X6E, 0XB8 }, /* -16.5db */
+	{ 0X0A, 0X24, 0XB0, 0X62 }, /* -16.0db */
+	{ 0X0A, 0XBE, 0X8D, 0X70 }, /* -15.5db */
+	{ 0X0B, 0X61, 0X88, 0X71 }, /* -15.0db */
+	{ 0X0C, 0X0E, 0X2B, 0XB0 }, /* -14.5db */
+	{ 0X0C, 0XC5, 0X09, 0XAB }, /* -14.0db */
+	{ 0X0D, 0X86, 0XBD, 0X8D }, /* -13.5db */
+	{ 0X0E, 0X53, 0XEB, 0XB3 }, /* -13.0db */
+	{ 0X0F, 0X2D, 0X42, 0X38 }, /* -12.5db */
+	{ 0X10, 0X13, 0X79, 0X87 }, /* -12.0db */
+	{ 0X11, 0X07, 0X54, 0XF9 }, /* -11.5db */
+	{ 0X12, 0X09, 0XA3, 0X7A }, /* -11.0db */
+	{ 0X13, 0X1B, 0X40, 0X39 }, /* -10.5db */
+	{ 0X14, 0X3D, 0X13, 0X62 }, /* -10.0db */
+	{ 0X15, 0X70, 0X12, 0XE1 }, /* -9.5db */
+	{ 0X16, 0XB5, 0X43, 0X37 }, /* -9.0db */
+	{ 0X18, 0X0D, 0XB8, 0X54 }, /* -8.5db */
+	{ 0X19, 0X7A, 0X96, 0X7F }, /* -8.0db */
+	{ 0X1A, 0XFD, 0X13, 0X54 }, /* -7.5db */
+	{ 0X1C, 0X96, 0X76, 0XC6 }, /* -7.0db */
+	{ 0X1E, 0X48, 0X1C, 0X37 }, /* -6.5db */
+	{ 0X20, 0X13, 0X73, 0X9E }, /* -6.0db */
+	{ 0X21, 0XFA, 0X02, 0XBF }, /* -5.5db */
+	{ 0X23, 0XFD, 0X66, 0X78 }, /* -5.0db */
+	{ 0X26, 0X1F, 0X54, 0X1C }, /* -4.5db */
+	{ 0X28, 0X61, 0X9A, 0XE9 }, /* -4.0db */
+	{ 0X2A, 0XC6, 0X25, 0X91 }, /* -3.5db */
+	{ 0X2D, 0X4E, 0XFB, 0XD5 }, /* -3.0db */
+	{ 0X2F, 0XFE, 0X44, 0X48 }, /* -2.5db */
+	{ 0X32, 0XD6, 0X46, 0X17 }, /* -2.0db */
+	{ 0X35, 0XD9, 0X6B, 0X02 }, /* -1.5db */
+	{ 0X39, 0X0A, 0X41, 0X5F }, /* -1.0db */
+	{ 0X3C, 0X6B, 0X7E, 0X4F }, /* -0.5db */
+	{ 0X40, 0X00, 0X00, 0X00 }, /* 0.0db */
+	{ 0X43, 0XCA, 0XD0, 0X22 }, /* 0.5db */
+	{ 0X47, 0XCF, 0X26, 0X7D }, /* 1.0db */
+	{ 0X4C, 0X10, 0X6B, 0XA5 }, /* 1.5db */
+	{ 0X50, 0X92, 0X3B, 0XE3 }, /* 2.0db */
+	{ 0X55, 0X58, 0X6A, 0X46 }, /* 2.5db */
+	{ 0X5A, 0X67, 0X03, 0XDF }, /* 3.0db */
+	{ 0X5F, 0XC2, 0X53, 0X32 }, /* 3.5db */
+	{ 0X65, 0X6E, 0XE3, 0XDB }, /* 4.0db */
+	{ 0X6B, 0X71, 0X86, 0X68 }, /* 4.5db */
+	{ 0X71, 0XCF, 0X54, 0X71 }, /* 5.0db */
+	{ 0X78, 0X8D, 0XB4, 0XE9 }, /* 5.5db */
+	{ 0X7F, 0XFF, 0XFF, 0XFF }, /* 6.0db */
+};
+#endif
diff --git a/include/sound/tas2781-tlv.h b/include/sound/tas2781-tlv.h
index 99c41bfc7827..5b003843752b 100644
--- a/include/sound/tas2781-tlv.h
+++ b/include/sound/tas2781-tlv.h
@@ -17,265 +17,5 @@
 
 static const __maybe_unused DECLARE_TLV_DB_SCALE(dvc_tlv, -10000, 100, 0);
 static const DECLARE_TLV_DB_SCALE(amp_vol_tlv, 1100, 50, 0);
-static const DECLARE_TLV_DB_SCALE(tas2563_dvc_tlv, -12150, 50, 1);
 
-/* pow(10, db/20) * pow(2,30) */
-static const unsigned char tas2563_dvc_table[][4] = {
-	{ 0X00, 0X00, 0X00, 0X00 }, /* -121.5db */
-	{ 0X00, 0X00, 0X03, 0XBC }, /* -121.0db */
-	{ 0X00, 0X00, 0X03, 0XF5 }, /* -120.5db */
-	{ 0X00, 0X00, 0X04, 0X31 }, /* -120.0db */
-	{ 0X00, 0X00, 0X04, 0X71 }, /* -119.5db */
-	{ 0X00, 0X00, 0X04, 0XB4 }, /* -119.0db */
-	{ 0X00, 0X00, 0X04, 0XFC }, /* -118.5db */
-	{ 0X00, 0X00, 0X05, 0X47 }, /* -118.0db */
-	{ 0X00, 0X00, 0X05, 0X97 }, /* -117.5db */
-	{ 0X00, 0X00, 0X05, 0XEC }, /* -117.0db */
-	{ 0X00, 0X00, 0X06, 0X46 }, /* -116.5db */
-	{ 0X00, 0X00, 0X06, 0XA5 }, /* -116.0db */
-	{ 0X00, 0X00, 0X07, 0X0A }, /* -115.5db */
-	{ 0X00, 0X00, 0X07, 0X75 }, /* -115.0db */
-	{ 0X00, 0X00, 0X07, 0XE6 }, /* -114.5db */
-	{ 0X00, 0X00, 0X08, 0X5E }, /* -114.0db */
-	{ 0X00, 0X00, 0X08, 0XDD }, /* -113.5db */
-	{ 0X00, 0X00, 0X09, 0X63 }, /* -113.0db */
-	{ 0X00, 0X00, 0X09, 0XF2 }, /* -112.5db */
-	{ 0X00, 0X00, 0X0A, 0X89 }, /* -112.0db */
-	{ 0X00, 0X00, 0X0B, 0X28 }, /* -111.5db */
-	{ 0X00, 0X00, 0X0B, 0XD2 }, /* -111.0db */
-	{ 0X00, 0X00, 0X0C, 0X85 }, /* -110.5db */
-	{ 0X00, 0X00, 0X0D, 0X43 }, /* -110.0db */
-	{ 0X00, 0X00, 0X0E, 0X0C }, /* -109.5db */
-	{ 0X00, 0X00, 0X0E, 0XE1 }, /* -109.0db */
-	{ 0X00, 0X00, 0X0F, 0XC3 }, /* -108.5db */
-	{ 0X00, 0X00, 0X10, 0XB2 }, /* -108.0db */
-	{ 0X00, 0X00, 0X11, 0XAF }, /* -107.5db */
-	{ 0X00, 0X00, 0X12, 0XBC }, /* -107.0db */
-	{ 0X00, 0X00, 0X13, 0XD8 }, /* -106.5db */
-	{ 0X00, 0X00, 0X15, 0X05 }, /* -106.0db */
-	{ 0X00, 0X00, 0X16, 0X44 }, /* -105.5db */
-	{ 0X00, 0X00, 0X17, 0X96 }, /* -105.0db */
-	{ 0X00, 0X00, 0X18, 0XFB }, /* -104.5db */
-	{ 0X00, 0X00, 0X1A, 0X76 }, /* -104.0db */
-	{ 0X00, 0X00, 0X1C, 0X08 }, /* -103.5db */
-	{ 0X00, 0X00, 0X1D, 0XB1 }, /* -103.0db */
-	{ 0X00, 0X00, 0X1F, 0X73 }, /* -102.5db */
-	{ 0X00, 0X00, 0X21, 0X51 }, /* -102.0db */
-	{ 0X00, 0X00, 0X23, 0X4A }, /* -101.5db */
-	{ 0X00, 0X00, 0X25, 0X61 }, /* -101.0db */
-	{ 0X00, 0X00, 0X27, 0X98 }, /* -100.5db */
-	{ 0X00, 0X00, 0X29, 0XF1 }, /* -100.0db */
-	{ 0X00, 0X00, 0X2C, 0X6D }, /* -99.5db */
-	{ 0X00, 0X00, 0X2F, 0X0F }, /* -99.0db */
-	{ 0X00, 0X00, 0X31, 0XD9 }, /* -98.5db */
-	{ 0X00, 0X00, 0X34, 0XCD }, /* -98.0db */
-	{ 0X00, 0X00, 0X37, 0XEE }, /* -97.5db */
-	{ 0X00, 0X00, 0X3B, 0X3F }, /* -97.0db */
-	{ 0X00, 0X00, 0X3E, 0XC1 }, /* -96.5db */
-	{ 0X00, 0X00, 0X42, 0X79 }, /* -96.0db */
-	{ 0X00, 0X00, 0X46, 0X6A }, /* -95.5db */
-	{ 0X00, 0X00, 0X4A, 0X96 }, /* -95.0db */
-	{ 0X00, 0X00, 0X4F, 0X01 }, /* -94.5db */
-	{ 0X00, 0X00, 0X53, 0XAF }, /* -94.0db */
-	{ 0X00, 0X00, 0X58, 0XA5 }, /* -93.5db */
-	{ 0X00, 0X00, 0X5D, 0XE6 }, /* -93.0db */
-	{ 0X00, 0X00, 0X63, 0X76 }, /* -92.5db */
-	{ 0X00, 0X00, 0X69, 0X5B }, /* -92.0db */
-	{ 0X00, 0X00, 0X6F, 0X99 }, /* -91.5db */
-	{ 0X00, 0X00, 0X76, 0X36 }, /* -91.0db */
-	{ 0X00, 0X00, 0X7D, 0X37 }, /* -90.5db */
-	{ 0X00, 0X00, 0X84, 0XA2 }, /* -90.0db */
-	{ 0X00, 0X00, 0X8C, 0X7E }, /* -89.5db */
-	{ 0X00, 0X00, 0X94, 0XD1 }, /* -89.0db */
-	{ 0X00, 0X00, 0X9D, 0XA3 }, /* -88.5db */
-	{ 0X00, 0X00, 0XA6, 0XFA }, /* -88.0db */
-	{ 0X00, 0X00, 0XB0, 0XDF }, /* -87.5db */
-	{ 0X00, 0X00, 0XBB, 0X5A }, /* -87.0db */
-	{ 0X00, 0X00, 0XC6, 0X74 }, /* -86.5db */
-	{ 0X00, 0X00, 0XD2, 0X36 }, /* -86.0db */
-	{ 0X00, 0X00, 0XDE, 0XAB }, /* -85.5db */
-	{ 0X00, 0X00, 0XEB, 0XDC }, /* -85.0db */
-	{ 0X00, 0X00, 0XF9, 0XD6 }, /* -84.5db */
-	{ 0X00, 0X01, 0X08, 0XA4 }, /* -84.0db */
-	{ 0X00, 0X01, 0X18, 0X52 }, /* -83.5db */
-	{ 0X00, 0X01, 0X28, 0XEF }, /* -83.0db */
-	{ 0X00, 0X01, 0X3A, 0X87 }, /* -82.5db */
-	{ 0X00, 0X01, 0X4D, 0X2A }, /* -82.0db */
-	{ 0X00, 0X01, 0X60, 0XE8 }, /* -81.5db */
-	{ 0X00, 0X01, 0X75, 0XD1 }, /* -81.0db */
-	{ 0X00, 0X01, 0X8B, 0XF7 }, /* -80.5db */
-	{ 0X00, 0X01, 0XA3, 0X6E }, /* -80.0db */
-	{ 0X00, 0X01, 0XBC, 0X48 }, /* -79.5db */
-	{ 0X00, 0X01, 0XD6, 0X9B }, /* -79.0db */
-	{ 0X00, 0X01, 0XF2, 0X7E }, /* -78.5db */
-	{ 0X00, 0X02, 0X10, 0X08 }, /* -78.0db */
-	{ 0X00, 0X02, 0X2F, 0X51 }, /* -77.5db */
-	{ 0X00, 0X02, 0X50, 0X76 }, /* -77.0db */
-	{ 0X00, 0X02, 0X73, 0X91 }, /* -76.5db */
-	{ 0X00, 0X02, 0X98, 0XC0 }, /* -76.0db */
-	{ 0X00, 0X02, 0XC0, 0X24 }, /* -75.5db */
-	{ 0X00, 0X02, 0XE9, 0XDD }, /* -75.0db */
-	{ 0X00, 0X03, 0X16, 0X0F }, /* -74.5db */
-	{ 0X00, 0X03, 0X44, 0XDF }, /* -74.0db */
-	{ 0X00, 0X03, 0X76, 0X76 }, /* -73.5db */
-	{ 0X00, 0X03, 0XAA, 0XFC }, /* -73.0db */
-	{ 0X00, 0X03, 0XE2, 0XA0 }, /* -72.5db */
-	{ 0X00, 0X04, 0X1D, 0X8F }, /* -72.0db */
-	{ 0X00, 0X04, 0X5B, 0XFD }, /* -71.5db */
-	{ 0X00, 0X04, 0X9E, 0X1D }, /* -71.0db */
-	{ 0X00, 0X04, 0XE4, 0X29 }, /* -70.5db */
-	{ 0X00, 0X05, 0X2E, 0X5A }, /* -70.0db */
-	{ 0X00, 0X05, 0X7C, 0XF2 }, /* -69.5db */
-	{ 0X00, 0X05, 0XD0, 0X31 }, /* -69.0db */
-	{ 0X00, 0X06, 0X28, 0X60 }, /* -68.5db */
-	{ 0X00, 0X06, 0X85, 0XC8 }, /* -68.0db */
-	{ 0X00, 0X06, 0XE8, 0XB9 }, /* -67.5db */
-	{ 0X00, 0X07, 0X51, 0X86 }, /* -67.0db */
-	{ 0X00, 0X07, 0XC0, 0X8A }, /* -66.5db */
-	{ 0X00, 0X08, 0X36, 0X21 }, /* -66.0db */
-	{ 0X00, 0X08, 0XB2, 0XB0 }, /* -65.5db */
-	{ 0X00, 0X09, 0X36, 0XA1 }, /* -65.0db */
-	{ 0X00, 0X09, 0XC2, 0X63 }, /* -64.5db */
-	{ 0X00, 0X0A, 0X56, 0X6D }, /* -64.0db */
-	{ 0X00, 0X0A, 0XF3, 0X3C }, /* -63.5db */
-	{ 0X00, 0X0B, 0X99, 0X56 }, /* -63.0db */
-	{ 0X00, 0X0C, 0X49, 0X48 }, /* -62.5db */
-	{ 0X00, 0X0D, 0X03, 0XA7 }, /* -62.0db */
-	{ 0X00, 0X0D, 0XC9, 0X11 }, /* -61.5db */
-	{ 0X00, 0X0E, 0X9A, 0X2D }, /* -61.0db */
-	{ 0X00, 0X0F, 0X77, 0XAD }, /* -60.5db */
-	{ 0X00, 0X10, 0X62, 0X4D }, /* -60.0db */
-	{ 0X00, 0X11, 0X5A, 0XD5 }, /* -59.5db */
-	{ 0X00, 0X12, 0X62, 0X16 }, /* -59.0db */
-	{ 0X00, 0X13, 0X78, 0XF0 }, /* -58.5db */
-	{ 0X00, 0X14, 0XA0, 0X50 }, /* -58.0db */
-	{ 0X00, 0X15, 0XD9, 0X31 }, /* -57.5db */
-	{ 0X00, 0X17, 0X24, 0X9C }, /* -57.0db */
-	{ 0X00, 0X18, 0X83, 0XAA }, /* -56.5db */
-	{ 0X00, 0X19, 0XF7, 0X86 }, /* -56.0db */
-	{ 0X00, 0X1B, 0X81, 0X6A }, /* -55.5db */
-	{ 0X00, 0X1D, 0X22, 0XA4 }, /* -55.0db */
-	{ 0X00, 0X1E, 0XDC, 0X98 }, /* -54.5db */
-	{ 0X00, 0X20, 0XB0, 0XBC }, /* -54.0db */
-	{ 0X00, 0X22, 0XA0, 0X9D }, /* -53.5db */
-	{ 0X00, 0X24, 0XAD, 0XE0 }, /* -53.0db */
-	{ 0X00, 0X26, 0XDA, 0X43 }, /* -52.5db */
-	{ 0X00, 0X29, 0X27, 0X9D }, /* -52.0db */
-	{ 0X00, 0X2B, 0X97, 0XE3 }, /* -51.5db */
-	{ 0X00, 0X2E, 0X2D, 0X27 }, /* -51.0db */
-	{ 0X00, 0X30, 0XE9, 0X9A }, /* -50.5db */
-	{ 0X00, 0X33, 0XCF, 0X8D }, /* -50.0db */
-	{ 0X00, 0X36, 0XE1, 0X78 }, /* -49.5db */
-	{ 0X00, 0X3A, 0X21, 0XF3 }, /* -49.0db */
-	{ 0X00, 0X3D, 0X93, 0XC3 }, /* -48.5db */
-	{ 0X00, 0X41, 0X39, 0XD3 }, /* -48.0db */
-	{ 0X00, 0X45, 0X17, 0X3B }, /* -47.5db */
-	{ 0X00, 0X49, 0X2F, 0X44 }, /* -47.0db */
-	{ 0X00, 0X4D, 0X85, 0X66 }, /* -46.5db */
-	{ 0X00, 0X52, 0X1D, 0X50 }, /* -46.0db */
-	{ 0X00, 0X56, 0XFA, 0XE8 }, /* -45.5db */
-	{ 0X00, 0X5C, 0X22, 0X4E }, /* -45.0db */
-	{ 0X00, 0X61, 0X97, 0XE1 }, /* -44.5db */
-	{ 0X00, 0X67, 0X60, 0X44 }, /* -44.0db */
-	{ 0X00, 0X6D, 0X80, 0X60 }, /* -43.5db */
-	{ 0X00, 0X73, 0XFD, 0X65 }, /* -43.0db */
-	{ 0X00, 0X7A, 0XDC, 0XD7 }, /* -42.5db */
-	{ 0X00, 0X82, 0X24, 0X8A }, /* -42.0db */
-	{ 0X00, 0X89, 0XDA, 0XAB }, /* -41.5db */
-	{ 0X00, 0X92, 0X05, 0XC6 }, /* -41.0db */
-	{ 0X00, 0X9A, 0XAC, 0XC8 }, /* -40.5db */
-	{ 0X00, 0XA3, 0XD7, 0X0A }, /* -40.0db */
-	{ 0X00, 0XAD, 0X8C, 0X52 }, /* -39.5db */
-	{ 0X00, 0XB7, 0XD4, 0XDD }, /* -39.0db */
-	{ 0X00, 0XC2, 0XB9, 0X65 }, /* -38.5db */
-	{ 0X00, 0XCE, 0X43, 0X28 }, /* -38.0db */
-	{ 0X00, 0XDA, 0X7B, 0XF1 }, /* -37.5db */
-	{ 0X00, 0XE7, 0X6E, 0X1E }, /* -37.0db */
-	{ 0X00, 0XF5, 0X24, 0XAC }, /* -36.5db */
-	{ 0X01, 0X03, 0XAB, 0X3D }, /* -36.0db */
-	{ 0X01, 0X13, 0X0E, 0X24 }, /* -35.5db */
-	{ 0X01, 0X23, 0X5A, 0X71 }, /* -35.0db */
-	{ 0X01, 0X34, 0X9D, 0XF8 }, /* -34.5db */
-	{ 0X01, 0X46, 0XE7, 0X5D }, /* -34.0db */
-	{ 0X01, 0X5A, 0X46, 0X27 }, /* -33.5db */
-	{ 0X01, 0X6E, 0XCA, 0XC5 }, /* -33.0db */
-	{ 0X01, 0X84, 0X86, 0X9F }, /* -32.5db */
-	{ 0X01, 0X9B, 0X8C, 0X27 }, /* -32.0db */
-	{ 0X01, 0XB3, 0XEE, 0XE5 }, /* -31.5db */
-	{ 0X01, 0XCD, 0XC3, 0X8C }, /* -31.0db */
-	{ 0X01, 0XE9, 0X20, 0X05 }, /* -30.5db */
-	{ 0X02, 0X06, 0X1B, 0X89 }, /* -30.0db */
-	{ 0X02, 0X24, 0XCE, 0XB0 }, /* -29.5db */
-	{ 0X02, 0X45, 0X53, 0X85 }, /* -29.0db */
-	{ 0X02, 0X67, 0XC5, 0XA2 }, /* -28.5db */
-	{ 0X02, 0X8C, 0X42, 0X3F }, /* -28.0db */
-	{ 0X02, 0XB2, 0XE8, 0X55 }, /* -27.5db */
-	{ 0X02, 0XDB, 0XD8, 0XAD }, /* -27.0db */
-	{ 0X03, 0X07, 0X36, 0X05 }, /* -26.5db */
-	{ 0X03, 0X35, 0X25, 0X29 }, /* -26.0db */
-	{ 0X03, 0X65, 0XCD, 0X13 }, /* -25.5db */
-	{ 0X03, 0X99, 0X57, 0X0C }, /* -25.0db */
-	{ 0X03, 0XCF, 0XEE, 0XCF }, /* -24.5db */
-	{ 0X04, 0X09, 0XC2, 0XB0 }, /* -24.0db */
-	{ 0X04, 0X47, 0X03, 0XC1 }, /* -23.5db */
-	{ 0X04, 0X87, 0XE5, 0XFB }, /* -23.0db */
-	{ 0X04, 0XCC, 0XA0, 0X6D }, /* -22.5db */
-	{ 0X05, 0X15, 0X6D, 0X68 }, /* -22.0db */
-	{ 0X05, 0X62, 0X8A, 0XB3 }, /* -21.5db */
-	{ 0X05, 0XB4, 0X39, 0XBC }, /* -21.0db */
-	{ 0X06, 0X0A, 0XBF, 0XD4 }, /* -20.5db */
-	{ 0X06, 0X66, 0X66, 0X66 }, /* -20.0db */
-	{ 0X06, 0XC7, 0X7B, 0X36 }, /* -19.5db */
-	{ 0X07, 0X2E, 0X50, 0XA6 }, /* -19.0db */
-	{ 0X07, 0X9B, 0X3D, 0XF6 }, /* -18.5db */
-	{ 0X08, 0X0E, 0X9F, 0X96 }, /* -18.0db */
-	{ 0X08, 0X88, 0XD7, 0X6D }, /* -17.5db */
-	{ 0X09, 0X0A, 0X4D, 0X2F }, /* -17.0db */
-	{ 0X09, 0X93, 0X6E, 0XB8 }, /* -16.5db */
-	{ 0X0A, 0X24, 0XB0, 0X62 }, /* -16.0db */
-	{ 0X0A, 0XBE, 0X8D, 0X70 }, /* -15.5db */
-	{ 0X0B, 0X61, 0X88, 0X71 }, /* -15.0db */
-	{ 0X0C, 0X0E, 0X2B, 0XB0 }, /* -14.5db */
-	{ 0X0C, 0XC5, 0X09, 0XAB }, /* -14.0db */
-	{ 0X0D, 0X86, 0XBD, 0X8D }, /* -13.5db */
-	{ 0X0E, 0X53, 0XEB, 0XB3 }, /* -13.0db */
-	{ 0X0F, 0X2D, 0X42, 0X38 }, /* -12.5db */
-	{ 0X10, 0X13, 0X79, 0X87 }, /* -12.0db */
-	{ 0X11, 0X07, 0X54, 0XF9 }, /* -11.5db */
-	{ 0X12, 0X09, 0XA3, 0X7A }, /* -11.0db */
-	{ 0X13, 0X1B, 0X40, 0X39 }, /* -10.5db */
-	{ 0X14, 0X3D, 0X13, 0X62 }, /* -10.0db */
-	{ 0X15, 0X70, 0X12, 0XE1 }, /* -9.5db */
-	{ 0X16, 0XB5, 0X43, 0X37 }, /* -9.0db */
-	{ 0X18, 0X0D, 0XB8, 0X54 }, /* -8.5db */
-	{ 0X19, 0X7A, 0X96, 0X7F }, /* -8.0db */
-	{ 0X1A, 0XFD, 0X13, 0X54 }, /* -7.5db */
-	{ 0X1C, 0X96, 0X76, 0XC6 }, /* -7.0db */
-	{ 0X1E, 0X48, 0X1C, 0X37 }, /* -6.5db */
-	{ 0X20, 0X13, 0X73, 0X9E }, /* -6.0db */
-	{ 0X21, 0XFA, 0X02, 0XBF }, /* -5.5db */
-	{ 0X23, 0XFD, 0X66, 0X78 }, /* -5.0db */
-	{ 0X26, 0X1F, 0X54, 0X1C }, /* -4.5db */
-	{ 0X28, 0X61, 0X9A, 0XE9 }, /* -4.0db */
-	{ 0X2A, 0XC6, 0X25, 0X91 }, /* -3.5db */
-	{ 0X2D, 0X4E, 0XFB, 0XD5 }, /* -3.0db */
-	{ 0X2F, 0XFE, 0X44, 0X48 }, /* -2.5db */
-	{ 0X32, 0XD6, 0X46, 0X17 }, /* -2.0db */
-	{ 0X35, 0XD9, 0X6B, 0X02 }, /* -1.5db */
-	{ 0X39, 0X0A, 0X41, 0X5F }, /* -1.0db */
-	{ 0X3C, 0X6B, 0X7E, 0X4F }, /* -0.5db */
-	{ 0X40, 0X00, 0X00, 0X00 }, /* 0.0db */
-	{ 0X43, 0XCA, 0XD0, 0X22 }, /* 0.5db */
-	{ 0X47, 0XCF, 0X26, 0X7D }, /* 1.0db */
-	{ 0X4C, 0X10, 0X6B, 0XA5 }, /* 1.5db */
-	{ 0X50, 0X92, 0X3B, 0XE3 }, /* 2.0db */
-	{ 0X55, 0X58, 0X6A, 0X46 }, /* 2.5db */
-	{ 0X5A, 0X67, 0X03, 0XDF }, /* 3.0db */
-	{ 0X5F, 0XC2, 0X53, 0X32 }, /* 3.5db */
-	{ 0X65, 0X6E, 0XE3, 0XDB }, /* 4.0db */
-	{ 0X6B, 0X71, 0X86, 0X68 }, /* 4.5db */
-	{ 0X71, 0XCF, 0X54, 0X71 }, /* 5.0db */
-	{ 0X78, 0X8D, 0XB4, 0XE9 }, /* 5.5db */
-	{ 0XFF, 0XFF, 0XFF, 0XFF }, /* 6.0db */
-};
 #endif
diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index 18161d02a96f..81fb34c9da89 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -23,6 +23,7 @@
 #define SMARTAMP_MODULE_NAME		"tas2781"
 #define TAS2781_GLOBAL_ADDR	0x40
 #define TAS2563_GLOBAL_ADDR	0x48
+
 #define TASDEVICE_RATES			(SNDRV_PCM_RATE_44100 |\
 	SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |\
 	SNDRV_PCM_RATE_88200)
@@ -49,12 +50,69 @@
 /*I2C Checksum */
 #define TASDEVICE_I2CChecksum		TASDEVICE_REG(0x0, 0x0, 0x7E)
 
+/* XM_340 */
+#define	TASDEVICE_XM_A1_REG	TASDEVICE_REG(0x64, 0x02, 0x4c)
+/* XM_341 */
+#define	TASDEVICE_XM_A2_REG	TASDEVICE_REG(0x64, 0x02, 0x64)
+
 /* Volume control */
 #define TAS2563_DVC_LVL			TASDEVICE_REG(0x00, 0x02, 0x0C)
 #define TAS2781_DVC_LVL			TASDEVICE_REG(0x0, 0x0, 0x1A)
 #define TAS2781_AMP_LEVEL		TASDEVICE_REG(0x0, 0x0, 0x03)
 #define TAS2781_AMP_LEVEL_MASK		GENMASK(5, 1)
 
+#define TAS2563_IDLE		TASDEVICE_REG(0x00, 0x00, 0x3e)
+#define TAS2563_PRM_R0_REG		TASDEVICE_REG(0x00, 0x0f, 0x34)
+#define TAS2563_PRM_R0_LOW_REG		TASDEVICE_REG(0x00, 0x0f, 0x48)
+#define TAS2563_PRM_INVR0_REG		TASDEVICE_REG(0x00, 0x0f, 0x40)
+#define TAS2563_PRM_POW_REG		TASDEVICE_REG(0x00, 0x0d, 0x3c)
+#define TAS2563_PRM_TLIMIT_REG		TASDEVICE_REG(0x00, 0x10, 0x14)
+
+#define TAS2563_RUNTIME_RE_REG_TF	TASDEVICE_REG(0x64, 0x02, 0x70)
+#define TAS2563_RUNTIME_RE_REG		TASDEVICE_REG(0x64, 0x02, 0x48)
+
+#define TAS2563_PRM_ENFF_REG		TASDEVICE_REG(0x00, 0x0d, 0x54)
+#define TAS2563_PRM_DISTCK_REG		TASDEVICE_REG(0x00, 0x0d, 0x58)
+#define TAS2563_PRM_TE_SCTHR_REG	TASDEVICE_REG(0x00, 0x0f, 0x60)
+#define TAS2563_PRM_PLT_FLAG_REG	TASDEVICE_REG(0x00, 0x0d, 0x74)
+#define TAS2563_PRM_SINEGAIN_REG	TASDEVICE_REG(0x00, 0x0d, 0x7c)
+/* prm_Int_B0 */
+#define TAS2563_TE_TA1_REG		TASDEVICE_REG(0x00, 0x10, 0x0c)
+/* prm_Int_A1 */
+#define TAS2563_TE_TA1_AT_REG		TASDEVICE_REG(0x00, 0x10, 0x10)
+/* prm_TE_Beta */
+#define TAS2563_TE_TA2_REG		TASDEVICE_REG(0x00, 0x0f, 0x64)
+/* prm_TE_Beta1 */
+#define TAS2563_TE_AT_REG		TASDEVICE_REG(0x00, 0x0f, 0x68)
+/* prm_TE_1_Beta1 */
+#define TAS2563_TE_DT_REG		TASDEVICE_REG(0x00, 0x0f, 0x70)
+
+#define TAS2781_PRM_R0_REG		TASDEVICE_REG(0x00, 0x17, 0x74)
+#define TAS2781_PRM_R0_LOW_REG		TASDEVICE_REG(0x00, 0x18, 0x0c)
+#define TAS2781_PRM_INVR0_REG		TASDEVICE_REG(0x00, 0x18, 0x14)
+#define TAS2781_PRM_POW_REG		TASDEVICE_REG(0x00, 0x13, 0x70)
+#define TAS2781_PRM_TLIMIT_REG		TASDEVICE_REG(0x00, 0x18, 0x7c)
+
+#define TAS2781_PRM_INT_MASK_REG	TASDEVICE_REG(0x00, 0x00, 0x3b)
+#define TAS2781_PRM_CLK_CFG_REG		TASDEVICE_REG(0x00, 0x00, 0x5c)
+#define TAS2781_PRM_RSVD_REG		TASDEVICE_REG(0x00, 0x01, 0x19)
+#define TAS2781_PRM_TEST_57_REG		TASDEVICE_REG(0x00, 0xfd, 0x39)
+#define TAS2781_PRM_TEST_62_REG		TASDEVICE_REG(0x00, 0xfd, 0x3e)
+#define TAS2781_PRM_PVDD_UVLO_REG	TASDEVICE_REG(0x00, 0x00, 0x71)
+#define TAS2781_PRM_CHNL_0_REG		TASDEVICE_REG(0x00, 0x00, 0x03)
+#define TAS2781_PRM_NG_CFG0_REG		TASDEVICE_REG(0x00, 0x00, 0x35)
+#define TAS2781_PRM_IDLE_CH_DET_REG	TASDEVICE_REG(0x00, 0x00, 0x66)
+#define TAS2781_PRM_PLT_FLAG_REG	TASDEVICE_REG(0x00, 0x14, 0x38)
+#define TAS2781_PRM_SINEGAIN_REG	TASDEVICE_REG(0x00, 0x14, 0x40)
+#define TAS2781_PRM_SINEGAIN2_REG	TASDEVICE_REG(0x00, 0x14, 0x44)
+
+#define TAS2781_TEST_UNLOCK_REG		TASDEVICE_REG(0x00, 0xFD, 0x0D)
+#define TAS2781_TEST_PAGE_UNLOCK	0x0D
+
+#define TAS2781_RUNTIME_LATCH_RE_REG	TASDEVICE_REG(0x00, 0x00, 0x49)
+#define TAS2781_RUNTIME_RE_REG_TF	TASDEVICE_REG(0x64, 0x62, 0x48)
+#define TAS2781_RUNTIME_RE_REG		TASDEVICE_REG(0x64, 0x63, 0x44)
+
 #define TASDEVICE_CMD_SING_W		0x1
 #define TASDEVICE_CMD_BURST		0x2
 #define TASDEVICE_CMD_DELAY		0x3
@@ -70,7 +128,15 @@ enum device_catlog_id {
 	OTHERS
 };
 
+struct bulk_reg_val {
+	int reg;
+	unsigned char val[4];
+	unsigned char val_len;
+	bool is_locked;
+};
+
 struct tasdevice {
+	struct bulk_reg_val *cali_data_restore;
 	struct tasdevice_fw *cali_data_fmw;
 	unsigned int dev_addr;
 	unsigned int err_code;
@@ -89,6 +155,9 @@ struct tasdevice_irqinfo {
 struct calidata {
 	unsigned char *data;
 	unsigned long total_sz;
+	unsigned int *reg_array;
+	unsigned int reg_array_sz;
+	unsigned int cali_dat_sz;
 };
 
 struct tasdevice_priv {
@@ -124,6 +193,7 @@ struct tasdevice_priv {
 	bool force_fwload_status;
 	bool playback_started;
 	bool isacpi;
+	bool is_user_space_calidata;
 	unsigned int global_addr;
 
 	int (*fw_parse_variable_header)(struct tasdevice_priv *tas_priv,
@@ -150,6 +220,8 @@ int tasdevice_init(struct tasdevice_priv *tas_priv);
 void tasdevice_remove(struct tasdevice_priv *tas_priv);
 int tasdevice_save_calibration(struct tasdevice_priv *tas_priv);
 void tasdevice_apply_calibration(struct tasdevice_priv *tas_priv);
+int tasdev_chn_switch(struct tasdevice_priv *tas_priv,
+	unsigned short chn);
 int tasdevice_dev_read(struct tasdevice_priv *tas_priv,
 	unsigned short chn, unsigned int reg, unsigned int *value);
 int tasdevice_dev_write(struct tasdevice_priv *tas_priv,
diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
index 1fbf4560f5cc..e7599f9fc125 100644
--- a/sound/soc/codecs/tas2781-comlib.c
+++ b/sound/soc/codecs/tas2781-comlib.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 //
-// TAS2781 Common functions for HDA and ASoC Audio drivers
+// TAS2563/TAS2781 Common functions for HDA and ASoC Audio drivers
 //
 // Copyright 2023 - 2024 Texas Instruments, Inc.
 //
@@ -64,8 +64,8 @@ static int tasdevice_change_chn_book(struct tasdevice_priv *tas_priv,
 			 */
 			ret = regmap_write(map, TASDEVICE_PAGE_SELECT, 0);
 			if (ret < 0) {
-				dev_err(tas_priv->dev, "%s, E=%d\n",
-					__func__, ret);
+				dev_err(tas_priv->dev, "%s, E=%d channel:%d\n",
+					__func__, ret, chn);
 				goto out;
 			}
 		}
@@ -89,6 +89,32 @@ static int tasdevice_change_chn_book(struct tasdevice_priv *tas_priv,
 	return ret;
 }
 
+int tasdev_chn_switch(struct tasdevice_priv *tas_priv,
+	unsigned short chn)
+{
+	struct i2c_client *client = (struct i2c_client *)tas_priv->client;
+	struct tasdevice *tasdev = &tas_priv->tasdevice[chn];
+	struct regmap *map = tas_priv->regmap;
+	int ret;
+
+	if (client->addr != tasdev->dev_addr) {
+		client->addr = tasdev->dev_addr;
+		/* All devices share the same regmap, clear the page
+		 * inside regmap once switching to another device.
+		 * Register 0 at any pages and any books inside tas2781
+		 * is the same one for page-switching.
+		 */
+		ret = regmap_write(map, TASDEVICE_PAGE_SELECT, 0);
+		if (ret < 0) {
+			dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
+			return ret;
+		}
+		return 1;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tasdev_chn_switch);
+
 int tasdevice_dev_read(struct tasdevice_priv *tas_priv,
 	unsigned short chn, unsigned int reg, unsigned int *val)
 {
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index 63626b982d04..2b5eb67a52e8 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2152,20 +2152,38 @@ static int tasdevice_load_data(struct tasdevice_priv *tas_priv,
 
 static void tasdev_load_calibrated_data(struct tasdevice_priv *priv, int i)
 {
+	struct tasdevice_fw *cal_fmw = priv->tasdevice[i].cali_data_fmw;
+	struct calidata *cali_data = &priv->cali_data;
+	unsigned char *data = &cali_data->data[1];
 	struct tasdevice_calibration *cal;
-	struct tasdevice_fw *cal_fmw;
+	int k = i * (cali_data->cali_dat_sz + 1);
+	int j, rc;
 
-	cal_fmw = priv->tasdevice[i].cali_data_fmw;
+	/* Load the calibrated data from cal bin file */
+	if (!priv->is_user_space_calidata && cal_fmw) {
+		cal = cal_fmw->calibrations;
 
-	/* No calibrated data for current devices, playback will go ahead. */
-	if (!cal_fmw)
+		if (cal)
+			load_calib_data(priv, &cal->dev_data);
 		return;
-
-	cal = cal_fmw->calibrations;
-	if (cal)
+	}
+	if (!priv->is_user_space_calidata)
 		return;
-
-	load_calib_data(priv, &cal->dev_data);
+	/* load calibrated data from user space */
+	if (data[k] != i) {
+		dev_err(priv->dev, "%s: no cal-data for dev %d from usr-spc\n",
+			__func__, i);
+		return;
+	}
+	k++;
+	for (j = 0; j < cali_data->reg_array_sz; j++) {
+		rc = tasdevice_dev_bulk_write(priv, i, cali_data->reg_array[j],
+			&(data[k + 4 * j]), 4);
+		if (rc < 0)
+			dev_err(priv->dev,
+				"chn %d calib %d bulk_wr err = %d\n",
+				i, j, rc);
+	}
 }
 
 int tasdevice_select_tuningprm_cfg(void *context, int prm_no,
@@ -2260,9 +2278,10 @@ int tasdevice_select_tuningprm_cfg(void *context, int prm_no,
 				tas_priv->tasdevice[i].cur_conf = cfg_no;
 			}
 		}
-	} else
+	} else {
 		dev_dbg(tas_priv->dev, "%s: Unneeded loading dsp conf %d\n",
 			__func__, cfg_no);
+	}
 
 	status |= cfg_info[rca_conf_no]->active_dev;
 
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index e79d613745b4..e36934c8eeb2 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -30,9 +30,141 @@
 #include <sound/soc.h>
 #include <sound/tas2781.h>
 #include <sound/tlv.h>
+#include <sound/tas2563-tlv.h>
 #include <sound/tas2781-tlv.h>
 #include <asm/unaligned.h>
 
+static const struct bulk_reg_val tas2563_cali_start_reg[] = {
+	{
+		.reg = TAS2563_IDLE,
+		.val_len = 1,
+		.val = { 0x00 },
+	},
+	{
+		.reg = TAS2563_PRM_ENFF_REG,
+		.val_len = 4,
+		.val = { 0x40, 0x00, 0x00, 0x00 },
+	},
+	{
+		.reg = TAS2563_PRM_DISTCK_REG,
+		.val_len = 4,
+		.val = { 0x40, 0x00, 0x00, 0x00 },
+	},
+	{
+		.reg = TAS2563_PRM_TE_SCTHR_REG,
+		.val_len = 4,
+		.val = { 0x7f, 0xff, 0xff, 0xff },
+	},
+	{
+		.reg = TAS2563_PRM_PLT_FLAG_REG,
+		.val_len = 4,
+		.val = { 0x40, 0x00, 0x00, 0x00 },
+	},
+	{
+		.reg = TAS2563_PRM_SINEGAIN_REG,
+		.val_len = 4,
+		.val = { 0x0a, 0x3d, 0x70, 0xa4 },
+	},
+	{
+		.reg = TAS2563_TE_TA1_REG,
+		.val_len = 4,
+		.val = { 0x00, 0x36, 0x91, 0x5e },
+	},
+	{
+		.reg = TAS2563_TE_TA1_AT_REG,
+		.val_len = 4,
+		.val = { 0x00, 0x36, 0x91, 0x5e },
+	},
+	{
+		.reg = TAS2563_TE_TA2_REG,
+		.val_len = 4,
+		.val = { 0x00, 0x06, 0xd3, 0x72 },
+	},
+	{
+		.reg = TAS2563_TE_AT_REG,
+		.val_len = 4,
+		.val = { 0x00, 0x36, 0x91, 0x5e },
+	},
+	{
+		.reg = TAS2563_TE_DT_REG,
+		.val_len = 4,
+		.val = { 0x00, 0x36, 0x91, 0x5e },
+	},
+};
+
+static const struct bulk_reg_val tas2781_cali_start_reg[] = {
+	{
+		.reg = TAS2781_PRM_INT_MASK_REG,
+		.val = { 0xfe },
+		.val_len = 1,
+		.is_locked = false
+	},
+	{
+		.reg = TAS2781_PRM_CLK_CFG_REG,
+		.val = { 0xdd },
+		.val_len = 1,
+		.is_locked = false
+	},
+	{
+		.reg = TAS2781_PRM_RSVD_REG,
+		.val = { 0x20 },
+		.val_len = 1,
+		.is_locked = false
+	},
+	{
+		.reg = TAS2781_PRM_TEST_57_REG,
+		.val = { 0x14 },
+		.val_len = 1,
+		.is_locked = true
+	},
+	{
+		.reg = TAS2781_PRM_TEST_62_REG,
+		.val = { 0x45 },
+		.val_len = 1,
+		.is_locked = true
+	},
+	{
+		.reg = TAS2781_PRM_PVDD_UVLO_REG,
+		.val = { 0x03 },
+		.val_len = 1,
+		.is_locked = false
+	},
+	{
+		.reg = TAS2781_PRM_CHNL_0_REG,
+		.val = { 0xA8 },
+		.val_len = 1,
+		.is_locked = false
+	},
+	{
+		.reg = TAS2781_PRM_NG_CFG0_REG,
+		.val = { 0xb9 },
+		.val_len = 1,
+		.is_locked = false
+	},
+	{
+		.reg = TAS2781_PRM_IDLE_CH_DET_REG,
+		.val = { 0x92 },
+		.val_len = 1,
+		.is_locked = false
+	},
+	{
+		.reg	= TAS2781_PRM_PLT_FLAG_REG,
+		.val = { 0x40, 0x00, 0x00, 0x00 },
+		.val_len = 4,
+		.is_locked = false
+	},
+	{
+		.reg	= TAS2781_PRM_SINEGAIN_REG,
+		.val_len = 4,
+		.is_locked = false
+	},
+	{
+		.reg	= TAS2781_PRM_SINEGAIN2_REG,
+		.val_len = 4,
+		.is_locked = false
+	},
+};
+
 static const struct i2c_device_id tasdevice_id[] = {
 	{ "tas2563", TAS2563 },
 	{ "tas2781", TAS2781 },
@@ -49,6 +181,22 @@ static const struct of_device_id tasdevice_of_match[] = {
 MODULE_DEVICE_TABLE(of, tasdevice_of_match);
 #endif
 
+static const int tas2563_cali_data_reg[] = {
+	TAS2563_PRM_R0_REG,
+	TAS2563_PRM_R0_LOW_REG,
+	TAS2563_PRM_INVR0_REG,
+	TAS2563_PRM_POW_REG,
+	TAS2563_PRM_TLIMIT_REG,
+};
+
+static const int tas2781_cali_data_reg[] = {
+	TAS2781_PRM_R0_REG,
+	TAS2781_PRM_R0_LOW_REG,
+	TAS2781_PRM_INVR0_REG,
+	TAS2781_PRM_POW_REG,
+	TAS2781_PRM_TLIMIT_REG,
+};
+
 /**
  * tas2781_digital_getvol - get the volum control
  * @kcontrol: control pointer
@@ -67,8 +215,13 @@ static int tas2781_digital_getvol(struct snd_kcontrol *kcontrol,
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
+	int rc;
+
+	mutex_lock(&tas_priv->codec_lock);
+	rc = tasdevice_digital_getvol(tas_priv, ucontrol, mc);
+	mutex_unlock(&tas_priv->codec_lock);
 
-	return tasdevice_digital_getvol(tas_priv, ucontrol, mc);
+	return rc;
 }
 
 static int tas2781_digital_putvol(struct snd_kcontrol *kcontrol,
@@ -78,8 +231,13 @@ static int tas2781_digital_putvol(struct snd_kcontrol *kcontrol,
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
+	int rc;
+
+	mutex_lock(&tas_priv->codec_lock);
+	rc = tasdevice_digital_putvol(tas_priv, ucontrol, mc);
+	mutex_unlock(&tas_priv->codec_lock);
 
-	return tasdevice_digital_putvol(tas_priv, ucontrol, mc);
+	return rc;
 }
 
 static int tas2781_amp_getvol(struct snd_kcontrol *kcontrol,
@@ -89,8 +247,13 @@ static int tas2781_amp_getvol(struct snd_kcontrol *kcontrol,
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
+	int rc;
 
-	return tasdevice_amp_getvol(tas_priv, ucontrol, mc);
+	mutex_lock(&tas_priv->codec_lock);
+	rc = tasdevice_amp_getvol(tas_priv, ucontrol, mc);
+	mutex_unlock(&tas_priv->codec_lock);
+
+	return rc;
 }
 
 static int tas2781_amp_putvol(struct snd_kcontrol *kcontrol,
@@ -101,8 +264,13 @@ static int tas2781_amp_putvol(struct snd_kcontrol *kcontrol,
 		snd_soc_component_get_drvdata(codec);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
+	int rc;
 
-	return tasdevice_amp_putvol(tas_priv, ucontrol, mc);
+	mutex_lock(&tas_priv->codec_lock);
+	rc = tasdevice_amp_putvol(tas_priv, ucontrol, mc);
+	mutex_unlock(&tas_priv->codec_lock);
+
+	return rc;
 }
 
 static int tasdev_force_fwload_get(struct snd_kcontrol *kcontrol,
@@ -141,6 +309,414 @@ static int tasdev_force_fwload_put(struct snd_kcontrol *kcontrol,
 	return change;
 }
 
+static int tasdev_cali_data_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned char *dst = ucontrol->value.bytes.data;
+	unsigned char *data = tas_priv->cali_data.data;
+
+	mutex_lock(&tas_priv->codec_lock);
+	if (!tas_priv->is_user_space_calidata ||
+		tas_priv->cali_data.total_sz != bytes_ext->max)
+		goto out;
+
+	memcpy(dst, data, bytes_ext->max);
+out:
+	mutex_unlock(&tas_priv->codec_lock);
+	return 0;
+}
+
+static int calib_data_get(struct tasdevice_priv *tas_priv, int reg,
+	unsigned char *dst, int data_len)
+{
+	struct i2c_client *clt = (struct i2c_client *)tas_priv->client;
+	struct tasdevice *tasdev = tas_priv->tasdevice;
+	int rc = -1;
+	int i;
+
+	if (data_len != 4)
+		return rc;
+
+	for (i = 0; i < tas_priv->ndev; i++) {
+		if (clt->addr == tasdev[i].dev_addr) {
+			/* First byte is the device index. */
+			dst[0] = i;
+			rc = tasdevice_dev_bulk_read(tas_priv, i, reg, &dst[1],
+				4);
+			break;
+		}
+	}
+
+	return rc;
+}
+
+static void sngl_calib_start(struct tasdevice_priv *tas_priv, int i,
+	unsigned char *dat)
+{
+	struct tasdevice *tasdev = tas_priv->tasdevice;
+	struct bulk_reg_val *p = tasdev[i].cali_data_restore;
+	const int sum = ARRAY_SIZE(tas2781_cali_start_reg);
+	int j;
+
+	if (p == NULL)
+		return;
+
+	/* Store the current setting from the chip */
+	for (j = 0; j < sum; j++) {
+		if (p[j].val_len == 1) {
+			if (p[j].is_locked)
+				tasdevice_dev_write(tas_priv, i,
+					TAS2781_TEST_UNLOCK_REG,
+					TAS2781_TEST_PAGE_UNLOCK);
+			tasdevice_dev_read(tas_priv, i, p[j].reg,
+				(int *)&p[j].val[0]);
+		} else {
+			tasdevice_dev_bulk_read(tas_priv, i, p[j].reg,
+				p[j].val, 4);
+		}
+	}
+
+	/* Update the setting for calibration */
+	for (j = 0; j < sum - 2; j++) {
+		if (p[j].val_len == 1) {
+			if (p[j].is_locked)
+				tasdevice_dev_write(tas_priv, i,
+					TAS2781_TEST_UNLOCK_REG,
+					TAS2781_TEST_PAGE_UNLOCK);
+			tasdevice_dev_write(tas_priv, i, p[j].reg,
+				tas2781_cali_start_reg[j].val[0]);
+		} else {
+			tasdevice_dev_bulk_write(tas_priv, i, p[j].reg,
+				(unsigned char *)
+				tas2781_cali_start_reg[j].val, 4);
+		}
+	}
+
+	tasdevice_dev_bulk_write(tas_priv, i, p[j].reg, &dat[1], 4);
+	tasdevice_dev_bulk_write(tas_priv, i, p[j + 1].reg, &dat[5], 4);
+}
+
+static int tas2781_calib_start_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned char *dat = ucontrol->value.bytes.data;
+	int rc = 1;
+	int i;
+
+	mutex_lock(&tas_priv->codec_lock);
+	if (tas_priv->chip_id != TAS2781 &&
+		bytes_ext->max != 9 * tas_priv->ndev) {
+		rc = 0;
+		goto out;
+	}
+
+	for (i = 0; i < tas_priv->ndev; i++) {
+		int k = i * 9;
+
+		if (dat[k] != i) {
+			dev_err(tas_priv->dev,
+				"%s:no cal-setting for dev %d\n", __func__, i);
+			continue;
+		}
+		sngl_calib_start(tas_priv, i, dat + k);
+	}
+out:
+	mutex_unlock(&tas_priv->codec_lock);
+	return rc;
+}
+
+static void tas2781_calib_stop_put(struct tasdevice_priv *tas_priv)
+{
+	const int sum = ARRAY_SIZE(tas2781_cali_start_reg);
+	int i, j;
+
+	for (i = 0; i < tas_priv->ndev; i++) {
+		struct tasdevice *tasdev = tas_priv->tasdevice;
+		struct bulk_reg_val *p = tasdev[i].cali_data_restore;
+
+		if (p == NULL)
+			continue;
+
+		for (j = 0; j < sum; j++) {
+			if (p[j].val_len == 1) {
+				if (p[j].is_locked)
+					tasdevice_dev_write(tas_priv, i,
+						TAS2781_TEST_UNLOCK_REG,
+						TAS2781_TEST_PAGE_UNLOCK);
+				tasdevice_dev_write(tas_priv, i, p[j].reg,
+					p[j].val[0]);
+			} else
+				tasdevice_dev_bulk_write(tas_priv, i, p[j].reg,
+					p[j].val, 4);
+		}
+	}
+}
+
+static int tas2563_calib_start_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct bulk_reg_val *q = (struct bulk_reg_val *)tas2563_cali_start_reg;
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	const int sum = ARRAY_SIZE(tas2563_cali_start_reg);
+	int rc = 1;
+	int i, j;
+
+	mutex_lock(&tas_priv->codec_lock);
+	if (tas_priv->chip_id != TAS2563) {
+		rc = -1;
+		goto out;
+	}
+
+	for (i = 0; i < tas_priv->ndev; i++) {
+		struct tasdevice *tasdev = tas_priv->tasdevice;
+		struct bulk_reg_val *p = tasdev[i].cali_data_restore;
+
+		if (p == NULL)
+			continue;
+		for (j = 0; j < sum; j++) {
+			if (p[j].val_len == 1)
+				tasdevice_dev_read(tas_priv,
+					i, p[j].reg,
+					(unsigned int *)&p[j].val[0]);
+			else
+				tasdevice_dev_bulk_read(tas_priv,
+					i, p[j].reg, p[j].val, 4);
+		}
+
+		for (j = 0; j < sum; j++) {
+			if (p[j].val_len == 1)
+				tasdevice_dev_write(tas_priv, i, p[j].reg,
+					q[j].val[0]);
+			else
+				tasdevice_dev_bulk_write(tas_priv, i, p[j].reg,
+					q[j].val, 4);
+		}
+	}
+out:
+	mutex_unlock(&tas_priv->codec_lock);
+	return rc;
+}
+
+static void tas2563_calib_stop_put(struct tasdevice_priv *tas_priv)
+{
+	const int sum = ARRAY_SIZE(tas2563_cali_start_reg);
+	int i, j;
+
+	for (i = 0; i < tas_priv->ndev; i++) {
+		struct tasdevice *tasdev = tas_priv->tasdevice;
+		struct bulk_reg_val *p = tasdev[i].cali_data_restore;
+
+		if (p == NULL)
+			continue;
+
+		for (j = 0; j < sum; j++) {
+			if (p[j].val_len == 1)
+				tasdevice_dev_write(tas_priv, i, p[j].reg,
+					p[j].val[0]);
+			else
+				tasdevice_dev_bulk_write(tas_priv, i, p[j].reg,
+					p[j].val, 4);
+		}
+	}
+}
+
+static int tasdev_calib_stop_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct calidata *cali_data = &tas_priv->cali_data;
+	unsigned char *data = cali_data->data;
+	int index = 0, i, j;
+
+	mutex_lock(&tas_priv->codec_lock);
+	if (tas_priv->chip_id == TAS2563)
+		tas2563_calib_stop_put(tas_priv);
+	else
+		tas2781_calib_stop_put(tas_priv);
+
+	for (i = 0; i < tas_priv->ndev; i++) {
+		data[index] = i;
+		index++;
+		for (j = 0; j < cali_data->reg_array_sz; j++) {
+			tasdevice_dev_bulk_read(tas_priv, i,
+				cali_data->reg_array[j], &data[index], 4);
+			index += 4;
+		}
+	}
+	mutex_unlock(&tas_priv->codec_lock);
+
+	return 1;
+}
+
+static int tasdev_cali_data_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned char *data = tas_priv->cali_data.data;
+	int rc = 1;
+
+	mutex_lock(&tas_priv->codec_lock);
+	if (tas_priv->cali_data.total_sz != bytes_ext->max) {
+		rc = 0;
+		goto out;
+	}
+	tas_priv->is_user_space_calidata = true;
+	data[0] = bytes_ext->max;
+	memcpy(&data[1], ucontrol->value.bytes.data, bytes_ext->max - 1);
+out:
+	mutex_unlock(&tas_priv->codec_lock);
+	return rc;
+}
+
+static int tas2781_latch_reg_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct i2c_client *clt = (struct i2c_client *)tas_priv->client;
+	struct tasdevice *tasdev = tas_priv->tasdevice;
+	unsigned char *dst = ucontrol->value.bytes.data;
+	int i, val, rc = -1;
+
+	mutex_lock(&tas_priv->codec_lock);
+	for (i = 0; i < tas_priv->ndev; i++) {
+		if (clt->addr == tasdev[i].dev_addr) {
+			/* First byte is the device index. */
+			dst[0] = i;
+			tasdevice_dev_read(tas_priv, i,
+				TAS2781_RUNTIME_LATCH_RE_REG, &val);
+			dst[1] = val;
+			rc = 0;
+			break;
+		}
+	}
+	mutex_unlock(&tas_priv->codec_lock);
+	return rc;
+}
+
+static int tasdev_tf_data_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned char *dst = ucontrol->value.bytes.data;
+	unsigned int reg;
+	int rc = -1;
+
+	if (tas_priv->chip_id == TAS2781)
+		reg = TAS2781_RUNTIME_RE_REG_TF;
+	else
+		reg = TAS2563_RUNTIME_RE_REG_TF;
+
+	mutex_lock(&tas_priv->codec_lock);
+	rc = calib_data_get(tas_priv, reg, dst, bytes_ext->max - 1);
+	mutex_unlock(&tas_priv->codec_lock);
+
+	return rc;
+}
+
+static int tasdev_re_data_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned char *dst = ucontrol->value.bytes.data;
+	unsigned int reg;
+	int rc = -1;
+
+	if (tas_priv->chip_id == TAS2781)
+		reg = TAS2781_RUNTIME_RE_REG;
+	else
+		reg = TAS2563_RUNTIME_RE_REG;
+	mutex_lock(&tas_priv->codec_lock);
+	rc = calib_data_get(tas_priv, reg, dst, bytes_ext->max - 1);
+	mutex_unlock(&tas_priv->codec_lock);
+
+	return rc;
+}
+
+static int tasdev_r0_data_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned char *dst = ucontrol->value.bytes.data;
+	unsigned int reg;
+	int rc = -1;
+
+	if (tas_priv->chip_id == TAS2781)
+		reg = TAS2781_PRM_R0_REG;
+	else
+		reg = TAS2563_PRM_R0_REG;
+	mutex_lock(&tas_priv->codec_lock);
+	rc = calib_data_get(tas_priv, reg, dst, bytes_ext->max - 1);
+	mutex_unlock(&tas_priv->codec_lock);
+
+	return rc;
+}
+
+static int tasdev_XMA1_data_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned char *dst = ucontrol->value.bytes.data;
+	unsigned int reg = TASDEVICE_XM_A1_REG;
+	int rc = -1;
+
+	mutex_lock(&tas_priv->codec_lock);
+	rc = calib_data_get(tas_priv, reg, dst, bytes_ext->max - 1);
+	mutex_unlock(&tas_priv->codec_lock);
+
+	return rc;
+}
+
+static int tasdev_XMA2_data_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned char *dst = ucontrol->value.bytes.data;
+	unsigned int reg = TASDEVICE_XM_A2_REG;
+	int rc = -1;
+
+	mutex_lock(&tas_priv->codec_lock);
+	rc = calib_data_get(tas_priv, reg, dst, bytes_ext->max - 1);
+	mutex_unlock(&tas_priv->codec_lock);
+
+	return rc;
+}
+
+static int tasdev_nop_get(
+	struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	return 0;
+}
+
 static int tas2563_digital_gain_get(
 	struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
@@ -241,6 +817,16 @@ static const struct snd_kcontrol_new tasdevice_snd_controls[] = {
 		tasdev_force_fwload_get, tasdev_force_fwload_put),
 };
 
+static const struct snd_kcontrol_new tasdevice_cali_controls[] = {
+	SOC_SINGLE_EXT("Calibration Stop", SND_SOC_NOPM, 0, 1, 0,
+		tasdev_nop_get, tasdev_calib_stop_put),
+	SND_SOC_BYTES_EXT("Amp TF Data", 5, tasdev_tf_data_get, NULL),
+	SND_SOC_BYTES_EXT("Amp RE Data", 5, tasdev_re_data_get, NULL),
+	SND_SOC_BYTES_EXT("Amp R0 Data", 5, tasdev_r0_data_get, NULL),
+	SND_SOC_BYTES_EXT("Amp XMA1 Data", 5, tasdev_XMA1_data_get, NULL),
+	SND_SOC_BYTES_EXT("Amp XMA2 Data", 5, tasdev_XMA2_data_get, NULL),
+};
+
 static const struct snd_kcontrol_new tas2781_snd_controls[] = {
 	SOC_SINGLE_RANGE_EXT_TLV("Speaker Analog Gain", TAS2781_AMP_LEVEL,
 		1, 0, 20, 0, tas2781_amp_getvol,
@@ -250,6 +836,10 @@ static const struct snd_kcontrol_new tas2781_snd_controls[] = {
 		tas2781_digital_putvol, dvc_tlv),
 };
 
+static const struct snd_kcontrol_new tas2781_cali_controls[] = {
+	SND_SOC_BYTES_EXT("Amp Latch Data", 2, tas2781_latch_reg_get, NULL),
+};
+
 static const struct snd_kcontrol_new tas2563_snd_controls[] = {
 	SOC_SINGLE_RANGE_EXT_TLV("Speaker Digital Volume", TAS2563_DVC_LVL, 0,
 		0, ARRAY_SIZE(tas2563_dvc_table) - 1, 0,
@@ -257,6 +847,11 @@ static const struct snd_kcontrol_new tas2563_snd_controls[] = {
 		tas2563_dvc_tlv),
 };
 
+static const struct snd_kcontrol_new tas2563_cali_controls[] = {
+	SOC_SINGLE_EXT("Calibration Start", SND_SOC_NOPM, 0, 1, 0,
+		tasdev_nop_get, tas2563_calib_start_put),
+};
+
 static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
@@ -274,6 +869,31 @@ static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
 	return ret;
 }
 
+static int tasdevice_info_active_num(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_info *uinfo)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = tas_priv->ndev - 1;
+
+	return 0;
+}
+
+static int tasdevice_info_chip_id(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = TAS2563;
+	uinfo->value.integer.max = TAS2781;
+
+	return 0;
+}
+
 static int tasdevice_info_programs(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_info *uinfo)
 {
@@ -330,29 +950,37 @@ static int tasdevice_get_profile_id(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int tasdevice_get_chip_id(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
+
+	ucontrol->value.integer.value[0] = tas_priv->chip_id;
+
+	return 0;
+}
+
 static int tasdevice_create_control(struct tasdevice_priv *tas_priv)
 {
 	struct snd_kcontrol_new *prof_ctrls;
-	int nr_controls = 1;
+	char *name;
+	int nr_controls = 2;
 	int mix_index = 0;
 	int ret;
-	char *name;
 
 	prof_ctrls = devm_kcalloc(tas_priv->dev, nr_controls,
 		sizeof(prof_ctrls[0]), GFP_KERNEL);
-	if (!prof_ctrls) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!prof_ctrls)
+		return -ENOMEM;
 
 	/* Create a mixer item for selecting the active profile */
 	name = devm_kzalloc(tas_priv->dev, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
 		GFP_KERNEL);
-	if (!name) {
-		ret = -ENOMEM;
-		goto out;
-	}
-	scnprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "Speaker Profile Id");
+	if (!name)
+		return -ENOMEM;
+
+	strscpy(name, "Speaker Profile Id", SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
 	prof_ctrls[mix_index].name = name;
 	prof_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	prof_ctrls[mix_index].info = tasdevice_info_profile;
@@ -363,7 +991,6 @@ static int tasdevice_create_control(struct tasdevice_priv *tas_priv)
 	ret = snd_soc_add_component_controls(tas_priv->codec,
 		prof_ctrls, nr_controls < mix_index ? nr_controls : mix_index);
 
-out:
 	return ret;
 }
 
@@ -423,12 +1050,48 @@ static int tasdevice_configuration_put(
 	return ret;
 }
 
-static int tasdevice_dsp_create_ctrls(
-	struct tasdevice_priv *tas_priv)
+static int tasdevice_active_num_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
+	struct i2c_client *clt = (struct i2c_client *)tas_priv->client;
+	struct tasdevice *tasdev = tas_priv->tasdevice;
+	int i;
+
+	for (i = 0; i < tas_priv->ndev; i++) {
+		if (clt->addr == tasdev[i].dev_addr) {
+			ucontrol->value.integer.value[0] = i;
+			return 0;
+		}
+	}
+
+	return -1;
+}
+
+static int tasdevice_active_num_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
+	int dev_id = ucontrol->value.integer.value[0];
+	int max = tas_priv->ndev - 1, rc;
+
+	dev_id = clamp(dev_id, 0, max);
+
+	mutex_lock(&tas_priv->codec_lock);
+	rc = tasdev_chn_switch(tas_priv, dev_id);
+	mutex_unlock(&tas_priv->codec_lock);
+
+	return rc;
+}
+
+static int tasdevice_dsp_create_ctrls(struct tasdevice_priv *tas_priv)
 {
 	struct snd_kcontrol_new *dsp_ctrls;
-	char *prog_name, *conf_name;
-	int nr_controls = 2;
+	char *active_dev_num, *chip_id;
+	char *conf_name, *prog_name;
+	int nr_controls = 4;
 	int mix_index = 0;
 	int ret;
 
@@ -437,23 +1100,23 @@ static int tasdevice_dsp_create_ctrls(
 	 */
 	dsp_ctrls = devm_kcalloc(tas_priv->dev, nr_controls,
 		sizeof(dsp_ctrls[0]), GFP_KERNEL);
-	if (!dsp_ctrls) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!dsp_ctrls)
+		return -ENOMEM;
 
 	/* Create a mixer item for selecting the active profile */
-	prog_name = devm_kzalloc(tas_priv->dev,
+	active_dev_num = devm_kzalloc(tas_priv->dev,
 		SNDRV_CTL_ELEM_ID_NAME_MAXLEN, GFP_KERNEL);
-	conf_name = devm_kzalloc(tas_priv->dev, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
+	conf_name = devm_kzalloc(tas_priv->dev,
+		SNDRV_CTL_ELEM_ID_NAME_MAXLEN, GFP_KERNEL);
+	prog_name = devm_kzalloc(tas_priv->dev, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
 		GFP_KERNEL);
-	if (!prog_name || !conf_name) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	chip_id = devm_kzalloc(tas_priv->dev, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
+		GFP_KERNEL);
+	if (!active_dev_num || !conf_name || !chip_id || !prog_name)
+		return -ENOMEM;
 
-	scnprintf(prog_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
-		"Speaker Program Id");
+	strscpy(prog_name, "Speaker Program Id",
+		SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
 	dsp_ctrls[mix_index].name = prog_name;
 	dsp_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	dsp_ctrls[mix_index].info = tasdevice_info_programs;
@@ -461,8 +1124,7 @@ static int tasdevice_dsp_create_ctrls(
 	dsp_ctrls[mix_index].put = tasdevice_program_put;
 	mix_index++;
 
-	scnprintf(conf_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
-		"Speaker Config Id");
+	strscpy(conf_name, "Speaker Config Id", SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
 	dsp_ctrls[mix_index].name = conf_name;
 	dsp_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	dsp_ctrls[mix_index].info = tasdevice_info_configurations;
@@ -470,13 +1132,154 @@ static int tasdevice_dsp_create_ctrls(
 	dsp_ctrls[mix_index].put = tasdevice_configuration_put;
 	mix_index++;
 
+	strscpy(active_dev_num, "Activate Tasdevice Num",
+		SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
+	dsp_ctrls[mix_index].name = active_dev_num;
+	dsp_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	dsp_ctrls[mix_index].info = tasdevice_info_active_num;
+	dsp_ctrls[mix_index].get = tasdevice_active_num_get;
+	dsp_ctrls[mix_index].put = tasdevice_active_num_put;
+	mix_index++;
+
+	strscpy(chip_id, "Tasdevice Chip Id", SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
+	dsp_ctrls[mix_index].name = chip_id;
+	dsp_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	dsp_ctrls[mix_index].info = tasdevice_info_chip_id;
+	dsp_ctrls[mix_index].get = tasdevice_get_chip_id;
+	mix_index++;
+
 	ret = snd_soc_add_component_controls(tas_priv->codec, dsp_ctrls,
 		nr_controls < mix_index ? nr_controls : mix_index);
 
-out:
 	return ret;
 }
 
+static int tasdevice_create_cali_ctrls(struct tasdevice_priv *tas_priv)
+{
+	struct calidata *cali_data = &tas_priv->cali_data;
+	struct tasdevice *tasdev = tas_priv->tasdevice;
+	struct soc_bytes_ext *ext_cali_data;
+	struct snd_kcontrol_new *cali_ctrls;
+	unsigned int num_controls;
+	char *cali_name;
+	int rc, i;
+
+	rc = snd_soc_add_component_controls(tas_priv->codec,
+		tasdevice_cali_controls, ARRAY_SIZE(tasdevice_cali_controls));
+	if (rc < 0) {
+		dev_err(tas_priv->dev, "%s: Add cali controls err rc = %d",
+			__func__, rc);
+		return rc;
+	}
+
+	if (tas_priv->chip_id == TAS2781) {
+		cali_ctrls = (struct snd_kcontrol_new *)tas2781_cali_controls;
+		num_controls = ARRAY_SIZE(tas2781_cali_controls);
+		cali_data->reg_array = (unsigned int *)tas2781_cali_data_reg;
+		cali_data->reg_array_sz = ARRAY_SIZE(tas2781_cali_data_reg);
+		for (i = 0; i < tas_priv->ndev; i++) {
+			tasdev[i].cali_data_restore =
+				kmemdup(tas2781_cali_start_reg,
+				sizeof(tas2781_cali_start_reg), GFP_KERNEL);
+			if (!tasdev[i].cali_data_restore)
+				return -ENOMEM;
+		}
+	} else {
+		cali_ctrls = (struct snd_kcontrol_new *)tas2563_cali_controls;
+		num_controls = ARRAY_SIZE(tas2563_cali_controls);
+		cali_data->reg_array = (unsigned int *)tas2563_cali_data_reg;
+		cali_data->reg_array_sz = ARRAY_SIZE(tas2563_cali_data_reg);
+		for (i = 0; i < tas_priv->ndev; i++) {
+			tasdev[i].cali_data_restore =
+				kmemdup(tas2563_cali_start_reg,
+				sizeof(tas2563_cali_start_reg), GFP_KERNEL);
+			if (!tasdev[i].cali_data_restore)
+				return -ENOMEM;
+		}
+	}
+
+	rc = snd_soc_add_component_controls(tas_priv->codec, cali_ctrls,
+		num_controls);
+	if (rc < 0) {
+		dev_err(tas_priv->dev, "%s: Add chip cali ctrls err rc = %d",
+			__func__, rc);
+		return rc;
+	}
+
+	/* index for cali_ctrls */
+	i = 0;
+	if (tas_priv->chip_id == TAS2781)
+		num_controls = 2;
+	else
+		num_controls = 1;
+
+	/*
+	 * Alloc kcontrol via devm_kzalloc, which don't manually
+	 * free the kcontrol
+	 */
+	cali_ctrls = devm_kcalloc(tas_priv->dev, num_controls,
+		sizeof(cali_ctrls[0]), GFP_KERNEL);
+	if (!cali_ctrls)
+		return -ENOMEM;
+
+	cali_name = devm_kzalloc(tas_priv->dev, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
+		GFP_KERNEL);
+	ext_cali_data = devm_kzalloc(tas_priv->dev, sizeof(*ext_cali_data),
+		GFP_KERNEL);
+	if (!cali_name || !ext_cali_data)
+		return -ENOMEM;
+
+	strscpy(cali_name, "Speaker Calibrated Data",
+		SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
+	/* the number of calibrated data per tas2563/tas2781 */
+	cali_data->cali_dat_sz = cali_data->reg_array_sz * 4;
+	ext_cali_data->max = tas_priv->ndev *
+		(cali_data->cali_dat_sz + 1) + 1;
+	tas_priv->cali_data.total_sz = ext_cali_data->max;
+	tas_priv->cali_data.data = devm_kzalloc(tas_priv->dev,
+		ext_cali_data->max, GFP_KERNEL);
+	cali_ctrls[i].name = cali_name;
+	cali_ctrls[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	cali_ctrls[i].info = snd_soc_bytes_info_ext;
+	cali_ctrls[i].get = tasdev_cali_data_get;
+	cali_ctrls[i].put = tasdev_cali_data_put;
+	cali_ctrls[i].private_value = (unsigned long)ext_cali_data;
+	i++;
+
+	cali_data->data = devm_kzalloc(tas_priv->dev, cali_data->total_sz,
+		GFP_KERNEL);
+	if (!cali_data->data)
+		return -ENOMEM;
+
+	if (tas_priv->chip_id == TAS2781) {
+		struct soc_bytes_ext *ext_cali_start;
+		char *cali_start_name;
+
+		cali_start_name = devm_kzalloc(tas_priv->dev,
+			SNDRV_CTL_ELEM_ID_NAME_MAXLEN, GFP_KERNEL);
+		ext_cali_start = devm_kzalloc(tas_priv->dev,
+			sizeof(*ext_cali_start), GFP_KERNEL);
+		if (!cali_start_name || !ext_cali_start)
+			return -ENOMEM;
+
+		strscpy(cali_start_name, "Calibration Start",
+			SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
+		ext_cali_data->max = tas_priv->ndev * 9;
+		cali_ctrls[i].name = cali_start_name;
+		cali_ctrls[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+		cali_ctrls[i].info = snd_soc_bytes_info_ext;
+		cali_ctrls[i].put = tas2781_calib_start_put;
+		cali_ctrls[i].get = tasdev_nop_get;
+		cali_ctrls[i].private_value = (unsigned long)ext_cali_start;
+		i++;
+	}
+
+	rc = snd_soc_add_component_controls(tas_priv->codec, cali_ctrls,
+		num_controls < i ? num_controls : i);
+
+	return rc;
+}
+
 static void tasdevice_fw_ready(const struct firmware *fmw,
 	void *context)
 {
@@ -523,6 +1326,12 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 		goto out;
 	}
 
+	ret = tasdevice_create_cali_ctrls(tas_priv);
+	if (ret) {
+		dev_err(tas_priv->dev, "cali controls error\n");
+		goto out;
+	}
+
 	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
 
 	/* If calibrated data occurs error, dsp will still works with default
@@ -558,18 +1367,14 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 		release_firmware(fmw);
 }
 
-static int tasdevice_dapm_event(struct snd_soc_dapm_widget *w,
-			struct snd_kcontrol *kcontrol, int event)
+static int tasdevice_mute(struct snd_soc_dai *dai, int mute, int stream)
 {
-	struct snd_soc_component *codec = snd_soc_dapm_to_component(w->dapm);
+	struct snd_soc_component *codec = dai->component;
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
-	int state = 0;
 
 	/* Codec Lock Hold */
 	mutex_lock(&tas_priv->codec_lock);
-	if (event == SND_SOC_DAPM_PRE_PMD)
-		state = 1;
-	tasdevice_tuning_switch(tas_priv, state);
+	tasdevice_tuning_switch(tas_priv, mute);
 	/* Codec Lock Release*/
 	mutex_unlock(&tas_priv->codec_lock);
 
@@ -578,18 +1383,16 @@ static int tasdevice_dapm_event(struct snd_soc_dapm_widget *w,
 
 static const struct snd_soc_dapm_widget tasdevice_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("ASI", "ASI Playback", 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_AIF_OUT_E("ASI OUT", "ASI Capture", 0, SND_SOC_NOPM,
-		0, 0, tasdevice_dapm_event,
-		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
-	SND_SOC_DAPM_SPK("SPK", tasdevice_dapm_event),
+	SND_SOC_DAPM_AIF_OUT("ASI OUT", "ASI Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_SPK("SPK", NULL),
 	SND_SOC_DAPM_OUTPUT("OUT"),
-	SND_SOC_DAPM_INPUT("DMIC")
+	SND_SOC_DAPM_INPUT("DMIC"),
 };
 
 static const struct snd_soc_dapm_route tasdevice_audio_map[] = {
 	{"SPK", NULL, "ASI"},
 	{"OUT", NULL, "SPK"},
-	{"ASI OUT", NULL, "DMIC"}
+	{"ASI OUT", NULL, "DMIC"},
 };
 
 static int tasdevice_startup(struct snd_pcm_substream *substream,
@@ -668,11 +1471,12 @@ static const struct snd_soc_dai_ops tasdevice_dai_ops = {
 	.startup = tasdevice_startup,
 	.hw_params = tasdevice_hw_params,
 	.set_sysclk = tasdevice_set_dai_sysclk,
+	.mute_stream = tasdevice_mute,
 };
 
 static struct snd_soc_dai_driver tasdevice_dai_driver[] = {
 	{
-		.name = "tas2781_codec",
+		.name = "tasdev_codec",
 		.id = 0,
 		.playback = {
 			.stream_name = "Playback",
@@ -724,6 +1528,11 @@ static int tasdevice_codec_probe(struct snd_soc_component *codec)
 static void tasdevice_deinit(void *context)
 {
 	struct tasdevice_priv *tas_priv = (struct tasdevice_priv *) context;
+	struct tasdevice *tasdev = tas_priv->tasdevice;
+	int i;
+
+	for (i = 0; i < tas_priv->ndev; i++)
+		kfree(tasdev[i].cali_data_restore);
 
 	tasdevice_config_info_remove(tas_priv);
 	tasdevice_dsp_remove(tas_priv);
-- 
2.34.1


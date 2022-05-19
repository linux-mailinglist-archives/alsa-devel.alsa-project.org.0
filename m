Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AA552DBEC
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 19:52:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0565D17E0;
	Thu, 19 May 2022 19:51:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0565D17E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652982733;
	bh=TYW6m6FsZTgi9/HXOilYOVwL35j8UnKEnnbWZDogcKM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e2NNkedTSXcgzsozmElLhT0CThaJFi3pE2sesqb3yI7UGum16J4q+Kmos9HykxYsb
	 icfkSreN601thfonnDXejL0D/ONZHZrLU1nM7/mEvQztTlbTabcK/1IERuWbv9SKE+
	 HhcNeHG6CNsQ1uyY0HyAi9CCOoc4zmQC7Zkq8wbY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8C37F80567;
	Thu, 19 May 2022 19:48:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34CA8F8055B; Thu, 19 May 2022 19:48:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4547F8051D
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 19:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4547F8051D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="hW5YzUwS"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k19F002261;
 Thu, 19 May 2022 12:47:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=lT5+Vd2K9nx9nebBMceyYbav4hKVz0RuGn2jqWZLaCs=;
 b=hW5YzUwSDtt/du9D7tB+AFXvzZuPeWcYS0Rx/5iiBoFbzBVG8uk+f0WL5Hwpdah+GOFw
 BUan4kxc1otN6RR7/mT9FAzckteb+KBa9hfpJcqBKOkQQIpJE3DI8EbvNZV7D0Z7LuL3
 VKmFOrWcZ5bb++BqK0rMrTMjybYijNlImxaPKpDgCulDgFs6WZnNXiqhqubfAZXBWZpG
 3OafSCFSi+MDt/LqPS4/XsgeuzyWeahVUJgtndRDb8SsZMfKg1zK2lVEnmFlMo41Pu+S
 gUkkxawV6QOexaDdINNUhpAl7ezXjHkUJK5GC8OQ3OqLLq7ZRblLrV5bhbpyJzfC0cjr Bg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37ted-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 12:47:56 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 18:47:55 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 18:47:55 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.59])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 51536458;
 Thu, 19 May 2022 17:47:55 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v3 13/17] ALSA: hda: cs35l41: Read Speaker Calibration data
 from UEFI variables
Date: Thu, 19 May 2022 18:47:45 +0100
Message-ID: <20220519174749.15459-14-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519174749.15459-1-vitalyr@opensource.cirrus.com>
References: <20220519174749.15459-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: qMteE48VueEwC7NqqKMd1iYup2WQRQSM
X-Proofpoint-ORIG-GUID: qMteE48VueEwC7NqqKMd1iYup2WQRQSM
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Stefan Binding <sbinding@opensource.cirrus.com>

Speaker Calibration data, specific to an individual speaker is
stored inside UEFI variables during calibration, and can be
used by the DSP.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---

Changes since v2:
 - Fixed building without CONFIG_EFI
 
 sound/pci/hda/cs35l41_hda.c | 63 +++++++++++++++++++++++++++++++++++++
 sound/pci/hda/cs35l41_hda.h | 15 +++++++++
 2 files changed, 78 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 9c622104bf01..016f97f61c34 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -26,6 +26,9 @@
 #define HALO_STATE_DSP_CTL_NAME		"HALO_STATE"
 #define HALO_STATE_DSP_CTL_TYPE		5
 #define HALO_STATE_DSP_CTL_ALG		262308
+#define CAL_R_DSP_CTL_NAME		"CAL_R"
+#define CAL_R_DSP_CTL_TYPE		5
+#define CAL_R_DSP_CTL_ALG		205
 
 static const struct reg_sequence cs35l41_hda_config[] = {
 	{ CS35L41_PLL_CLK_CTRL,		0x00000430 }, // 3072000Hz, BCLK Input, PLL_REFCLK_EN = 1
@@ -282,6 +285,61 @@ static int cs35l41_request_firmware_files(struct cs35l41_hda *cs35l41,
 	return ret;
 }
 
+#if IS_ENABLED(CONFIG_EFI)
+static int cs35l41_apply_calibration(struct cs35l41_hda *cs35l41)
+{
+	static efi_guid_t efi_guid = EFI_GUID(0x02f9af02, 0x7734, 0x4233, 0xb4, 0x3d, 0x93, 0xfe,
+					      0x5a, 0xa3, 0x5d, 0xb3);
+	static efi_char16_t efi_name[] = L"CirrusSmartAmpCalibrationData";
+	const struct cs35l41_amp_efi_data *efi_data;
+	const struct cs35l41_amp_cal_data *cl;
+	unsigned long data_size = 0;
+	efi_status_t status;
+	int ret = 0;
+	u8 *data = NULL;
+	u32 attr;
+	u32 r0;
+
+	/* Get real size of UEFI variable */
+	status = efi.get_variable(efi_name, &efi_guid, &attr, &data_size, data);
+	if (status == EFI_BUFFER_TOO_SMALL) {
+		ret = -ENODEV;
+		/* Allocate data buffer of data_size bytes */
+		data = vmalloc(data_size);
+		if (!data)
+			return -ENOMEM;
+		/* Get variable contents into buffer */
+		status = efi.get_variable(efi_name, &efi_guid, &attr, &data_size, data);
+		if (status == EFI_SUCCESS) {
+			efi_data = (struct cs35l41_amp_efi_data *)data;
+			dev_dbg(cs35l41->dev, "Calibration: Size=%d, Amp Count=%d\n",
+				efi_data->size, efi_data->count);
+			if (efi_data->count > cs35l41->index) {
+				cl = &efi_data->data[cs35l41->index];
+				dev_dbg(cs35l41->dev,
+					"Calibration: Ambient=%02x, Status=%02x, R0=%d\n",
+					cl->calAmbient, cl->calStatus, cl->calR);
+				r0 = cpu_to_be32(cl->calR);
+				ret = hda_cs_dsp_write_ctl(&cs35l41->cs_dsp, CAL_R_DSP_CTL_NAME,
+							   CAL_R_DSP_CTL_TYPE, CAL_R_DSP_CTL_ALG,
+							   &r0, 4);
+				if (ret)
+					dev_err(cs35l41->dev, "Cannot Write Control: %s - %d\n",
+						CAL_R_DSP_CTL_NAME, ret);
+			}
+		}
+		vfree(data);
+	}
+	return ret;
+}
+#else
+static int cs35l41_apply_calibration(struct cs35l41_hda *cs35l41)
+{
+	dev_warn(cs35l41->dev, "Calibration not supported without EFI support.\n");
+	return 0;
+}
+#endif
+
 static int cs35l41_init_dsp(struct cs35l41_hda *cs35l41)
 {
 	const struct firmware *coeff_firmware = NULL;
@@ -314,7 +372,12 @@ static int cs35l41_init_dsp(struct cs35l41_hda *cs35l41)
 
 	ret = cs_dsp_power_up(dsp, wmfw_firmware, wmfw_filename, coeff_firmware, coeff_filename,
 			      FW_NAME);
+	if (ret)
+		goto err_release;
+
+	ret = cs35l41_apply_calibration(cs35l41);
 
+err_release:
 	if (wmfw_firmware)
 		release_firmware(wmfw_firmware);
 	if (coeff_firmware)
diff --git a/sound/pci/hda/cs35l41_hda.h b/sound/pci/hda/cs35l41_hda.h
index 54521a013e78..3cf9871fbed2 100644
--- a/sound/pci/hda/cs35l41_hda.h
+++ b/sound/pci/hda/cs35l41_hda.h
@@ -10,6 +10,7 @@
 #ifndef __CS35L41_HDA_H__
 #define __CS35L41_HDA_H__
 
+#include <linux/efi.h>
 #include <linux/regulator/consumer.h>
 #include <linux/gpio/consumer.h>
 #include <linux/device.h>
@@ -18,6 +19,20 @@
 #include <linux/firmware/cirrus/cs_dsp.h>
 #include <linux/firmware/cirrus/wmfw.h>
 
+struct cs35l41_amp_cal_data {
+	u32 calTarget[2];
+	u32 calTime[2];
+	s8 calAmbient;
+	u8 calStatus;
+	u16 calR;
+} __packed;
+
+struct cs35l41_amp_efi_data {
+	u32 size;
+	u32 count;
+	struct cs35l41_amp_cal_data data[];
+} __packed;
+
 enum cs35l41_hda_spk_pos {
 	CS35l41_LEFT,
 	CS35l41_RIGHT,
-- 
2.34.1


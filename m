Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CB74963ED
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 18:27:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1794E2A27;
	Fri, 21 Jan 2022 18:26:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1794E2A27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642786058;
	bh=s+h7J4FWCQMqhxaVbGmVQBD2Lzfan4Jp1i+MsmVLpUc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dlhxyqcNcfFJZ1fWjkpOWjGP2dvtG3kVSmljRfcEo092d9a2l/24jD9606+S2Ou3K
	 It15wCi/Qm6onQaBbtDW5/SJZNt07NpKsuK0shRj4JzliwnxuheBensCbYgYac6NDN
	 5jyhQ5U3US2KSQ/vVkjPMKEj2X3ouyIAoBYWHd/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84110F80520;
	Fri, 21 Jan 2022 18:25:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A16FDF80508; Fri, 21 Jan 2022 18:25:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E9E1F80507
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 18:24:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E9E1F80507
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="JZqx2E8Y"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20LH9VJJ024708;
 Fri, 21 Jan 2022 11:24:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=YQUCoSxP+9+eIv2ZAagiW/8KjNXA5jCZTnaLW1fzb9I=;
 b=JZqx2E8Yb9ujcCtG4N7fm5rIlFifKQjT2HEw8INQ2XwzH6DC1jWtHm/cPgmf1MBgbOGk
 VTus2ZPA0BQyuAJGO09983cELQP46BrbTd/ZSi2Y3UvGCFOrxI8XXVDOK7fFtKOdmTf5
 vdmziJnHbjhpgaRE3wVqUCgRNyFQMBUXaytxkhGGIymkA0novMXbzzHLO/kQKJUMH/FQ
 NCeszn7vBdDFM82CavSgAHFjmmgXAJ3LhKvo3ch0b2FNuG4lvpXu+bCRN7cJN3QGIEMQ
 NwGjAUdqWPdhEG++XppGGk8gkO3UfVi9nz/GgRc2WhYW87Xr2u3CQAMYnoi2gqFyYwIY GA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dqhyq14dj-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 21 Jan 2022 11:24:54 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 21 Jan
 2022 17:24:52 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 21 Jan 2022 17:24:52 +0000
Received: from LONN2DGDQ73.ad.cirrus.com (unknown [198.90.238.138])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B8861B0E;
 Fri, 21 Jan 2022 17:24:51 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Len Brown <lenb@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <markgross@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v6 6/9] platform/x86: serial-multi-instantiate: Reorganize I2C
 functions
Date: Fri, 21 Jan 2022 17:24:28 +0000
Message-ID: <20220121172431.6876-7-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
References: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 91kiSRFsUrn1Ck8OkbH_3z_pV8Z3NCA3
X-Proofpoint-ORIG-GUID: 91kiSRFsUrn1Ck8OkbH_3z_pV8Z3NCA3
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 Stefan Binding <sbinding@opensource.cirrus.com>, linux-spi@vger.kernel.org
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

From: Lucas Tanure <tanureal@opensource.cirrus.com>

Reorganize I2C functions to accommodate SPI support
Split the probe and factor out parts of the code
that will be used in the SPI support
Also switched from strlcpy() to strscpy()

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 .../platform/x86/serial-multi-instantiate.c   | 144 +++++++++++-------
 1 file changed, 90 insertions(+), 54 deletions(-)

diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
index 33cbb0caed33..4cd6d72a0741 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -29,96 +29,132 @@ struct smi_instance {
 
 struct smi {
 	int i2c_num;
-	struct i2c_client *i2c_devs[];
+	struct i2c_client **i2c_devs;
 };
 
-static int smi_probe(struct platform_device *pdev)
+static int smi_get_irq(struct platform_device *pdev, struct acpi_device *adev,
+		       const struct smi_instance *inst)
+{
+	int ret;
+
+	switch (inst->flags & IRQ_RESOURCE_TYPE) {
+	case IRQ_RESOURCE_GPIO:
+		ret = acpi_dev_gpio_irq_get(adev, inst->irq_idx);
+		break;
+	case IRQ_RESOURCE_APIC:
+		ret = platform_get_irq(pdev, inst->irq_idx);
+		break;
+	default:
+		return 0;
+	}
+
+	if (ret < 0)
+		dev_err_probe(&pdev->dev, ret, "Error requesting irq at index %d: %d\n",
+			      inst->irq_idx, ret);
+
+	return ret;
+}
+
+static void smi_devs_unregister(struct smi *smi)
+{
+	while (smi->i2c_num > 0)
+		i2c_unregister_device(smi->i2c_devs[--smi->i2c_num]);
+}
+
+/**
+ * smi_i2c_probe - Instantiate multiple I2C devices from inst array
+ * @pdev:	Platform device
+ * @adev:	ACPI device
+ * @smi:	Internal struct for Serial multi instantiate driver
+ * @inst_array:	Array of instances to probe
+ *
+ * Returns the number of I2C devices instantiate, Zero if none is found or a negative error code.
+ */
+static int smi_i2c_probe(struct platform_device *pdev, struct acpi_device *adev, struct smi *smi,
+			 const struct smi_instance *inst_array)
 {
 	struct i2c_board_info board_info = {};
-	const struct smi_instance *inst;
 	struct device *dev = &pdev->dev;
-	struct acpi_device *adev;
-	struct smi *smi;
 	char name[32];
-	int i, ret;
+	int i, ret, count;
 
-	inst = device_get_match_data(dev);
-	if (!inst) {
-		dev_err(dev, "Error ACPI match data is missing\n");
-		return -ENODEV;
-	}
-
-	adev = ACPI_COMPANION(dev);
-
-	/* Count number of clients to instantiate */
 	ret = i2c_acpi_client_count(adev);
 	if (ret < 0)
 		return ret;
+	else if (!ret)
+		return -ENODEV;
 
-	smi = devm_kmalloc(dev, struct_size(smi, i2c_devs, ret), GFP_KERNEL);
-	if (!smi)
-		return -ENOMEM;
+	count = ret;
 
-	smi->i2c_num = ret;
+	smi->i2c_devs = devm_kcalloc(dev, count, sizeof(*smi->i2c_devs), GFP_KERNEL);
+	if (!smi->i2c_devs)
+		return -ENOMEM;
 
-	for (i = 0; i < smi->i2c_num && inst[i].type; i++) {
+	for (i = 0; i < count && inst_array[i].type; i++) {
 		memset(&board_info, 0, sizeof(board_info));
-		strlcpy(board_info.type, inst[i].type, I2C_NAME_SIZE);
-		snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev), inst[i].type, i);
+		strscpy(board_info.type, inst_array[i].type, I2C_NAME_SIZE);
+		snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev), inst_array[i].type, i);
 		board_info.dev_name = name;
-		switch (inst[i].flags & IRQ_RESOURCE_TYPE) {
-		case IRQ_RESOURCE_GPIO:
-			ret = acpi_dev_gpio_irq_get(adev, inst[i].irq_idx);
-			if (ret < 0) {
-				dev_err(dev, "Error requesting irq at index %d: %d\n",
-						inst[i].irq_idx, ret);
-				goto error;
-			}
-			board_info.irq = ret;
-			break;
-		case IRQ_RESOURCE_APIC:
-			ret = platform_get_irq(pdev, inst[i].irq_idx);
-			if (ret < 0) {
-				dev_dbg(dev, "Error requesting irq at index %d: %d\n",
-					inst[i].irq_idx, ret);
-				goto error;
-			}
-			board_info.irq = ret;
-			break;
-		default:
-			board_info.irq = 0;
-			break;
-		}
+
+		ret = smi_get_irq(pdev, adev, &inst_array[i]);
+		if (ret < 0)
+			goto error;
+		board_info.irq = ret;
+
 		smi->i2c_devs[i] = i2c_acpi_new_device(dev, i, &board_info);
 		if (IS_ERR(smi->i2c_devs[i])) {
 			ret = dev_err_probe(dev, PTR_ERR(smi->i2c_devs[i]),
 					    "Error creating i2c-client, idx %d\n", i);
 			goto error;
 		}
+		smi->i2c_num++;
 	}
-	if (i < smi->i2c_num) {
-		dev_err(dev, "Error finding driver, idx %d\n", i);
+	if (smi->i2c_num < count) {
+		dev_dbg(dev, "Error finding driver, idx %d\n", i);
 		ret = -ENODEV;
 		goto error;
 	}
 
-	platform_set_drvdata(pdev, smi);
-	return 0;
+	dev_info(dev, "Instantiated %d I2C devices.\n", smi->i2c_num);
 
+	return 0;
 error:
-	while (--i >= 0)
-		i2c_unregister_device(smi->i2c_devs[i]);
+	smi_devs_unregister(smi);
 
 	return ret;
 }
 
+static int smi_probe(struct platform_device *pdev)
+{
+	const struct smi_instance *inst_array;
+	struct device *dev = &pdev->dev;
+	struct acpi_device *adev;
+	struct smi *smi;
+
+	adev = ACPI_COMPANION(dev);
+	if (!adev)
+		return -ENODEV;
+
+	inst_array = device_get_match_data(dev);
+	if (!inst_array) {
+		dev_dbg(dev, "Error ACPI match data is missing\n");
+		return -ENODEV;
+	}
+
+	smi = devm_kzalloc(dev, sizeof(*smi), GFP_KERNEL);
+	if (!smi)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, smi);
+
+	return smi_i2c_probe(pdev, adev, smi, inst_array);
+}
+
 static int smi_remove(struct platform_device *pdev)
 {
 	struct smi *smi = platform_get_drvdata(pdev);
-	int i;
 
-	for (i = 0; i < smi->i2c_num; i++)
-		i2c_unregister_device(smi->i2c_devs[i]);
+	smi_devs_unregister(smi);
 
 	return 0;
 }
-- 
2.25.1


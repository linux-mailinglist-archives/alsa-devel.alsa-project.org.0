Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF9C7A95B7
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 18:31:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D513DDED;
	Thu, 21 Sep 2023 18:30:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D513DDED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695313859;
	bh=UD2Oc1hdKS+7ZO0RLSiuoG3XLVnJt5JKEG8LZq6CoEg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EulWXNO+/1zRr9AZzS/BvaKX4o9S/E66ACWtrjCyZI1CYuHFgwsqoN1+5Qse0wLpm
	 8T7TmsylzwTJ8TLqtMJRDTZr6KnXsPHbf9PPhAWGkRVguWcbLyt2WjD8dcPnIWgXRA
	 SrPrNj/TiMfLUqRKKV42JSQQ/bN7z0bMawvjYnJ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FC1CF80563; Thu, 21 Sep 2023 18:29:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A591F80564;
	Thu, 21 Sep 2023 18:29:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 794EEF80549; Thu, 21 Sep 2023 18:29:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4EE86F80494
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 18:29:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EE86F80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=XtkFuL0F
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38LFWYi5009262;
	Thu, 21 Sep 2023 11:28:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=p1Png+N6iCp2Y9Samkt3Ejdu6Hik57jvhh5dG+CbAjM=; b=
	XtkFuL0FgfGYDd00xhJV05PLOISiBVx4X8LuRXiHgyc6BWObLVeQ3gxDyqOxbwRA
	1U9Iem3JyuJQEumfpXnjqh6lmSx6KAG34PKrpK0OLj3ZzovAYpLWsfGmqadfWf1T
	eRjsYAskD04TLwVAiP2aoyZ3I8s6GMWMFk09xS3PUva2E27w3pWZsfGmRgCA8U7I
	4AxJz9l673DYkbD7PwlIEYUEXF+44Fk93SamPysnYqZ/Xk437UvSZuE94j8Zamf4
	xzymLTStzAAmpM9CqanBE/0rDs5YGLK/cTL7uwurEhnpCLqALPDsSTrPTdVXz/Ry
	TfI2QW7kz69cSkQhnjUEoQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t58shx0ab-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 11:28:59 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 21 Sep
 2023 17:28:57 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Thu, 21 Sep 2023 17:28:57 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.135])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3D47B15B9;
	Thu, 21 Sep 2023 16:28:57 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v5 2/4] ALSA: hda/realtek: Support ACPI Notification framework
 via component binding
Date: Thu, 21 Sep 2023 17:28:47 +0100
Message-ID: <20230921162849.1988124-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921162849.1988124-1-sbinding@opensource.cirrus.com>
References: <20230921162849.1988124-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Mj6zCoeq71EVG4BdInqjfA3StwOxbG4x
X-Proofpoint-ORIG-GUID: Mj6zCoeq71EVG4BdInqjfA3StwOxbG4x
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: JISSK7GG223QMUFXUTVTBIPXKL2VLBVF
X-Message-ID-Hash: JISSK7GG223QMUFXUTVTBIPXKL2VLBVF
X-MailFrom: prvs=462875a41c=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JISSK7GG223QMUFXUTVTBIPXKL2VLBVF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For systems which have support for ACPI notifications, add a mechanism to
register a handler for ACPI notifications and then call the acpi_notify
api on the bound components.

Registering a handler in the Realtek HDA driver, allows a single handler to
be registered, which then calls into all the components, rather than
attempting to register the same handler multiple times, once for each
component.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/patch_realtek.c | 83 ++++++++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 883a7e865bc5..1e2b6a299dbc 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10,6 +10,7 @@
  *                    Jonathan Woithe <jwoithe@just42.net>
  */
 
+#include <linux/acpi.h>
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
@@ -6704,12 +6705,91 @@ static void alc287_fixup_legion_15imhg05_speakers(struct hda_codec *codec,
 	}
 }
 
+#ifdef CONFIG_ACPI
+static void comp_acpi_device_notify(acpi_handle handle, u32 event, void *data)
+{
+	struct hda_codec *cdc = data;
+	struct alc_spec *spec = cdc->spec;
+	int i;
+
+	codec_info(cdc, "ACPI Notification %d\n", event);
+
+	for (i = 0; i < HDA_MAX_COMPONENTS; i++) {
+		if (spec->comps[i].dev && spec->comps[i].acpi_notify)
+			spec->comps[i].acpi_notify(acpi_device_handle(spec->comps[i].adev), event,
+						   spec->comps[i].dev);
+	}
+}
+
+static int comp_bind_acpi(struct device *dev)
+{
+	struct hda_codec *cdc = dev_to_hda_codec(dev);
+	struct alc_spec *spec = cdc->spec;
+	bool support_notifications = false;
+	struct acpi_device *adev;
+	int ret;
+	int i;
+
+	adev = spec->comps[0].adev;
+	if (!acpi_device_handle(adev))
+		return 0;
+
+	for (i = 0; i < HDA_MAX_COMPONENTS; i++)
+		support_notifications = support_notifications ||
+			spec->comps[i].acpi_notifications_supported;
+
+	if (support_notifications) {
+		ret = acpi_install_notify_handler(adev->handle, ACPI_DEVICE_NOTIFY,
+						comp_acpi_device_notify, cdc);
+		if (ret < 0) {
+			codec_warn(cdc, "Failed to install notify handler: %d\n", ret);
+			return 0;
+		}
+
+		codec_dbg(cdc, "Notify handler installed\n");
+	}
+
+	return 0;
+}
+
+static void comp_unbind_acpi(struct device *dev)
+{
+	struct hda_codec *cdc = dev_to_hda_codec(dev);
+	struct alc_spec *spec = cdc->spec;
+	struct acpi_device *adev;
+	int ret;
+
+	adev = spec->comps[0].adev;
+	if (!acpi_device_handle(adev))
+		return;
+
+	ret = acpi_remove_notify_handler(adev->handle, ACPI_DEVICE_NOTIFY,
+					 comp_acpi_device_notify);
+	if (ret < 0)
+		codec_warn(cdc, "Failed to uninstall notify handler: %d\n", ret);
+}
+#else
+static int comp_bind_acpi(struct device *dev)
+{
+	return 0;
+}
+
+static void comp_unbind_acpi(struct device *dev)
+{
+}
+#endif
+
 static int comp_bind(struct device *dev)
 {
 	struct hda_codec *cdc = dev_to_hda_codec(dev);
 	struct alc_spec *spec = cdc->spec;
+	int ret;
+
+	ret = component_bind_all(dev, spec->comps);
+	if (ret)
+		return ret;
 
-	return component_bind_all(dev, spec->comps);
+	return comp_bind_acpi(dev);
 }
 
 static void comp_unbind(struct device *dev)
@@ -6717,6 +6797,7 @@ static void comp_unbind(struct device *dev)
 	struct hda_codec *cdc = dev_to_hda_codec(dev);
 	struct alc_spec *spec = cdc->spec;
 
+	comp_unbind_acpi(dev);
 	component_unbind_all(dev, spec->comps);
 }
 
-- 
2.34.1


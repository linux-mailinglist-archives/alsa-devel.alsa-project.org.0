Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A3679D661
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 18:34:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83385950;
	Tue, 12 Sep 2023 18:33:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83385950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694536443;
	bh=2vBIEQ8X6bwytnFEBbfOpMy0Yj3ViBWRqTxVBM2Avfk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HweIfaj6XbLlVG5NLELWI4BARDY0JcCPJCbVgN3gW4gEKuQrzyN8jPmhBYNqPyda5
	 kCNeRyGYahkMJh1y8gdROjccX17ukcNuVLhO3hbxZIOr05W1YizILoi+9Zj1f2Bqwo
	 LgEjxGEbGEFNtGqlf+i4LcUhfryjxgWJSk0qUCL4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACA14F80570; Tue, 12 Sep 2023 18:32:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B1B9F8055B;
	Tue, 12 Sep 2023 18:32:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76F46F80537; Tue, 12 Sep 2023 18:32:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3D41F80246
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 18:32:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3D41F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=qpYV6TEQ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38CFSmv8002448;
	Tue, 12 Sep 2023 11:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=Rr6lXL3LtOXOlIrtorpBwjgzzvf6AwbEgVb5NSht5y8=; b=
	qpYV6TEQfr6faHaHkgmQTJjwRPvahx6fYNeJKX7slRj77mlE3KRbszsZYn40ubX8
	1cekwg7OzWdzk5HcCDWCB1tHQHOdI7UU4kmVAEhE7Kqur8y/yEMyUo3lUOCx5Txo
	G6/TtZQ6jjReC5TnP4ERCa0l/ixOglmpqC87fa6UCxLVST9tPw+fT9SivFWG6WeL
	2++WHo5BCqgvL+J9AI8qfFEe/ponJQph9AQFzbIJVDO5G6YPbpsx6ErAf5k9+MJK
	Y5Om0MnuL/61atGkBOvEYg8v1L35i4vIc+vjw61dAarVZbJzHrVBZi2hXXhSdzUV
	KGyFNsh9qAm52p4242wWsA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t0p3xkxdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 11:32:10 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 12 Sep
 2023 17:32:08 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Tue, 12 Sep 2023 17:32:08 +0100
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.125])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F19A115B6;
	Tue, 12 Sep 2023 16:32:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <yung-chuan.liao@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
        <peter.ujfalusi@linux.intel.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 2/4] ASoC: SOF: Pass PCI SSID to machine driver
Date: Tue, 12 Sep 2023 17:32:05 +0100
Message-ID: <20230912163207.3498161-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230912163207.3498161-1-rf@opensource.cirrus.com>
References: <20230912163207.3498161-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: OfR6-QC06i1vuM7mxdr9uE_5p7vc3GuM
X-Proofpoint-GUID: OfR6-QC06i1vuM7mxdr9uE_5p7vc3GuM
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: AIXDK3SM5KXL6TI65ZFJGFAWXTDKZPX3
X-Message-ID-Hash: AIXDK3SM5KXL6TI65ZFJGFAWXTDKZPX3
X-MailFrom: prvs=4619193f72=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AIXDK3SM5KXL6TI65ZFJGFAWXTDKZPX3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Pass the PCI SSID of the audio interface through to the machine driver.
This allows the machine driver to use the SSID to uniquely identify the
specific hardware configuration and apply any platform-specific
configuration.

struct snd_sof_pdata is passed around inside the SOF code, but it then
passes configuration information to the machine driver through
struct snd_soc_acpi_mach and struct snd_soc_acpi_mach_params. So SSID
information has been added to both snd_sof_pdata and
snd_soc_acpi_mach_params.

PCI does not define 0x0000 as an invalid value so we can't use zero to
indicate that the struct member was not written. Instead a flag is
included to indicate that a value has been written to the
subsystem_vendor and subsystem_device members.

sof_pci_probe() creates the struct snd_sof_pdata. It is passed a struct
pci_dev so it can fill in the SSID value.

sof_machine_check() finds the appropriate struct snd_soc_acpi_mach. It
copies the SSID information across to the struct snd_soc_acpi_mach_params.
This done before calling any custom set_mach_params() so that it could be
used by the set_mach_params() callback to apply variant params.

The machine driver receives the struct snd_soc_acpi_mach as its
platform_data.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/soc-acpi.h    | 7 +++++++
 include/sound/sof.h         | 8 ++++++++
 sound/soc/sof/sof-audio.c   | 7 +++++++
 sound/soc/sof/sof-pci-dev.c | 8 ++++++++
 4 files changed, 30 insertions(+)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index 6d31d535e8f6..23d6d6bfb073 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -68,6 +68,10 @@ static inline struct snd_soc_acpi_mach *snd_soc_acpi_codec_list(void *arg)
  * @i2s_link_mask: I2S/TDM links enabled on the board
  * @num_dai_drivers: number of elements in @dai_drivers
  * @dai_drivers: pointer to dai_drivers, used e.g. in nocodec mode
+ * @subsystem_vendor: optional PCI SSID vendor value
+ * @subsystem_device: optional PCI SSID device value
+ * @subsystem_id_set: true if a value has been written to
+ *		      subsystem_vendor and subsystem_device.
  */
 struct snd_soc_acpi_mach_params {
 	u32 acpi_ipc_irq_index;
@@ -80,6 +84,9 @@ struct snd_soc_acpi_mach_params {
 	u32 i2s_link_mask;
 	u32 num_dai_drivers;
 	struct snd_soc_dai_driver *dai_drivers;
+	unsigned short subsystem_vendor;
+	unsigned short subsystem_device;
+	bool subsystem_id_set;
 };
 
 /**
diff --git a/include/sound/sof.h b/include/sound/sof.h
index d3c41f87ac31..51294f2ba302 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -64,6 +64,14 @@ struct snd_sof_pdata {
 	const char *name;
 	const char *platform;
 
+	/*
+	 * PCI SSID. As PCI does not define 0 as invalid, the subsystem_id_set
+	 * flag indicates that a value has been written to these members.
+	 */
+	unsigned short subsystem_vendor;
+	unsigned short subsystem_device;
+	bool subsystem_id_set;
+
 	struct device *dev;
 
 	/*
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index e7ef77012c35..9c2359d10ecf 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -1031,6 +1031,13 @@ int sof_machine_check(struct snd_sof_dev *sdev)
 		mach = snd_sof_machine_select(sdev);
 		if (mach) {
 			sof_pdata->machine = mach;
+
+			if (sof_pdata->subsystem_id_set) {
+				mach->mach_params.subsystem_vendor = sof_pdata->subsystem_vendor;
+				mach->mach_params.subsystem_device = sof_pdata->subsystem_device;
+				mach->mach_params.subsystem_id_set = true;
+			}
+
 			snd_sof_set_mach_params(mach, sdev);
 			return 0;
 		}
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index f5ece43d0ec2..146d25983b08 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -214,6 +214,14 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 		return ret;
 
 	sof_pdata->name = pci_name(pci);
+
+	/* PCI defines a vendor ID of 0xFFFF as invalid. */
+	if (pci->subsystem_vendor != 0xFFFF) {
+		sof_pdata->subsystem_vendor = pci->subsystem_vendor;
+		sof_pdata->subsystem_device = pci->subsystem_device;
+		sof_pdata->subsystem_id_set = true;
+	}
+
 	sof_pdata->desc = desc;
 	sof_pdata->dev = dev;
 
-- 
2.30.2


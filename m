Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AB171A3C4
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 18:07:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DC06DF8;
	Thu,  1 Jun 2023 18:06:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DC06DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685635647;
	bh=V6JUoxjtm4PUKEn4l1ZyPWDorh521645NQAVwnUHi28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BsQvKm7VaiO2Y1NAlsduSduF4/d1+np5gdVhzbfnfM0Whop65uWiizq9nQ3hRYhGv
	 aYzJfX5D9X8OX1gmPUdUi6OqR2nacx/XO2J+3rwSmCVZSZ5GEg75wrd+oynAeknJtU
	 Yee9p5xO2Ld+QwuPvjmUwV24dWGyHev+WmkB4QcU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7229F8061A; Thu,  1 Jun 2023 18:03:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 306CDF8060F;
	Thu,  1 Jun 2023 18:03:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FD69F804FC; Wed, 31 May 2023 05:21:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id 13DDCF80086
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 05:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13DDCF80086
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8DxuPFEvXZkz9MCAA--.6324S3;
	Wed, 31 May 2023 11:21:40 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx77M_vXZkqrWBAA--.14943S3;
	Wed, 31 May 2023 11:21:40 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: tiwai@suse.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	perex@perex.cz,
	chenhuacai@loongson.cn,
	mengyingkun@loongson.cn,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH 1/4] ALSA: hda: Add Loongson LS7A HD-Audio support
Date: Wed, 31 May 2023 11:21:31 +0800
Message-Id: 
 <0b9480e89df63804db504554f441cc648fe5c2ef.1685501806.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
In-Reply-To: <cover.1685501806.git.siyanteng@loongson.cn>
References: <cover.1685501806.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx77M_vXZkqrWBAA--.14943S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxWF48Xw43urW7ZryrCFy7trb_yoWrJF4fpr
	1kZryUKFZ7tFWYyF4DG3WDKFyfC3WDCFn8urW29w1xuFna9w4xX34Dur45AFWavrW3Wrya
	grWqk3s7ZFW3Jw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr
	0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU82g43UUUUU==
X-MailFrom: siyanteng@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VW3IDQZ4KV3TWMMVY2MWKXFUK4ZBPY4C
X-Message-ID-Hash: VW3IDQZ4KV3TWMMVY2MWKXFUK4ZBPY4C
X-Mailman-Approved-At: Thu, 01 Jun 2023 16:02:28 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VW3IDQZ4KV3TWMMVY2MWKXFUK4ZBPY4C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the new PCI ID 0x0014 0x7a07 and the new PCI ID 0x0014 0x7a37
Loongson HDA controller.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 include/linux/pci_ids.h        | 3 +++
 sound/hda/hdac_device.c        | 1 +
 sound/pci/hda/hda_controller.h | 1 +
 sound/pci/hda/hda_intel.c      | 7 +++++++
 sound/pci/hda/patch_hdmi.c     | 1 +
 5 files changed, 13 insertions(+)

diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index e43ab203054a..f2aecb78f628 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -158,6 +158,9 @@
 
 #define PCI_VENDOR_ID_LOONGSON		0x0014
 
+#define PCI_DEVICE_ID_LOONGSON_HDA      0x7a07
+#define PCI_DEVICE_ID_LOONGSON_HDMI     0x7a37
+
 #define PCI_VENDOR_ID_SOLIDIGM		0x025e
 
 #define PCI_VENDOR_ID_TTTECH		0x0357
diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index 6c043fbd606f..bbf7bcdb449a 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -645,6 +645,7 @@ struct hda_vendor_id {
 };
 
 static const struct hda_vendor_id hda_vendor_ids[] = {
+	{ 0x0014, "Loongson" },
 	{ 0x1002, "ATI" },
 	{ 0x1013, "Cirrus Logic" },
 	{ 0x1057, "Motorola" },
diff --git a/sound/pci/hda/hda_controller.h b/sound/pci/hda/hda_controller.h
index 8556031bcd68..1fd60246412f 100644
--- a/sound/pci/hda/hda_controller.h
+++ b/sound/pci/hda/hda_controller.h
@@ -45,6 +45,7 @@
 #define AZX_DCAPS_CORBRP_SELF_CLEAR (1 << 28)	/* CORBRP clears itself after reset */
 #define AZX_DCAPS_NO_MSI64      (1 << 29)	/* Stick to 32-bit MSIs */
 #define AZX_DCAPS_SEPARATE_STREAM_TAG	(1 << 30) /* capture and playback use separate stream tag */
+#define AZX_DCAPS_LOONGSON_WORKAROUND (1 << 31)    /* Loongson workaround */
 
 enum {
 	AZX_SNOOP_TYPE_NONE,
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 3226691ac923..f28806b3e308 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -237,6 +237,7 @@ enum {
 	AZX_DRIVER_CTHDA,
 	AZX_DRIVER_CMEDIA,
 	AZX_DRIVER_ZHAOXIN,
+	AZX_DRIVER_LOONGSON,
 	AZX_DRIVER_GENERIC,
 	AZX_NUM_DRIVERS, /* keep this as last entry */
 };
@@ -360,6 +361,7 @@ static const char * const driver_short_names[] = {
 	[AZX_DRIVER_CTHDA] = "HDA Creative",
 	[AZX_DRIVER_CMEDIA] = "HDA C-Media",
 	[AZX_DRIVER_ZHAOXIN] = "HDA Zhaoxin",
+	[AZX_DRIVER_LOONGSON] = "HDA Loongson",
 	[AZX_DRIVER_GENERIC] = "HD-Audio Generic",
 };
 
@@ -2809,6 +2811,11 @@ static const struct pci_device_id azx_ids[] = {
 	  .driver_data = AZX_DRIVER_GENERIC | AZX_DCAPS_PRESET_ATI_HDMI },
 	/* Zhaoxin */
 	{ PCI_DEVICE(0x1d17, 0x3288), .driver_data = AZX_DRIVER_ZHAOXIN },
+	/* Loongson HDAudio*/
+	{PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, PCI_DEVICE_ID_LOONGSON_HDA),
+	  .driver_data = AZX_DRIVER_LOONGSON | AZX_DCAPS_LOONGSON_WORKAROUND },
+	{PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, PCI_DEVICE_ID_LOONGSON_HDMI),
+	  .driver_data = AZX_DRIVER_LOONGSON | AZX_DCAPS_LOONGSON_WORKAROUND },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, azx_ids);
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 5c0b1a09fd57..260d3e64f658 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -4505,6 +4505,7 @@ static int patch_gf_hdmi(struct hda_codec *codec)
  * patch entries
  */
 static const struct hda_device_id snd_hda_id_hdmi[] = {
+HDA_CODEC_ENTRY(0x00147a47, "Loongson HDMI",	patch_generic_hdmi),
 HDA_CODEC_ENTRY(0x1002793c, "RS600 HDMI",	patch_atihdmi),
 HDA_CODEC_ENTRY(0x10027919, "RS600 HDMI",	patch_atihdmi),
 HDA_CODEC_ENTRY(0x1002791a, "RS690/780 HDMI",	patch_atihdmi),
-- 
2.31.4


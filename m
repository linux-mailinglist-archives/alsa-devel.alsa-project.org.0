Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C8B729D40
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:48:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D577182A;
	Fri,  9 Jun 2023 16:47:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D577182A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322129;
	bh=D4zNE3QN7oj5n2sD6QcdLycLNqpXmybbjtBW400QNrM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BI85e12UlwsOdhA0J0P3dG5PQaT7NmVe8VQq5OzzTZhDElrUSaHT36bJH6zFjDhQz
	 hpyRsuoUWAjMRoE1cHNgJcoZ3Z3wF2BiQcYOIHMg7iqyqIP32PiZ7+v1CpWqjCAKSg
	 RSJzpkSeKB8T5Xz9n/8ndUufqRzIyTA9gyceMq74=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EFFEF80563; Fri,  9 Jun 2023 16:47:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B0BCF8055A;
	Fri,  9 Jun 2023 16:47:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62486F80254; Wed,  7 Jun 2023 11:23:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D072F80130
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 11:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D072F80130
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8DxSuo3TIBkTBcAAA--.340S3;
	Wed, 07 Jun 2023 17:21:59 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxNeQ2TIBkvzcEAA--.14996S3;
	Wed, 07 Jun 2023 17:21:59 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: tiwai@suse.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	perex@perex.cz,
	chenhuacai@loongson.cn,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH RESEND v3 1/4] ALSA: hda: Add Loongson LS7A HD-Audio support
Date: Wed,  7 Jun 2023 17:21:49 +0800
Message-Id: 
 <993587483b9509796b29a416f257fcfb4b15c6ea.1686128807.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
In-Reply-To: <cover.1686128807.git.siyanteng@loongson.cn>
References: <cover.1686128807.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxNeQ2TIBkvzcEAA--.14996S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGFy8GrW7KrWkAFy5Xry8tFc_yoW5AFWfpr
	4kZryjkFZ7JrWYvr4DW3ZrKF9rC3WDA3WDurW29w1xuFn2yw4Sqa4Dur45ZF4ayrW7WFya
	grWqk34xuayUJwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU90b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x07jr6p9UUUUU=
X-MailFrom: siyanteng@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KMDORYFHLZTQVLESR2GFOZP322T4ZQC5
X-Message-ID-Hash: KMDORYFHLZTQVLESR2GFOZP322T4ZQC5
X-Mailman-Approved-At: Fri, 09 Jun 2023 14:46:44 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KMDORYFHLZTQVLESR2GFOZP322T4ZQC5/>
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
 include/linux/pci_ids.h    | 3 +++
 sound/hda/hdac_device.c    | 1 +
 sound/pci/hda/hda_intel.c  | 7 +++++++
 sound/pci/hda/patch_hdmi.c | 1 +
 4 files changed, 12 insertions(+)

diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 22f4be95b3f1..543998b44e4c 100644
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
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 3226691ac923..9c353dc7740c 100644
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
+	  .driver_data = AZX_DRIVER_LOONGSON },
+	{PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, PCI_DEVICE_ID_LOONGSON_HDMI),
+	  .driver_data = AZX_DRIVER_LOONGSON },
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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A14775E659
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 03:18:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD7777F8;
	Mon, 24 Jul 2023 03:17:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD7777F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690161516;
	bh=EoafBzWmDJ3kWSsMKu7+HRgCtqL6cpNWPTUqn9i5E8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CiScXBGMwzY9oi/aOmW40J5b/JMROQGVInwPRwdrm7935WRxdhkQdMRWi0IJ5zVKq
	 G5D1/ra/gvM/LIMR14h2iv5kSAcMdFyNk4dyNShOj8hzCHVQuKcd109Y1aeGz+HtnL
	 REt6E2otLLhIdT/LldVK7/hnxak6k3EBKqMVghAQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43B32F80153; Mon, 24 Jul 2023 03:17:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63CD5F80153;
	Mon, 24 Jul 2023 03:17:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C27FF8019B; Mon, 24 Jul 2023 03:17:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A672F800C7
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 03:16:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A672F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jFHL5tHE
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1B7B860F14;
	Mon, 24 Jul 2023 01:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5504C433CD;
	Mon, 24 Jul 2023 01:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690161416;
	bh=EoafBzWmDJ3kWSsMKu7+HRgCtqL6cpNWPTUqn9i5E8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jFHL5tHEkv31Z2bC3fT7fWnms9FLa+ARqI9sVCDIgJFESwx3NSkvfaSv9YiB1EAy8
	 /nETlMG2Vt3KzUmLit7r11KDldxZKrM5Nun66OQQcl5BoHHNqcPb8QnNuqIdGGULMT
	 u0dgqKQZexG4eKDXN+Qf+6To3uEW3LS/+ezd1210bB4tVQaFX3bbMP1ODNWuha5gyh
	 /RX2x0cMCAtVM5NdyZ2xfBpnRPHa/uE44Id+Wf/EB0vagZuNZzn1zxnFnijxR0Qs0K
	 kstlxC6rvqHZeW/Ycctb29SjFrvhoDqo72B1oNSpu0Qm5R755kuWda/KRRpUsy/Acm
	 LAYqEtdm5sVVw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yanteng Si <siyanteng@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	bhelgaas@google.com,
	perex@perex.cz,
	tiwai@suse.com,
	rafael@kernel.org,
	chenhuacai@kernel.org,
	gregkh@linuxfoundation.org,
	pierre-louis.bossart@linux.intel.com,
	mengyingkun@loongson.cn,
	fred.oh@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	jasontao@glenfly.com,
	amadeuszx.slawinski@linux.intel.com,
	mkumard@nvidia.com,
	linux-pci@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.4 28/58] ALSA: hda: Add Loongson LS7A HD-Audio
 support
Date: Sun, 23 Jul 2023 21:12:56 -0400
Message-Id: <20230724011338.2298062-28-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724011338.2298062-1-sashal@kernel.org>
References: <20230724011338.2298062-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.5
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OZIVDRXAN67JIXCZCWZYDAXG6T4SHWA4
X-Message-ID-Hash: OZIVDRXAN67JIXCZCWZYDAXG6T4SHWA4
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OZIVDRXAN67JIXCZCWZYDAXG6T4SHWA4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Yanteng Si <siyanteng@loongson.cn>

[ Upstream commit 28bd137a3c8e105587ba8c55b68ef43b519b270f ]

Add the new PCI ID 0x0014 0x7a07 and the new PCI ID 0x0014 0x7a37
Loongson HDA controller.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Acked-by: Huacai Chen <chenhuacai@loongson.cn>
Link: https://lore.kernel.org/r/993587483b9509796b29a416f257fcfb4b15c6ea.1686128807.git.siyanteng@loongson.cn
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/linux/pci_ids.h    | 3 +++
 sound/hda/hdac_device.c    | 1 +
 sound/pci/hda/hda_intel.c  | 7 +++++++
 sound/pci/hda/patch_hdmi.c | 1 +
 4 files changed, 12 insertions(+)

diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 95f33dadb2be2..c0c4ca8e28510 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -158,6 +158,9 @@
 
 #define PCI_VENDOR_ID_LOONGSON		0x0014
 
+#define PCI_DEVICE_ID_LOONGSON_HDA      0x7a07
+#define PCI_DEVICE_ID_LOONGSON_HDMI     0x7a37
+
 #define PCI_VENDOR_ID_TTTECH		0x0357
 #define PCI_DEVICE_ID_TTTECH_MC322	0x000a
 
diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index 6c043fbd606f1..bbf7bcdb449a8 100644
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
index 3226691ac923c..9c353dc7740c4 100644
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
index 5c0b1a09fd57c..260d3e64f6589 100644
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
2.39.2


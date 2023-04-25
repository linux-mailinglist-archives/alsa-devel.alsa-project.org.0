Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7616F2EC7
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 08:41:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CB83176C;
	Mon,  1 May 2023 08:41:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CB83176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682923317;
	bh=VAqrzoSv66udt6uWajaNDqFRvur1KgmG620NA20D2eo=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hz8vqvOjMpUu8ERAGCmLuBzEvlvS9ppDuzmgC00TZNBXB4BpfLPG4bIwNW/QBFMsR
	 NsgprKubznrbEhqccBqqRpume72agc2qFiEREGCeptFTh2Pidr17dko1A936m8UXQO
	 0r4hBUIcpgZD1vkYVU7nXpww6XYCucUkuSyRjLFA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F59BF8052E;
	Mon,  1 May 2023 08:40:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34D2DF80236; Tue, 25 Apr 2023 12:10:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from gfmail2.glenfly.com (unknown [113.31.180.36])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B984F80104
	for <alsa-devel@alsa-project.org>; Tue, 25 Apr 2023 12:10:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B984F80104
X-ASG-Debug-ID: 1682417406-196b961945142490001-UKjUFf
Received: from GFSHEXCH03.glenfly.com (GFSHEXCH03.glenfly.com [10.5.250.53])
 by gfmail2.glenfly.com with ESMTP id yIRkw841eh1FqKQv;
 Tue, 25 Apr 2023 18:10:06 +0800 (CST)
X-Barracuda-Envelope-From: ReaperLiOC@glenfly.com
X-Barracuda-RBL-Trusted-Forwarder: 10.5.250.53
Received: from sqa-PC.glenfly.com (10.30.16.40) by GFSHEXCH03.glenfly.com
 (10.5.250.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 25 Apr
 2023 18:10:29 +0800
From: Reaper Li <reaperlioc@glenfly.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.5.250.53
To: <tiwai@suse.com>, <perex@perex.cz>
Subject: [PATCH v2] ALSA: hda: Glenfly: add HD Audio PCI IDs and HDMI Codec
 Vendor IDs.
Date: Tue, 25 Apr 2023 18:15:24 +0800
X-ASG-Orig-Subj: [PATCH v2] ALSA: hda: Glenfly: add HD Audio PCI IDs and HDMI
 Codec Vendor IDs.
Message-ID: <20230425101524.8020-1-reaperlioc@glenfly.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.30.16.40]
X-ClientProxiedBy: GFSHEXCH02.glenfly.com (10.5.250.52) To
 GFSHEXCH03.glenfly.com (10.5.250.53)
X-Barracuda-Connect: GFSHEXCH03.glenfly.com[10.5.250.53]
X-Barracuda-Start-Time: 1682417406
X-Barracuda-URL: https://10.5.252.52:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at glenfly.com
X-Barracuda-Scan-Msg-Size: 5079
X-Barracuda-Bayes: SPAM GLOBAL 1.0000 1.0000 4.3430
X-Barracuda-Spam-Score: 4.34
X-Barracuda-Spam-Status: No,
 SCORE=4.34 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0
 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.107903
	Rule breakdown below
	 pts rule name              description
	---- ----------------------
 --------------------------------------------------
X-MailFrom: ReaperLiOC@glenfly.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZDIKV5IOETVMLNFGNMMUYFQVQMLLV5YG
X-Message-ID-Hash: ZDIKV5IOETVMLNFGNMMUYFQVQMLLV5YG
X-Mailman-Approved-At: Mon, 01 May 2023 06:39:02 +0000
CC: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 jasontao <jasontao@glenfly.com>, Reaper Li <reaperlioc@glenfly.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZDIKV5IOETVMLNFGNMMUYFQVQMLLV5YG/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: jasontao <jasontao@glenfly.com>

Add a set of HD Audio PCI IDS, and the HDMI codec vendor IDs for
Glenfly Gpus.

- In default_bdl_pos_adj, set bdl to 128 as Glenfly Gpus have hardware
limitation, need to increase hdac interrupt interval.
- In azx_first_init, enable polling mode for Glenfly Gpu. When the codec
complete the command, it sends interrupt and writes response entries to
memory, howerver, the write requests sometimes are not actually
synchronized to memory when driver handle hdac interrupt on Glenfly Gpus.
If the RIRB status is not updated in the interrupt handler,
azx_rirb_get_response keeps trying to recevie a response from rirb until
1s timeout. Enabling polling mode for Glenfly Gpu can fix the issue.
- In patch_gf_hdmi, set Glenlfy Gpu Codec's no_sticky_stream as it need
driver to do actual clean-ups for the linked codec when switch from one
codec to another.

Signed-off-by: jasontao <jasontao@glenfly.com>
Signed-off-by: Reaper Li <reaperlioc@glenfly.com>
---
v2: add some comments for code and details in the commit log.

 sound/pci/hda/hda_intel.c  | 17 +++++++++++++++++
 sound/pci/hda/patch_hdmi.c | 20 ++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 77a592f21..0d6bf3ac6 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -227,6 +227,7 @@ enum {
 	AZX_DRIVER_ATI,
 	AZX_DRIVER_ATIHDMI,
 	AZX_DRIVER_ATIHDMI_NS,
+	AZX_DRIVER_GFHDMI,
 	AZX_DRIVER_VIA,
 	AZX_DRIVER_SIS,
 	AZX_DRIVER_ULI,
@@ -349,6 +350,7 @@ static const char * const driver_short_names[] = {
 	[AZX_DRIVER_ATI] = "HDA ATI SB",
 	[AZX_DRIVER_ATIHDMI] = "HDA ATI HDMI",
 	[AZX_DRIVER_ATIHDMI_NS] = "HDA ATI HDMI",
+	[AZX_DRIVER_GFHDMI] = "HDA GF HDMI",
 	[AZX_DRIVER_VIA] = "HDA VIA VT82xx",
 	[AZX_DRIVER_SIS] = "HDA SIS966",
 	[AZX_DRIVER_ULI] = "HDA ULI M5461",
@@ -1743,6 +1745,10 @@ static int default_bdl_pos_adj(struct azx *chip)
 	}
 
 	switch (chip->driver_type) {
+	/* increase the bdl size for Glenfly Gpus for hardware
+	 * limitation on hdac interrupt interval */
+	case AZX_DRIVER_GFHDMI:
+		return 128;
 	case AZX_DRIVER_ICH:
 	case AZX_DRIVER_PCH:
 		return 1;
@@ -1858,6 +1864,10 @@ static int azx_first_init(struct azx *chip)
 		pci_write_config_dword(pci, PCI_BASE_ADDRESS_1, 0);
 	}
 #endif
+	/* Fix reponse write request not synced to memory when handle
+	 * hdac interrupt on Glenfly Gpus */
+	if (chip->driver_type == AZX_DRIVER_GFHDMI)
+		bus->polling_mode = 1;
 
 	err = pcim_iomap_regions(pci, 1 << 0, "ICH HD audio");
 	if (err < 0)
@@ -1959,6 +1969,7 @@ static int azx_first_init(struct azx *chip)
 			chip->playback_streams = ATIHDMI_NUM_PLAYBACK;
 			chip->capture_streams = ATIHDMI_NUM_CAPTURE;
 			break;
+		case AZX_DRIVER_GFHDMI:
 		case AZX_DRIVER_GENERIC:
 		default:
 			chip->playback_streams = ICH6_NUM_PLAYBACK;
@@ -2724,6 +2735,12 @@ static const struct pci_device_id azx_ids[] = {
 	{ PCI_DEVICE(0x1002, 0xab38),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
 	  AZX_DCAPS_PM_RUNTIME },
+	/* GLENFLY */
+	{ PCI_DEVICE(0x6766, PCI_ANY_ID),
+	  .class = PCI_CLASS_MULTIMEDIA_HD_AUDIO << 8,
+	  .class_mask = 0xffffff,
+	  .driver_data = AZX_DRIVER_GFHDMI | AZX_DCAPS_POSFIX_LPIB |
+	  AZX_DCAPS_NO_MSI | AZX_DCAPS_NO_64BIT },
 	/* VIA VT8251/VT8237A */
 	{ PCI_DEVICE(0x1106, 0x3288), .driver_data = AZX_DRIVER_VIA },
 	/* VIA GFX VT7122/VX900 */
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 4ffa3a59f..03197abda 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -4489,6 +4489,20 @@ static int patch_via_hdmi(struct hda_codec *codec)
 	return patch_simple_hdmi(codec, VIAHDMI_CVT_NID, VIAHDMI_PIN_NID);
 }
 
+static int patch_gf_hdmi(struct hda_codec *codec)
+{
+	int err;
+
+	err = patch_generic_hdmi(codec);
+	if (err)
+		return err;
+
+	/* Glenfly GPUs have two codecs, stream switches from one codec to
+	 * another, need to do actual clean-ups in codec_cleanup_stream */
+	codec->no_sticky_stream = 1;
+	return 0;
+}
+
 /*
  * patch entries
  */
@@ -4579,6 +4593,12 @@ HDA_CODEC_ENTRY(0x10de009f, "GPU 9f HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de00a0, "GPU a0 HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de8001, "MCP73 HDMI",	patch_nvhdmi_2ch),
 HDA_CODEC_ENTRY(0x10de8067, "MCP67/68 HDMI",	patch_nvhdmi_2ch),
+HDA_CODEC_ENTRY(0x67663d82, "Arise 82 HDMI/DP",	patch_gf_hdmi),
+HDA_CODEC_ENTRY(0x67663d83, "Arise 83 HDMI/DP",	patch_gf_hdmi),
+HDA_CODEC_ENTRY(0x67663d84, "Arise 84 HDMI/DP",	patch_gf_hdmi),
+HDA_CODEC_ENTRY(0x67663d85, "Arise 85 HDMI/DP",	patch_gf_hdmi),
+HDA_CODEC_ENTRY(0x67663d86, "Arise 86 HDMI/DP",	patch_gf_hdmi),
+HDA_CODEC_ENTRY(0x67663d87, "Arise 87 HDMI/DP",	patch_gf_hdmi),
 HDA_CODEC_ENTRY(0x11069f80, "VX900 HDMI/DP",	patch_via_hdmi),
 HDA_CODEC_ENTRY(0x11069f81, "VX900 HDMI/DP",	patch_via_hdmi),
 HDA_CODEC_ENTRY(0x11069f84, "VX11 HDMI/DP",	patch_generic_hdmi),
-- 
2.20.1


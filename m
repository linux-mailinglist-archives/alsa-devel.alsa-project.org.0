Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BEB4770FF
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 12:47:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08DD91853;
	Thu, 16 Dec 2021 12:46:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08DD91853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639655229;
	bh=ddV85ikKU7QvxLk84StlFcNiXRuIUZyzMsGfxKALhVM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GnGQQPCNm0fF9WzDxqJ7/D9b6LBx3bcjsxhauWBYGSnIi1fomvHariPy1yk0y90XC
	 z1MQ3/6+sQqe1wqW0ZeSUcGKqJMcqOL1DBxExYW9UMX2kdRxpKX51s+/7JWaVAZIQq
	 FAmXHJsy2L0MnB0YWT1npwxv9ElDpHZZoz8BWFiI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD36FF8051B;
	Thu, 16 Dec 2021 12:44:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19A61F80311; Thu, 16 Dec 2021 12:43:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26377F8027C
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 12:43:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26377F8027C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ZE5KvTOY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BG81ZNs010099;
 Thu, 16 Dec 2021 05:43:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=jXDNKFPYOs58wajQgaQSSQ3pg1rBTfuJ2kGHM7w4uWE=;
 b=ZE5KvTOYRNGOS6qDCGlgoVZ20LrzJRhwqUBPxKARHvuh1DqtuVphvilm6BYYhK3lfoF/
 SQiXmmN7HMJHZDS+wPWKqihUxVTTx7NyzmRqIA/su7fNkndVl29I+6ARgHBTUC2b1au1
 oQfHT6+99d8MBle3K8fZStCHQqSX5xW1GE5JNJhveE6svVj6caMqVhxBM6hWA6oHEPg9
 uENKJpO9FaVFXpe/AzPE3rt1qB1HGU6d6U+QqBZYwLmupHeuhzuyqHdFlxni8T0AXh9k
 WSSjOfoeMBy7FZKxj+NiHJr0AIuv613AmWkmZQogu57Y9oH58jQceyJAzlHjT1B/uR1H FA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3cygdq9c3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Dec 2021 05:43:41 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 16 Dec
 2021 11:43:40 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Thu, 16 Dec 2021 11:43:40 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.39])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DAA36B13;
 Thu, 16 Dec 2021 11:43:39 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v5 10/10] ALSA: hda/realtek: Add CS35L41 support for Thinkpad
 laptops
Date: Thu, 16 Dec 2021 11:43:32 +0000
Message-ID: <20211216114332.153409-11-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211216114332.153409-1-tanureal@opensource.cirrus.com>
References: <20211216114332.153409-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: MSL8FsqCjFVZLeGciaBmzw5bHkUuDPGq
X-Proofpoint-GUID: MSL8FsqCjFVZLeGciaBmzw5bHkUuDPGq
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 patches@opensource.cirrus.com
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

Add support for two CS35L41 using I2C bus and the component
binding method

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/pci/hda/patch_realtek.c | 37 +++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 7299e6388900..af9f8d70dbce 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6552,6 +6552,35 @@ static void comp_generic_playback_hook(struct hda_pcm_stream *hinfo, struct hda_
 	}
 }
 
+static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char *bus,
+				  const char *hid, int count)
+{
+	struct device *dev = hda_codec_dev(cdc);
+	struct alc_spec *spec = cdc->spec;
+	char *name;
+	int ret, i;
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		for (i = 0; i < count; i++) {
+			name = devm_kasprintf(dev, GFP_KERNEL,
+					      "%s-%s:00-cs35l41-hda.%d", bus, hid, i);
+			component_match_add(dev, &spec->match, comp_match_dev_name, name);
+		}
+		ret = component_master_add_with_match(dev, &comp_master_ops, spec->match);
+		if (ret)
+			codec_err(cdc, "Fail to register component aggregator %d\n", ret);
+		else
+			spec->gen.pcm_playback_hook = comp_generic_playback_hook;
+		break;
+	}
+}
+
+static void cs35l41_fixup_i2c_two(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
+{
+	cs35l41_generic_fixup(cdc, action, "i2c", "CSC3551", 2);
+}
+
 static void alc287_legion_16achg6_playback_hook(struct hda_pcm_stream *hinfo, struct hda_codec *cdc,
 						struct snd_pcm_substream *sub, int action)
 {
@@ -6868,6 +6897,7 @@ enum {
 	ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
 	ALC233_FIXUP_NO_AUDIO_JACK,
 	ALC287_FIXUP_LEGION_16ACHG6,
+	ALC287_FIXUP_CS35L41_I2C_2,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -8596,6 +8626,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc287_fixup_legion_16achg6_speakers,
 	},
+	[ALC287_FIXUP_CS35L41_I2C_2] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cs35l41_fixup_i2c_two,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -9006,6 +9040,9 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3843, "Yoga 9i", ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP),
 	SND_PCI_QUIRK(0x17aa, 0x3813, "Legion 7i 15IMHG05", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3847, "Legion 7 16ACHG6", ALC287_FIXUP_LEGION_16ACHG6),
+	SND_PCI_QUIRK(0x17aa, 0x22F1, "Thinkpad", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x17aa, 0x22F2, "Thinkpad", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x17aa, 0x22F3, "Thinkpad", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3852, "Lenovo Yoga 7 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3853, "Lenovo Yoga 7 15ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3819, "Lenovo 13s Gen2 ITL", ALC287_FIXUP_13S_GEN2_SPEAKERS),
-- 
2.34.1


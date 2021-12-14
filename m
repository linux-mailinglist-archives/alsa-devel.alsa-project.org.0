Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A7147443F
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 15:02:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4484A1F31;
	Tue, 14 Dec 2021 15:01:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4484A1F31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639490562;
	bh=2Rz97as+VlFZSEScvybHKY2sSUROfdPHGcwt7ICS8s4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i8+boqAuqD4o5yJfe/B1rlzyCwxmYBNB6hIzIO2hI//TU1M5OlZzcmvP9C//5O/vl
	 xr8tOV7HYJ/jSd06TaJzVTmjyVUMZtnho43XRBWeEw3g96UNOTrueAAEdKvDV+8hIY
	 hLnJZrL4jmxoK9tbW23XUNLZeU2vOPoPcK8QRSy8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DEEEF8051E;
	Tue, 14 Dec 2021 15:00:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E529F8025E; Tue, 14 Dec 2021 15:00:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88E00F8025A
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 15:00:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88E00F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="feMF4N6I"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BE4Ko3p006814;
 Tue, 14 Dec 2021 08:00:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=d/1h1dcmjbxeO1WOxkRmaotN/td2jqwcrUgCM/MTXvU=;
 b=feMF4N6IOcbAkT6787HfxGICUYk7d+xb9NbxLs6OeEGk7KkAhDL2pDHeDbVWMfJ1eqfC
 OekM44D+J7eIZE4gGXHCTx66Jz4YF/0PVBKQ2NTc4SNCns0chwb9AMWFpSuBrY30IZ/n
 Nsa24PSMGQOUSR2kpkU8L14v0CWUVD5c3ksJ18bWGJ7vh/z3nluQ91hyHul20avpzV2E
 CwonOvwZsw8F3hTyiDZDsv7pIYcLPuGvKdGntw52mSVnTgTSCnrGcpfOuV4dHv6xnlyg
 Nx217B1sJjkRaGxiC+FlRkrjoz1lD4be+H5VAi23G5SCmhKVZecPcrsSSeVj4OwjVngt cA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3cxh14grht-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 14 Dec 2021 08:00:06 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 14:00:05 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 14 Dec 2021 14:00:05 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.39])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 21C56B12;
 Tue, 14 Dec 2021 14:00:05 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v4 10/10] ALSA: hda/realtek: Add CS35L41 support for Thinkpad
 laptops
Date: Tue, 14 Dec 2021 13:59:59 +0000
Message-ID: <20211214135959.1317949-11-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211214135959.1317949-1-tanureal@opensource.cirrus.com>
References: <20211214135959.1317949-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 49LNN7KSG5k83oJX55pFMpVTm8EV8yd8
X-Proofpoint-ORIG-GUID: 49LNN7KSG5k83oJX55pFMpVTm8EV8yd8
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
index c7afabfae574..56c2ce3121fd 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6555,6 +6555,35 @@ void comp_generic_playback_hook(struct hda_pcm_stream *hinfo, struct hda_codec *
 	}
 }
 
+static void cs35l41_generic_fixup(struct hda_codec *codec, int action, const char *bus,
+				  const char *hid, int count)
+{
+	struct device *dev = hda_codec_dev(codec);
+	struct alc_spec *spec = codec->spec;
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
+			codec_err(codec, "Fail to register component aggregator %d\n", ret);
+		else
+			spec->gen.pcm_playback_hook = comp_generic_playback_hook;
+		break;
+	}
+}
+
+static void cs35l41_fixup_i2c_two(struct hda_codec *codec, const struct hda_fixup *fix, int action)
+{
+	cs35l41_generic_fixup(codec, action, "i2c", "CSC3551", 2);
+}
+
 void alc287_legion_16achg6_playback_hook(struct hda_pcm_stream *hinfo, struct hda_codec *codec,
 					 struct snd_pcm_substream *sub, int action)
 {
@@ -6871,6 +6900,7 @@ enum {
 	ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
 	ALC233_FIXUP_NO_AUDIO_JACK,
 	ALC287_FIXUP_LEGION_16ACHG6,
+	ALC287_FIXUP_CS35L41_I2C_2,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -8599,6 +8629,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc287_fixup_legion_16achg6_speakers,
 	},
+	[ALC287_FIXUP_CS35L41_I2C_2] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cs35l41_fixup_i2c_two,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -9009,6 +9043,9 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
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


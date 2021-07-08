Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 913CB3BF2F2
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 02:45:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19752843;
	Thu,  8 Jul 2021 02:44:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19752843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625705112;
	bh=al3VcySOcwb/a7wdnVD1VkrqKxkAmoQ/R22iWbOe3aQ=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Mr3OSEzYcKpz4Ite+HX1MLfihL9jJJE1ywxBz8NbI0Ex/I9HnF6oCND9kY+O5nV/7
	 uKvHnflohg+GXewg+UjCPp5XNfD+LOsWYgmusS5TKLZpu/5siN9m0BaZtjYynI/11V
	 GujYLX077/jbHeYye025fip1j7WE1cNV1SQBQ09M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F723F8012F;
	Thu,  8 Jul 2021 02:43:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C51AF80224; Thu,  8 Jul 2021 02:43:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from neo-zeon.de (neo-zeon.de [70.229.12.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 258A3F8012F
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 02:43:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 258A3F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=neo-zeon.de header.i=@neo-zeon.de
 header.b="lLPQaZzm"
Received: from neo-zeon.de (localhost [127.0.0.1])
 by neo-zeon.de (OpenSMTPD) with ESMTP id d656f739
 for <alsa-devel@alsa-project.org>;
 Wed, 7 Jul 2021 17:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=neo-zeon.de; h=to:from
 :subject:message-id:date:mime-version:content-type; s=1; bh=qDIi
 /NkXmi/rFUGP9c7C3jzyywc=; b=lLPQaZzm9D2w5z3bScxB6rO0YAKVi0UJY047
 DXK16n8ub6eU4xig9JMlLoPkRaLngBlC7ymiqS3fxD0EE2hGIJcMs/+NT5xOVbGa
 PmhNZB+EQMkkOeX601IBqilBUIaeYV9R58WV8uP4v9B/yEfzOj6YEkuuEpXx2Ao1
 kYikuoE=
Received: by neo-zeon.de (OpenSMTPD) with ESMTPSA id fa743d35
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <alsa-devel@alsa-project.org>;
 Wed, 7 Jul 2021 17:16:49 -0700 (PDT)
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Cameron Berkenpas <cam@neo-zeon.de>
Subject: Patch For Lenovo Legion 7 15IMHg05 & Yoga 7 14ITL5
Message-ID: <f3bbf247-ae21-474d-ccb5-f56710c2391f@neo-zeon.de>
Date: Wed, 7 Jul 2021 17:16:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hello,

I have a patch against 5.12.x that results in working speaker audio for 
the Lenovo Legion 7 15IMHg05 and the Lenovo Yoga 7 14ITL5.

How should I go about getting this merged? Should this be against the 
latest torvalds git? Is this the right place to present this particular 
patch? There are no issues checking my changes against checkpatch.pl.

Thanks!

diff --git a/sound/pci/hda/legion_15imhg05_helper.c b/sound/pci/hda/legion_15imhg05_helper.c
new file mode 100644
index 000000000000..6ead999ec3c9
--- /dev/null
+++ b/sound/pci/hda/legion_15imhg05_helper.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Fixes for Lenovo Legion 15IMHg05 speaker output. */
+
+static const struct hda_verb legion_15imhg05_coefs[] = {
+{0x20, AC_VERB_SET_COEF_INDEX, 0x24 },
+{0x20, AC_VERB_SET_PROC_COEF, 0x41 },
+{0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{0x20, AC_VERB_SET_PROC_COEF, 0x2 },
+{0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+{0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+{0x20, 0x4b0, 0x20 },
+
+// Set right speaker for Legion 7i.
+{0x20, AC_VERB_SET_COEF_INDEX, 0x24 },
+{0x20, AC_VERB_SET_PROC_COEF, 0x42 },
+
+{0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{0x20, AC_VERB_SET_PROC_COEF, 0xc },
+{0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+{0x20, AC_VERB_SET_PROC_COEF, 0x2a },
+{0x20, 0x4b0, 0x20 },
+{0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{0x20, AC_VERB_SET_PROC_COEF, 0x2 },
+{0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+{0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+{0x20, 0x4b0, 0x20 },
+{}
+};
+
+static void alc287_fixup_legion_15imhg05_speakers(struct hda_codec *codec,
+						  const struct hda_fixup *fix,
+						  int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	switch (action) {
+	case HDA_FIXUP_ACT_INIT:
+		spec->gen.automute_speaker = 0;
+		break;
+	}
+}
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index e46e43dac6bf..28a4955cf2c2 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6352,6 +6352,12 @@ static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
  /* for alc285_fixup_ideapad_s740_coef() */
  #include "ideapad_s740_helper.c"
  
+/* For alc287_fixup_legion_15imhg05_speakers() */
+#include "legion_15imhg05_helper.c"
+
+/* For yoga7_14itl5_coefs */
+#include "yoga7_14itl5_coefs.c"
+
  enum {
  	ALC269_FIXUP_GPIO2,
  	ALC269_FIXUP_SONY_VAIO,
@@ -6561,6 +6567,9 @@ enum {
  	ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP,
  	ALC623_FIXUP_LENOVO_THINKSTATION_P340,
  	ALC255_FIXUP_ACER_HEADPHONE_AND_MIC,
+	ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS,
+	ALC287_FIXUP_LEGION_15IMHG05_AUTOMUTE,
+	ALC287_FIXUP_YOGA7_14ITL_SPEAKERS,
  };
  
  static const struct hda_fixup alc269_fixups[] = {
@@ -8088,6 +8097,24 @@ static const struct hda_fixup alc269_fixups[] = {
  		.chained = true,
  		.chain_id = ALC269_FIXUP_THINKPAD_ACPI,
  	},
+	[ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = legion_15imhg05_coefs,
+		.chained = true,
+		.chain_id = ALC287_FIXUP_LEGION_15IMHG05_AUTOMUTE,
+	},
+	[ALC287_FIXUP_LEGION_15IMHG05_AUTOMUTE] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc287_fixup_legion_15imhg05_speakers,
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MODE,
+	},
+	[ALC287_FIXUP_YOGA7_14ITL_SPEAKERS] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = yoga7_14itl5_coefs,
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MODE,
+	},
  	[ALC295_FIXUP_ASUS_DACS] = {
  		.type = HDA_FIXUP_FUNC,
  		.v.func = alc295_fixup_asus_dacs,
@@ -8520,6 +8547,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
  	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940", ALC298_FIXUP_LENOVO_SPK_VOLUME),
  	SND_PCI_QUIRK(0x17aa, 0x3827, "Ideapad S740", ALC285_FIXUP_IDEAPAD_S740_COEF),
  	SND_PCI_QUIRK(0x17aa, 0x3843, "Yoga 9i", ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP),
+	SND_PCI_QUIRK(0x17aa, 0x3813, "Lenovo Legion 7", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
+	SND_PCI_QUIRK(0x17aa, 0x3852, "Lenovo Yoga 7 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
  	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
  	SND_PCI_QUIRK(0x17aa, 0x3977, "IdeaPad S210", ALC283_FIXUP_INT_MIC),
  	SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo B50-70", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
diff --git a/sound/pci/hda/yoga7_14itl5_coefs.c b/sound/pci/hda/yoga7_14itl5_coefs.c
new file mode 100644
index 000000000000..a437fe042a1d
--- /dev/null
+++ b/sound/pci/hda/yoga7_14itl5_coefs.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Fixes for Lenovo Yoga 7 14ITL5 speaker output. */
+
+static const struct hda_verb yoga7_14itl5_coefs[] = {
+{0x20, AC_VERB_SET_COEF_INDEX, 0x24 },
+{0x20, AC_VERB_SET_PROC_COEF, 0x41 },
+{0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{0x20, AC_VERB_SET_PROC_COEF, 0x2 },
+{0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+{0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+{0x20, 0x4b0, 0x20 },
+
+// set right speaker Yoga 7i.
+{0x20, AC_VERB_SET_COEF_INDEX, 0x24 },
+{0x20, AC_VERB_SET_PROC_COEF, 0x46 },
+
+{0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{0x20, AC_VERB_SET_PROC_COEF, 0xc },
+{0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+{0x20, AC_VERB_SET_PROC_COEF, 0x2a },
+{0x20, 0x4b0, 0x20 },
+{0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{0x20, AC_VERB_SET_PROC_COEF, 0x2 },
+{0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+{0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+{0x20, 0x4b0, 0x20 },
+{}
+};
+



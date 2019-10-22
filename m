Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54482E0AF4
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 19:46:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 000CB1612;
	Tue, 22 Oct 2019 19:45:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 000CB1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571766360;
	bh=kxQDO5NPxG+GH1DVy3VAjN6nwLgnYlDM+yN8KzAwC3k=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e+wAvmvS6o7cxglM7MPPZopAj9vX/dziaup7/EQ2YG+BNS1TZBobz+VGT41Zs023X
	 dQkfTAIvsUz8m6XLBGcGLLAQyF80/7zILfEBTt6cOZWGVCB1YcOwN2wIyXseaS+54z
	 lmy+2XMI6YACA5uX30pF0JLucxkajEYynVkvivmg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3700FF80390;
	Tue, 22 Oct 2019 19:43:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A508F800C0; Tue, 22 Oct 2019 19:43:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A878FF800C0
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 19:43:25 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3B474A003F;
 Tue, 22 Oct 2019 19:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3B474A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1571766205; bh=KpqhM5G1BWzKRkvycaCD2cgqX/mKdi5zYRgLGZW7edw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S7ohpru18QVnKw1nyCb0+bIyfxJxHk4D10dXq5lr0nDApBmzjfMkSmK74Wg1NPCiu
 4KpR2RNv4G3wJIogZxpmqNi8UmXnFUW+7CVeuUoR9dK0/cl/p0J+qK/943T7XaB0Wu
 PCqO4M9lzGJhG83d+DMnj4LgdYIPdfgNPNk5dpR8=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 22 Oct 2019 19:43:21 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Date: Tue, 22 Oct 2019 19:43:13 +0200
Message-Id: <20191022174313.29087-2-perex@perex.cz>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191022174313.29087-1-perex@perex.cz>
References: <20191022174313.29087-1-perex@perex.cz>
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v5 2/2] ALSA: hda: fix intel DSP config
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Reshuffle list of devices by historical order and add correct
information as needed.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/hda/intel-dsp-config.c | 220 ++++++++++++++++++++++++++---------
 1 file changed, 164 insertions(+), 56 deletions(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index d9f6d9e872b4..0b2a7201a46a 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -30,45 +30,98 @@ struct config_entry {
  * - the first successful match will win
  */
 static const struct config_entry config_table[] = {
-/* Cometlake-LP */
-#if IS_ENABLED(CONFIG_SND_SOC_INTEL_CML_LP)
+/* Merrifield */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_MERRIFIELD)
 	{
-		/* prefer SST */
-		.flags = FLAG_SST,
-		.device = 0x02c8,
+		.flags = FLAG_SOF,
+		.device = 0x119a,
 	},
-#elif IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP)
+#endif
+/* Broxton-T */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
 	{
 		.flags = FLAG_SOF,
-		.device = 0x02c8,
+		.device = 0x1a98,
 	},
 #endif
-/* Cometlake-H */
-#if IS_ENABLED(CONFIG_SND_SOC_INTEL_CML_H)
+/*
+ * Apollolake (Broxton-P)
+ * the legacy HDaudio driver is used except on Up Squared (SOF) and
+ * Chromebooks (SST)
+ */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
 	{
-		.flags = FLAG_SST,
-		.device = 0x06c8,
+		.flags = FLAG_SOF,
+		.device = 0x5a98,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Up Squared",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "AAEON"),
+					DMI_MATCH(DMI_BOARD_NAME, "UP-APL01"),
+				}
+			},
+			{}
+		}
 	},
-#elif IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_H)
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL)
 	{
-		.flags = FLAG_SOF,
-		.device = 0x06c8,
+		.flags = FLAG_SST,
+		.device = 0x5a98,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
 	},
 #endif
-/* Merrifield */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_MERRIFIELD)
+/*
+ * Skylake and Kabylake use legacy HDaudio driver except for Google
+ * Chromebooks (SST)
+ */
+
+/* Sunrise Point-LP */
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKL)
 	{
-		.flags = FLAG_SOF,
-		.device = 0x119a,
+		.flags = FLAG_SST,
+		.device = 0x9d70,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
 	},
 #endif
-/* Broxton-T */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
+/* Kabylake-LP */
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_KBL)
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
-		.device = 0x1a98,
+		.flags = FLAG_SST,
+		.device = 0x9d71,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
 	},
 #endif
+
+/*
+ * Geminilake uses legacy HDaudio driver except for Google
+ * Chromebooks
+ */
 /* Geminilake */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_GEMINILAKE)
 	{
@@ -85,84 +138,139 @@ static const struct config_entry config_table[] = {
 		}
 	},
 #endif
-#if IS_ENABLED(CONFIG_SND_SOC_INTEL_GLK)
+
+/*
+ * CoffeeLake, CannonLake, CometLake, IceLake, TigerLake use legacy
+ * HDaudio driver except for Google Chromebooks and when DMICs are
+ * present. Two cases are required since Coreboot does not expose NHLT
+ * tables.
+ *
+ * When the Chromebook quirk is not present, it's based on information
+ * that no such device exists. When the quirk is present, it could be
+ * either based on product information or a placeholder.
+ */
+
+/* Cannonlake */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_CANNONLAKE)
 	{
-		.flags = FLAG_SST,
-		.device = 0x3198,
+		.flags = FLAG_SOF,
+		.device = 0x9dc8,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
 	},
-#endif
-/* Icelake */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_ICELAKE)
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
-		.device = 0x34c8,
+		.device = 0x9dc8,
 	},
 #endif
-/* Elkhart Lake */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_ELKHARTLAKE)
+
+/* Coffelake */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COFFEELAKE)
+	{
+		.flags = FLAG_SOF,
+		.device = 0xa348,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
-		.device = 0x4b55,
+		.device = 0xa348,
 	},
 #endif
-/* Appololake (Broxton-P) */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
+
+/* Cometlake-LP */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP)
 	{
 		.flags = FLAG_SOF,
-		.device = 0x5a98,
+		.device = 0x02c8,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
-				.ident = "Up Squared",
+				.ident = "Google Chromebooks",
 				.matches = {
-					DMI_MATCH(DMI_SYS_VENDOR, "AAEON"),
-					DMI_MATCH(DMI_BOARD_NAME, "UP-APL01"),
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
 				}
 			},
 			{}
 		}
 	},
-#endif
-#if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL)
 	{
-		.flags = FLAG_SST,
-		.device = 0x5a98,
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
+		.device = 0x02c8,
 	},
 #endif
-/* Cannonlake */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_CANNONLAKE)
+/* Cometlake-H */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_H)
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
-		.device = 0x9dc8,
+		.device = 0x06c8,
 	},
 #endif
-/* Sunrise Point-LP */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_SKYLAKE)
+
+/* Icelake */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_ICELAKE)
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
-		.device = 0x9d70,
+		.flags = FLAG_SOF,
+		.device = 0x34c8,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
 	},
-#endif
-/* Kabylake-LP */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_KABYLAKE)
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
-		.device = 0x9d71,
+		.device = 0x34c8,
 	},
 #endif
+
 /* Tigerlake */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE)
+	{
+		.flags = FLAG_SOF,
+		.device = 0xa0c8,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
+
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
 		.device = 0xa0c8,
 	},
 #endif
-/* Coffelake */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_COFFEELAKE)
+
+/* Elkhart Lake */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_ELKHARTLAKE)
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
-		.device = 0xa348,
+		.device = 0x4b55,
 	},
 #endif
+
 };
 
 static const struct config_entry *snd_intel_dsp_find_config
-- 
2.20.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

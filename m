Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 532824F6B3F
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 22:21:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E9D0173E;
	Wed,  6 Apr 2022 22:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E9D0173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649276472;
	bh=YnVi7SV63060gXbFMvlyQSuGHzRUsi/C5DeXjpmhkwo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KjZhWUZol8LN7q1Jww2OxP5hW7WAyaygkmnvJy9oC7gsy5sBd/t63Wloq5CqXGWqx
	 YBGVuFS3jKIgbSNXGLwaeDP5IXOu6Vi70DLb3cCprwGehztAXwKXDhPqXIhV97ezEA
	 2n7F4bEmrKLHarHs3M0ue9pyG8qLRGR4aTPfannM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28018F80516;
	Wed,  6 Apr 2022 22:19:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD7FBF80516; Wed,  6 Apr 2022 22:19:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2400DF80141
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 22:19:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2400DF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VA6xOLF9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B9928615A5;
 Wed,  6 Apr 2022 20:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25DBAC385A1;
 Wed,  6 Apr 2022 20:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649276363;
 bh=YnVi7SV63060gXbFMvlyQSuGHzRUsi/C5DeXjpmhkwo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VA6xOLF9tQ+N0PXEvROHdUim3nXjkFoQXZ0Nv5oH3oKLO0+jNKJiUAdm3Sx/8wkmi
 wEB9ezvtTLEPj2kdcDMxuzbhTt6GhhL/59/p6Nr0aq3HWmALot9Jk7y7I43nKUpiiU
 QrHUYnGJMP0P7xqU7CALj3IYrokCzP7/oGERjLeingqM7a2wC69FdWXUf/c4TD6BSz
 8cO9CpAqZKBvslORpJ+/SA2Mr8vRktj2tK6bIHxsicwlIV3Dcn9Bf/OmR+W8osjRIj
 zPTTda7U30NZJeIy7eceJEAAEc6uQwADrPmDJgr8n0JEr3SqwPSiNfpCPYmlREAckK
 3uGJgUkOGtN1A==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1ncC7c-00GGaR-Ma; Wed, 06 Apr 2022 22:19:20 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 3/4] ASoC: Intel: sof_es8336: add a quirk for headset at
 mic1 port
Date: Wed,  6 Apr 2022 22:19:17 +0200
Message-Id: <baf412bc431650fc7f3a157c6ab96d08120940fc.1649275618.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649275618.git.mchehab@kernel.org>
References: <cover.1649275618.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 linux-kernel@vger.kernel.org
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

The headset/internal mic can either be routed as mic1/mic2
or vice-versa.

By default, the driver assumes that the headset is mapped as
mic2, but not all devices map this way.

So, add a quirk to support changing it to mic1, using mic2
for the internal analog mic (if any).

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH v4 0/4] at: https://lore.kernel.org/all/cover.1649275618.git.mchehab@kernel.org/

 sound/soc/intel/boards/sof_es8336.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index d15a58666cc6..bc5bc6124223 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -31,6 +31,7 @@
 #define SOF_ES8336_ENABLE_DMIC			BIT(5)
 #define SOF_ES8336_JD_INVERTED			BIT(6)
 #define SOF_ES8336_HEADPHONE_GPIO		BIT(7)
+#define SOC_ES8336_HEADSET_MIC1			BIT(8)
 
 static unsigned long quirk;
 
@@ -90,6 +91,8 @@ static void log_quirks(struct device *dev)
 		dev_info(dev, "quirk headphone GPIO enabled\n");
 	if (quirk & SOF_ES8336_JD_INVERTED)
 		dev_info(dev, "quirk JD inverted enabled\n");
+	if (quirk & SOC_ES8336_HEADSET_MIC1)
+		dev_info(dev, "quirk headset at mic1 port enabled\n");
 }
 
 static int sof_es8316_speaker_power_event(struct snd_soc_dapm_widget *w,
@@ -145,13 +148,23 @@ static const struct snd_soc_dapm_route sof_es8316_audio_map[] = {
 	{"Speaker", NULL, "HPOL"},
 	{"Speaker", NULL, "HPOR"},
 	{"Speaker", NULL, "Speaker Power"},
+
+	{"Differential Mux", "lin1-rin1", "MIC1"},
+	{"Differential Mux", "lin2-rin2", "MIC2"},
+	{"Differential Mux", "lin1-rin1 with 20db Boost", "MIC1"},
+	{"Differential Mux", "lin2-rin2 with 20db Boost", "MIC2"},
 };
 
-static const struct snd_soc_dapm_route sof_es8316_intmic_in1_map[] = {
+static const struct snd_soc_dapm_route sof_es8316_headset_mic2_map[] = {
 	{"MIC1", NULL, "Internal Mic"},
 	{"MIC2", NULL, "Headset Mic"},
 };
 
+static const struct snd_soc_dapm_route sof_es8316_headset_mic1_map[] = {
+	{"MIC2", NULL, "Internal Mic"},
+	{"MIC1", NULL, "Headset Mic"},
+};
+
 static const struct snd_soc_dapm_route dmic_map[] = {
 	/* digital mics */
 	{"DMic", NULL, "SoC DMIC"},
@@ -225,8 +238,13 @@ static int sof_es8316_init(struct snd_soc_pcm_runtime *runtime)
 
 	card->dapm.idle_bias_off = true;
 
-	custom_map = sof_es8316_intmic_in1_map;
-	num_routes = ARRAY_SIZE(sof_es8316_intmic_in1_map);
+	if (quirk & SOC_ES8336_HEADSET_MIC1) {
+		custom_map = sof_es8316_headset_mic1_map;
+		num_routes = ARRAY_SIZE(sof_es8316_headset_mic1_map);
+	} else {
+		custom_map = sof_es8316_headset_mic2_map;
+		num_routes = ARRAY_SIZE(sof_es8316_headset_mic2_map);
+	}
 
 	ret = snd_soc_dapm_add_routes(&card->dapm, custom_map, num_routes);
 	if (ret)
-- 
2.35.1


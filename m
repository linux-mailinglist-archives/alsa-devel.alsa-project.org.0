Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DFC4F8768
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 20:52:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6BD9185C;
	Thu,  7 Apr 2022 20:51:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6BD9185C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649357545;
	bh=vlqXx0ieppmMKLD+I9u5Kx4ETGPRQ4q+RN6HUTu1DPk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GjZorFERrlVeO+6n1fZDNtbd0Nr5GTNYkkATmRNPEe33MTgYhTE/pWYRpCOnTIzh5
	 SQJ3CwGEkRbJx8A6vzCq9gt7fLD0tGf3sLCkzWlmmvhzTlOSw05eskSQGgLBn7JWiK
	 86nWCZLdcNGU4XwyIDKUxjxo/Ektt52ZwsnR0TqA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0070F8051E;
	Thu,  7 Apr 2022 20:50:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26D09F80516; Thu,  7 Apr 2022 20:50:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18FF1F8012A
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 20:50:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18FF1F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C5ICFnyl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5AF561DD2;
 Thu,  7 Apr 2022 18:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5274C385B1;
 Thu,  7 Apr 2022 18:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649357402;
 bh=vlqXx0ieppmMKLD+I9u5Kx4ETGPRQ4q+RN6HUTu1DPk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C5ICFnylGtemLREXeUOzU273I0WS0gdBX+8C/1aajTGFUoTgbsqQhOfHslQuzV7m0
 HmlCgJoEI/GTlvLXa2xLJinN/FqwU321I/E1fh/UOj10Q6Io1+MHw+ezOvqusHgkUI
 05HmVwKVhfwud5DdzEFRiTVKGrfrU6KpfSUK+Qn2iAY4S/6nxQ7UV2Vc95He4F6tY8
 hr9MHatTZMVDHp0268ppdQQubE2y4wU9ePRqzTFpUC1NOvnMkx/ziNxUxsBIRMzVfx
 0GGbId8w5TpiS8uVvCIOZhtqzjcrrEN2jXYu2ragPH2IV8486Xz8YFvpma3rCLbbWt
 CrlRjJ5wrAmhw==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1ncXCi-000Rut-9x; Thu, 07 Apr 2022 20:50:00 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 3/4] ASoC: Intel: sof_es8336: add a quirk for headset at
 mic1 port
Date: Thu,  7 Apr 2022 20:49:58 +0200
Message-Id: <5d88fc29b79be7ab77dae391c8e5ee929fd36c27.1649357263.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649357263.git.mchehab@kernel.org>
References: <cover.1649357263.git.mchehab@kernel.org>
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

See [PATCH v5 0/4] at: https://lore.kernel.org/all/cover.1649357263.git.mchehab@kernel.org/

 sound/soc/intel/boards/sof_es8336.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index d15a58666cc6..c71842be9d59 100644
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
@@ -147,11 +150,16 @@ static const struct snd_soc_dapm_route sof_es8316_audio_map[] = {
 	{"Speaker", NULL, "Speaker Power"},
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
@@ -225,8 +233,13 @@ static int sof_es8316_init(struct snd_soc_pcm_runtime *runtime)
 
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


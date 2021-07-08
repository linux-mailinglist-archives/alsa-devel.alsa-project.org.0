Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B883BF753
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 11:14:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BF88166A;
	Thu,  8 Jul 2021 11:13:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BF88166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625735664;
	bh=eus4BD03luebpH3Fxa0IptnLzaI2nBucujc2Srots/Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Sr6sFhzBQf0lEUm1La/h2+MTScgBssXUuXx1RBNgMrUc+DMHuIVfr+MVarf021fs5
	 sGl38KTtjA9xAPj81FOJ4kcjPTyin6qZamgPOGu2zCWpL3m+N62dfDqDkvhbsXOBlq
	 0TjI5glKuPh7/YbYqJ4makGxIoMLktY9+rZm0oIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27929F8012A;
	Thu,  8 Jul 2021 11:13:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04434F80143; Thu,  8 Jul 2021 11:13:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2BF5F80143
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 11:12:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2BF5F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="Wyu2z7QU"
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6CAF882A13;
 Thu,  8 Jul 2021 11:12:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1625735578;
 bh=6PrtEOO5NWH/SLHaWLKK/dourcU2gKiC8AMwQVhBBbY=;
 h=From:To:Cc:Subject:Date:From;
 b=Wyu2z7QUvMniQuQkeTarZdPnHnoHVevRETq+GFQQDIfW2kDF0LzQ9fXEHnf/IE8CE
 HdeNQfJV8aSagSCafyCR4aQcULx0/6PpDfYyvG2Qvma6x6qWeLXWy+sSkRC/WWqKsq
 4SrArBpS9dlRSZXSm2jNJ0gKxeo4Q600RyZCCI4NpGcQQhyCNA+6Q7f31d2bp9BMQg
 MGHQs4IJIM8pclemabkql6WvfeSgFmaJrHAPVpPvmIV+U83KSVzHZuV3UGiV88JT5G
 22SwAOFg7ZlbD64aO6eLwG9B5dHvVvlUyYi1GcPqub9BSM68iX6CldGuBmIt8JoQ5r
 ty1Le9ZOFR4fg==
From: Marek Vasut <marex@denx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: tlv320aic32x4: Fix TAS2505 volume controls
Date: Thu,  8 Jul 2021 11:12:55 +0200
Message-Id: <20210708091255.56502-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Mark Brown <broonie@kernel.org>, ch@denx.de
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

None of the TAS2505 outputs are stereo, do not pretend they are by
implementing them using SOC*DOUBLE* macros referencing the same
register twice, use SOC*SINGLE* instead. Fix volume ranges and mute
control for the codec according to datasheet.

Fixes: b4525b6196cd7 ("ASoC: tlv320aic32x4: add support for TAS2505")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Claudius Heine <ch@denx.de>
Cc: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tlv320aic32x4.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 8af739284fbec..30a503e154604 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -250,8 +250,8 @@ static DECLARE_TLV_DB_SCALE(tlv_pcm, -6350, 50, 0);
 static DECLARE_TLV_DB_SCALE(tlv_driver_gain, -600, 100, 0);
 /* -12dB min, 0.5dB steps */
 static DECLARE_TLV_DB_SCALE(tlv_adc_vol, -1200, 50, 0);
-
-static DECLARE_TLV_DB_LINEAR(tlv_spk_vol, TLV_DB_GAIN_MUTE, 0);
+/* -6dB min, 1dB steps */
+static DECLARE_TLV_DB_SCALE(tlv_tas_driver_gain, -5850, 50, 0);
 static DECLARE_TLV_DB_SCALE(tlv_amp_vol, 0, 600, 1);
 
 static const char * const lo_cm_text[] = {
@@ -1063,21 +1063,20 @@ static const struct snd_soc_component_driver soc_component_dev_aic32x4 = {
 };
 
 static const struct snd_kcontrol_new aic32x4_tas2505_snd_controls[] = {
-	SOC_DOUBLE_R_S_TLV("PCM Playback Volume", AIC32X4_LDACVOL,
-			AIC32X4_LDACVOL, 0, -0x7f, 0x30, 7, 0, tlv_pcm),
+	SOC_SINGLE_S8_TLV("PCM Playback Volume",
+			  AIC32X4_LDACVOL, -0x7f, 0x30, tlv_pcm),
 	SOC_ENUM("DAC Playback PowerTune Switch", l_ptm_enum),
-	SOC_DOUBLE_R_S_TLV("HP Driver Playback Volume", AIC32X4_HPLGAIN,
-			AIC32X4_HPLGAIN, 0, -0x6, 0x1d, 5, 0,
-			tlv_driver_gain),
-	SOC_DOUBLE_R("HP DAC Playback Switch", AIC32X4_HPLGAIN,
-			AIC32X4_HPLGAIN, 6, 0x01, 1),
 
-	SOC_SINGLE("Auto-mute Switch", AIC32X4_DACMUTE, 4, 7, 0),
+	SOC_SINGLE_TLV("HP Driver Gain Volume",
+			AIC32X4_HPLGAIN, 0, 0x74, 1, tlv_tas_driver_gain),
+	SOC_SINGLE("HP DAC Playback Switch", AIC32X4_HPLGAIN, 6, 1, 1),
 
-	SOC_SINGLE_RANGE_TLV("Speaker Driver Playback Volume", TAS2505_SPKVOL1,
-			0, 0, 117, 1, tlv_spk_vol),
-	SOC_SINGLE_TLV("Speaker Amplifier Playback Volume", TAS2505_SPKVOL2,
-			4, 5, 0, tlv_amp_vol),
+	SOC_SINGLE_TLV("Speaker Driver Playback Volume",
+			TAS2505_SPKVOL1, 0, 0x74, 1, tlv_tas_driver_gain),
+	SOC_SINGLE_TLV("Speaker Amplifier Playback Volume",
+			TAS2505_SPKVOL2, 4, 5, 0, tlv_amp_vol),
+
+	SOC_SINGLE("Auto-mute Switch", AIC32X4_DACMUTE, 4, 7, 0),
 };
 
 static const struct snd_kcontrol_new hp_output_mixer_controls[] = {
-- 
2.30.2


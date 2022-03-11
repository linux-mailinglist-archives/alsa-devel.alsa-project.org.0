Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED6B4D5F26
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 11:07:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC7E817B4;
	Fri, 11 Mar 2022 11:07:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC7E817B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646993279;
	bh=4e4QluxUYturNwHU5F9VOEmVx5jcDahK0vUlQ1uTaDg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TAvzjLnw84xCOgsQGBmeZzy2BboIKGydf7E8ANFfaeIFz/6EQCDg5YSDZWlmRYDSl
	 kHFmys1tUspV6Z+I0Vf/lstTsu6bUGVFPIiVM+Cd6Nvbjh7ktDsZaAommeQClB6i9x
	 MKXgyFiSgDLEZdDVXT8Dhm0myj5RlzcRhVS0Bybw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 577CCF80085;
	Fri, 11 Mar 2022 11:06:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD87AF80227; Fri, 11 Mar 2022 11:06:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60B76F80085
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 11:06:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60B76F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.b="Smy34Rd4"
Received: (Authenticated sender: gregory.clement@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 071921BF205;
 Fri, 11 Mar 2022 10:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646993200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=llGYuhNKxBL0E6/d3vK4t1hI1EI6u830rzt/YiiK4Mg=;
 b=Smy34Rd4T1XCgENWAE4kxUfpJ8kqu3IGPHUIDjUPfhxq2UwrliYBkQ1G2An2DMuIMR0eNV
 zLRUc0xjvH40sM/NSb9WDlKdXpULcjQWwNdQ1OLpVuIxng3BmToP2zNAP3r8ja1jeUa6hK
 Mw8Cv1USIR4L/HvMDi7Qh8eEWmUhp5hLVRUR6nDVLiXaWi2GftW5OCEDqF+Mo63BsSTxZh
 a7QYxmkGiaVCm1Yml/rYT1XT4GzNduT5hQ9dnFp+WBQSUv7s+ZzGdaU8lxhrZ+pWrz9ePn
 8aPhSVuDZrb/mc9cQtJu1fQF+Vy6c7K728oiR3yKMeZkYFzj+WbzkyUM1hUBGQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: tlv320aic3x: add dmic widget support
Date: Fri, 11 Mar 2022 11:06:27 +0100
Message-Id: <20220311100627.2181756-1-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>
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

This patch allows to use dmic to record sound.

This is a port from a variscite patch written by Eran Matityahu
<eran.m@variscite.com>.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 sound/soc/codecs/tlv320aic3x.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index d53037b1509d..426f92cc44da 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -296,6 +296,11 @@ static SOC_ENUM_SINGLE_DECL(aic3x_poweron_time_enum, HPOUT_POP_REDUCTION, 4,
 static const char * const aic3x_rampup_step[] = { "0ms", "1ms", "2ms", "4ms" };
 static SOC_ENUM_SINGLE_DECL(aic3x_rampup_step_enum, HPOUT_POP_REDUCTION, 2,
 			    aic3x_rampup_step);
+static const char * const aic3x_dmic_rates[] = { "off", "128x", "64x", "32x" };
+static SOC_ENUM_SINGLE_DECL(aic3x_dmic_rates_enum, AIC3X_ASD_INTF_CTRLA, 0,
+			    aic3x_dmic_rates);
+static const struct snd_kcontrol_new aic3x_dmic_rates_controls =
+	SOC_DAPM_ENUM("Route", aic3x_dmic_rates_enum);
 
 /*
  * DAC digital volumes. From -63.5 to 0 dB in 0.5 dB steps
@@ -751,6 +756,9 @@ static const struct snd_soc_dapm_widget aic3x_extra_dapm_widgets[] = {
 	SND_SOC_DAPM_INPUT("MIC3R"),
 	SND_SOC_DAPM_INPUT("LINE2L"),
 	SND_SOC_DAPM_INPUT("LINE2R"),
+
+	SND_SOC_DAPM_MUX("DMic Rate", SND_SOC_NOPM, 0, 0, &aic3x_dmic_rates_controls),
+	SND_SOC_DAPM_INPUT("DMIC"),
 };
 
 /* For tlv320aic3104 */
@@ -939,6 +947,12 @@ static const struct snd_soc_dapm_route intercon_extra[] = {
 	{"GPIO1 dmic modclk", NULL, "DMic Rate 64"},
 	{"GPIO1 dmic modclk", NULL, "DMic Rate 32"},
 
+	{"GPIO1 dmic modclk", NULL, "DMic Rate"},
+	{"DMic Rate", "128x", "DMIC"},
+	{"DMic Rate", "64x", "DMIC"},
+	{"DMic Rate", "32x", "DMIC"},
+	{"DMic Rate", "off", "DMIC"},
+
 	/* Left Line Output */
 	{"Left Line Mixer", "Line2L Bypass Switch", "Left Line2L Mux"},
 	{"Left Line Mixer", "Line2R Bypass Switch", "Right Line2R Mux"},
-- 
2.34.1


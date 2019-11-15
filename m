Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50172FE261
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 17:11:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CD7A1666;
	Fri, 15 Nov 2019 17:11:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CD7A1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573834310;
	bh=6YKwDdzvvt2haVNB2Ieyh2fNP+rFyvUBtkKGe3DIg3k=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LnRW5UpnJeWG7m+aifCnIfhmkUNCxSMWLhZqjseec80f2/58rFlJa+QSA/rJnnEiB
	 kXoyZbNvXAjaWj6D9RBMaN3wr3RZwsOrIml66UQdoQBrXlksMu3nM6Zc+k/17kuqBi
	 heAo4BdOmBGeytXBLKyGmOx3hj9yFS8kwLETu5jw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78383F80121;
	Fri, 15 Nov 2019 17:08:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50549F80105; Fri, 15 Nov 2019 17:08:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2FE0F80103
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 17:08:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2FE0F80103
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.lab.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1iVe90-0002S7-MC; Fri, 15 Nov 2019 17:08:22 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1iVe8y-00047J-7C; Fri, 15 Nov 2019 17:08:20 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: robh+dt@kernel.org, KCHSU0@nuvoton.com, broonie@kernel.org,
 thomas.fehrenbacher@siedle.de
Date: Fri, 15 Nov 2019 17:08:19 +0100
Message-Id: <20191115160819.15557-4-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191115160819.15557-1-m.felsch@pengutronix.de>
References: <20191115160819.15557-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kernel@pengutronix.de
Subject: [alsa-devel] [PATCH 3/3] ASoC: nau8810: add aux input control,
	available on NAU8812
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

From: Thomas Fehrenbacher <thomas.fehrenbacher@siedle.de>

This commit adds the support to control the aux-port on the nau8812
devices. We don't need to differentiate the aux-port registers since
those bitfields are set to '0' on the nau8810 devices [1,2].

[1] http://www.nuvoton.com/resource-files/NAU8810_Datasheet_Rev_2.8.pdf
[2] http://www.nuvoton.com/resource-files/NAU8812DatasheetRev2.7.pdf

Signed-off-by: Thomas Fehrenbacher <thomas.fehrenbacher@siedle.de>
[m.felsch@pengutronix.de: add commit message]
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 sound/soc/codecs/nau8810.c | 7 +++++++
 sound/soc/codecs/nau8810.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/sound/soc/codecs/nau8810.c b/sound/soc/codecs/nau8810.c
index a32a4a8d5f50..b1024d24d413 100644
--- a/sound/soc/codecs/nau8810.c
+++ b/sound/soc/codecs/nau8810.c
@@ -351,6 +351,9 @@ static const struct snd_kcontrol_new nau8810_snd_controls[] = {
 		NAU8810_DACOS_SFT, 1, 0),
 	SOC_SINGLE("ADC Oversampling Rate(128x) Switch", NAU8810_REG_ADC,
 		NAU8810_ADCOS_SFT, 1, 0),
+
+	SOC_SINGLE("AUX Input Enable Switch", NAU8810_REG_POWER1,
+		NAU8810_AUX_EN_SFT, 1, 0),
 };
 
 /* Speaker Output Mixer */
@@ -383,6 +386,8 @@ static const struct snd_kcontrol_new nau8810_inpga[] = {
 		NAU8810_NMICPGA_SFT, 1, 0),
 	SOC_DAPM_SINGLE("MicP Switch", NAU8810_REG_INPUT_SIGNAL,
 		NAU8810_PMICPGA_SFT, 1, 0),
+	SOC_DAPM_SINGLE("AUX Switch", NAU8810_REG_INPUT_SIGNAL,
+		NAU8810_AUXPGA_SFT, 1, 0),
 };
 
 /* Loopback Switch */
@@ -436,6 +441,7 @@ static const struct snd_soc_dapm_widget nau8810_dapm_widgets[] = {
 
 	SND_SOC_DAPM_INPUT("MICN"),
 	SND_SOC_DAPM_INPUT("MICP"),
+	SND_SOC_DAPM_INPUT("AUX"),
 	SND_SOC_DAPM_OUTPUT("MONOOUT"),
 	SND_SOC_DAPM_OUTPUT("SPKOUTP"),
 	SND_SOC_DAPM_OUTPUT("SPKOUTN"),
@@ -470,6 +476,7 @@ static const struct snd_soc_dapm_route nau8810_dapm_routes[] = {
 	{"Input PGA", NULL, "Mic Bias"},
 	{"Input PGA", "MicN Switch", "MICN"},
 	{"Input PGA", "MicP Switch", "MICP"},
+	{"Input PGA", "AUX Switch", "AUX"},
 
 	/* Digital Looptack */
 	{"Digital Loopback", "Switch", "ADC"},
diff --git a/sound/soc/codecs/nau8810.h b/sound/soc/codecs/nau8810.h
index 1ada31883dc6..7b5ecad173d3 100644
--- a/sound/soc/codecs/nau8810.h
+++ b/sound/soc/codecs/nau8810.h
@@ -69,6 +69,7 @@
 
 /* NAU8810_REG_POWER1 (0x1) */
 #define NAU8810_DCBUF_EN		(0x1 << 8)
+#define NAU8810_AUX_EN_SFT		6
 #define NAU8810_PLL_EN_SFT		5
 #define NAU8810_MICBIAS_EN_SFT	4
 #define NAU8810_ABIAS_EN		(0x1 << 3)
@@ -229,6 +230,7 @@
 /* NAU8810_REG_INPUT_SIGNAL (0x2C) */
 #define NAU8810_PMICPGA_SFT		0
 #define NAU8810_NMICPGA_SFT		1
+#define NAU8810_AUXPGA_SFT		2
 
 /* NAU8810_REG_PGAGAIN (0x2D) */
 #define NAU8810_PGAGAIN_SFT		0
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

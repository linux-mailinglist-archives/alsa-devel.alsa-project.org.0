Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B67D10C9F2
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 14:56:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CCC316B0;
	Thu, 28 Nov 2019 14:55:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CCC316B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574949403;
	bh=5zoLsRvRFQmVqx3ioAx7BpvzNhwlLPtSYN87WkW+AQY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GFYpaLWe2HiNlwK78iPbakr9W2URhU3GfzRAdYi+XrZ3JzQ7mrqKpKtew1P2oXLxU
	 jF7wbBDeCz0BHc9R3uQFAIrr6V3fNywOq99teMs/CDtNF+T9m3z0ehu3hhTB9jRiDJ
	 qImxJ+fPSC6Z3DwiJrGiTyXOxysk55mlKi+bfXzc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95583F800CB;
	Thu, 28 Nov 2019 14:54:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C114AF80149; Thu, 28 Nov 2019 14:54:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 735BAF800CB
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 14:54:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 735BAF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com
 header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="QMBwExph"
Received: by mail-wm1-x344.google.com with SMTP id u18so11056235wmc.3
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 05:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CAcvbytV4i2a1AoQdWPTiNmNKQ9t7p9KSzPJ6vzgFPc=;
 b=QMBwExphVxemOgnNlthrCN7d7TjJUTnBj6TFZ01UYgrmsdtrFkVTgNQ/Zi2/3ACcIq
 MPCvzCrDCSKSbGAIlSiuzm/9IxULCIaUciW2rDKc5/GughrDE761PaCJzeJ3o4DFyIN1
 u6Dk+3Z+zoHFjRUWPPL+xJXI/HnB8Dp3709yTU0b7PGkUQkdQThZA5kdg8KJgrw6g09+
 HSFXkXZClgDL0w5p1KmmVGklJE7ss8pTa94TOnp5uMpMlYnISTq3F1uaCZyzZK0kRDx2
 IP03p7J5zu8P02+fmdHuhBcC/2luiuieGYBDtDqWJt22FwqfAyeq4HSJ0PN4GnBMRv6k
 Q+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CAcvbytV4i2a1AoQdWPTiNmNKQ9t7p9KSzPJ6vzgFPc=;
 b=f0LCFcljMz40Ng58YmqMpZ0DBErFF4GoFNkr4/0P0FR6mUA2Bs5egCfX9NWMaj8sIl
 Y6e6DlfkwygU/I+Wt9rxUevg6on5mzSs31djWK18tVsVnnCnHT9VYB5GeD8IeaMpopmx
 bAGpFvvFf5JPRJO8yqXa59Sg3lSAlTGjEbxUNl5f1l+vlkVyihYxjc9hJ7RRfNZ4cbzI
 8d9DJT3gEXBWWTnz1qSi7sWH2e6affY1V3uXpzo6tXKSK+BmIfE6JXFdi3BNc8aFzrRa
 L6nvfnUq9aUK2ilSU2XSRtDaHcvuFuxqeLoYCHwzUdHOcBiZZQOWoS8DnhTpwubcumXZ
 AuAA==
X-Gm-Message-State: APjAAAU0UTMj5l0ktDcSOcxGnJFSNxdWtqY/NUGxz+0FoehLSGEFh1M3
 a51g829tAl5XzaBUmrr5FhgMFQ==
X-Google-Smtp-Source: APXvYqztu2661hM/tDpwiKNjROy9HqloK/NHG6y+VNcJz+qgtBkEj0z6E7TTM4iuyyiQM/oIV5bVQw==
X-Received: by 2002:a1c:2846:: with SMTP id o67mr9868162wmo.7.1574949292213;
 Thu, 28 Nov 2019 05:54:52 -0800 (PST)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
 by smtp.gmail.com with ESMTPSA id r2sm10960599wma.44.2019.11.28.05.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 05:54:51 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Lucas Stach <l.stach@pengutronix.de>, "Andrew F. Davis" <afd@ti.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Date: Thu, 28 Nov 2019 16:54:47 +0300
Message-Id: <20191128135447.26458-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191128122337.GC4210@sirena.org.uk>
References: <20191128122337.GC4210@sirena.org.uk>
MIME-Version: 1.0
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Chris Healy <cphealy@gmail.com>
Subject: [alsa-devel] [PATCH v2] ASoC: tlv320aic31xx: Add HP output driver
	pop reduction controls
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

HP output driver has two parameters that can be configured to reduce
pop noise: power-on delay and ramp-up step time. Two new kcontrols
have been added to set these parameters.

Also have to alter timeout in aic31xx_dapm_power_event() because default
timeout does fire when higher supported power-on delay are configured.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 sound/soc/codecs/tlv320aic31xx.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index f6f19fdc72f5..d6c462f21370 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -262,6 +262,19 @@ static SOC_ENUM_SINGLE_DECL(mic1lm_p_enum, AIC31XX_MICPGAPI, 2,
 static SOC_ENUM_SINGLE_DECL(mic1lm_m_enum, AIC31XX_MICPGAMI, 4,
 	mic_select_text);
 
+static const char * const hp_poweron_time_text[] = {
+	"0us", "15.3us", "153us", "1.53ms", "15.3ms", "76.2ms",
+	"153ms", "304ms", "610ms", "1.22s", "3.04s", "6.1s" };
+
+static SOC_ENUM_SINGLE_DECL(hp_poweron_time_enum, AIC31XX_HPPOP, 3,
+	hp_poweron_time_text);
+
+static const char * const hp_rampup_step_text[] = {
+	"0ms", "0.98ms", "1.95ms", "3.9ms" };
+
+static SOC_ENUM_SINGLE_DECL(hp_rampup_step_enum, AIC31XX_HPPOP, 1,
+	hp_rampup_step_text);
+
 static const DECLARE_TLV_DB_SCALE(dac_vol_tlv, -6350, 50, 0);
 static const DECLARE_TLV_DB_SCALE(adc_fgain_tlv, 0, 10, 0);
 static const DECLARE_TLV_DB_SCALE(adc_cgain_tlv, -2000, 50, 0);
@@ -285,6 +298,14 @@ static const struct snd_kcontrol_new common31xx_snd_controls[] = {
 
 	SOC_DOUBLE_R_TLV("HP Analog Playback Volume", AIC31XX_LANALOGHPL,
 			 AIC31XX_RANALOGHPR, 0, 0x7F, 1, hp_vol_tlv),
+
+	/* HP de-pop control: apply power not immediately but via ramp
+	 * function with these psarameters. Note that power up sequence
+	 * has to wait for this to complete; this is implemented by
+	 * polling HP driver status in aic31xx_dapm_power_event()
+	 */
+	SOC_ENUM("HP Output Driver Power-On time", hp_poweron_time_enum),
+	SOC_ENUM("HP Output Driver Ramp-up step", hp_rampup_step_enum),
 };
 
 static const struct snd_kcontrol_new aic31xx_snd_controls[] = {
@@ -357,6 +378,7 @@ static int aic31xx_dapm_power_event(struct snd_soc_dapm_widget *w,
 	struct aic31xx_priv *aic31xx = snd_soc_component_get_drvdata(component);
 	unsigned int reg = AIC31XX_DACFLAG1;
 	unsigned int mask;
+	unsigned int timeout = 500 * USEC_PER_MSEC;
 
 	switch (WIDGET_BIT(w->reg, w->shift)) {
 	case WIDGET_BIT(AIC31XX_DACSETUP, 7):
@@ -367,9 +389,13 @@ static int aic31xx_dapm_power_event(struct snd_soc_dapm_widget *w,
 		break;
 	case WIDGET_BIT(AIC31XX_HPDRIVER, 7):
 		mask = AIC31XX_HPLDRVPWRSTATUS_MASK;
+		if (event == SND_SOC_DAPM_POST_PMU)
+			timeout = 7 * USEC_PER_SEC;
 		break;
 	case WIDGET_BIT(AIC31XX_HPDRIVER, 6):
 		mask = AIC31XX_HPRDRVPWRSTATUS_MASK;
+		if (event == SND_SOC_DAPM_POST_PMU)
+			timeout = 7 * USEC_PER_SEC;
 		break;
 	case WIDGET_BIT(AIC31XX_SPKAMP, 7):
 		mask = AIC31XX_SPLDRVPWRSTATUS_MASK;
@@ -389,9 +415,11 @@ static int aic31xx_dapm_power_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		return aic31xx_wait_bits(aic31xx, reg, mask, mask, 5000, 100);
+		return aic31xx_wait_bits(aic31xx, reg, mask, mask,
+				5000, timeout / 5000);
 	case SND_SOC_DAPM_POST_PMD:
-		return aic31xx_wait_bits(aic31xx, reg, mask, 0, 5000, 100);
+		return aic31xx_wait_bits(aic31xx, reg, mask, 0,
+				5000, timeout / 5000);
 	default:
 		dev_dbg(component->dev,
 			"Unhandled dapm widget event %d from %s\n",
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

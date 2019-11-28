Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4577310C61C
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 10:41:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 973C916E9;
	Thu, 28 Nov 2019 10:41:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 973C916E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574934114;
	bh=vNjh/v7tcFwK9qRu6rqEGVLYYjhpFT9/XpvrPGURpxs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jh1Ah/wTqMAbzliGok4HZ4zFTxE2vhKGjWsgsMNJRIvzJgxq9avaeTHOQ82kegBSe
	 VCZsHw3yx1T+ZD6XSjbJ1s/1l10tEmYlAsA/sM3C/vOBknmUhHti0TU8kwDU1QklAB
	 RLkyrRkpgyan5we/hfztoFibxmwu5prjLfWciH/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3E23F8013A;
	Thu, 28 Nov 2019 10:40:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6E93F80149; Thu, 28 Nov 2019 10:40:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72B8CF80106
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 10:40:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72B8CF80106
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com
 header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="wFhcln6M"
Received: by mail-wr1-x444.google.com with SMTP id n1so30255202wra.10
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 01:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/JTPZnckyzjgJEzpIRleuMXljaM0DFNZiV1GxL/alt8=;
 b=wFhcln6M8qxf18N1O/bdB4MCLIw8mwWvsHlQJCgz+bkNzJ5TKu63c1aX109Yy0GTci
 Irrx9dzqltC3ArhPSav2bCyG0L+eTVr8lNvEhb7eNstKT1Zyj6Vc9n72zpeyKrJdsuS0
 6bYbohiwF0D4Vl946uBLeLqIgUKHQjlgG5kA6oD7Ei7DcjEJvpX9+Ay00ONY1aEShlSC
 KTTEmsZH71kbakbsWSd79pAft5+k/AYNVHNtgDoUV0e1awngaSdpRHINFE25dfQK3aLN
 5eYjABk8G7n617MEqZiStbaTxZqf77Q8SYETeUVVUFQv41pJIbTjQFqUi1jr13IUfzJ9
 rhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/JTPZnckyzjgJEzpIRleuMXljaM0DFNZiV1GxL/alt8=;
 b=kiaZmOXhp8yN4pfxfaD5yTCpodn5iqC/nSpFqwYuUWEmq1DtQ392VHSxmt+RBTBK46
 l7im+MgE0dieu1JKbLxA+nCIlgv526SSgG3REpBLwws+CrB4m4tah/SyJZNijlBrBB13
 EYvWu5yJ9GhgbsqkER8z0/itW1RIRzR/qo90gzu9JpR9Rdgr2TXjJtbtsrc8VbHpEC5E
 MbLw0bwe6LFemSrMz4v+1p36Bq35zGt5D1KRVlxEFsqdkPLQCzxonb8LCyUeNzopQJT5
 /7luvpZiI34/3R1+cfJG29FCEqOXFfzfpqPZknoRmaz1OImge4/XUr4ieHZw2GpfQwIB
 Z0dw==
X-Gm-Message-State: APjAAAULuvgnRdytu8eRvgNVrkud2Evqi4IGju8LnrYa2bYX+9NRc3K/
 2hCuaDf4FLUQ6AAWGjFPy2HZCg==
X-Google-Smtp-Source: APXvYqwu1QjgKfwI4JCeQQx1SHzEZw7WIBYrq8BpklWehtaitBzDqcEh+OUYTfpGukVZw43XcCA6rw==
X-Received: by 2002:a05:6000:149:: with SMTP id
 r9mr7594495wrx.147.1574934004238; 
 Thu, 28 Nov 2019 01:40:04 -0800 (PST)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
 by smtp.gmail.com with ESMTPSA id f6sm23073673wrr.15.2019.11.28.01.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 01:40:03 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Lucas Stach <l.stach@pengutronix.de>, "Andrew F. Davis" <afd@ti.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Date: Thu, 28 Nov 2019 12:39:55 +0300
Message-Id: <20191128093955.29567-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Chris Healy <cphealy@gmail.com>
Subject: [alsa-devel] [PATCH] ASoC: tlv320aic31xx: Add HP output driver pop
	reduction controls
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

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 sound/soc/codecs/tlv320aic31xx.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 67323188afd2..740e75032f36 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -263,6 +263,19 @@ static SOC_ENUM_SINGLE_DECL(cm_m_enum, AIC31XX_MICPGAMI, 6, mic_select_text);
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
@@ -286,6 +299,9 @@ static const struct snd_kcontrol_new common31xx_snd_controls[] = {
 
 	SOC_DOUBLE_R_TLV("HP Analog Playback Volume", AIC31XX_LANALOGHPL,
 			 AIC31XX_RANALOGHPR, 0, 0x7F, 1, hp_vol_tlv),
+
+	SOC_ENUM("HP Output Driver Power-On time", hp_poweron_time_enum),
+	SOC_ENUM("HP Output Driver Ramp-up step", hp_rampup_step_enum),
 };
 
 static const struct snd_kcontrol_new aic31xx_snd_controls[] = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

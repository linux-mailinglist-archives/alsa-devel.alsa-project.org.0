Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7247B3EF5
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:06:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 823F9EB1;
	Sat, 30 Sep 2023 10:05:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 823F9EB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061184;
	bh=DO0SCkjO3npMGLJlon0IBHmw5QcBsEY7QhrN8hiCvw8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aDOFEh31Yk9Nx5egqeEd0U4e/GEcNd5A92vMs3vWfts89ySMhN8rcHYwcIPwVzH9W
	 vD7fpdevl0MSs3LOk08PhWjawJu2Beiclmwrw1FS6MFrmeR3kJunbwouhz9xCam/oi
	 YvAu9SJRDemzvJX/7TeYOBhL6D5tw7LoKhqOp3jM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7397EF80604; Sat, 30 Sep 2023 10:05:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE39DF80606;
	Sat, 30 Sep 2023 10:05:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30DA2F8016A; Wed, 27 Sep 2023 04:07:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by alsa1.perex.cz (Postfix) with ESMTP id 1229CF80130
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 04:06:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1229CF80130
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1978105:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256);
 Wed, 27 Sep 2023 10:06:17 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Wed, 27 Sep
 2023 10:06:17 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Wed, 27 Sep 2023 10:06:17 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>
CC: ChiYuan Huang <cy_huang@richtek.com>, Allen Lin <allen_lin@richtek.com>,
	<alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: codecs: rtq9128: Add TDM data source selection
Date: Wed, 27 Sep 2023 10:06:16 +0800
Message-ID: <1695780376-32301-1-git-send-email-cy_huang@richtek.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: prvs=1631658C43=cy_huang@richtek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PQRZZ4DTREGJBL3N2UUT2MCKZIRAOE2O
X-Message-ID-Hash: PQRZZ4DTREGJBL3N2UUT2MCKZIRAOE2O
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:05:10 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PQRZZ4DTREGJBL3N2UUT2MCKZIRAOE2O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Since rtq9128 can support 4 channel I2S mode audio data, there are two
dedicated data input pins for CH12 and CH34.  But in TDM mode, input
source was already drived on one data pin for multiple data slots. In
this case, only one input source is needed for TDM mode.

This patch is to add the data source pin selection for CH12 and CH34.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 sound/soc/codecs/rtq9128.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/rtq9128.c b/sound/soc/codecs/rtq9128.c
index 926b79ed8078..3cf613c6900e 100644
--- a/sound/soc/codecs/rtq9128.c
+++ b/sound/soc/codecs/rtq9128.c
@@ -225,6 +225,7 @@ static const char * const phase_select_text[] = {
 	"180 degree",	"225 degree",	"270 degree",	"315 degree",
 };
 static const char * const dvdduv_select_text[] = { "1P4V", "1P5V", "2P1V", "2P3V" };
+static const char * const tdm_data_select_text[] = { "DATA1", "DATA2" };
 
 static const struct soc_enum rtq9128_ch1_si_enum =
 	SOC_ENUM_SINGLE(RTQ9128_REG_SDI_SEL, 6, ARRAY_SIZE(source_select_text), source_select_text);
@@ -246,6 +247,12 @@ static const struct soc_enum rtq9128_out3_phase_enum =
 static const struct soc_enum rtq9128_out4_phase_enum =
 	SOC_ENUM_SINGLE(RTQ9128_REG_PLLTRI_GEN2, 0, ARRAY_SIZE(phase_select_text),
 			phase_select_text);
+static const struct soc_enum rtq9128_ch12_tdm_data_select_enum =
+	SOC_ENUM_SINGLE(RTQ9128_REG_SDO_SEL, 5, ARRAY_SIZE(tdm_data_select_text),
+			tdm_data_select_text);
+static const struct soc_enum rtq9128_ch34_tdm_data_select_enum =
+	SOC_ENUM_SINGLE(RTQ9128_REG_SDO_SEL, 4, ARRAY_SIZE(tdm_data_select_text),
+			tdm_data_select_text);
 
 /*
  * In general usage, DVDD could be 1P8V, 3P0V or 3P3V.
@@ -277,6 +284,8 @@ static const struct snd_kcontrol_new rtq9128_snd_ctrls[] = {
 	SOC_ENUM("OUT3 Phase Select", rtq9128_out3_phase_enum),
 	SOC_ENUM("OUT4 Phase Select", rtq9128_out4_phase_enum),
 	SOC_ENUM("DVDD UV Threshold Select", rtq9128_dvdduv_select_enum),
+	SOC_ENUM("CH12 TDM Data Select", rtq9128_ch12_tdm_data_select_enum),
+	SOC_ENUM("CH34 TDM Data Select", rtq9128_ch34_tdm_data_select_enum),
 };
 
 static int rtq9128_dac_power_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol,

base-commit: c351835058419c1eb8791941a057c3f3e6068cb6
-- 
2.34.1


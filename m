Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB1675C250
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 11:00:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4188C83E;
	Fri, 21 Jul 2023 10:59:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4188C83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689930014;
	bh=kU2Bs5vS/3uiQcEVO7vkNTXtJKfpO9ftuilDt0XCrP0=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tA9x9io5NUlZwOGDeyYjTsMAxj/paDjAMvEY1h4J3HF+EmEdl3dqTKZNBvndZ/M0D
	 vyh0tcRwd/jB7DfGq/lCR3v257LeBwUG5WfOFD2oC0zOs3oDc8NvLYZ7BIygsvJQRG
	 Md8/hJIbDxzcN0dgDNX53X0uMqF6DDv/QPH5Nuew=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 772C7F8047D; Fri, 21 Jul 2023 10:57:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37E6FF8027B;
	Fri, 21 Jul 2023 10:57:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67F84F804DA; Fri, 21 Jul 2023 10:57:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0D17F800D2
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 10:57:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0D17F800D2
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 53C102004DB;
	Fri, 21 Jul 2023 10:57:47 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1AFC02004B5;
	Fri, 21 Jul 2023 10:57:47 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B7DF21820F57;
	Fri, 21 Jul 2023 16:57:45 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: wm8960: Add DAC filter characteristics selection
Date: Fri, 21 Jul 2023 16:24:02 +0800
Message-Id: <1689927842-21165-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: D7GDIFBXKNQEO5D3HNMWA6O4ZMJML6NB
X-Message-ID-Hash: D7GDIFBXKNQEO5D3HNMWA6O4ZMJML6NB
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D7GDIFBXKNQEO5D3HNMWA6O4ZMJML6NB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Support DAC filter characteristics selection: Normal mode
and Sloping stopband. Sloping stopband may have
better frequency response.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
changes in v2:
- modify capitalise

 sound/soc/codecs/wm8960.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index 366f5d769d6d..5db9b0338396 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -155,6 +155,7 @@ static const char *wm8960_adc_data_output_sel[] = {
 	"Left Data = Right ADC; Right Data = Left ADC",
 };
 static const char *wm8960_dmonomix[] = {"Stereo", "Mono"};
+static const char *wm8960_dacslope[] = {"Normal", "Sloping"};
 
 static const struct soc_enum wm8960_enum[] = {
 	SOC_ENUM_SINGLE(WM8960_DACCTL1, 5, 4, wm8960_polarity),
@@ -165,6 +166,7 @@ static const struct soc_enum wm8960_enum[] = {
 	SOC_ENUM_SINGLE(WM8960_ALC3, 8, 2, wm8960_alcmode),
 	SOC_ENUM_SINGLE(WM8960_ADDCTL1, 2, 4, wm8960_adc_data_output_sel),
 	SOC_ENUM_SINGLE(WM8960_ADDCTL1, 4, 2, wm8960_dmonomix),
+	SOC_ENUM_SINGLE(WM8960_DACCTL2, 1, 2, wm8960_dacslope),
 };
 
 static const int deemph_settings[] = { 0, 32000, 44100, 48000 };
@@ -307,6 +309,7 @@ SOC_SINGLE_TLV("Right Output Mixer RINPUT3 Volume",
 
 SOC_ENUM("ADC Data Output Select", wm8960_enum[6]),
 SOC_ENUM("DAC Mono Mix", wm8960_enum[7]),
+SOC_ENUM("DAC Filter Characteristics", wm8960_enum[8]),
 };
 
 static const struct snd_kcontrol_new wm8960_lin_boost[] = {
-- 
2.34.1


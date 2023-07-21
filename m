Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EDC75C190
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:27:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36E34E93;
	Fri, 21 Jul 2023 10:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36E34E93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689928051;
	bh=fjkwoYEet82kXX5nCKnW/U40nFPSyt/Ky9ww18b5XoM=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Aw7rfDkXKpKA8qRRz7d7lSUOrh+sifAs09OZEH9whzWH85yyXGDadq2N8LIu4uChf
	 rnrlPLxhSO1kR18IhoJy/FFcyvGzpy3eBQftx+OgCtNWyIrKhwz7+BaJf/llNss2xo
	 EfEd8wm+KBHJUMCPDVdkWPYViF9QKhR0QPWI6Knc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00EE9F80520; Fri, 21 Jul 2023 10:26:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F2E1F8007E;
	Fri, 21 Jul 2023 10:26:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FCE2F8032D; Fri, 21 Jul 2023 10:26:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E09B5F8007E
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 10:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E09B5F8007E
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 39B5E1A04CE;
	Fri, 21 Jul 2023 10:26:10 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F24761A04D7;
	Fri, 21 Jul 2023 10:26:09 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 9A16D183486C;
	Fri, 21 Jul 2023 16:26:08 +0800 (+08)
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
Subject: [PATCH] ASoC: wm8960: Add DAC filter characteristics selection
Date: Fri, 21 Jul 2023 15:52:28 +0800
Message-Id: <1689925948-21001-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: RE4QGVNEXHQPWHDFP3MVMQWJM53PRCJ7
X-Message-ID-Hash: RE4QGVNEXHQPWHDFP3MVMQWJM53PRCJ7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RE4QGVNEXHQPWHDFP3MVMQWJM53PRCJ7/>
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
---
 sound/soc/codecs/wm8960.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index 366f5d769d6d..ff1355306b43 100644
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
+SOC_ENUM("DAC filter characteristics", wm8960_enum[8]),
 };
 
 static const struct snd_kcontrol_new wm8960_lin_boost[] = {
-- 
2.34.1


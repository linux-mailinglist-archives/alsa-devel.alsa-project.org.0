Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E90DC763150
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 11:12:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E9137F8;
	Wed, 26 Jul 2023 11:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E9137F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690362733;
	bh=X1dUfZEbupeIwim/opFMnIXqh5u4FOapK8rET02P2mY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=eHO+fk0GYC0P+vMS1YJ1nracKnoum2hjnFYLQvEDkdSGNF49ri6xWYYV1uD526hvg
	 qcFdy9Wj7jg1fud1lh5OVLsALpJKBu1MLJ2VtdDHCEuS+lCxj2/qHcNAHrFCGQ59/K
	 3Aimv7j0QJaP3JsYVUYg7LMzXlBr1GuAiVvmaqwY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13399F80153; Wed, 26 Jul 2023 11:11:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4137F80153;
	Wed, 26 Jul 2023 11:11:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7110DF8019B; Wed, 26 Jul 2023 11:11:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by alsa1.perex.cz (Postfix) with ESMTP id EBBF3F800C7
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 11:11:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBBF3F800C7
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 36Q9AmjeE001602,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 36Q9AmjeE001602
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Wed, 26 Jul 2023 17:10:48 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 26 Jul 2023 17:11:00 +0800
Received: from sw-server.realtek.com.tw (172.22.102.117) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 26 Jul 2023 17:10:59 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <Vijendar.Mukunda@amd.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH v2] ASoC: rt1316: fix key tone missing
Date: Wed, 26 Jul 2023 09:10:51 +0000
Message-ID: <20230726091051.658754-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.117]
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: XRZCTRSBBLVWMIC6K4OFPAHXCIDFQXWF
X-Message-ID-Hash: XRZCTRSBBLVWMIC6K4OFPAHXCIDFQXWF
X-MailFrom: shumingf@realtek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XRZCTRSBBLVWMIC6K4OFPAHXCIDFQXWF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

This patch adds a control that there are three options to control the digital volume output.
The user could select "immediately" to make volume updates immediately
and avoid key tone missing issues.
In default, the driver selects that the volume update when a zero-crossing with a soft ramp.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Reported-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/codecs/rt1316-sdw.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 721821d9e9af..10a53c8d4874 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -424,6 +424,15 @@ static SOC_ENUM_SINGLE_DECL(rt1316_rx_data_ch_enum,
 	SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, RT1316_SDCA_ENT_UDMPU21, RT1316_SDCA_CTL_UDMPU_CLUSTER, 0), 0,
 	rt1316_rx_data_ch_select);
 
+static const char * const rt1316_dac_output_vol_select[] = {
+	"immediately",
+	"zero crossing",
+	"zero crossing with soft ramp",
+};
+
+static SOC_ENUM_SINGLE_DECL(rt1316_dac_vol_ctl_enum,
+	0xc010, 6, rt1316_dac_output_vol_select);
+
 static const struct snd_kcontrol_new rt1316_snd_controls[] = {
 
 	/* I2S Data Channel Selection */
@@ -442,6 +451,9 @@ static const struct snd_kcontrol_new rt1316_snd_controls[] = {
 	/* IV mixer Control */
 	SOC_DOUBLE("Isense Mixer Switch", 0xc605, 2, 0, 1, 1),
 	SOC_DOUBLE("Vsense Mixer Switch", 0xc605, 3, 1, 1, 1),
+
+	/* DAC Output Volume Control */
+	SOC_ENUM("DAC Output Vol Control", rt1316_dac_vol_ctl_enum),
 };
 
 static const struct snd_kcontrol_new rt1316_sto_dac =
-- 
2.34.1


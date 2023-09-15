Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A895D7A1389
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 04:07:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4B1B84C;
	Fri, 15 Sep 2023 04:06:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4B1B84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694743621;
	bh=CyuNw99YJL+VqmHDfPJQuAJ2OaV0jQh0+/qwg935wXs=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DXRFsomIKZKswr1lTwmAWZaVQe7UExhscTxv82q6eni+Efodfs4msqH+f5M+xkxKx
	 iERx/3vF2GRcMCLl1eA1yA2c2xT9igaBBne64dF+9ZtRde+5tVPsW28v4ThOJMTkoG
	 /1LxYshFrwYnkucd95wdzOK1hr7J2a0d0tYAwwdA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D33DF80141; Fri, 15 Sep 2023 04:06:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1E19F80246;
	Fri, 15 Sep 2023 04:06:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5192F80425; Fri, 15 Sep 2023 04:06:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F791F80141
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 04:05:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F791F80141
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 38F25i0K21919137,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.92/5.92) with ESMTPS id 38F25i0K21919137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Sep 2023 10:05:44 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 15 Sep 2023 10:05:44 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 15 Sep 2023 10:05:43 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <judyhsiao@google.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt1015: fix the first word being cut off
Date: Fri, 15 Sep 2023 10:05:30 +0800
Message-ID: <20230915020530.83452-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: REIGPUIRSLVTBDNBAR7KP4FXOXNKEL6V
X-Message-ID-Hash: REIGPUIRSLVTBDNBAR7KP4FXOXNKEL6V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/REIGPUIRSLVTBDNBAR7KP4FXOXNKEL6V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

This patch adds a control that there are four options to control the digital volume output.
The user could select "immediate" to make volume updates immediately.
In default, the driver selects the volume update with "zero detection + soft inc/dec change".

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1015.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 99ec0f9a8362..1250cfaf2adc 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -546,6 +546,16 @@ static int rt1015_bypass_boost_put(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static const char * const rt1015_dac_output_vol_select[] = {
+	"immediate",
+	"zero detection + immediate change",
+	"zero detection + inc/dec change",
+	"zero detection + soft inc/dec change",
+};
+
+static SOC_ENUM_SINGLE_DECL(rt1015_dac_vol_ctl_enum,
+	RT1015_DAC3, 2, rt1015_dac_output_vol_select);
+
 static const struct snd_kcontrol_new rt1015_snd_controls[] = {
 	SOC_SINGLE_TLV("DAC Playback Volume", RT1015_DAC1, RT1015_DAC_VOL_SFT,
 		127, 0, dac_vol_tlv),
@@ -556,6 +566,9 @@ static const struct snd_kcontrol_new rt1015_snd_controls[] = {
 	SOC_ENUM("Mono LR Select", rt1015_mono_lr_sel),
 	SOC_SINGLE_EXT("Bypass Boost", SND_SOC_NOPM, 0, 1, 0,
 		rt1015_bypass_boost_get, rt1015_bypass_boost_put),
+
+	/* DAC Output Volume Control */
+	SOC_ENUM("DAC Output Control", rt1015_dac_vol_ctl_enum),
 };
 
 static int rt1015_is_sys_clk_from_pll(struct snd_soc_dapm_widget *source,
-- 
2.34.1


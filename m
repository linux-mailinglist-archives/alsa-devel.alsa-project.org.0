Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AACB883DE86
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jan 2024 17:21:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32499950;
	Fri, 26 Jan 2024 17:20:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32499950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706286067;
	bh=5PS7c/dCCqcGCKbQTbtxxziKGZzqWDqE28S0ctit9oc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kiqL5La3eN/vxwJ1x3zjdvykW3gO4kyHXdVXaZ7ZGz90NYivwoU9HrcoSVBGyhG1E
	 /ZiKc5pq5XqvgOY0xc3GQB7hCsb96zP0kAwjGnfD+8JbDWmt3RDGn61Hc++cXuTqYX
	 8z9qQ4Eo/K/n5aCRMfqzMOySbPMLsJ5ko4DrjZoo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4241FF805E8; Fri, 26 Jan 2024 17:18:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E51F2F806BD;
	Fri, 26 Jan 2024 17:18:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 790F0F8028D; Fri, 26 Jan 2024 08:45:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail78-66.sinamail.sina.com.cn (mail78-66.sinamail.sina.com.cn
 [219.142.78.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07FC6F8022B
	for <alsa-devel@alsa-project.org>; Fri, 26 Jan 2024 08:45:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07FC6F8022B
Received: from unknown (HELO zy-virtual-machine.localdomain)([222.70.13.170])
	by sina.net (10.75.30.239) with ESMTP
	id 65B3630A0001F3AA; Fri, 26 Jan 2024 15:45:15 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 844E2918951444D3B8BF1970F4D9E86D
X-SMAIL-UIID: 844E2918951444D3B8BF1970F4D9E86D-20240126-154515
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH] ASoC: codecs: ES8326: Adding new kcontrols about Headphone
 resistance
Date: Fri, 26 Jan 2024 15:45:12 +0800
Message-Id: <20240126074512.62013-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IRFHQ6LRGU4LN74RUQDSWGR2K3HEGANR
X-Message-ID-Hash: IRFHQ6LRGU4LN74RUQDSWGR2K3HEGANR
X-Mailman-Approved-At: Fri, 26 Jan 2024 16:18:53 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IRFHQ6LRGU4LN74RUQDSWGR2K3HEGANR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We get headphone detect issue.And we fix it with the new kcontrols

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 608862aebd71..aa5044eef0ca 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -226,6 +226,29 @@ static const char *const hp_spkvol_switch[] = {
 	"HPVOL: HPL+HPR, SPKVOL: SPKL+SPKR",
 };
 
+static const char *const hp_det_resistance[] = {
+	"10K",
+	"5K",
+};
+
+static const char *const micbias_resistance[] = {
+	"5.5K",
+	"4.5K",
+	"3.6K",
+	"2.8K",
+	"2.1K",
+	"1.5K",
+	"1.0K",
+	"0.6K",
+};
+
+static const char *const button_resistance[] = {
+	"100 percent",
+	"90 percent",
+	"80 percent",
+	"70 percent",
+};
+
 static const struct soc_enum dacpol =
 	SOC_ENUM_SINGLE(ES8326_DAC_DSM, 4, 4, dacpol_txt);
 static const struct soc_enum alc_winsize =
@@ -234,6 +257,12 @@ static const struct soc_enum drc_winsize =
 	SOC_ENUM_SINGLE(ES8326_DRC_WINSIZE, 4, 16, winsize);
 static const struct soc_enum hpvol_spkvol_switch =
 	SOC_ENUM_SINGLE(ES8326_HP_MISC, 6, 4, hp_spkvol_switch);
+static const struct soc_enum hp_det =
+	SOC_ENUM_SINGLE(ES8326_ANA_MICBIAS, 7, 2, hp_det_resistance);
+static const struct soc_enum micbias_res =
+	SOC_ENUM_SINGLE(ES8326_ANA_MICBIAS, 4, 8, micbias_resistance);
+static const struct soc_enum button_res =
+	SOC_ENUM_SINGLE(ES8326_ANA_MICBIAS, 0, 4, button_resistance);
 
 static const struct snd_kcontrol_new es8326_snd_controls[] = {
 	SOC_SINGLE_TLV("DAC Playback Volume", ES8326_DACL_VOL, 0, 0xbf, 0, dac_vol_tlv),
@@ -270,6 +299,9 @@ static const struct snd_kcontrol_new es8326_snd_controls[] = {
 	SOC_SINGLE_TLV("SPKR Playback Volume", ES8326_SPKR_VOL, 0, 0xbf, 0, dac_vol_tlv),
 
 	SOC_ENUM("HPVol SPKVol Switch", hpvol_spkvol_switch),
+	SOC_ENUM("Hpdet Resistance", hp_det),
+	SOC_ENUM("Micbias Resistance", micbias_res),
+	SOC_ENUM("Button Resistance", button_res),
 };
 
 static const struct snd_soc_dapm_widget es8326_dapm_widgets[] = {
-- 
2.17.1


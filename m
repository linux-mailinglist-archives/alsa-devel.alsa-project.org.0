Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4315B6919EE
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 09:23:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F379846;
	Fri, 10 Feb 2023 09:22:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F379846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676017380;
	bh=eWtoGF52KDNVxOUxtIGPJfL5prPzyMRzWiCsq1FwsjA=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZGli4O03Iqv43TKAASDTD1cEKOxoSKYSVkiFFO/PcLr8zUP8e+eWoBXnCCJTs59BJ
	 bxKjy2qoUs+I1JfARxMNg0iWBxDGf8RJW5Fs80oJ/gkI2jJ9kVh+skCJEHK9NqRuFP
	 /vvA7a+hajHg44FCElpjREN0K4bDq9aVSrM+NUCk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA204F800B8;
	Fri, 10 Feb 2023 09:22:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69CBCF800E4; Fri, 10 Feb 2023 09:22:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C9D4F80086
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 09:21:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C9D4F80086
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 31A8LlOR2023653,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 31A8LlOR2023653
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 10 Feb 2023 16:21:47 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 10 Feb 2023 16:21:47 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 10 Feb 2023 16:21:47 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt712-sdca: fix coding style and unconditionally return
 issues
Date: Fri, 10 Feb 2023 16:21:41 +0800
Message-ID: <20230210082141.24077-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.38.1
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
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: 
	=?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIyLzUvMjQgpFekyCAwNjoxNDowMA==?=
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
Message-ID-Hash: VBGH6PGR5OL4B4UNASH3D67YJWDVMP6D
X-Message-ID-Hash: VBGH6PGR5OL4B4UNASH3D67YJWDVMP6D
X-MailFrom: shumingf@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
 pierre-louis.bossart@intel.com, bard.liao@intel.com,
 Shuming Fan <shumingf@realtek.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VBGH6PGR5OL4B4UNASH3D67YJWDVMP6D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

This patch fixes
1. coding style issues
2. check if the setting was set already in rt712_sdca_mux_put callback

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt712-sdca.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index cc3f6dae1871..8d2fa769bb2e 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -366,8 +366,9 @@ static void rt712_sdca_btn_check_handler(struct work_struct *work)
 				break;
 			}
 		}
-	} else
+	} else {
 		rt712->jack_type = 0;
+	}
 
 	dev_dbg(&rt712->slave->dev, "%s, btn_type=0x%x\n",	__func__, btn_type);
 	snd_soc_jack_report(rt712->hs_jack, rt712->jack_type | btn_type,
@@ -707,6 +708,7 @@ static int rt712_sdca_mux_put(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int *item = ucontrol->value.enumerated.item;
 	unsigned int mask_sft;
+	unsigned int val;
 
 	if (item[0] >= e->items)
 		return -EINVAL;
@@ -718,6 +720,11 @@ static int rt712_sdca_mux_put(struct snd_kcontrol *kcontrol,
 	else
 		return -EINVAL;
 
+	rt712_sdca_index_read(rt712, RT712_VENDOR_HDA_CTL, RT712_MIXER_CTL1, &val);
+	val = (val >> mask_sft) & 0x3;
+	if (!val)
+		return 0;
+
 	rt712_sdca_index_write(rt712, RT712_VENDOR_HDA_CTL,
 		RT712_MIXER_CTL1, 0x3fff);
 	rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
@@ -1094,19 +1101,24 @@ static int rt712_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	/* set sampling frequency */
-	if (dai->id == RT712_AIF1) {
+	switch (dai->id) {
+	case RT712_AIF1:
 		regmap_write(rt712->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_CS01, RT712_SDCA_CTL_SAMPLE_FREQ_INDEX, 0),
 			sampling_rate);
 		regmap_write(rt712->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_CS11, RT712_SDCA_CTL_SAMPLE_FREQ_INDEX, 0),
 			sampling_rate);
-	}
-
-	if (dai->id == RT712_AIF2)
+		break;
+	case RT712_AIF2:
 		regmap_write(rt712->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_CS31, RT712_SDCA_CTL_SAMPLE_FREQ_INDEX, 0),
 			sampling_rate);
+		break;
+	default:
+		dev_err(component->dev, "Wrong DAI id\n");
+		return -EINVAL;
+	}
 
 	return 0;
 }
-- 
2.38.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0412C2A4B7A
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 17:29:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ED1916B2;
	Tue,  3 Nov 2020 17:28:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ED1916B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604420960;
	bh=Njw/2Z6h3EbMmFbdDIqFHZbB609XPZJX9YQCSkVTafQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XtcGlwdZRkWQwtyztF+aSjBj3wP/UUrDV39JauwllSrmq490Ivk0mSt3xOjS8QfGp
	 AlbL4NlK7tvIvgTOdxl7PHxqoVSIq8VGLwdT4N+PSPVTNAtPYCunWIYKN9SWYHBS24
	 G48j7svrPBkNj72HUyXLUy4LG+ERfYlXiYzVjUcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B85AFF8015A;
	Tue,  3 Nov 2020 17:26:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD739F80171; Tue,  3 Nov 2020 13:59:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2ECBF80108
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 13:59:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2ECBF80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="Du6+RNFQ"
Received: from pps.filterd (m0170390.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A3CuoqA000919
 for <alsa-devel@alsa-project.org>; Tue, 3 Nov 2020 07:59:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=smtpout1; bh=gXiXEbn51dmWApabI5YJtghO8VjiHbPBfHDnqtSPYug=;
 b=Du6+RNFQm7y6sBg9rTCWKAytw59tv6joyKSNOUT8usHfQqyL5dlxpGMCELkZdEn7i+dt
 Jmt1t1B4lL+JmsGfixR8DJMymYPBqEciVsLd9yyr7GxZIbcwSpbSTAt8VGUOUpZISAHm
 jsCkCNdgXTY8YLKdrVCGiXNnQC6nfoJZSVfgaoBJFnOkLuiHLU4eL4jT/C2EEhD7s3gE
 E2G5hhHMtNsSG4DkPFP9rYcB4kpxLJa5RI5whoSShWiqTHFhK335TLEpHm0VKnepA24c
 5A75UMapeimzA2cZuD+gm1QHBBSOPl9FWMVbLEMWeOOm50fIFz3NfZgQjBG6zQMQ/Xi3 0A== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0a-00154904.pphosted.com with ESMTP id 34h302t6kp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <alsa-devel@alsa-project.org>; Tue, 03 Nov 2020 07:59:15 -0500
Received: from pps.filterd (m0142699.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A3Co64q109691
 for <alsa-devel@alsa-project.org>; Tue, 3 Nov 2020 07:59:15 -0500
Received: from ausxipps310.us.dell.com (AUSXIPPS310.us.dell.com
 [143.166.148.211])
 by mx0a-00154901.pphosted.com with ESMTP id 34k6pg91hc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <alsa-devel@alsa-project.org>; Tue, 03 Nov 2020 07:59:15 -0500
X-LoopCount0: from 10.69.132.19
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.77,448,1596517200"; d="scan'208";a="559511945"
From: Perry Yuan <Perry.Yuan@dell.com>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: rt715:add Mic Mute LED control support
Date: Tue,  3 Nov 2020 04:58:59 -0800
Message-Id: <20201103125859.8759-1-Perry_Yuan@Dell.com>
X-Mailer: git-send-email 2.24.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-03_08:2020-11-03,
 2020-11-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxlogscore=765 priorityscore=1501 clxscore=1011
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011030087
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 phishscore=0
 adultscore=0 bulkscore=0 mlxlogscore=901 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011030088
X-Mailman-Approved-At: Tue, 03 Nov 2020 17:26:07 +0100
Cc: alsa-devel@alsa-project.org, Limonciello Mario <Mario.Limonciello@dell.com>,
 linux-kernel@vger.kernel.org, perry_yuan <Perry.Yuan@dell.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: perry_yuan <perry_yuan@dell.com>

Some new Dell system is going to support audio internal micphone
privacy setting from hardware level with micmute led state changing

This patch allow to change micmute led state through this micphone
led control interface like hda_generic provided.

Signed-off-by: Perry Yuan  <perry_yuan@dell.com>
Signed-off-by: Limonciello Mario <mario_limonciello@dell.com>
---
 sound/soc/codecs/rt715.c | 43 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/rt715.h |  1 +
 2 files changed, 44 insertions(+)

diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index 099c8bd20006..2df2895d0092 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -26,6 +26,7 @@
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/of_device.h>
+#include <linux/leds.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -213,6 +214,45 @@ static const DECLARE_TLV_DB_SCALE(mic_vol_tlv, 0, 1000, 0);
 	.private_value = SOC_DOUBLE_R_VALUE(reg_left, reg_right, xshift, \
 					    xmax, xinvert) }
 
+static const char *rt715_micmute_led_mode[] = {
+  "Off", "On"
+};
+
+static const struct soc_enum rt715_micmute_led_mode_enum =
+  SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(rt715_micmute_led_mode),
+              rt715_micmute_led_mode);
+
+static int rt715_mic_mute_led_mode_get(struct snd_kcontrol *kcontrol,
+      struct snd_ctl_elem_value *ucontrol)
+{
+    struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+    struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
+    int led_mode = rt715->micmute_led;
+
+    ucontrol->value.integer.value[0] = led_mode;
+#if IS_ENABLED(CONFIG_LEDS_TRIGGER_AUDIO)
+    ledtrig_audio_set(LED_AUDIO_MICMUTE,
+            rt715->micmute_led ? LED_ON : LED_OFF);
+#endif
+    return 0;
+}
+
+static int rt715_micmute_led_mode_put(struct snd_kcontrol *kcontrol,
+      struct snd_ctl_elem_value *ucontrol)
+{
+    struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+    struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
+    int led_mode = ucontrol->value.integer.value[0];
+
+    rt715->micmute_led = led_mode;
+#if IS_ENABLED(CONFIG_LEDS_TRIGGER_AUDIO)
+    ledtrig_audio_set(LED_AUDIO_MICMUTE,
+               rt715->micmute_led ? LED_ON : LED_OFF);
+#endif
+  return 0;
+}
+
+
 static const struct snd_kcontrol_new rt715_snd_controls[] = {
 	/* Capture switch */
 	SOC_DOUBLE_R_EXT("ADC 07 Capture Switch", RT715_SET_GAIN_MIC_ADC_H,
@@ -277,6 +317,9 @@ static const struct snd_kcontrol_new rt715_snd_controls[] = {
 			RT715_SET_GAIN_LINE2_L, RT715_DIR_IN_SFT, 3, 0,
 			rt715_set_amp_gain_get, rt715_set_amp_gain_put,
 			mic_vol_tlv),
+    /*Micmute Led Control*/
+    SOC_ENUM_EXT("Micmute Led Mode", rt715_micmute_led_mode_enum,
+            rt715_mic_mute_led_mode_get, rt715_micmute_led_mode_put),
 };
 
 static int rt715_mux_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/codecs/rt715.h b/sound/soc/codecs/rt715.h
index df0f24f9bc0c..32917b7846b4 100644
--- a/sound/soc/codecs/rt715.h
+++ b/sound/soc/codecs/rt715.h
@@ -22,6 +22,7 @@ struct rt715_priv {
 	struct sdw_bus_params params;
 	bool hw_init;
 	bool first_hw_init;
+    int micmute_led;
 };
 
 struct sdw_stream_data {
-- 
2.25.1


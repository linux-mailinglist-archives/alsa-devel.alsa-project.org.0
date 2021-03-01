Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 506EA3280D3
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 15:29:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FF881672;
	Mon,  1 Mar 2021 15:29:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FF881672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614608991;
	bh=EGN7ye1xYJSnqT62hWzfD8zBAlvqqjPecLMVzHS/yxw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sE/Yjx+mv6Uc6OiAB9xhrJJJNQB6lu1Ia6noSbPNK3QdEpRAiFgXKMtNg/wDJHb9Y
	 HVo0gD6ijnXBV0Kaqghu0YW2FGeDP+m7PdDirAdP/kt2WbQVBcM2Jc/RrXkwcdNwtH
	 LWLDBQDvAhieTZ1l+Fx8/kcFiO3nslUs46BR5xdE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21C91F804B0;
	Mon,  1 Mar 2021 10:38:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36D9BF804AF; Mon,  1 Mar 2021 10:38:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BFBFF804AC
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 10:38:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BFBFF804AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="SpUkVYgc"
Received: from pps.filterd (m0170397.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1219bVNt024242
 for <alsa-devel@alsa-project.org>; Mon, 1 Mar 2021 04:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=smtpout1; bh=fwWYGhIgeA//auGUVrYqkTT5nitDGeyYzh4vm+Tr33A=;
 b=SpUkVYgc1Ir0stIzV0puPq5Lkp6MES/JhV3QTbETbabR+JaX+Dbf06bN/KaxX8tQpIs6
 9tyCbdzHhOcSs6LAEOfQBxpxEQYwwWF4cWX1R4DUgdceO0Lxbo8d3hLShus6FEzoJ8IT
 +sskQzy9rsxoNpQv1XHFJdL3NlpXjQpnv4xHqF4gk4Ni9Ah4Utwkoq4kp5e18uivvzd/
 D0/1UH0YI7CH630d7vG/cIcWNB9DCOVzjOx2Q6jMDI0ufeEVMEingt30g93E9yK8/3RM
 rjQkMALrW2yhCYx0wOL6tedO7d2pUM1bIZKFcHvQdssSQsBtTCfShvtdySG25YbCHcR3 0Q== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0b-00154904.pphosted.com with ESMTP id 36yg20c740-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <alsa-devel@alsa-project.org>; Mon, 01 Mar 2021 04:38:43 -0500
Received: from pps.filterd (m0133268.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1219L0wv190204
 for <alsa-devel@alsa-project.org>; Mon, 1 Mar 2021 04:38:42 -0500
Received: from ausxipps310.us.dell.com (AUSXIPPS310.us.dell.com
 [143.166.148.211])
 by mx0a-00154901.pphosted.com with ESMTP id 3704k2w64k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <alsa-devel@alsa-project.org>; Mon, 01 Mar 2021 04:38:41 -0500
X-LoopCount0: from 10.69.132.19
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.81,215,1610431200"; d="scan'208";a="600234247"
From: Perry Yuan <Perry.Yuan@dell.com>
To: pobrn@protonmail.com, pierre-louis.bossart@linux.intel.com,
 oder_chiou@realtek.com, perex@perex.cz, tiwai@suse.com,
 hdegoede@redhat.com, mgross@linux.intel.com, Mario.Limonciello@dell.com
Subject: [PATCH v4 2/2] ASoC: rt715:add micmute led state control supports
Date: Mon,  1 Mar 2021 17:38:34 +0800
Message-Id: <20210301093834.19524-1-Perry_Yuan@Dell.com>
X-Mailer: git-send-email 2.19.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-01_05:2021-02-26,
 2021-03-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103010078
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103010079
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Perry.Yuan@dell.com, lgirdwood@gmail.com, platform-driver-x86@vger.kernel.org,
 broonie@kernel.org
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

From: Perry Yuan <perry_yuan@dell.com>

Some new Dell system is going to support audio internal micphone
privacy setting from hardware level with micmute led state changing
When micmute hotkey pressed by user, soft mute will need to be enabled
firstly in case of pop noise, and codec driver need to react to mic
mute event to EC(embedded controller) notifying that SW mute is completed
Then EC will do the hardware mute physically within the timeout reached

This patch allow codec rt715 and rt715 sdca driver to change the local micmute
led state. Dell privacy led trigger driver will ack EC when micmute key pressed
through this micphone led control interface like hda_generic provided
ACPI method defined in dell-privacy micmute led trigger will be called
for notifying the EC that software mute has been completed, then hardware
audio circuit solution controlled by EC will switch the audio input source off/on

Signed-off-by: Perry Yuan <perry_yuan@dell.com>

--------
v3 -> v4:
* remove unused debug log
* remove compile flag of DELL privacy
* move the micmute_led to local from rt715_priv
* when Jaroslav upstream his gerneric LED trigger driver,I will rebase
  this patch,please consider merge this at first
  https://lore.kernel.org/alsa-devel/20210211111400.1131020-1-perex@perex.cz/
v2 -> v3:
* simplify the patch to reuse some val value
* add more detail to the commit info
v1 -> v2:
* fix some format issue
--------
---
 sound/soc/codecs/rt715-sdca.c | 12 ++++++++++++
 sound/soc/codecs/rt715.c      | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index b43ac8559e45..816348ae11a1 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -12,6 +12,7 @@
 #include <linux/version.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/leds.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm.h>
 #include <linux/soundwire/sdw.h>
@@ -269,6 +270,7 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int reg = mc->reg;
 	unsigned int max = mc->max;
 	int err;
+	bool micmute_led;
 
 	val = ucontrol->value.integer.value[0];
 	if (invert)
@@ -287,6 +289,16 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
 			return err;
 	}
 
+	/* Micmute LED state changed by muted/unmute switch */
+	if (mc->invert) {
+		if (ucontrol->value.integer.value[0] || ucontrol->value.integer.value[1]) {
+			micmute_led = LED_OFF;
+		} else {
+			micmute_led = LED_ON;
+		}
+		ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led);
+	}
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index cdcba70146da..db2c0d2ff9d2 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -13,6 +13,7 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
+#include <linux/leds.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm.h>
 #include <linux/soundwire/sdw.h>
@@ -88,6 +89,7 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 		RT715_SET_GAIN_MIX_ADC2_L};
 	unsigned int addr_h, addr_l, val_h, val_ll, val_lr;
 	unsigned int read_ll, read_rl, i, j, loop_cnt;
+	bool micmute_led;
 
 	if (strstr(ucontrol->id.name, "Main Capture Switch") ||
 		strstr(ucontrol->id.name, "Main Capture Volume"))
@@ -95,6 +97,16 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 	else
 		loop_cnt = 1;
 
+	/* Micmute LED state changed by muted/unmute switch */
+	if (mc->invert) {
+		if (ucontrol->value.integer.value[0] || ucontrol->value.integer.value[1]) {
+			micmute_led = LED_OFF;
+		} else {
+			micmute_led = LED_ON;
+		}
+		ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led);
+	}
+
 	for (j = 0; j < loop_cnt; j++) {
 		/* Can't use update bit function, so read the original value first */
 		if (loop_cnt == 1) {
-- 
2.25.1


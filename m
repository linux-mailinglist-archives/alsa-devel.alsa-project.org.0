Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8A237535A
	for <lists+alsa-devel@lfdr.de>; Thu,  6 May 2021 13:58:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B9F91690;
	Thu,  6 May 2021 13:57:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B9F91690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620302307;
	bh=xJ/JczUCXxDUeVgdozXacjKQT1HLSBP6IP7pWbX5DzA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QUHEiLQy3PtEGvO59dy1UP+nnnJZx4cfl0vjetGO4gDFfNulcMxnThgtw8YZVpZHO
	 fDpMfv5KE1YrSKAqrQ5HCCxwVD2pyvC2OAQ7P5DDGjDkto15Mh8dLynKwSqboHCZed
	 nQxeadOt/3WhLZW8I4YtX+kMG6cMj/TX40gLxBWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC766F8049C;
	Thu,  6 May 2021 13:56:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16C03F80482; Thu,  6 May 2021 13:56:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3957FF80430
 for <alsa-devel@alsa-project.org>; Thu,  6 May 2021 13:56:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3957FF80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="LutnyVl2"
Received: from pps.filterd (m0170389.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 146BuiF7012589
 for <alsa-devel@alsa-project.org>; Thu, 6 May 2021 07:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=smtpout1; bh=kAqG1xSiy1fNYSYSKfOGSm223epERpT41q1HmNbuKro=;
 b=LutnyVl2+bEx/LAzgTy51fWLaa8npc920qs3v+rOF7tZ+X7auvm/qg8eNdoBs3UNO81d
 jlWhBSxsEyCFRkxTIzJwtvTqstJ0B8YwTA/6zAF0UwDPry084gsUg2sYDtayFZlf4WTO
 sYR6JZi7FnMkc+h4bDdqMxFBBAKWbkI+eNoLu2/Qfi9joukjGTAjBmmlvrPO637Ug5Ph
 txTdx2KkOAUFVBlkl3hDlqY+sksiREEFBS4larmU6UJp2KtFEfGKIoNoGun/O864lFXB
 LlpTIHKLIBvTWvLm4mZrerpQHIodolq36vB+nHebaKV+yXov1gVahtmrIv31wu4bHXFh hQ== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0a-00154904.pphosted.com with ESMTP id 38bebm71gr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <alsa-devel@alsa-project.org>; Thu, 06 May 2021 07:56:45 -0400
Received: from pps.filterd (m0089483.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 146BtWYU060287
 for <alsa-devel@alsa-project.org>; Thu, 6 May 2021 07:56:36 -0400
Received: from esaploutps321.us.dell.com ([143.166.148.228])
 by mx0b-00154901.pphosted.com with ESMTP id 38cfjagcae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <alsa-devel@alsa-project.org>; Thu, 06 May 2021 07:56:36 -0400
X-LoopCount0: from 10.69.132.19
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.82,277,1613455200"; 
   d="scan'208";a="9585114"
From: Perry Yuan <Perry.Yuan@dell.com>
To: pobrn@protonmail.com, pierre-louis.bossart@linux.intel.com,
 oder_chiou@realtek.com, perex@perex.cz, tiwai@suse.com,
 hdegoede@redhat.com, mgross@linux.intel.com
Subject: [PATCH v8 2/2] ASoC: rt715:add micmute led state control supports
Date: Thu,  6 May 2021 19:56:26 +0800
Message-Id: <20210506115626.12480-1-Perry_Yuan@Dell.com>
X-Mailer: git-send-email 2.19.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-06_08:2021-05-06,
 2021-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105060084
X-Proofpoint-GUID: LvROJJN2eQiIow_Bzy1l8YkdH62Otr9E
X-Proofpoint-ORIG-GUID: LvROJJN2eQiIow_Bzy1l8YkdH62Otr9E
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 adultscore=0 phishscore=0 spamscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105060084
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Perry.Yuan@dell.com, lgirdwood@gmail.com, platform-driver-x86@vger.kernel.org,
 broonie@kernel.org, Dell.Client.Kernel@dell.com, mario.limonciello@outlook.com
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
v7 -> v8:
* N/A
v6 -> v7:
* addresed review comments from Jaroslav
* use device id in the quirk list
v5 -> v6:
* add quirks for micmute led control as short term solution to control
  micmute led state change
* add comments for the invert checking
v4 -> v5:
* rebase to latest 5.12 rc4 upstream kernel
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
 sound/soc/codecs/rt715-sdca.c | 42 +++++++++++++++++++++++++++++++++++
 sound/soc/codecs/rt715.c      | 42 +++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index 936e3061ca1e..de46514e0207 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -11,12 +11,14 @@
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/leds.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
+#include <linux/dmi.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -344,6 +346,32 @@ static int rt715_sdca_get_volsw(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static bool micmute_led_set;
+static int  dmi_matched(const struct dmi_system_id *dmi)
+{
+	micmute_led_set = 1;
+	return 1;
+}
+
+/* Some systems will need to use this to trigger mic mute LED state changed */
+static const struct dmi_system_id micmute_led_dmi_table[] = {
+	{
+		.callback = dmi_matched,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_SKU, "0A32"),
+		},
+	},
+	{
+		.callback = dmi_matched,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_SKU, "0A3E"),
+		},
+	},
+	{},
+};
+
 static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
@@ -358,6 +386,7 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int mask = (1 << fls(max)) - 1;
 	unsigned int invert = p->invert;
 	int err;
+	bool micmute_led;
 
 	for (i = 0; i < 4; i++) {
 		if (ucontrol->value.integer.value[i] != rt715->kctl_switch_orig[i]) {
@@ -394,6 +423,18 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
 			return err;
 	}
 
+	/* Micmute LED state changed by muted/unmute switch
+	 * to keep syncing with actual hardware mic mute led state
+	 * invert will be checked to change the state switch
+	 */
+	if (invert && micmute_led_set) {
+		if (ucontrol->value.integer.value[0] || ucontrol->value.integer.value[1])
+			micmute_led = LED_OFF;
+		else
+			micmute_led = LED_ON;
+		ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led);
+	}
+
 	return k_changed;
 }
 
@@ -1069,6 +1110,7 @@ int rt715_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 
 	pm_runtime_mark_last_busy(&slave->dev);
 	pm_runtime_put_autosuspend(&slave->dev);
+	dmi_check_system(micmute_led_dmi_table);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index 1352869cc086..4dbd870009b8 100644
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
@@ -25,6 +26,7 @@
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/of_device.h>
+#include <linux/dmi.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -70,6 +72,32 @@ static void rt715_get_gain(struct rt715_priv *rt715, unsigned int addr_h,
 		pr_err("Failed to get L channel gain.\n");
 }
 
+static bool micmute_led_set;
+static int  dmi_matched(const struct dmi_system_id *dmi)
+{
+	micmute_led_set = 1;
+	return 1;
+}
+
+/* Some systems will need to use this to trigger mic mute LED state changed */
+static const struct dmi_system_id micmute_led_dmi_table[] = {
+	{
+		.callback = dmi_matched,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_SKU, "0A32"),
+		},
+	},
+	{
+		.callback = dmi_matched,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_SKU, "0A3E"),
+		},
+	},
+	{},
+};
+
 /* For Verb-Set Amplifier Gain (Verb ID = 3h) */
 static int rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
@@ -83,6 +111,7 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 	unsigned int addr_h, addr_l, val_h, val_ll, val_lr;
 	unsigned int read_ll, read_rl, i;
 	unsigned int k_vol_changed = 0;
+	bool micmute_led;
 
 	for (i = 0; i < 2; i++) {
 		if (ucontrol->value.integer.value[i] != rt715->kctl_2ch_vol_ori[i]) {
@@ -155,6 +184,18 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 			break;
 	}
 
+	/* Micmute LED state changed by muted/unmute switch
+	 * to keep syncing with actual hardware mic mute led state
+	 * invert will be checked to change the state switch
+	 */
+	if (micmute_led_set) {
+		if (ucontrol->value.integer.value[0] || ucontrol->value.integer.value[1])
+			micmute_led = LED_OFF;
+		else
+			micmute_led = LED_ON;
+		ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led);
+	}
+
 	/* D0:power on state, D3: power saving mode */
 	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt715->regmap,
@@ -1088,6 +1129,7 @@ int rt715_io_init(struct device *dev, struct sdw_slave *slave)
 
 	pm_runtime_mark_last_busy(&slave->dev);
 	pm_runtime_put_autosuspend(&slave->dev);
+	dmi_check_system(micmute_led_dmi_table);
 
 	return 0;
 }
-- 
2.25.1


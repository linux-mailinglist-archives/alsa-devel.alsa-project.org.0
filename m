Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D05E4343D12
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 10:40:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D95C15F2;
	Mon, 22 Mar 2021 10:39:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D95C15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616406045;
	bh=TankSbOXj5kG48UIDP55txBpxvPLTy6c0PtjyZV3eOA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GMJ4/TRmHQFjKtcb/JKNmZGIAExUlpD/Qwz1l+77LAGyESD4qNRnlI8Hi/20/Pw+B
	 dpy6PGJQwuQD5xe/R2DCX9Jn/V9p5C80us3FMOWaw2E5rhEKlnYyGfv/tL58SZCcJg
	 7t3v2JJhLe40MsumYWFQTPV+Z8xSPXCXNr+hawpU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0E18F80156;
	Mon, 22 Mar 2021 10:39:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A456BF8012F; Mon, 22 Mar 2021 10:39:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E05EAF8012F
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 10:39:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E05EAF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="jO28DpZL"
Received: from pps.filterd (m0170397.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12M9GtMt023324
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 05:39:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=smtpout1; bh=IZZmDWoeYpA894/jnGZIgYX0koHQOXtvBq29Zoe+Fio=;
 b=jO28DpZLHs1SNvwVeoF+SX8V4aKUFd6FW+xNz5kEzgDXwHM5q4lt48SBqm1HUleYVFrZ
 JTQKuWAiTm1dKNfZ3lQTNe99tcbknaFLi1nW6EJdebDvxUZQI/nSHjuUVOKVHs1q2Qdr
 OC3yG3hkdYmkzq0cbWlPebmPN3c4K4kEQk2Nul7XVfzpJtoPX3P1OYr+SSBe1SD3Yisi
 Qu0JXFQAhCNp96ZeGjQI9oYW2BvKRMzeEbDhLWTHYp5rJ8z1G9u/tbuZusQO8fxsq7tg
 xjLsii9UdsbAT08X5fHsKgGGqMC5foGhYPjP5oO9SvqTtR9O76LHC+3Jl2aWv+Ulyhis EQ== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0b-00154904.pphosted.com with ESMTP id 37da4svgt8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 05:39:24 -0400
Received: from pps.filterd (m0144103.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12M9Gma4004115
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 05:39:24 -0400
Received: from ausxipps310.us.dell.com (AUSXIPPS310.us.dell.com
 [143.166.148.211])
 by mx0b-00154901.pphosted.com with ESMTP id 37dwxv472s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 05:39:24 -0400
X-LoopCount0: from 10.69.132.19
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.81,268,1610431200"; d="scan'208";a="613815038"
From: Perry Yuan <Perry.Yuan@dell.com>
To: pobrn@protonmail.com, pierre-louis.bossart@linux.intel.com,
 oder_chiou@realtek.com, perex@perex.cz, tiwai@suse.com,
 hdegoede@redhat.com, mgross@linux.intel.com, Mario.Limonciello@dell.com
Subject: [PATCH v5 2/2] ASoC: rt715:add micmute led state control supports
Date: Mon, 22 Mar 2021 17:39:14 +0800
Message-Id: <20210322093914.4228-1-Perry_Yuan@Dell.com>
X-Mailer: git-send-email 2.19.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-22_04:2021-03-22,
 2021-03-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103220072
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103220072
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
 sound/soc/codecs/rt715-sdca.c | 11 +++++++++++
 sound/soc/codecs/rt715.c      | 12 ++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index 20528afbdc57..70e1181f1dee 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -11,6 +11,7 @@
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/leds.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm.h>
 #include <linux/soundwire/sdw.h>
@@ -358,6 +359,7 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int mask = (1 << fls(max)) - 1;
 	unsigned int invert = p->invert;
 	int err;
+	bool micmute_led;
 
 	for (i = 0; i < 4; i++) {
 		if (ucontrol->value.integer.value[i] != rt715->kctl_switch_orig[i]) {
@@ -393,6 +395,15 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
 		if (err < 0)
 			return err;
 	}
+	/* Micmute LED state changed by muted/unmute switch */
+	if (invert) {
+		if (ucontrol->value.integer.value[0] || ucontrol->value.integer.value[1]) {
+			micmute_led = LED_OFF;
+		} else {
+			micmute_led = LED_ON;
+		}
+		ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led);
+	}
 
 	return k_changed;
 }
diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index 34c3357e943b..13686c5239b3 100644
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


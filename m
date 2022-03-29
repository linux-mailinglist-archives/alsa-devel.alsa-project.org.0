Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6179E4EA8F2
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Mar 2022 10:05:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE57E175F;
	Tue, 29 Mar 2022 10:04:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE57E175F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648541120;
	bh=Uiomxc4kOPhuCG4dr3bw5zHSjIFy20fvhhkL3Pak7BI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Tc92HWiBXmYYbyPoY0DthVPGRvdyt+Hp/8CYWUOB9r/b5D1EX39ydVYQezEi0Cgo/
	 PWXwnFN7y4kbNVTc7nYwE4+ceUsTaJfA6HlQf7R+4K7RaM746jmIZbIITGV8B0PsFX
	 X7yQJ0qdLP8NdIs/raDALHK6MFqXpy4ivvADhN+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F85FF800FA;
	Tue, 29 Mar 2022 10:04:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35E1BF800FA; Tue, 29 Mar 2022 10:04:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D89BF80121
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 10:04:04 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 0E875A0040;
 Tue, 29 Mar 2022 10:04:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 0E875A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1648541044; bh=+ilGIA8OKHzhM7eG6/lq9rW4E7gMFChZjr70BJlbIjY=;
 h=From:To:Cc:Subject:Date:From;
 b=hNyNx9YKfbSwBUSL5D/qgUG+1MEKnKRTG3ppWNmbE2j6M+gtPTpx2le4l/yQ+UBXa
 aJ4FL+kAcmdRIuwq5elIzVGG3I9rax7TgebsuOJ+3OiWe1HtLxnlNcrVUyAztS0Ufu
 vRHjnAjktYCVpVDR6TjNLeM5yy7dFYVRIcl8ir2s=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 29 Mar 2022 10:03:57 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: SOF: topology: use new sound control LED layer
Date: Tue, 29 Mar 2022 10:03:51 +0200
Message-Id: <20220329080351.2384110-1-perex@perex.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

Use the new sound control LED layer instead the direct ledtrig_audio_set()
call - see 22d8de62f11b ("ALSA: control - add generic LED trigger module
as the new control layer").

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/control.c  | 33 ---------------------------------
 sound/soc/sof/topology.c | 10 ++++++++++
 2 files changed, 10 insertions(+), 33 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index de1778c4002b..3b5718a3516d 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -15,36 +15,6 @@
 #include "sof-priv.h"
 #include "sof-audio.h"
 
-static void update_mute_led(struct snd_sof_control *scontrol,
-			    struct snd_kcontrol *kcontrol,
-			    struct snd_ctl_elem_value *ucontrol)
-{
-	int temp = 0;
-	int mask;
-	int i;
-
-	mask = 1U << snd_ctl_get_ioffidx(kcontrol, &ucontrol->id);
-
-	for (i = 0; i < scontrol->num_channels; i++) {
-		if (ucontrol->value.integer.value[i]) {
-			temp |= mask;
-			break;
-		}
-	}
-
-	if (temp == scontrol->led_ctl.led_value)
-		return;
-
-	scontrol->led_ctl.led_value = temp;
-
-#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
-	if (!scontrol->led_ctl.direction)
-		ledtrig_audio_set(LED_AUDIO_MUTE, temp ? LED_OFF : LED_ON);
-	else
-		ledtrig_audio_set(LED_AUDIO_MICMUTE, temp ? LED_OFF : LED_ON);
-#endif
-}
-
 int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_value *ucontrol)
 {
@@ -121,9 +91,6 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
 
-	if (scontrol->led_ctl.use_led)
-		update_mute_led(scontrol, kcontrol, ucontrol);
-
 	if (tplg_ops->control->switch_put)
 		return tplg_ops->control->switch_put(scontrol, ucontrol);
 
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 9b11e9795a7a..267a781494da 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -773,6 +773,7 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 	struct snd_soc_tplg_mixer_control *mc =
 		container_of(hdr, struct snd_soc_tplg_mixer_control, hdr);
 	int tlv[TLV_ITEMS];
+	unsigned int mask;
 	int ret;
 
 	/* validate topology data */
@@ -821,6 +822,15 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 		goto err;
 	}
 
+	if (scontrol->led_ctl.use_led) {
+		mask = scontrol->led_ctl.direction ? SNDRV_CTL_ELEM_ACCESS_MIC_LED :
+							SNDRV_CTL_ELEM_ACCESS_SPK_LED;
+		scontrol->access &= ~SNDRV_CTL_ELEM_ACCESS_LED_MASK;
+		scontrol->access |= mask;
+		kc->access &= ~SNDRV_CTL_ELEM_ACCESS_LED_MASK;
+		kc->access |= mask;
+	}
+
 	dev_dbg(scomp->dev, "tplg: load kcontrol index %d chans %d\n",
 		scontrol->comp_id, scontrol->num_channels);
 
-- 
2.34.1

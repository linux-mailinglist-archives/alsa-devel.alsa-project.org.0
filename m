Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E1F4EACCC
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Mar 2022 14:01:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD5CC181D;
	Tue, 29 Mar 2022 14:01:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD5CC181D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648555310;
	bh=ycLriWMR28mkibFSvDmWDJjegfV+K7CmHCVmY6uq/bM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UgyWT8OvmZY0N2q5x42vTSzbDY6A7trPKMu/c3CMB1g7BlHZtqam4yAGZb6764ruC
	 ey1AIru9cJjgJA8amKlTcexZnoWBEHz5QEWFVxwavc9GQM4e1AOKhsAmZxCZOPt3xb
	 HJbH18rMoGFHiEcNJM6QdZElA83H3lwKvLamNprI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07B5FF8014E;
	Tue, 29 Mar 2022 14:01:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F0FCF80311; Tue, 29 Mar 2022 14:00:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95B61F80121
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 14:00:51 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 05AE4A0042;
 Tue, 29 Mar 2022 14:00:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 05AE4A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1648555251; bh=JkFxuZFayGXoHBRBNRF0vI5rHD8WpQEXJjFIrMMp4Jo=;
 h=From:To:Cc:Subject:Date:From;
 b=bfUUqHtB+ig8urPfx0Y9w7MvjtGEg8QGiTaD6nZ81ato9QFuep8S9kS2pGfIYHYn3
 OkOfMqBJvQBWACbIAZVzxQR9NP/q9MbHVLyPSb1FpCtiu/RvwBLM9BS762fMI43ynK
 22bbJl9Dygs1k3fCq5ZSZ+zd8p4BeRwWX5OzNB4o=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 29 Mar 2022 14:00:42 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH v2] ASoC: SOF: topology: use new sound control LED layer
Date: Tue, 29 Mar 2022 14:00:39 +0200
Message-Id: <20220329120039.2394138-1-perex@perex.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
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
Cc: Mark Brown <broonie@kernel.org>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

-----
v2:
  - add Mark to Cc:
  - add snd_ctl_led_request() call
---
 sound/soc/sof/control.c  | 33 ---------------------------------
 sound/soc/sof/sof-priv.h |  1 +
 sound/soc/sof/topology.c | 16 ++++++++++++++++
 3 files changed, 17 insertions(+), 33 deletions(-)

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
 
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 0d9b640ae24c..e537b1258aa8 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -473,6 +473,7 @@ struct snd_sof_dev {
 	struct list_head route_list;
 	struct snd_soc_component *component;
 	u32 enabled_cores_mask; /* keep track of enabled cores */
+	bool led_present;
 
 	/* FW configuration */
 	struct sof_ipc_window *info_window;
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 9b11e9795a7a..e47a64934c04 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -773,6 +773,7 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 	struct snd_soc_tplg_mixer_control *mc =
 		container_of(hdr, struct snd_soc_tplg_mixer_control, hdr);
 	int tlv[TLV_ITEMS];
+	unsigned int mask;
 	int ret;
 
 	/* validate topology data */
@@ -821,6 +822,16 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 		goto err;
 	}
 
+	if (scontrol->led_ctl.use_led) {
+		mask = scontrol->led_ctl.direction ? SNDRV_CTL_ELEM_ACCESS_MIC_LED :
+							SNDRV_CTL_ELEM_ACCESS_SPK_LED;
+		scontrol->access &= ~SNDRV_CTL_ELEM_ACCESS_LED_MASK;
+		scontrol->access |= mask;
+		kc->access &= ~SNDRV_CTL_ELEM_ACCESS_LED_MASK;
+		kc->access |= mask;
+		sdev->led_present = true;
+	}
+
 	dev_dbg(scomp->dev, "tplg: load kcontrol index %d chans %d\n",
 		scontrol->comp_id, scontrol->num_channels);
 
@@ -2027,6 +2038,7 @@ static struct snd_soc_tplg_ops sof_tplg_ops = {
 
 int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 {
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	const struct firmware *fw;
 	int ret;
 
@@ -2049,6 +2061,10 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 	}
 
 	release_firmware(fw);
+
+	if (ret >= 0 && sdev->led_present)
+		ret = snd_ctl_led_request();
+
 	return ret;
 }
 EXPORT_SYMBOL(snd_sof_load_topology);
-- 
2.34.1

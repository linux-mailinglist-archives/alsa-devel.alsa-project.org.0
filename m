Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BC5DC52B
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 14:40:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6055985D;
	Fri, 18 Oct 2019 14:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6055985D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571402412;
	bh=jUO72unw6m48+B06FXCyaAULLyiL99MX+Qo0VeWG/rE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ihiSwcvTCsXeRErV2i0/HitiogIoaBe0YX2yIz39mvjocRUhuaLH+3kvFTnxryfDJ
	 p1hPry/qqFIYRPsT8aGTmQ4s9iykL1JJRBIJ7MaBQoyMwXu54BSx1MOaBEtUhx1+1P
	 t82aExXaBjpUdxpU9XPJQUIi5WlUJWYAPdfGWFSY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9748CF8036C;
	Fri, 18 Oct 2019 14:38:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33BE1F80362; Fri, 18 Oct 2019 14:38:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E4C4F800F3
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 14:38:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E4C4F800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Oct 2019 05:38:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,311,1566889200"; d="scan'208";a="200698912"
Received: from csganpul-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.228.37])
 by orsmga006.jf.intel.com with ESMTP; 18 Oct 2019 05:38:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 18 Oct 2019 07:38:06 -0500
Message-Id: <20191018123806.18063-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: SOF: control: return true when kcontrol
	values change
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Dragos Tarcatu <dragos_tarcatu@mentor.com>

All the kcontrol put() functions are currently returning 0 when
successful. This does not go well with alsamixer as it does
not seem to get notified on SND_CTL_EVENT_MASK_VALUE callbacks
when values change for (some of) the sof kcontrols.
This patch fixes that by returning true for volume, switch
and enum type kcontrols when values do change in put().

Signed-off-by: Dragos Tarcatu <dragos_tarcatu@mentor.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/control.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 2c4abd406c4f..7baf7f1507c3 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -91,13 +91,16 @@ int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 	struct snd_sof_dev *sdev = scontrol->sdev;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	unsigned int i, channels = scontrol->num_channels;
+	bool change = false;
+	u32 value;
 
 	/* update each channel */
 	for (i = 0; i < channels; i++) {
-		cdata->chanv[i].value =
-			mixer_to_ipc(ucontrol->value.integer.value[i],
+		value = mixer_to_ipc(ucontrol->value.integer.value[i],
 				     scontrol->volume_table, sm->max + 1);
+		change = change || (value != cdata->chanv[i].value);
 		cdata->chanv[i].channel = i;
+		cdata->chanv[i].value = value;
 	}
 
 	/* notify DSP of mixer updates */
@@ -107,8 +110,7 @@ int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 					      SOF_CTRL_TYPE_VALUE_CHAN_GET,
 					      SOF_CTRL_CMD_VOLUME,
 					      true);
-
-	return 0;
+	return change;
 }
 
 int snd_sof_switch_get(struct snd_kcontrol *kcontrol,
@@ -136,11 +138,15 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
 	struct snd_sof_dev *sdev = scontrol->sdev;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	unsigned int i, channels = scontrol->num_channels;
+	bool change = false;
+	u32 value;
 
 	/* update each channel */
 	for (i = 0; i < channels; i++) {
-		cdata->chanv[i].value = ucontrol->value.integer.value[i];
+		value = ucontrol->value.integer.value[i];
+		change = change || (value != cdata->chanv[i].value);
 		cdata->chanv[i].channel = i;
+		cdata->chanv[i].value = value;
 	}
 
 	if (scontrol->led_ctl.use_led)
@@ -154,7 +160,7 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
 					      SOF_CTRL_CMD_SWITCH,
 					      true);
 
-	return 0;
+	return change;
 }
 
 int snd_sof_enum_get(struct snd_kcontrol *kcontrol,
@@ -182,11 +188,15 @@ int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
 	struct snd_sof_dev *sdev = scontrol->sdev;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	unsigned int i, channels = scontrol->num_channels;
+	bool change = false;
+	u32 value;
 
 	/* update each channel */
 	for (i = 0; i < channels; i++) {
-		cdata->chanv[i].value = ucontrol->value.enumerated.item[i];
+		value = ucontrol->value.enumerated.item[i];
+		change = change || (value != cdata->chanv[i].value);
 		cdata->chanv[i].channel = i;
+		cdata->chanv[i].value = value;
 	}
 
 	/* notify DSP of enum updates */
@@ -197,7 +207,7 @@ int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
 					      SOF_CTRL_CMD_ENUM,
 					      true);
 
-	return 0;
+	return change;
 }
 
 int snd_sof_bytes_get(struct snd_kcontrol *kcontrol,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

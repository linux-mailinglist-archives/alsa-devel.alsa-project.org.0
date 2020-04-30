Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F01921BF3E4
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 11:14:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CDFD1689;
	Thu, 30 Apr 2020 11:13:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CDFD1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588238040;
	bh=jS0UA7cZFS3kupniVJuY8uhyLsjwypKlMjRPqEYNIlQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R9Kq/t/LIaov5E6xpWGHlxCG8Dh77Rc9PQyUh2oPaKnWcrWFiv1hzrKO5MEG5cw10
	 ANfKIQllF0w7AvrUO/d+tzOLxYF9MQ3Okw8h4MQwED30H9M1N6SIfQFVlspvPIr+IV
	 2gzhCQhksNVsAcJmK2TpsppSFTJhzoRe+tgpX79c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B99CF801EB;
	Thu, 30 Apr 2020 11:12:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2A43F801DB; Thu, 30 Apr 2020 11:12:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=AC_FROM_MANY_DOTS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EFA3F80123;
 Thu, 30 Apr 2020 11:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EFA3F80123
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1jU5EZ-00063O-A0; Thu, 30 Apr 2020 09:11:56 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com
Subject: [PATCH] ASoC: SOF: Update correct LED status at the first time usage
 of update_mute_led()
Date: Thu, 30 Apr 2020 17:11:39 +0800
Message-Id: <20200430091139.7003-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE SOF DRIVERS"
 <sound-open-firmware@alsa-project.org>
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

At the first time update_mute_led() gets called, if channels are already
muted, the temp value equals to led_value as 0, skipping the following
LED setting.

So set led_value to -1 as an uninitialized state, to update the correct
LED status at first time usage.

Fixes: 5d43001ae436 ("ASoC: SOF: acpi led support for switch controls")
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 sound/soc/sof/control.c   | 4 ++--
 sound/soc/sof/sof-audio.h | 2 +-
 sound/soc/sof/topology.c  | 2 ++
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index dfc412e2d956..6d63768d42aa 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -19,8 +19,8 @@ static void update_mute_led(struct snd_sof_control *scontrol,
 			    struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	unsigned int temp = 0;
-	unsigned int mask;
+	int temp = 0;
+	int mask;
 	int i;
 
 	mask = 1U << snd_ctl_get_ioffidx(kcontrol, &ucontrol->id);
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index bf65f31af858..875a5fc13297 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -56,7 +56,7 @@ struct snd_sof_pcm {
 struct snd_sof_led_control {
 	unsigned int use_led;
 	unsigned int direction;
-	unsigned int led_value;
+	int led_value;
 };
 
 /* ALSA SOF Kcontrol device */
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index fe8ba3e05e08..ab2b69de1d4d 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1203,6 +1203,8 @@ static int sof_control_load(struct snd_soc_component *scomp, int index,
 		return ret;
 	}
 
+	scontrol->led_ctl.led_value = -1;
+
 	dobj->private = scontrol;
 	list_add(&scontrol->list, &sdev->kcontrol_list);
 	return ret;
-- 
2.17.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E91E876A40
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Mar 2024 18:54:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3E4D844;
	Fri,  8 Mar 2024 18:53:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3E4D844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709920446;
	bh=Ig+eLq/Swz8NEyZK0Zsi8AZ2yOZH+1AjIHTvSRnoLgA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=czZV2C5W2PiqVwGfnS3+IeZxCYBUC+VFV5//dbjt8B1gn1xbHms/yZ+dYb6Xp1zjR
	 A722zywyd2hSL551lAwkmdU6mtknJwROUS45xVG36LMKY9HVdZQBi40VxnculvMH2z
	 ry7ry2w1HSbJkobMY8WWrfykAomYlkwTO2nlnRbU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C0C6F80680; Fri,  8 Mar 2024 18:52:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52835F8068D;
	Fri,  8 Mar 2024 18:52:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED8B8F801F5; Fri,  8 Mar 2024 18:46:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 25A08F80496
	for <alsa-devel@alsa-project.org>; Fri,  8 Mar 2024 18:42:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25A08F80496
Received: from fedori.lan (51b693e7.dsl.pool.telekom.hu
 [::ffff:81.182.147.231])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000076817.0000000065EB4DF1.0020A5E5;
 Fri, 08 Mar 2024 18:42:09 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 5/5] ALSA: hda/tas2781: restore power state after
 system_resume
Date: Fri,  8 Mar 2024 18:41:44 +0100
Message-ID: 
 <1742b61901781826f6e6212ffe1d21af542d134a.1709918447.git.soyer@irl.hu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1709918447.git.soyer@irl.hu>
References: <cover.1709918447.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: CR4IVTMPSK64O4SABN7GF47MP5TTI732
X-Message-ID-Hash: CR4IVTMPSK64O4SABN7GF47MP5TTI732
X-MailFrom: soyer@irl.hu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CR4IVTMPSK64O4SABN7GF47MP5TTI732/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

After system_resume the amplifers will remain off, even if they were on
before system_suspend.

Use playback_started bool to save the playback state, and restore power
state based on it.

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index a99f490c6a23..7aef93126ed0 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -160,11 +160,13 @@ static void tas2781_hda_playback_hook(struct device *dev, int action)
 		pm_runtime_get_sync(dev);
 		mutex_lock(&tas_hda->priv->codec_lock);
 		tasdevice_tuning_switch(tas_hda->priv, 0);
+		tas_hda->priv->playback_started = true;
 		mutex_unlock(&tas_hda->priv->codec_lock);
 		break;
 	case HDA_GEN_PCM_ACT_CLOSE:
 		mutex_lock(&tas_hda->priv->codec_lock);
 		tasdevice_tuning_switch(tas_hda->priv, 1);
+		tas_hda->priv->playback_started = false;
 		mutex_unlock(&tas_hda->priv->codec_lock);
 
 		pm_runtime_mark_last_busy(dev);
@@ -666,6 +668,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	tasdevice_save_calibration(tas_priv);
 
 	tasdevice_tuning_switch(tas_hda->priv, 0);
+	tas_hda->priv->playback_started = true;
 
 out:
 	mutex_unlock(&tas_hda->priv->codec_lock);
@@ -837,6 +840,9 @@ static int tas2781_runtime_suspend(struct device *dev)
 
 	mutex_lock(&tas_hda->priv->codec_lock);
 
+	/* The driver powers up the amplifiers at module load time.
+	 * Stop the playback if it's unused.
+	 */
 	if (tas_hda->priv->playback_started) {
 		tasdevice_tuning_switch(tas_hda->priv, 1);
 		tas_hda->priv->playback_started = false;
@@ -876,7 +882,8 @@ static int tas2781_system_suspend(struct device *dev)
 	mutex_lock(&tas_hda->priv->codec_lock);
 
 	/* Shutdown chip before system suspend */
-	tasdevice_tuning_switch(tas_hda->priv, 1);
+	if (tas_hda->priv->playback_started)
+		tasdevice_tuning_switch(tas_hda->priv, 1);
 
 	mutex_unlock(&tas_hda->priv->codec_lock);
 
@@ -908,6 +915,10 @@ static int tas2781_system_resume(struct device *dev)
 	 * calibrated data inside algo.
 	 */
 	tasdevice_apply_calibration(tas_hda->priv);
+
+	if (tas_hda->priv->playback_started)
+		tasdevice_tuning_switch(tas_hda->priv, 0);
+
 	mutex_unlock(&tas_hda->priv->codec_lock);
 
 	return 0;
-- 
2.44.0


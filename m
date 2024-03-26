Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 465E088C8DD
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:19:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAC122C24;
	Tue, 26 Mar 2024 17:19:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAC122C24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469996;
	bh=L+q8Bz8ds3vFmEIewe+gxAJPjDaqpzMYghNPAeRyPt4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ALif4wNOHHHXOz2OuQ4tBqdFR2UjxaZ5x8Y7ryzIQpKKoUN/KcQoYi2JIn2+iM9mz
	 HAUqHkN6DoMFFPa0qyVDyMSkDuoaAzP7YbJYDDLDONTjUWUHKKdyebUUlfG5eG6tV5
	 2AJq9tY1TUE7u7ww9gKusToSu0yODoGklBWvxJQk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A872F805D2; Tue, 26 Mar 2024 17:19:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FEF5F805BB;
	Tue, 26 Mar 2024 17:19:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C273F80563; Tue, 26 Mar 2024 17:19:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id A09DBF801EB
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:19:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A09DBF801EB
Received: from fedori.lan (51b68717.dsl.pool.telekom.hu
 [::ffff:81.182.135.23])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000007733D.000000006602F573.0023D3BC;
 Tue, 26 Mar 2024 17:18:59 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH v2 3/4] ALSA: hda/tas2781: add debug statements to kcontrols
Date: Tue, 26 Mar 2024 17:18:47 +0100
Message-ID: 
 <18ff4b0caab90a2dacf907e62346fd5079a9eb1a.1711469583.git.soyer@irl.hu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1711469583.git.soyer@irl.hu>
References: <cover.1711469583.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: XCEBSB6LJRZRTDRQEZY36MUHVIQATSYY
X-Message-ID-Hash: XCEBSB6LJRZRTDRQEZY36MUHVIQATSYY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XCEBSB6LJRZRTDRQEZY36MUHVIQATSYY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Sometimes it is useful to examine the timing of kcontrol events.

Add debug statements to each kcontrol.

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c | 35 +++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 9a43f563bb9e..f495caee38e1 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -189,6 +189,9 @@ static int tasdevice_get_profile_id(struct snd_kcontrol *kcontrol,
 
 	ucontrol->value.integer.value[0] = tas_priv->rcabin.profile_cfg_id;
 
+	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %d\n",
+		__func__, kcontrol->id.name, tas_priv->rcabin.profile_cfg_id);
+
 	mutex_unlock(&tas_priv->codec_lock);
 
 	return 0;
@@ -206,6 +209,10 @@ static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
 
 	mutex_lock(&tas_priv->codec_lock);
 
+	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %d -> %d\n",
+		__func__, kcontrol->id.name,
+		tas_priv->rcabin.profile_cfg_id, val);
+
 	if (tas_priv->rcabin.profile_cfg_id != val) {
 		tas_priv->rcabin.profile_cfg_id = val;
 		ret = 1;
@@ -253,6 +260,9 @@ static int tasdevice_program_get(struct snd_kcontrol *kcontrol,
 
 	ucontrol->value.integer.value[0] = tas_priv->cur_prog;
 
+	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %d\n",
+		__func__, kcontrol->id.name, tas_priv->cur_prog);
+
 	mutex_unlock(&tas_priv->codec_lock);
 
 	return 0;
@@ -271,6 +281,9 @@ static int tasdevice_program_put(struct snd_kcontrol *kcontrol,
 
 	mutex_lock(&tas_priv->codec_lock);
 
+	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %d -> %d\n",
+		__func__, kcontrol->id.name, tas_priv->cur_prog, val);
+
 	if (tas_priv->cur_prog != val) {
 		tas_priv->cur_prog = val;
 		ret = 1;
@@ -290,6 +303,9 @@ static int tasdevice_config_get(struct snd_kcontrol *kcontrol,
 
 	ucontrol->value.integer.value[0] = tas_priv->cur_conf;
 
+	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %d\n",
+		__func__, kcontrol->id.name, tas_priv->cur_conf);
+
 	mutex_unlock(&tas_priv->codec_lock);
 
 	return 0;
@@ -308,6 +324,9 @@ static int tasdevice_config_put(struct snd_kcontrol *kcontrol,
 
 	mutex_lock(&tas_priv->codec_lock);
 
+	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %d -> %d\n",
+		__func__, kcontrol->id.name, tas_priv->cur_conf, val);
+
 	if (tas_priv->cur_conf != val) {
 		tas_priv->cur_conf = val;
 		ret = 1;
@@ -330,6 +349,9 @@ static int tas2781_amp_getvol(struct snd_kcontrol *kcontrol,
 
 	ret = tasdevice_amp_getvol(tas_priv, ucontrol, mc);
 
+	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %ld\n",
+		__func__, kcontrol->id.name, ucontrol->value.integer.value[0]);
+
 	mutex_unlock(&tas_priv->codec_lock);
 
 	return ret;
@@ -345,6 +367,9 @@ static int tas2781_amp_putvol(struct snd_kcontrol *kcontrol,
 
 	mutex_lock(&tas_priv->codec_lock);
 
+	dev_dbg(tas_priv->dev, "%s: kcontrol %s: -> %ld\n",
+		__func__, kcontrol->id.name, ucontrol->value.integer.value[0]);
+
 	/* The check of the given value is in tasdevice_amp_putvol. */
 	ret = tasdevice_amp_putvol(tas_priv, ucontrol, mc);
 
@@ -361,8 +386,8 @@ static int tas2781_force_fwload_get(struct snd_kcontrol *kcontrol,
 	mutex_lock(&tas_priv->codec_lock);
 
 	ucontrol->value.integer.value[0] = (int)tas_priv->force_fwload_status;
-	dev_dbg(tas_priv->dev, "%s : Force FWload %s\n", __func__,
-			tas_priv->force_fwload_status ? "ON" : "OFF");
+	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %d\n",
+		__func__, kcontrol->id.name, tas_priv->force_fwload_status);
 
 	mutex_unlock(&tas_priv->codec_lock);
 
@@ -377,14 +402,16 @@ static int tas2781_force_fwload_put(struct snd_kcontrol *kcontrol,
 
 	mutex_lock(&tas_priv->codec_lock);
 
+	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %d -> %d\n",
+		__func__, kcontrol->id.name,
+		tas_priv->force_fwload_status, val);
+
 	if (tas_priv->force_fwload_status == val)
 		change = false;
 	else {
 		change = true;
 		tas_priv->force_fwload_status = val;
 	}
-	dev_dbg(tas_priv->dev, "%s : Force FWload %s\n", __func__,
-		tas_priv->force_fwload_status ? "ON" : "OFF");
 
 	mutex_unlock(&tas_priv->codec_lock);
 
-- 
2.44.0


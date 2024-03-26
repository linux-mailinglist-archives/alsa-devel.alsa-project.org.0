Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2C388C8DF
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:20:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCC652C3A;
	Tue, 26 Mar 2024 17:19:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCC652C3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711470007;
	bh=fdU0/4nAFfsDVSfMuzjWoxODhsFLL7hOMH1mO1m1t+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SYF65ygP+VjLwkcybiRFFzDOb2mk6UyJcVuzWJXnmSpP+6l7dSVbukKDmd6K0DfSG
	 tlg+YoaNKaxOzHQJ39ZUkrgMe7bI0FTzBYUz9n3kwdOm8s9VE8gLGPXDOOSU7g+ArM
	 xBtoN8jSbcX67huIFLkpIi78Zat0WMmTGJ304uCY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CAE5F805F8; Tue, 26 Mar 2024 17:19:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3F48F805E4;
	Tue, 26 Mar 2024 17:19:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15B35F801EB; Tue, 26 Mar 2024 17:19:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 5B61CF802DB
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:18:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B61CF802DB
Received: from fedori.lan (51b68717.dsl.pool.telekom.hu
 [::ffff:81.182.135.23])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000007733A.000000006602F572.0023D3B2;
 Tue, 26 Mar 2024 17:18:57 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>,
  stable@vger.kernel.org
Subject: [PATCH v2 2/4] ALSA: hda/tas2781: add locks to kcontrols
Date: Tue, 26 Mar 2024 17:18:46 +0100
Message-ID: 
 <e35b867f6fe5fa1f869dd658a0a1f2118b737f57.1711469583.git.soyer@irl.hu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1711469583.git.soyer@irl.hu>
References: <cover.1711469583.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: JGQBKFWE2TKWIJWJPU3BO7G65R4LBSII
X-Message-ID-Hash: JGQBKFWE2TKWIJWJPU3BO7G65R4LBSII
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JGQBKFWE2TKWIJWJPU3BO7G65R4LBSII/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rcabin.profile_cfg_id, cur_prog, cur_conf, force_fwload_status
variables are acccessible from multiple threads and therefore require
locking.

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
CC: stable@vger.kernel.org
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c | 50 +++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 5acb475c10a7..9a43f563bb9e 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -185,8 +185,12 @@ static int tasdevice_get_profile_id(struct snd_kcontrol *kcontrol,
 {
 	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
 
+	mutex_lock(&tas_priv->codec_lock);
+
 	ucontrol->value.integer.value[0] = tas_priv->rcabin.profile_cfg_id;
 
+	mutex_unlock(&tas_priv->codec_lock);
+
 	return 0;
 }
 
@@ -200,11 +204,15 @@ static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
 
 	val = clamp(nr_profile, 0, max);
 
+	mutex_lock(&tas_priv->codec_lock);
+
 	if (tas_priv->rcabin.profile_cfg_id != val) {
 		tas_priv->rcabin.profile_cfg_id = val;
 		ret = 1;
 	}
 
+	mutex_unlock(&tas_priv->codec_lock);
+
 	return ret;
 }
 
@@ -241,8 +249,12 @@ static int tasdevice_program_get(struct snd_kcontrol *kcontrol,
 {
 	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
 
+	mutex_lock(&tas_priv->codec_lock);
+
 	ucontrol->value.integer.value[0] = tas_priv->cur_prog;
 
+	mutex_unlock(&tas_priv->codec_lock);
+
 	return 0;
 }
 
@@ -257,11 +269,15 @@ static int tasdevice_program_put(struct snd_kcontrol *kcontrol,
 
 	val = clamp(nr_program, 0, max);
 
+	mutex_lock(&tas_priv->codec_lock);
+
 	if (tas_priv->cur_prog != val) {
 		tas_priv->cur_prog = val;
 		ret = 1;
 	}
 
+	mutex_unlock(&tas_priv->codec_lock);
+
 	return ret;
 }
 
@@ -270,8 +286,12 @@ static int tasdevice_config_get(struct snd_kcontrol *kcontrol,
 {
 	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
 
+	mutex_lock(&tas_priv->codec_lock);
+
 	ucontrol->value.integer.value[0] = tas_priv->cur_conf;
 
+	mutex_unlock(&tas_priv->codec_lock);
+
 	return 0;
 }
 
@@ -286,11 +306,15 @@ static int tasdevice_config_put(struct snd_kcontrol *kcontrol,
 
 	val = clamp(nr_config, 0, max);
 
+	mutex_lock(&tas_priv->codec_lock);
+
 	if (tas_priv->cur_conf != val) {
 		tas_priv->cur_conf = val;
 		ret = 1;
 	}
 
+	mutex_unlock(&tas_priv->codec_lock);
+
 	return ret;
 }
 
@@ -300,8 +324,15 @@ static int tas2781_amp_getvol(struct snd_kcontrol *kcontrol,
 	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
+	int ret;
+
+	mutex_lock(&tas_priv->codec_lock);
+
+	ret = tasdevice_amp_getvol(tas_priv, ucontrol, mc);
+
+	mutex_unlock(&tas_priv->codec_lock);
 
-	return tasdevice_amp_getvol(tas_priv, ucontrol, mc);
+	return ret;
 }
 
 static int tas2781_amp_putvol(struct snd_kcontrol *kcontrol,
@@ -310,9 +341,16 @@ static int tas2781_amp_putvol(struct snd_kcontrol *kcontrol,
 	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
+	int ret;
+
+	mutex_lock(&tas_priv->codec_lock);
 
 	/* The check of the given value is in tasdevice_amp_putvol. */
-	return tasdevice_amp_putvol(tas_priv, ucontrol, mc);
+	ret = tasdevice_amp_putvol(tas_priv, ucontrol, mc);
+
+	mutex_unlock(&tas_priv->codec_lock);
+
+	return ret;
 }
 
 static int tas2781_force_fwload_get(struct snd_kcontrol *kcontrol,
@@ -320,10 +358,14 @@ static int tas2781_force_fwload_get(struct snd_kcontrol *kcontrol,
 {
 	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
 
+	mutex_lock(&tas_priv->codec_lock);
+
 	ucontrol->value.integer.value[0] = (int)tas_priv->force_fwload_status;
 	dev_dbg(tas_priv->dev, "%s : Force FWload %s\n", __func__,
 			tas_priv->force_fwload_status ? "ON" : "OFF");
 
+	mutex_unlock(&tas_priv->codec_lock);
+
 	return 0;
 }
 
@@ -333,6 +375,8 @@ static int tas2781_force_fwload_put(struct snd_kcontrol *kcontrol,
 	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
 	bool change, val = (bool)ucontrol->value.integer.value[0];
 
+	mutex_lock(&tas_priv->codec_lock);
+
 	if (tas_priv->force_fwload_status == val)
 		change = false;
 	else {
@@ -342,6 +386,8 @@ static int tas2781_force_fwload_put(struct snd_kcontrol *kcontrol,
 	dev_dbg(tas_priv->dev, "%s : Force FWload %s\n", __func__,
 		tas_priv->force_fwload_status ? "ON" : "OFF");
 
+	mutex_unlock(&tas_priv->codec_lock);
+
 	return change;
 }
 
-- 
2.44.0


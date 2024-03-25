Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AB088B2BC
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 22:27:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 353BB210F;
	Mon, 25 Mar 2024 22:27:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 353BB210F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711402048;
	bh=7tKjUPBeypTJx3dhjiPVGtY+r3oYW9ckUbJZzdlsjYY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pnszog3sTq6zWvIFyg8FgMImdVnRGoZJo6V3UopF6PLkEfG8Ms+vnADq6tv+kYcnx
	 jf1wnmSw0o4/+o2Xjvn+KM1MrdED5XrullIhGZNG0zg8shh+UA+CM8UeBBQ6cN30Fw
	 Vd9smsNSf9q5iX+6RS5PnQLiNdoF9z3y+T6HqL4U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CB63F8058C; Mon, 25 Mar 2024 22:26:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 588D7F8060C;
	Mon, 25 Mar 2024 22:26:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6F80F805DF; Mon, 25 Mar 2024 22:26:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 9B400F805AA
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 22:26:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B400F805AA
Received: from fedori.lan (51b68717.dsl.pool.telekom.hu
 [::ffff:81.182.135.23])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000770B0.000000006601EBEE.0023A89D;
 Mon, 25 Mar 2024 22:26:03 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 3/3] ALSA: hda/tas2781: add debug statements to kcontrols
Date: Mon, 25 Mar 2024 22:25:35 +0100
Message-ID: 
 <cbdc337b911bee0f80f805b936041fd59c1db54a.1711401621.git.soyer@irl.hu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1711401621.git.soyer@irl.hu>
References: <cover.1711401621.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: OPWIC62ECVDE7FW4HNZQUACT7KA5JHVA
X-Message-ID-Hash: OPWIC62ECVDE7FW4HNZQUACT7KA5JHVA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OPWIC62ECVDE7FW4HNZQUACT7KA5JHVA/>
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
 sound/pci/hda/tas2781_hda_i2c.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 9a43f563bb9e..b60ce4c2c090 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -189,6 +189,9 @@ static int tasdevice_get_profile_id(struct snd_kcontrol *kcontrol,
 
 	ucontrol->value.integer.value[0] = tas_priv->rcabin.profile_cfg_id;
 
+	dev_dbg(tas_priv->dev, "%s: %d\n", __func__,
+		tas_priv->rcabin.profile_cfg_id);
+
 	mutex_unlock(&tas_priv->codec_lock);
 
 	return 0;
@@ -206,6 +209,9 @@ static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
 
 	mutex_lock(&tas_priv->codec_lock);
 
+	dev_dbg(tas_priv->dev, "%s: %d -> %d\n", __func__,
+		tas_priv->rcabin.profile_cfg_id, val);
+
 	if (tas_priv->rcabin.profile_cfg_id != val) {
 		tas_priv->rcabin.profile_cfg_id = val;
 		ret = 1;
@@ -253,6 +259,8 @@ static int tasdevice_program_get(struct snd_kcontrol *kcontrol,
 
 	ucontrol->value.integer.value[0] = tas_priv->cur_prog;
 
+	dev_dbg(tas_priv->dev, "%s: %d\n", __func__, tas_priv->cur_prog);
+
 	mutex_unlock(&tas_priv->codec_lock);
 
 	return 0;
@@ -271,6 +279,9 @@ static int tasdevice_program_put(struct snd_kcontrol *kcontrol,
 
 	mutex_lock(&tas_priv->codec_lock);
 
+	dev_dbg(tas_priv->dev, "%s: %d -> %d\n", __func__,
+		tas_priv->cur_prog, val);
+
 	if (tas_priv->cur_prog != val) {
 		tas_priv->cur_prog = val;
 		ret = 1;
@@ -290,6 +301,8 @@ static int tasdevice_config_get(struct snd_kcontrol *kcontrol,
 
 	ucontrol->value.integer.value[0] = tas_priv->cur_conf;
 
+	dev_dbg(tas_priv->dev, "%s: %d\n", __func__, tas_priv->cur_conf);
+
 	mutex_unlock(&tas_priv->codec_lock);
 
 	return 0;
@@ -308,6 +321,9 @@ static int tasdevice_config_put(struct snd_kcontrol *kcontrol,
 
 	mutex_lock(&tas_priv->codec_lock);
 
+	dev_dbg(tas_priv->dev, "%s: %d -> %d\n", __func__,
+		tas_priv->cur_conf, val);
+
 	if (tas_priv->cur_conf != val) {
 		tas_priv->cur_conf = val;
 		ret = 1;
@@ -330,6 +346,9 @@ static int tas2781_amp_getvol(struct snd_kcontrol *kcontrol,
 
 	ret = tasdevice_amp_getvol(tas_priv, ucontrol, mc);
 
+	dev_dbg(tas_priv->dev, "%s: %ld\n", __func__,
+		ucontrol->value.integer.value[0]);
+
 	mutex_unlock(&tas_priv->codec_lock);
 
 	return ret;
@@ -345,6 +364,9 @@ static int tas2781_amp_putvol(struct snd_kcontrol *kcontrol,
 
 	mutex_lock(&tas_priv->codec_lock);
 
+	dev_dbg(tas_priv->dev, "%s: %ld\n", __func__,
+		ucontrol->value.integer.value[0]);
+
 	/* The check of the given value is in tasdevice_amp_putvol. */
 	ret = tasdevice_amp_putvol(tas_priv, ucontrol, mc);
 
-- 
2.44.0


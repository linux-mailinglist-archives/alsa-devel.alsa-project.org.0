Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E790F88C8DB
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:19:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B0F22C2D;
	Tue, 26 Mar 2024 17:19:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B0F22C2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469987;
	bh=9sS/jISAgyu61lXomWChV7j5u4qUbSmNT3mVkkIqqbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eHiBJVOopb4KRgR2V8EA62/X+X1EigEphl/d20da3S4QnXJPen1cSdYOPFEZC0tTt
	 yLDOk8Y0mfCIh79u6nbZHV2667JSryDA1U/wAvDBoKJnmElnVNZWnv5byVfm5KFiWf
	 3v0T2t2b8wfecUzGumd939RvRNgk0aKO+Ab04R88=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12D27F805A0; Tue, 26 Mar 2024 17:19:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38F1BF8057C;
	Tue, 26 Mar 2024 17:19:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00319F801D5; Tue, 26 Mar 2024 17:19:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 6725DF801D5
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:18:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6725DF801D5
Received: from fedori.lan (51b68717.dsl.pool.telekom.hu
 [::ffff:81.182.135.23])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000077336.000000006602F571.0023D3A2;
 Tue, 26 Mar 2024 17:18:54 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>,
  stable@vger.kernel.org
Subject: [PATCH v2 1/4] ALSA: hda/tas2781: remove digital gain kcontrol
Date: Tue, 26 Mar 2024 17:18:45 +0100
Message-ID: 
 <741fc21db994efd58f83e7aef38931204961e5b2.1711469583.git.soyer@irl.hu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1711469583.git.soyer@irl.hu>
References: <cover.1711469583.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: AXYSS564TAKCK5MLUFLPOHSVI4NECLFP
X-Message-ID-Hash: AXYSS564TAKCK5MLUFLPOHSVI4NECLFP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AXYSS564TAKCK5MLUFLPOHSVI4NECLFP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The "Speaker Digital Gain" kcontrol controls the TAS2781_DVC_LVL (0x1A)
register. Unfortunately the tas2563 does not have DVC_LVL, but has
INT_MASK0 in 0x1A, which has been misused so far.

Since commit c1947ce61ff4 ("ALSA: hda/realtek: tas2781: enable subwoofer
volume control") the volume of the tas2781 amplifiers can be controlled
by the master volume, so this digital gain kcontrol is not needed.

Remove it.

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
CC: stable@vger.kernel.org
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c | 37 +--------------------------------
 1 file changed, 1 insertion(+), 36 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 4475cea8e9f7..5acb475c10a7 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -89,7 +89,7 @@ struct tas2781_hda {
 	struct snd_kcontrol *dsp_prog_ctl;
 	struct snd_kcontrol *dsp_conf_ctl;
 	struct snd_kcontrol *prof_ctl;
-	struct snd_kcontrol *snd_ctls[3];
+	struct snd_kcontrol *snd_ctls[2];
 };
 
 static int tas2781_get_i2c_res(struct acpi_resource *ares, void *data)
@@ -294,27 +294,6 @@ static int tasdevice_config_put(struct snd_kcontrol *kcontrol,
 	return ret;
 }
 
-/*
- * tas2781_digital_getvol - get the volum control
- * @kcontrol: control pointer
- * @ucontrol: User data
- * Customer Kcontrol for tas2781 is primarily for regmap booking, paging
- * depends on internal regmap mechanism.
- * tas2781 contains book and page two-level register map, especially
- * book switching will set the register BXXP00R7F, after switching to the
- * correct book, then leverage the mechanism for paging to access the
- * register.
- */
-static int tas2781_digital_getvol(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
-	struct soc_mixer_control *mc =
-		(struct soc_mixer_control *)kcontrol->private_value;
-
-	return tasdevice_digital_getvol(tas_priv, ucontrol, mc);
-}
-
 static int tas2781_amp_getvol(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
@@ -325,17 +304,6 @@ static int tas2781_amp_getvol(struct snd_kcontrol *kcontrol,
 	return tasdevice_amp_getvol(tas_priv, ucontrol, mc);
 }
 
-static int tas2781_digital_putvol(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
-	struct soc_mixer_control *mc =
-		(struct soc_mixer_control *)kcontrol->private_value;
-
-	/* The check of the given value is in tasdevice_digital_putvol. */
-	return tasdevice_digital_putvol(tas_priv, ucontrol, mc);
-}
-
 static int tas2781_amp_putvol(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
@@ -381,9 +349,6 @@ static const struct snd_kcontrol_new tas2781_snd_controls[] = {
 	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Analog Gain", TAS2781_AMP_LEVEL,
 		1, 0, 20, 0, tas2781_amp_getvol,
 		tas2781_amp_putvol, amp_vol_tlv),
-	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Digital Gain", TAS2781_DVC_LVL,
-		0, 0, 200, 1, tas2781_digital_getvol,
-		tas2781_digital_putvol, dvc_tlv),
 	ACARD_SINGLE_BOOL_EXT("Speaker Force Firmware Load", 0,
 		tas2781_force_fwload_get, tas2781_force_fwload_put),
 };
-- 
2.44.0


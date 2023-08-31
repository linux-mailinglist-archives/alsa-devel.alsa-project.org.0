Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E8878ED4F
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 14:37:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B12F1FA;
	Thu, 31 Aug 2023 14:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B12F1FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693485466;
	bh=YiFziT9dNaEQBnv24y6HF96k6ONvcd+59E2buBOKCO8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hMuNaK9uLXTdL0OCmNvbD3xBOPa5ecm2WNXpuZaGyRMznF49rzXx23xzbOCRVEyKp
	 0GQdGO1OQlJ9+9jrThKVqBZIXNvpLSTiwj/l8BkdvwJB5XU5TysXdWGvRhZGPnWwIp
	 g38I9MIxduqzz5fv4728fjypKP6cn5BAf6Goj+gs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0117FF804DA; Thu, 31 Aug 2023 14:36:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52414F800F5;
	Thu, 31 Aug 2023 14:36:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA5B3F80155; Thu, 31 Aug 2023 14:36:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24771F80007
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 14:36:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24771F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=KL63wBh8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=53Gl/x0K
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 97FBA215EF;
	Thu, 31 Aug 2023 12:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693485383;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=o5rNb7z+qfgOtqiNQ72Qxllsc56T5I8nUd+ZpLaIF7M=;
	b=KL63wBh8DKy8HASQEtEYGOOtp9zizJt/nfXEQA8g2CUi15hDJyt52w69UyrAfobOMHRUOv
	4lxh819eEenPou2EgR381Bwd/SSWXL2cbFMCpSQwoOIMMzzGfYVZ41BSKXFniIGxGwOGW0
	1Jh+mvgMcuePoKAMvMXXdqfYanIAiCI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693485383;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=o5rNb7z+qfgOtqiNQ72Qxllsc56T5I8nUd+ZpLaIF7M=;
	b=53Gl/x0KV3Fvy4w6GVgNbpAryfYrq+CUy0e/ZqNl8WM7QlalmlOJ6JkBLJ5gWTSN4IPokS
	crJhM6auhLJQhtDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 71DA513587;
	Thu, 31 Aug 2023 12:36:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id qrThGkeJ8GSxAgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 31 Aug 2023 12:36:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <x1077012@ti.com>
Subject: [PATCH] ALSA: hda/tas2781: Use standard clamp() macro
Date: Thu, 31 Aug 2023 14:36:20 +0200
Message-Id: <20230831123620.23064-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M2OIBW3ZOQDEAEHTMFBLVNGKXDTWAC2S
X-Message-ID-Hash: M2OIBW3ZOQDEAEHTMFBLVNGKXDTWAC2S
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M2OIBW3ZOQDEAEHTMFBLVNGKXDTWAC2S/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of the home-made clamp() function, use the standard macro().

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/tas2781_hda_i2c.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 37114fd61a38..fb802802939e 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -173,16 +173,6 @@ static int tasdevice_get_profile_id(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static int tasdevice_hda_clamp(int val, int max)
-{
-	if (val > max)
-		val = max;
-
-	if (val < 0)
-		val = 0;
-	return val;
-}
-
 static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
@@ -191,7 +181,7 @@ static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
 	int max = tas_priv->rcabin.ncfgs - 1;
 	int val, ret = 0;
 
-	val = tasdevice_hda_clamp(nr_profile, max);
+	val = clamp(nr_profile, 0, max);
 
 	if (tas_priv->rcabin.profile_cfg_id != val) {
 		tas_priv->rcabin.profile_cfg_id = val;
@@ -248,7 +238,7 @@ static int tasdevice_program_put(struct snd_kcontrol *kcontrol,
 	int max = tas_fw->nr_programs - 1;
 	int val, ret = 0;
 
-	val = tasdevice_hda_clamp(nr_program, max);
+	val = clamp(nr_program, 0, max);
 
 	if (tas_priv->cur_prog != val) {
 		tas_priv->cur_prog = val;
@@ -277,7 +267,7 @@ static int tasdevice_config_put(struct snd_kcontrol *kcontrol,
 	int max = tas_fw->nr_configurations - 1;
 	int val, ret = 0;
 
-	val = tasdevice_hda_clamp(nr_config, max);
+	val = clamp(nr_config, 0, max);
 
 	if (tas_priv->cur_conf != val) {
 		tas_priv->cur_conf = val;
-- 
2.35.3


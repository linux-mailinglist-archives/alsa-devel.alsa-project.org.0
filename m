Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6301C47444
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 15:41:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A49FB60205;
	Mon, 10 Nov 2025 15:41:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A49FB60205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762785678;
	bh=gA8tlc/rn9u5avxIE4PtESQM2VD/ueReL6UEiKGVi+E=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mVH7S4UXM2YDe1jMUTyaWqFZ3uAk2EJNil/r4PETDaJz1pWZObQMFwcng215zeXWt
	 bduKEipyzpljBtmTA9NvGgJaAn+DFHz4FpAAUAiz05CAIX5qFJKAiFIBng+IzWp+l/
	 QBpKUHjMMhVW2KujC6uzLRAzoIIP8cJE7uBbZ5rM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 063E2F80682; Mon, 10 Nov 2025 15:39:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 999A4F80681;
	Mon, 10 Nov 2025 15:39:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48186F80518; Thu, 11 Sep 2025 17:57:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53A3CF802DB
	for <alsa-devel@alsa-project.org>; Thu, 11 Sep 2025 17:57:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53A3CF802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=vKJsgbbn
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BFvMPu840583;
	Thu, 11 Sep 2025 10:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757606242;
	bh=U2Z3uzxnVD/Yd6/VdzBbXZxCNeXvX4xYQxQr49hd0NI=;
	h=From:To:CC:Subject:Date;
	b=vKJsgbbna167p4X3MFbVznf5ai8Gcqy+yQkuRSZ7Wus0VVPb29ZGur/6sT/OyuYAz
	 F4HEs3fsMPgM9a14A0+t8dyi77DWCylatkDgM+6n96Oqdebrmf3mwqe+0Z7rKpE8Ud
	 kLQ68eoIk+nHCSmB7mIzjRaDRcGt3DcOl8370dms=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BFvLDW605280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 10:57:22 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 10:57:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 10:57:21 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BFvFFI2366393;
	Thu, 11 Sep 2025 10:57:16 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>,
        <perex@perex.cz>, <tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
        <cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
        <ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
        <pierre-louis.bossart@linux.dev>, <navada@ti.com>,
        <shenghao-ding@ti.com>, <v-hampiholi@ti.com>, <baojun.xu@ti.com>,
        Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v4 1/6] ASoC: ops: improve snd_soc_get_volsw
Date: Thu, 11 Sep 2025 21:26:58 +0530
Message-ID: <20250911155704.2236-1-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZFKON225KIIE7WP3GBRWW3PKK6RJTWLS
X-Message-ID-Hash: ZFKON225KIIE7WP3GBRWW3PKK6RJTWLS
X-Mailman-Approved-At: Mon, 10 Nov 2025 14:39:23 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZFKON225KIIE7WP3GBRWW3PKK6RJTWLS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

* add error handling in case register read fails
* add support for clamping the values if the register
  value read is greater than max value

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/soc-ops.c | 38 +++++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index a629e0eac..59e91741b 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -111,10 +111,14 @@ int snd_soc_put_enum_double(struct snd_kcontrol *kcontrol,
 EXPORT_SYMBOL_GPL(snd_soc_put_enum_double);
 
 static int soc_mixer_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_val,
-				unsigned int mask, unsigned int shift, int max)
+				unsigned int mask, unsigned int shift, int max,
+				bool clamp)
 {
 	int val = (reg_val >> shift) & mask;
 
+	if (clamp)
+		val = clamp(val, 0, mc->max);
+
 	if (mc->sign_bit)
 		val = sign_extend32(val, mc->sign_bit);
 
@@ -245,29 +249,44 @@ static int soc_put_volsw(struct snd_kcontrol *kcontrol,
 
 static int soc_get_volsw(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_value *ucontrol,
-			 struct soc_mixer_control *mc, int mask, int max)
+			 struct soc_mixer_control *mc, int mask, int max,
+			 bool clamp)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg_val;
-	int val;
+	int val, ret = 0;
 
 	reg_val = snd_soc_component_read(component, mc->reg);
-	val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->shift, max);
+	val = reg_val;
+	if (val < 0) {
+		ret = val;
+		goto get_volsw_done;
+	}
+
+	val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->shift, max, clamp);
 
 	ucontrol->value.integer.value[0] = val;
 
 	if (snd_soc_volsw_is_stereo(mc)) {
 		if (mc->reg == mc->rreg) {
-			val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->rshift, max);
+			val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->rshift,
+						   max, clamp);
 		} else {
 			reg_val = snd_soc_component_read(component, mc->rreg);
-			val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->shift, max);
+			val = reg_val;
+			if (val < 0) {
+				ret = val;
+				goto get_volsw_done;
+			}
+			val = soc_mixer_reg_to_ctl(mc, reg_val, mask,
+						   mc->shift, max, clamp);
 		}
 
 		ucontrol->value.integer.value[1] = val;
 	}
 
-	return 0;
+get_volsw_done:
+	return ret;
 }
 
 /**
@@ -330,7 +349,8 @@ int snd_soc_get_volsw(struct snd_kcontrol *kcontrol,
 		(struct soc_mixer_control *)kcontrol->private_value;
 	unsigned int mask = soc_mixer_mask(mc);
 
-	return soc_get_volsw(kcontrol, ucontrol, mc, mask, mc->max - mc->min);
+	return soc_get_volsw(kcontrol, ucontrol, mc, mask,
+			     mc->max - mc->min, false);
 }
 EXPORT_SYMBOL_GPL(snd_soc_get_volsw);
 
@@ -372,7 +392,7 @@ int snd_soc_get_volsw_sx(struct snd_kcontrol *kcontrol,
 		(struct soc_mixer_control *)kcontrol->private_value;
 	unsigned int mask = soc_mixer_sx_mask(mc);
 
-	return soc_get_volsw(kcontrol, ucontrol, mc, mask, mc->max);
+	return soc_get_volsw(kcontrol, ucontrol, mc, mask, mc->max, false);
 }
 EXPORT_SYMBOL_GPL(snd_soc_get_volsw_sx);
 
-- 
2.45.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 198F1812346
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 00:39:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BBD6AEA;
	Thu, 14 Dec 2023 00:39:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BBD6AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702510771;
	bh=vAEat/8eDUSFefvM00/f1BonbSABpidQlso70r4FIaE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KnO4fJIVzn0yfmGXgm63/OLiZOJY/DBp/KwmoiT6CImYdhRI7L6pv4P2w31mizptO
	 I0nRjjOxFheh5s7SF7AlS/ppeBfJs1dvo9pCD086pXFZZv5FjMVw+wylFw2Oe80RZh
	 965jBcyLUtpnVUaQ/McWw3CEm1gmblATRlMMjOes=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00AA2F80579; Thu, 14 Dec 2023 00:39:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E823F80568;
	Thu, 14 Dec 2023 00:38:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9ACB6F8016A; Thu, 14 Dec 2023 00:30:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 2EADEF8001F
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 00:28:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EADEF8001F
Received: from fedori.lan (51b690cd.dsl.pool.telekom.hu
 [::ffff:81.182.144.205])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000070634.00000000657A3E1D.0012846C;
 Thu, 14 Dec 2023 00:28:29 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
  Gergo Koteles <soyer@irl.hu>, stable@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/tas2781: call cleanup functions only once
Date: Thu, 14 Dec 2023 00:28:16 +0100
Message-ID: 
 <1a0885c424bb21172702d254655882b59ef6477a.1702510018.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: VKNA6EWFMSSHXJLRK4C33UJNTZHVN4TN
X-Message-ID-Hash: VKNA6EWFMSSHXJLRK4C33UJNTZHVN4TN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VKNA6EWFMSSHXJLRK4C33UJNTZHVN4TN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If the module can load the RCA but not the firmware binary, it will call
the cleanup functions. Then unloading the module causes general
protection fault due to double free.

Do not call the cleanup functions in tasdev_fw_ready.

general protection fault, probably for non-canonical address
0x6f2b8a2bff4c8fec: 0000 [#1] PREEMPT SMP NOPTI
Call Trace:
 <TASK>
 ? die_addr+0x36/0x90
 ? exc_general_protection+0x1c5/0x430
 ? asm_exc_general_protection+0x26/0x30
 ? tasdevice_config_info_remove+0x6d/0xd0 [snd_soc_tas2781_fmwlib]
 tas2781_hda_unbind+0xaa/0x100 [snd_hda_scodec_tas2781_i2c]
 component_unbind+0x2e/0x50
 component_unbind_all+0x92/0xa0
 component_del+0xa8/0x140
 tas2781_hda_remove.isra.0+0x32/0x60 [snd_hda_scodec_tas2781_i2c]
 i2c_device_remove+0x26/0xb0

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
CC: stable@vger.kernel.org
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index fb802802939e..c6b292606dfa 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -550,11 +550,6 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	tas2781_save_calibration(tas_priv);
 
 out:
-	if (tas_priv->fw_state == TASDEVICE_DSP_FW_FAIL) {
-		/*If DSP FW fail, kcontrol won't be created */
-		tasdevice_config_info_remove(tas_priv);
-		tasdevice_dsp_remove(tas_priv);
-	}
 	mutex_unlock(&tas_priv->codec_lock);
 	if (fmw)
 		release_firmware(fmw);

base-commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa
-- 
2.43.0


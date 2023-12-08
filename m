Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C2180AB00
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Dec 2023 18:41:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D591C843;
	Fri,  8 Dec 2023 18:40:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D591C843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702057260;
	bh=fqqWOmoeWyc5eQQiOQT4IPcS43+gVCQhHiCpqIgoCow=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FOyS9H1sN79FW/kTnpUhj4IAkCksYC0rY4Qy38BkCAp85jiRU0dTa6wnaL8F9C9/J
	 aRLZiHCrXmTfg0vrFhGZ3+BvqHYvE3NkmItW7BdpI68A1oqYdo7rrXBJRJL6i3HQSO
	 t48GJA/mu/Gml5DQj9ASE3PMMgQGz+zJO/kIVyAY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5EA8F80567; Fri,  8 Dec 2023 18:40:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CE89F80571;
	Fri,  8 Dec 2023 18:40:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95B1EF8024E; Fri,  8 Dec 2023 18:40:19 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 4EEECF800E4
	for <alsa-devel@alsa-project.org>; Fri,  8 Dec 2023 18:40:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EEECF800E4
Received: from fedori.lan (51b690cd.dsl.pool.telekom.hu
 [::ffff:81.182.144.205])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000719DB.00000000657354F6.0011CADC;
 Fri, 08 Dec 2023 18:40:06 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
  Gergo Koteles <soyer@irl.hu>, stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/tas2781: leave hda_component in usable state
Date: Fri,  8 Dec 2023 18:38:19 +0100
Message-ID: 
 <052224ccd9d24dac777c468d2ef94d5fabe619a0.1702056528.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: GWITBAGRFYOJIRTLLBXK3CMMNDVLLB5P
X-Message-ID-Hash: GWITBAGRFYOJIRTLLBXK3CMMNDVLLB5P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GWITBAGRFYOJIRTLLBXK3CMMNDVLLB5P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Unloading then loading the module causes a NULL ponter dereference.

The hda_unbind zeroes the hda_component, later the hda_bind tries
to dereference the codec field.

The hda_component is only initialized once by tas2781_generic_fixup.

Set only previously modified fields to NULL.

BUG: kernel NULL pointer dereference, address: 0000000000000322
Call Trace:
 <TASK>
 ? __die+0x23/0x70
 ? page_fault_oops+0x171/0x4e0
 ? exc_page_fault+0x7f/0x180
 ? asm_exc_page_fault+0x26/0x30
 ? tas2781_hda_bind+0x59/0x140 [snd_hda_scodec_tas2781_i2c]
 component_bind_all+0xf3/0x240
 try_to_bring_up_aggregate_device+0x1c3/0x270
 __component_add+0xbc/0x1a0
 tas2781_hda_i2c_probe+0x289/0x3a0 [snd_hda_scodec_tas2781_i2c]
 i2c_device_probe+0x136/0x2e0

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
CC: stable@vger.kernel.org
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index fb802802939e..ba4fdae8ec9b 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -612,9 +612,13 @@ static void tas2781_hda_unbind(struct device *dev,
 {
 	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
 	struct hda_component *comps = master_data;
+	comps = &comps[tas_priv->index];
 
-	if (comps[tas_priv->index].dev == dev)
-		memset(&comps[tas_priv->index], 0, sizeof(*comps));
+	if (comps[tas_priv->index].dev == dev) {
+		comps->dev = NULL;
+		strscpy(comps->name, "", sizeof(comps->name));
+		comps->playback_hook = NULL;
+	}
 
 	tasdevice_config_info_remove(tas_priv);
 	tasdevice_dsp_remove(tas_priv);

base-commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa
-- 
2.43.0


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7953397C9CB
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2024 15:13:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB38B85D;
	Thu, 19 Sep 2024 15:13:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB38B85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726751591;
	bh=V6u2eHa/w9HQk3WWvCdMr/y/+BoQMgcZ+Nl2/14uCeA=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IdfSdlsuTpcoXmQDW46lRB6hr0yN97rjcNLhV/S4b8Pjxm0DJa4XVl7sJ00pTVq45
	 tfVQRu5Cw9/8XUIVADmBdLmW/dixTeK0IHftsfokqCwBAfCb48CfIADOCPEpJt3vcb
	 j8CXnmlSEPa9JBnoLz1Fd8gukPKlk9RxSc0mWAHE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59238F805AD; Thu, 19 Sep 2024 15:12:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E91C0F8059F;
	Thu, 19 Sep 2024 15:12:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FB65F801F5; Fri, 13 Sep 2024 14:07:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5DAAF800E9
	for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2024 14:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5DAAF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=DsWd7aJR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726229260; x=1757765260;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V6u2eHa/w9HQk3WWvCdMr/y/+BoQMgcZ+Nl2/14uCeA=;
  b=DsWd7aJRQIDd6KEj1jZ1g5LxvNGfbxSQe7YWCaLVFp0N3Weh6+5y+JOo
   qOcFKe6jAPy21UAUNJAsehiAioiaktxZE+idpk2fEBVEorLGqKI7XfL7k
   NAxmJumq14M6wWGQNBjX9EM0OrCJdPLfGrkrFupY3I65Tf+qqxqZMJz6v
   irFr0u3JoEDz+uDZGKpFBuiFpYEBFHG5/sfSYQ6SFfKgoOtuMmWRKPm8H
   r29HxBtyTAP7YXGrP9RQZtekepP/cTeosKTnT+l8RJRKU34SOyM43q7HJ
   2EPE7u0kE6xOj459qoZu92fed6eMhJG/+WVJ6yMMHZ6U6Ph4GBx0ycbmT
   w==;
X-CSE-ConnectionGUID: ap9aDqYYRZ2h/RrZKGCbqA==
X-CSE-MsgGUID: FyIGOBtkRr+rtkG0jt9EvA==
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600";
   d="scan'208";a="31749888"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Sep 2024 05:07:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 13 Sep 2024 05:07:25 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 13 Sep 2024 05:07:21 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Andrei Simion
	<andrei.simion@microchip.com>
Subject: [PATCH v2] ASoC: atmel: mchp-pdmc: Retain Non-Runtime Controls
Date: Fri, 13 Sep 2024 15:06:22 +0300
Message-ID: <20240913120621.79088-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: prvs=97946740d=Andrei.Simion@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BSUJ622NZFMBZSOESMUHX6GCWIUXV5N2
X-Message-ID-Hash: BSUJ622NZFMBZSOESMUHX6GCWIUXV5N2
X-Mailman-Approved-At: Thu, 19 Sep 2024 13:12:34 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BSUJ622NZFMBZSOESMUHX6GCWIUXV5N2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Avoid removing these controls, as doing so can cause issues if the stream
is initiated from another control. Ensure these controls remain intact when
the stream is started or finished. Instead of removing them, return an
-EBUSY error code to indicate that the controller is busy, especially when
the audio filter and the SINC filter are in use.

[andrei.simion@microchip.com: Reword the commit title and the commit
message. Replace spinlock and busy variable with atomic_t busy_stream.]

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
v1 -> v2:
- drop spinlock and u8 busy:1;
- use atomic_t variable busy_stream
- use atomic_read, atomic_set
---
 sound/soc/atmel/mchp-pdmc.c | 57 ++++++++++---------------------------
 1 file changed, 15 insertions(+), 42 deletions(-)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index d97d153ee375..939cd44ebc8a 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -124,6 +124,7 @@ struct mchp_pdmc {
 	int mic_no;
 	int sinc_order;
 	bool audio_filter_en;
+	atomic_t busy_stream;
 };
 
 static const char *const mchp_pdmc_sinc_filter_order_text[] = {
@@ -167,6 +168,10 @@ static int mchp_pdmc_sinc_order_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 
 	val = snd_soc_enum_item_to_val(e, item[0]) << e->shift_l;
+
+	if (atomic_read(&dd->busy_stream))
+		return -EBUSY;
+
 	if (val == dd->sinc_order)
 		return 0;
 
@@ -193,6 +198,9 @@ static int mchp_pdmc_af_put(struct snd_kcontrol *kcontrol,
 	struct mchp_pdmc *dd = snd_soc_component_get_drvdata(component);
 	bool af = uvalue->value.integer.value[0] ? true : false;
 
+	if (atomic_read(&dd->busy_stream))
+		return -EBUSY;
+
 	if (dd->audio_filter_en == af)
 		return 0;
 
@@ -379,52 +387,10 @@ static const struct snd_kcontrol_new mchp_pdmc_snd_controls[] = {
 	},
 };
 
-static int mchp_pdmc_close(struct snd_soc_component *component,
-			   struct snd_pcm_substream *substream)
-{
-	return snd_soc_add_component_controls(component, mchp_pdmc_snd_controls,
-					      ARRAY_SIZE(mchp_pdmc_snd_controls));
-}
-
-static int mchp_pdmc_open(struct snd_soc_component *component,
-			  struct snd_pcm_substream *substream)
-{
-	int i;
-
-	/* remove controls that can't be changed at runtime */
-	for (i = 0; i < ARRAY_SIZE(mchp_pdmc_snd_controls); i++) {
-		const struct snd_kcontrol_new *control = &mchp_pdmc_snd_controls[i];
-		struct snd_ctl_elem_id id;
-		int err;
-
-		if (component->name_prefix)
-			snprintf(id.name, sizeof(id.name), "%s %s", component->name_prefix,
-				 control->name);
-		else
-			strscpy(id.name, control->name, sizeof(id.name));
-
-		id.numid = 0;
-		id.iface = control->iface;
-		id.device = control->device;
-		id.subdevice = control->subdevice;
-		id.index = control->index;
-		err = snd_ctl_remove_id(component->card->snd_card, &id);
-		if (err < 0)
-			dev_err(component->dev, "%d: Failed to remove %s\n", err,
-				control->name);
-	}
-
-	return 0;
-}
-
 static const struct snd_soc_component_driver mchp_pdmc_dai_component = {
 	.name = "mchp-pdmc",
 	.controls = mchp_pdmc_snd_controls,
 	.num_controls = ARRAY_SIZE(mchp_pdmc_snd_controls),
-	.open = &mchp_pdmc_open,
-	.close = &mchp_pdmc_close,
-	.legacy_dai_naming = 1,
-	.trigger_start = SND_SOC_TRIGGER_ORDER_LDC,
 };
 
 static const unsigned int mchp_pdmc_1mic[] = {1};
@@ -587,6 +553,11 @@ static int mchp_pdmc_hw_params(struct snd_pcm_substream *substream,
 			cfgr_val |= MCHP_PDMC_CFGR_BSSEL(i);
 	}
 
+	/*
+	 * from these point forward, we consider the controller busy, so the
+	 * audio filter and SINC order can't be changed
+	 */
+	atomic_set(&dd->busy_stream, 1);
 	for (osr_start = dd->audio_filter_en ? 64 : 8;
 	     osr_start <= 256 && best_diff_rate; osr_start *= 2) {
 		long round_rate;
@@ -1143,6 +1114,8 @@ static void mchp_pdmc_remove(struct platform_device *pdev)
 {
 	struct mchp_pdmc *dd = platform_get_drvdata(pdev);
 
+	atomic_set(&dd->busy_stream, 0);
+
 	if (!pm_runtime_status_suspended(dd->dev))
 		mchp_pdmc_runtime_suspend(dd->dev);
 

base-commit: 5acd9952f95fb4b7da6d09a3be39195a80845eb6
-- 
2.34.1


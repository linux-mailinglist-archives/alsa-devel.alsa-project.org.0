Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9728B45D56A
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 08:28:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B19C184C;
	Thu, 25 Nov 2021 08:27:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B19C184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637825280;
	bh=pIwkJTu8V4ySbsCtNQdxtC6pn9/behFmZiUCrf7jATs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hjHTTcX8SKesaTAM7pQoUJ0QiSpy3SOzshiU2QeFuARhHj1qengAJ4Rg2d4pYpCEt
	 YqEdcR1KUaWeLeD3m2SJBSJ9rJB1pufj6uXqGMt1wIPBTpMleDMgXor7W8d+/C+RK+
	 AvxM/WdFT5MlnK1VzAJlNGqofSNuZNvfX+UbtXgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D923EF80302;
	Thu, 25 Nov 2021 08:26:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 305A7F8049E; Thu, 25 Nov 2021 08:26:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MAILING_LIST_MULTI, MSGID_FROM_MTA_HEADER, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCA7AF80302
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 08:26:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCA7AF80302
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="ttZcOx7R"; 
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=cirrus.com header.i=@cirrus.com header.b="GT6Wg99f"
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8091840748
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 07:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637825184;
 bh=DA5H5yWze8BGMI8ucALCnUYKMSvgBd6BbMpraTj5Kdo=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=ttZcOx7RBgesJHwjpZQaICKuKnGsFv6jlzqreSkEh+ON695dsOhjsZ0a7JS1xmLh8
 etxhPTbONjlnkz2jh5NuetBJN+HFZhTs+sF8i0HZ7+4yDo/nch3DXACEGvcVApgf/v
 fktNZsFxmQJkjVkxQWgOAInnEqgl/oyWo6wTENTLbQh312tX448FWSEhLZOzWcMXCA
 dmc0b4oSNfGweMbphqFRkaCmmXyDBRD9dIMjbLtQciC9JBf73M1OwIWrz4xtLXIKoR
 6ovDe3jVwC8qaXEBKEcFWHsC1zwhKdQwvQIOE+A30m/Dc6FXuCT1ki2Nh8LOswhKaV
 qNgYuVt1A+EPA==
Received: by mail-pl1-f198.google.com with SMTP id
 4-20020a170902c20400b0014381f710d5so1707019pll.11
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 23:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id
 :dkim-signature:mime-version:precedence:list-id
 :content-transfer-encoding;
 bh=DA5H5yWze8BGMI8ucALCnUYKMSvgBd6BbMpraTj5Kdo=;
 b=VgKAzCMsU/TvBYVuzu62wR0hQCay31XJjMwdR27Ply5deCUc4Dv4VUndOjJDLhh1Vg
 nk2N6SVN5j275QMCC9iI2/uBzgGhxmlyTasS8qRV/qixr8HYdoeZ/QEi7JScRwt1uUYv
 M0srMfx6K9MQ8fejFz1uanAcbjsI+f2jvtzt+GQMe8fQGmbVns9Vc6o5Z0D0QVWi5It5
 aGNfotSVOnxxpCTG9RtLwp/puzcnzxstC4AzDljTIsMIaOzpejb6o8PSLGXCGlM/N8u2
 iXh5+BO76pZbdhThQ9JNVP8yGGYoFzv8CAbwj7wY74zbNgmq8T0o6N0tso8Q6FFMd848
 OciA==
X-Gm-Message-State: AOAM531ifVMy0TgMcewSzlivudU7qBjlDltqnZMDBec0feg9fPeOdeB9
 v69n33zu4RF4gCr80SVdrGL9hhQxOcCU/jYNDfdNbm7q4glnZyYT/JNB8MOWwBoixW41mudj/wS
 4TNphdOaqz8Xn1uOivyYueEB9jCNcQVP11/IeJwLq
X-Received: by 2002:a05:6a00:1248:b0:4a2:5cba:89cb with SMTP id
 u8-20020a056a00124800b004a25cba89cbmr12607924pfi.12.1637825182782; 
 Wed, 24 Nov 2021 23:26:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmm6j6eeOlZBaPBPinTv/7yu5VueHBFQmVblSUNSyiRaxIgqisJqMc4nd2pGcc2dhVLx8aRQ==
X-Received: by 2002:a05:6a00:1248:b0:4a2:5cba:89cb with SMTP id
 u8-20020a056a00124800b004a25cba89cbmr12607908pfi.12.1637825182436; 
 Wed, 24 Nov 2021 23:26:22 -0800 (PST)
Received: from localhost.localdomain (111-240-133-170.dynamic-ip.hinet.net.
 [111.240.133.170])
 by smtp.gmail.com with ESMTPSA id h13sm1977370pfv.37.2021.11.24.23.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 23:26:22 -0800 (PST)
From: Chris Chiu <chris.chiu@canonical.com>
To: ccchiu@gmail.com, James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: hda/cs8409: Schedule delayed work for jack detect on
 resume
Date: Thu, 25 Nov 2021 15:26:02 +0800
Message-Id: <20211124181908.50672-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18]) by
 smtp.lore.kernel.org (Postfix) with ESMTP id 395DCC433F5 for
 <linux-kernel@archiver.kernel.org>; Wed, 24 Nov 2021 18:19:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand id
 S243344AbhKXSXF (ORCPT <rfc822; linux-kernel@archiver.kernel.org>);
 Wed, 24 Nov 2021 13:23:05 -0500
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:54194 "EHLO
 mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S242520AbhKXSWx (ORCPT <rfc822; linux-kernel@vger.kernel.org>);
 Wed, 24 Nov 2021 13:22:53 -0500
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1]) by
 mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AO7P93t013358;
 Wed, 24 Nov 2021 12:19:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc : subject : date : message-id : mime-version
 : content-transfer-encoding : content-type; s=PODMain02222019;
 bh=U8Ap+OhwHy2SWvzy0sqCvywt4yyXDWnVtiddXPBdUQ8=;
 b=GT6Wg99ftCaP4vptM9MfwILGC8BHoT8bTM2YjL+jYL2yyLLxFRkSC1I9zvEJivFg5F4j
 FwSlwwMVNn0vav4x1LiiJIkIfr4VPpKjpU7V/rkVCTjJoVAdhqroisZbhe3umDCEX6Mm
 Y+f+8xt8oN5+yzey4iL8gt26qK98iBB//ikawhQAA9BaoFB3P01jiu9ROCgwi1Fl+w1k
 hH3BTZI+AeoZ93dMgOSXlE7PMKN4P+5uCegni31Jw1+cIjmROjx4ZxiblX3bFL5eaIZ2
 Qmukx0Bu2ecJsYks2wFi1esKcPBEH3TSrSAuN5dEenYgkNblBdaLHGduziFwD9z2mUwA NQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68]) by
 mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3chds7gtp8-1 (version=TLSv1.2
 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 24 Nov 2021 12:19:11 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17;
 Wed, 24 Nov 2021 18:19:09 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 24 Nov 2021 18:19:09 +0000
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.68]) by
 ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2D9EC2A1;
 Wed, 24 Nov 2021 18:19:08 +0000 (UTC)
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: OecZu0N3k7o4BupfIvgv86XUL39FNquW
X-Proofpoint-ORIG-GUID: OecZu0N3k7o4BupfIvgv86XUL39FNquW
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 8bit
Cc: Chris Chiu <chris.chiu@canonical.com>, alsa-devel@alsa-project.org,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>

From: Stefan Binding <sbinding@opensource.cirrus.com>

CS42L42 runs jack detect on resume, however this requires unsol
events, and unsol events are ignored whilst the power state is
not set to ON. The power state is set to ON only after the resume
finishes. Schedule a delayed work timer to run jack detect
after the resume call finishes.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---

Tested-by: Chris Chiu <chris.chiu@canonical.com>

 sound/pci/hda/patch_cs8409.c | 79 +++++++++++++++++++++++++++++-------
 sound/pci/hda/patch_cs8409.h |  1 +
 2 files changed, 65 insertions(+), 15 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 31ff11ab868e..88213e95f0b3 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -634,6 +634,30 @@ static void cs42l42_run_jack_detect(struct sub_codec *cs42l42)
 	cs8409_i2c_write(cs42l42, 0x1120, 0xc0);
 }
 
+static void cs42l42_run_jack_detect_all(struct hda_codec *codec)
+{
+	struct cs8409_spec *spec = codec->spec;
+	struct sub_codec *cs42l42;
+	int i;
+
+	for (i = 0; i < spec->num_scodecs; i++) {
+		cs42l42 = spec->scodecs[i];
+		cs42l42_enable_jack_detect(cs42l42);
+		if (!cs42l42->hp_jack_in)
+			cs42l42_run_jack_detect(cs42l42);
+	}
+}
+
+/*
+ * cs42l42_jack_detect_worker - Worker that retries jack detect
+ */
+static void cs42l42_jack_detect_worker(struct work_struct *work)
+{
+	struct cs8409_spec *spec = container_of(work, struct cs8409_spec, jack_detect_work.work);
+
+	cs42l42_run_jack_detect_all(spec->codec);
+}
+
 static int cs42l42_handle_tip_sense(struct sub_codec *cs42l42, unsigned int reg_ts_status)
 {
 	int status_changed = 0;
@@ -749,8 +773,6 @@ static void cs42l42_resume(struct sub_codec *cs42l42)
 
 	if (cs42l42->full_scale_vol)
 		cs8409_i2c_write(cs42l42, 0x2001, 0x01);
-
-	cs42l42_enable_jack_detect(cs42l42);
 }
 
 #ifdef CONFIG_PM
@@ -800,6 +822,7 @@ static void cs8409_free(struct hda_codec *codec)
 
 	/* Cancel i2c clock disable timer, and disable clock if left enabled */
 	cancel_delayed_work_sync(&spec->i2c_clk_work);
+	cancel_delayed_work_sync(&spec->jack_detect_work);
 	cs8409_disable_i2c_clock(codec);
 
 	snd_hda_gen_free(codec);
@@ -863,6 +886,7 @@ static int cs8409_cs42l42_suspend(struct hda_codec *codec)
 
 	/* Cancel i2c clock disable timer, and disable clock if left enabled */
 	cancel_delayed_work_sync(&spec->i2c_clk_work);
+	cancel_delayed_work_sync(&spec->jack_detect_work);
 	cs8409_disable_i2c_clock(codec);
 
 	snd_hda_shutup_pins(codec);
@@ -970,6 +994,8 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		spec->scodecs[CS8409_CODEC0]->codec = codec;
 		codec->patch_ops = cs8409_cs42l42_patch_ops;
 
+		INIT_DELAYED_WORK(&spec->jack_detect_work, cs42l42_jack_detect_worker);
+
 		spec->gen.suppress_auto_mute = 1;
 		spec->gen.no_primary_hp = 1;
 		spec->gen.suppress_vmaster = 1;
@@ -1029,9 +1055,16 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 	case HDA_FIXUP_ACT_INIT:
 		cs8409_cs42l42_hw_init(codec);
 		spec->init_done = 1;
-		if (spec->init_done && spec->build_ctrl_done
-			&& !spec->scodecs[CS8409_CODEC0]->hp_jack_in)
-			cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
+		if (spec->init_done && spec->build_ctrl_done) {
+			/* No point in running jack detect until we have fully resumed */
+			if (codec->core.dev.power.power_state.event != PM_EVENT_ON) {
+				codec_warn(codec, "Not ready to detect jack, deferring...\n");
+				schedule_delayed_work(&spec->jack_detect_work, msecs_to_jiffies(25));
+				return;
+			} else {
+				cs42l42_run_jack_detect_all(codec);
+			}
+		}
 		break;
 	case HDA_FIXUP_ACT_BUILD:
 		spec->build_ctrl_done = 1;
@@ -1040,9 +1073,16 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		 * been already plugged in.
 		 * Run immediately after init.
 		 */
-		if (spec->init_done && spec->build_ctrl_done
-			&& !spec->scodecs[CS8409_CODEC0]->hp_jack_in)
-			cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
+		if (spec->init_done && spec->build_ctrl_done) {
+			/* No point in running jack detect until we have fully resumed */
+			if (codec->core.dev.power.power_state.event != PM_EVENT_ON) {
+				codec_warn(codec, "Not ready to detect jack, deferring...\n");
+				schedule_delayed_work(&spec->jack_detect_work, msecs_to_jiffies(25));
+				return;
+			} else {
+				cs42l42_run_jack_detect_all(codec);
+			}
+		}
 		break;
 	default:
 		break;
@@ -1178,7 +1218,6 @@ void dolphin_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int ac
 {
 	struct cs8409_spec *spec = codec->spec;
 	struct snd_kcontrol_new *kctrl;
-	int i;
 
 	switch (action) {
 	case HDA_FIXUP_ACT_PRE_PROBE:
@@ -1193,6 +1232,8 @@ void dolphin_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int ac
 		spec->scodecs[CS8409_CODEC1]->codec = codec;
 		spec->num_scodecs = 2;
 
+		INIT_DELAYED_WORK(&spec->jack_detect_work, cs42l42_jack_detect_worker);
+
 		codec->patch_ops = cs8409_dolphin_patch_ops;
 
 		/* GPIO 1,5 out, 0,4 in */
@@ -1237,9 +1278,13 @@ void dolphin_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int ac
 		dolphin_hw_init(codec);
 		spec->init_done = 1;
 		if (spec->init_done && spec->build_ctrl_done) {
-			for (i = 0; i < spec->num_scodecs; i++) {
-				if (!spec->scodecs[i]->hp_jack_in)
-					cs42l42_run_jack_detect(spec->scodecs[i]);
+			/* No point in running jack detect until we have fully resumed */
+			if (codec->core.dev.power.power_state.event != PM_EVENT_ON) {
+				codec_warn(codec, "Not ready to detect jack, deferring...\n");
+				schedule_delayed_work(&spec->jack_detect_work, msecs_to_jiffies(25));
+				return;
+			} else {
+				cs42l42_run_jack_detect_all(codec);
 			}
 		}
 		break;
@@ -1251,9 +1296,13 @@ void dolphin_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int ac
 		 * Run immediately after init.
 		 */
 		if (spec->init_done && spec->build_ctrl_done) {
-			for (i = 0; i < spec->num_scodecs; i++) {
-				if (!spec->scodecs[i]->hp_jack_in)
-					cs42l42_run_jack_detect(spec->scodecs[i]);
+			/* No point in running jack detect until we have fully resumed */
+			if (codec->core.dev.power.power_state.event != PM_EVENT_ON) {
+				codec_warn(codec, "Not ready to detect jack, deferring...\n");
+				schedule_delayed_work(&spec->jack_detect_work, msecs_to_jiffies(25));
+				return;
+			} else {
+				cs42l42_run_jack_detect_all(codec);
 			}
 		}
 		break;
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index ade2b838590c..632d3ec8322d 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -330,6 +330,7 @@ struct cs8409_spec {
 	unsigned int i2c_clck_enabled;
 	unsigned int dev_addr;
 	struct delayed_work i2c_clk_work;
+	struct delayed_work jack_detect_work;
 
 	unsigned int playback_started:1;
 	unsigned int capture_started:1;
-- 
2.25.1



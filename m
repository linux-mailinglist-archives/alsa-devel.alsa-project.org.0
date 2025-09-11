Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB324C47447
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 15:41:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 049136021E;
	Mon, 10 Nov 2025 15:41:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 049136021E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762785698;
	bh=hrcW5HRwoVO5AaCGG/ywl3j8o6ZmjYB2G9tHTnI0GQU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iQBtqvFl3u+z19KLuw97HCquIfna//fWrUhhT3uxCQfSlrlC2xFmQVRxb+EUj6eKw
	 tUIx/2X0ppjo3e2L3uVOR7ZhZUX/hRlTaOxqKh3ZL8FJbHyERLnXtjh5DvUPSTbyUs
	 W3BslsXstOh9wpyls2Rq2Zfp4JyEDE396veUGxww=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 947FBF8069F; Mon, 10 Nov 2025 15:39:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46181F80697;
	Mon, 10 Nov 2025 15:39:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02D2EF80518; Thu, 11 Sep 2025 17:57:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 496D1F802DB
	for <alsa-devel@alsa-project.org>; Thu, 11 Sep 2025 17:57:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 496D1F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=HAHFalHN
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BFvTcf411208;
	Thu, 11 Sep 2025 10:57:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757606249;
	bh=XUvv+AnBramso+YMdyYjMt/0odeuMKapNNe5YCj5NiU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HAHFalHNdOZBGWEkZog/3AUSGk5wzVUi4wLMKwZoj6Pg6GPyuI/teiKx2kzO21tJx
	 jNYOOaa7NPNdErub87kPcfPpVO5Q2GL8fAnNgxvLl7X58PPwa2WVI1NVKDim6mDuJH
	 t7CQV3C9eNamBI4ZxGLoJdJfWdpONrAwxifgAwGY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BFvSOX2051076
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 10:57:28 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 10:57:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 10:57:27 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BFvFFJ2366393;
	Thu, 11 Sep 2025 10:57:23 -0500
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
Subject: [PATCH v4 2/6] ASoC: ops: add snd_soc_get_volsw_clamped
Date: Thu, 11 Sep 2025 21:26:59 +0530
Message-ID: <20250911155704.2236-2-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20250911155704.2236-1-niranjan.hy@ti.com>
References: <20250911155704.2236-1-niranjan.hy@ti.com>
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
Message-ID-Hash: XOUSOCR4DQZJFV2NHUQM4K7PKH2BHP42
X-Message-ID-Hash: XOUSOCR4DQZJFV2NHUQM4K7PKH2BHP42
X-Mailman-Approved-At: Mon, 10 Nov 2025 14:39:24 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XOUSOCR4DQZJFV2NHUQM4K7PKH2BHP42/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

  Add API snd_soc_get_volsw_clamped to read
  the volume from device. This similar to
  existing API snd_soc_get_volsw. But has
  additional step to clamp the value to max value
  if the register value is larger than max value.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 include/sound/soc.h |  2 ++
 sound/soc/soc-ops.c | 22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 1fffef311..34a490ece 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -553,6 +553,8 @@ int snd_soc_info_volsw_sx(struct snd_kcontrol *kcontrol,
 #define snd_soc_info_bool_ext		snd_ctl_boolean_mono_info
 int snd_soc_get_volsw(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
+int snd_soc_get_volsw_clamped(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_put_volsw(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 #define snd_soc_get_volsw_2r snd_soc_get_volsw
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 59e91741b..4d1ee5cd2 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -354,6 +354,28 @@ int snd_soc_get_volsw(struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL_GPL(snd_soc_get_volsw);
 
+/**
+ * snd_soc_get_volsw_clamped - single mixer get callback with range
+ * @kcontrol: mixer control
+ * @ucontrol: control element information
+ *
+ * Similar to snd_soc_get_volsw, with additional operation to
+ * clamp the register value to its maximum.
+ *
+ * Returns 0 for success.
+ */
+int snd_soc_get_volsw_clamped(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	unsigned int mask = soc_mixer_mask(mc);
+
+	return soc_get_volsw(kcontrol, ucontrol, mc, mask,
+			     mc->max - mc->min, true);
+}
+EXPORT_SYMBOL_GPL(snd_soc_get_volsw_clamped);
+
 /**
  * snd_soc_put_volsw - single mixer put callback with range
  * @kcontrol: mixer control
-- 
2.45.2


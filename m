Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A927D81E6
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 13:36:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B775823;
	Thu, 26 Oct 2023 13:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B775823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698320216;
	bh=wNYMRIG5scyAdTJj4MaccPslwOpU48pDFon17ftDxSU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rF62WMaVjECbcmG4WMrg6cOKdjKoqXK8WUcED7PM4Ffb8tZ7zFbmLl5/eWS7ujaim
	 EbqSXSALm0qexISOmFp+114onjNaogBlFYOCWTzk5mSgahKJv4Q1OdYlg1AQAbs5lZ
	 56yzT6TygF/PrwfRJWdak2YLxHDBqKI4m0HEdFWE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04720F8019B; Thu, 26 Oct 2023 13:36:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D5BBF80165;
	Thu, 26 Oct 2023 13:36:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C2C3F8019B; Thu, 26 Oct 2023 13:35:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80EA5F8014B
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 13:35:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80EA5F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=M5pGUWZW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698320149; x=1729856149;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wNYMRIG5scyAdTJj4MaccPslwOpU48pDFon17ftDxSU=;
  b=M5pGUWZWf5zWGFTPmq5Fz/Ztu31Z/SHGNWhx2aM6JPERvvV51hUF/rj/
   ZVMfTAq2yhIGv3SjihIPtXwbyW6n7NXDvbB2WRC5WZW09jsZDB9xYPObc
   9LuMOLBbW7x7dFMJxNn0nRAnZySPxjHXLipPsB6h3EMjj6rVEekPoMQF0
   4lXNpyLwh+0pITE1UrWV6G4MS2j8Y3BwCyZ1ZLxPHxCPOkWF3MD+1JhR0
   BkHt1XBO8cIYtG0OyKcVOZSV3J3knp7/5g7vPPIi9tw0nv9quQywd+sCo
   QpmU2bMdUjfEE0+DfBlKC8PftEqPAvKwu8r7rkbSpbMGVL10S/I53ET6u
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="473760825"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200";
   d="scan'208";a="473760825"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 04:35:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200";
   d="scan'208";a="417432"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa002.jf.intel.com with ESMTP; 26 Oct 2023 04:35:05 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ASoC: dapm: Simplify widget clone
Date: Thu, 26 Oct 2023 13:35:49 +0200
Message-Id: <20231026113549.1897368-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EFN7G7IVE63O6VDAMSDOD5TBMYEUMD43
X-Message-ID-Hash: EFN7G7IVE63O6VDAMSDOD5TBMYEUMD43
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EFN7G7IVE63O6VDAMSDOD5TBMYEUMD43/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

New DAPM widgets are created based on a provided template. When cloning
the data, the name and stream name also need to be cloned. Currently the
data and the names are initialized in different places. Simplify the
code by having entire initialization in one place.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-dapm.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 4e2beda6f9bf..b0503bf050db 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -320,7 +320,8 @@ EXPORT_SYMBOL_GPL(dapm_mark_endpoints_dirty);
 
 /* create a new dapm widget */
 static inline struct snd_soc_dapm_widget *dapm_cnew_widget(
-	const struct snd_soc_dapm_widget *_widget)
+	const struct snd_soc_dapm_widget *_widget,
+	const char *prefix)
 {
 	struct snd_soc_dapm_widget *w;
 
@@ -328,13 +329,19 @@ static inline struct snd_soc_dapm_widget *dapm_cnew_widget(
 	if (!w)
 		return NULL;
 
-	/*
-	 * w->name is duplicated in caller, but w->sname isn't.
-	 * Duplicate it here if defined
-	 */
+	if (prefix)
+		w->name = kasprintf(GFP_KERNEL, "%s %s", prefix, _widget->name);
+	else
+		w->name = kstrdup_const(_widget->name, GFP_KERNEL);
+	if (!w->name) {
+		kfree(w);
+		return NULL;
+	}
+
 	if (_widget->sname) {
 		w->sname = kstrdup_const(_widget->sname, GFP_KERNEL);
 		if (!w->sname) {
+			kfree_const(w->name);
 			kfree(w);
 			return NULL;
 		}
@@ -3629,20 +3636,12 @@ snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 {
 	enum snd_soc_dapm_direction dir;
 	struct snd_soc_dapm_widget *w;
-	const char *prefix;
 	int ret = -ENOMEM;
 
-	if ((w = dapm_cnew_widget(widget)) == NULL)
+	w = dapm_cnew_widget(widget, soc_dapm_prefix(dapm));
+	if (!w)
 		goto cnew_failed;
 
-	prefix = soc_dapm_prefix(dapm);
-	if (prefix)
-		w->name = kasprintf(GFP_KERNEL, "%s %s", prefix, widget->name);
-	else
-		w->name = kstrdup_const(widget->name, GFP_KERNEL);
-	if (!w->name)
-		goto name_failed;
-
 	switch (w->id) {
 	case snd_soc_dapm_regulator_supply:
 		w->regulator = devm_regulator_get(dapm->dev, widget->name);
@@ -3767,7 +3766,6 @@ snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 	dev_err_probe(dapm->dev, ret, "ASoC: Failed to request %s\n",
 		      w->name);
 	kfree_const(w->name);
-name_failed:
 	kfree_const(w->sname);
 	kfree(w);
 cnew_failed:

base-commit: 3edc85e3bfcb411da6e48a38e8de578f9fd71340
-- 
2.34.1


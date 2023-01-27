Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8952967E925
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 16:13:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB791E95;
	Fri, 27 Jan 2023 16:12:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB791E95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674832381;
	bh=/ZoWQ+I5P6IxwXu7b2P7X88hVoPxXeJl+Ti79/e6frk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WdeCpWlh+4i4iIwEkhQe/93WdOf9nX5M3YueGaRyh+ZHpa9nrdiidJr/WsKLSMWSy
	 TdzLZl9yQgf9T2gl49z0VT/6gWkhMJiRjqA43hGa8fMGFNTLU99DyIxK/I5hIVuGwV
	 f73BookOa4d+ByQ9bbPHzuzgjYplK0/Ipr7i0ook=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3184AF80543;
	Fri, 27 Jan 2023 16:10:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB631F80552; Fri, 27 Jan 2023 16:10:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE4A6F801F7
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 16:10:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE4A6F801F7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AFG5izhv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674832222; x=1706368222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/ZoWQ+I5P6IxwXu7b2P7X88hVoPxXeJl+Ti79/e6frk=;
 b=AFG5izhvHDHGuEqUYinIIoRwd1F73ApR9UYqayb/QNYkm6b9qGPEtDUW
 gy/keigsgg+G8AaULxUTqV/GBg/lF5mSf6DgIf167wiBoHe/YlFSX+95n
 4jxthKFAHNjXNTJnnlHcV0RF8Z0l45vBCJF58wm+xRgTIPWah06mMoyAD
 98Zka/Pa5be4l2IgxTWd5BGHtxGtzLOysSAiv/a4EfdnxMODCZH/gkduy
 VCBItw+ZXWUVsMebFIKBsA1Dedj0gBQ9z1kQlPuW7rknSLGbq7zAboUnb
 yDUl/R3bgnSUwU+foxhaNsWkbXui5Ire9P560JaFtAG+UltL8Sn0yLRKr A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="324795819"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="324795819"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 07:10:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="908709013"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="908709013"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jan 2023 07:10:19 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 05/11] ASoC: topology: Rename remove_ handlers
Date: Sat, 28 Jan 2023 00:11:05 +0100
Message-Id: <20230127231111.937721-6-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
References: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Those are the only functions missing soc_tplg_ prefix, add it for
consistency.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 1fe4fa82fa2f..a952f7eaa646 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -354,7 +354,7 @@ static int soc_tplg_add_kcontrol(struct soc_tplg *tplg,
 }
 
 /* remove a mixer kcontrol */
-static void remove_mixer(struct snd_soc_component *comp,
+static void soc_tplg_remove_mixer(struct snd_soc_component *comp,
 	struct snd_soc_dobj *dobj, int pass)
 {
 	struct snd_card *card = comp->card->snd_card;
@@ -370,7 +370,7 @@ static void remove_mixer(struct snd_soc_component *comp,
 }
 
 /* remove an enum kcontrol */
-static void remove_enum(struct snd_soc_component *comp,
+static void soc_tplg_remove_enum(struct snd_soc_component *comp,
 	struct snd_soc_dobj *dobj, int pass)
 {
 	struct snd_card *card = comp->card->snd_card;
@@ -386,7 +386,7 @@ static void remove_enum(struct snd_soc_component *comp,
 }
 
 /* remove a byte kcontrol */
-static void remove_bytes(struct snd_soc_component *comp,
+static void soc_tplg_remove_bytes(struct snd_soc_component *comp,
 	struct snd_soc_dobj *dobj, int pass)
 {
 	struct snd_card *card = comp->card->snd_card;
@@ -402,7 +402,7 @@ static void remove_bytes(struct snd_soc_component *comp,
 }
 
 /* remove a route */
-static void remove_route(struct snd_soc_component *comp,
+static void soc_tplg_remove_route(struct snd_soc_component *comp,
 			 struct snd_soc_dobj *dobj, int pass)
 {
 	if (pass != SOC_TPLG_PASS_GRAPH)
@@ -415,7 +415,7 @@ static void remove_route(struct snd_soc_component *comp,
 }
 
 /* remove a widget and it's kcontrols - routes must be removed first */
-static void remove_widget(struct snd_soc_component *comp,
+static void soc_tplg_remove_widget(struct snd_soc_component *comp,
 	struct snd_soc_dobj *dobj, int pass)
 {
 	struct snd_card *card = comp->card->snd_card;
@@ -443,7 +443,7 @@ static void remove_widget(struct snd_soc_component *comp,
 }
 
 /* remove DAI configurations */
-static void remove_dai(struct snd_soc_component *comp,
+static void soc_tplg_remove_dai(struct snd_soc_component *comp,
 	struct snd_soc_dobj *dobj, int pass)
 {
 	struct snd_soc_dai_driver *dai_drv =
@@ -464,7 +464,7 @@ static void remove_dai(struct snd_soc_component *comp,
 }
 
 /* remove link configurations */
-static void remove_link(struct snd_soc_component *comp,
+static void soc_tplg_remove_link(struct snd_soc_component *comp,
 	struct snd_soc_dobj *dobj, int pass)
 {
 	struct snd_soc_dai_link *link =
@@ -492,7 +492,7 @@ static void remove_backend_link(struct snd_soc_component *comp,
 		dobj->ops->link_unload(comp, dobj);
 
 	/*
-	 * We don't free the link here as what remove_link() do since BE
+	 * We don't free the link here as what soc_tplg_remove_link() do since BE
 	 * links are not allocated by topology.
 	 * We however need to reset the dobj type to its initial values
 	 */
@@ -1492,7 +1492,7 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 	return 0;
 
 ready_err:
-	remove_widget(widget->dapm->component, &widget->dobj, SOC_TPLG_PASS_WIDGET);
+	soc_tplg_remove_widget(widget->dapm->component, &widget->dobj, SOC_TPLG_PASS_WIDGET);
 	snd_soc_dapm_free_widget(widget);
 hdr_err:
 	kfree(template.sname);
@@ -2627,25 +2627,25 @@ int snd_soc_tplg_component_remove(struct snd_soc_component *comp)
 
 			switch (dobj->type) {
 			case SND_SOC_DOBJ_MIXER:
-				remove_mixer(comp, dobj, pass);
+				soc_tplg_remove_mixer(comp, dobj, pass);
 				break;
 			case SND_SOC_DOBJ_ENUM:
-				remove_enum(comp, dobj, pass);
+				soc_tplg_remove_enum(comp, dobj, pass);
 				break;
 			case SND_SOC_DOBJ_BYTES:
-				remove_bytes(comp, dobj, pass);
+				soc_tplg_remove_bytes(comp, dobj, pass);
 				break;
 			case SND_SOC_DOBJ_GRAPH:
-				remove_route(comp, dobj, pass);
+				soc_tplg_remove_route(comp, dobj, pass);
 				break;
 			case SND_SOC_DOBJ_WIDGET:
-				remove_widget(comp, dobj, pass);
+				soc_tplg_remove_widget(comp, dobj, pass);
 				break;
 			case SND_SOC_DOBJ_PCM:
-				remove_dai(comp, dobj, pass);
+				soc_tplg_remove_dai(comp, dobj, pass);
 				break;
 			case SND_SOC_DOBJ_DAI_LINK:
-				remove_link(comp, dobj, pass);
+				soc_tplg_remove_link(comp, dobj, pass);
 				break;
 			case SND_SOC_DOBJ_BACKEND_LINK:
 				/*
-- 
2.25.1


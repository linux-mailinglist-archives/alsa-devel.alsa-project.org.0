Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF3067E92D
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 16:14:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA969E87;
	Fri, 27 Jan 2023 16:13:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA969E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674832470;
	bh=nD9stkrLrT5BglI11fXrao9wpCwGGGCwogO9XxndKZ4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=a+6SSdCr6LaozrhlS/RJ4enFX2Y6WjBq9k9MFA/LL80qou4pXV1sRhy9sQEBryaAz
	 Sdn9xl/ClQbKbCP6N405g/Ga79+XFPJB/kQ58HbOcEQq10ixIqCrxr7It2l3qyg6Gz
	 2n7AvcdvohgvyPt5LK32poXSxQXTq4xv4bkETHXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BFF9F805AF;
	Fri, 27 Jan 2023 16:10:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6636BF8057C; Fri, 27 Jan 2023 16:10:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D34B0F8057C
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 16:10:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D34B0F8057C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iutlgIm+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674832234; x=1706368234;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nD9stkrLrT5BglI11fXrao9wpCwGGGCwogO9XxndKZ4=;
 b=iutlgIm+k1/X+WhRkzGoT21wDZPPP8Jc22zFsnNNuL1kd9CIMFq94+bi
 mtHeU95uHZcDpZ6Sgv8Kruy/sa/lSU1nrbjRsE6buWrw7zN7UCf6imRrA
 t2+GkD66bGumSTooIs6nVNQ0lglODbkNJPwRMUCVn9JkVKk48I9C0TmZT
 loyfDGhOG+fn0NhyRl8EatsFFQ3I0YKLjdK4lIBbdryfcTmRpX0PKGq0Y
 ErF2EeNJx9r86JGb6RgfnKGk4/bZ9gUIShJtQ4ZYwnzrVKSrwmKt8nfXG
 8mJPVmsyvfoiD/iFrpnyYMBqOm5DyIcauRjfP+A2zwI/vkY8SiR0IXPcQ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="324795867"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="324795867"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 07:10:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="908709038"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="908709038"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jan 2023 07:10:29 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 10/11] ASoC: topology: Unify kcontrol removal code
Date: Sat, 28 Jan 2023 00:11:10 +0100
Message-Id: <20230127231111.937721-11-amadeuszx.slawinski@linux.intel.com>
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

Functions removing bytes, enum and mixer kcontrols are identical. Unify
them under one function and use it to free associated kcontrols.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 48 +++++-----------------------------------
 1 file changed, 6 insertions(+), 42 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 6689cf44464c..9f527d9baf1c 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -350,41 +350,9 @@ static int soc_tplg_add_kcontrol(struct soc_tplg *tplg,
 				tplg->dev, k, comp->name_prefix, comp, kcontrol);
 }
 
-/* remove a mixer kcontrol */
-static void soc_tplg_remove_mixer(struct snd_soc_component *comp,
-	struct snd_soc_dobj *dobj, int pass)
-{
-	struct snd_card *card = comp->card->snd_card;
-
-	if (pass != SOC_TPLG_PASS_CONTROL)
-		return;
-
-	if (dobj->ops && dobj->ops->control_unload)
-		dobj->ops->control_unload(comp, dobj);
-
-	snd_ctl_remove(card, dobj->control.kcontrol);
-	list_del(&dobj->list);
-}
-
-/* remove an enum kcontrol */
-static void soc_tplg_remove_enum(struct snd_soc_component *comp,
-	struct snd_soc_dobj *dobj, int pass)
-{
-	struct snd_card *card = comp->card->snd_card;
-
-	if (pass != SOC_TPLG_PASS_CONTROL)
-		return;
-
-	if (dobj->ops && dobj->ops->control_unload)
-		dobj->ops->control_unload(comp, dobj);
-
-	snd_ctl_remove(card, dobj->control.kcontrol);
-	list_del(&dobj->list);
-}
-
-/* remove a byte kcontrol */
-static void soc_tplg_remove_bytes(struct snd_soc_component *comp,
-	struct snd_soc_dobj *dobj, int pass)
+/* remove kcontrol */
+static void soc_tplg_remove_kcontrol(struct snd_soc_component *comp, struct snd_soc_dobj *dobj,
+				     int pass)
 {
 	struct snd_card *card = comp->card->snd_card;
 
@@ -2618,14 +2586,10 @@ int snd_soc_tplg_component_remove(struct snd_soc_component *comp)
 			list) {
 
 			switch (dobj->type) {
-			case SND_SOC_DOBJ_MIXER:
-				soc_tplg_remove_mixer(comp, dobj, pass);
-				break;
-			case SND_SOC_DOBJ_ENUM:
-				soc_tplg_remove_enum(comp, dobj, pass);
-				break;
 			case SND_SOC_DOBJ_BYTES:
-				soc_tplg_remove_bytes(comp, dobj, pass);
+			case SND_SOC_DOBJ_ENUM:
+			case SND_SOC_DOBJ_MIXER:
+				soc_tplg_remove_kcontrol(comp, dobj, pass);
 				break;
 			case SND_SOC_DOBJ_GRAPH:
 				soc_tplg_remove_route(comp, dobj, pass);
-- 
2.25.1


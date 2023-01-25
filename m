Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BC167B1FA
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 12:49:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B06F1FE;
	Wed, 25 Jan 2023 12:48:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B06F1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674647385;
	bh=aEoWH4RVvF3dZqkOJ77RsIDTVgB7VipNGAEIa5cleMM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ag9qTUfpksq92aOg+jIpTtSun3l2ol9aqLme66Mh9qZiy6X48aKKkf7eFJO6ZrSPR
	 d3u104kxX1XuNaAmi35kaGy1vi+QlovAOaOK2jY3FQvR0a1Mc6wdFjwKo0jS7+BlqI
	 TYbETXkGVZU7TViJqusM6A+0UixgycuI2AbPA5Dc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6C26F805A8;
	Wed, 25 Jan 2023 12:46:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94BE9F80553; Wed, 25 Jan 2023 12:46:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3ACEBF80548
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 12:46:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ACEBF80548
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RC1cpzYQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674647184; x=1706183184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aEoWH4RVvF3dZqkOJ77RsIDTVgB7VipNGAEIa5cleMM=;
 b=RC1cpzYQdUZdmuMX8tPBunKfDrlPv59Cp02r5vDOQh3ChU6MwUcsPoQr
 O5BCW5ogD0ZFYymRuJaW/oRC1gVQHC5e9cT/rucJgysZOoOYeRZp4O9fe
 4+XVv4a8Q86xh+lL2bU9m8+buUdHppdPEoQqskDe5OiJ7ssqzURaEbO08
 69fTtTvfj0merYbM5KuYIvmYSFfIzQm05FFEENSt/V4KMYlaLAkD47T2W
 WRB9sUHQ7LZF7ZQaX70aRSV90/JSHs2FLkLyhKmKMXMjV+PowSjcUgyp2
 2xWrjPr417JAjvL7Fmf6D9bIijPxTgwMWbHP1hnhVTEybs/53icoHVR1S w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="324234251"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="324234251"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 03:46:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="612394060"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="612394060"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga003.jf.intel.com with ESMTP; 25 Jan 2023 03:46:19 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 11/11] ASoC: topology: Unify kcontrol removal code
Date: Wed, 25 Jan 2023 20:46:49 +0100
Message-Id: <20230125194649.3485731-12-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125194649.3485731-1-amadeuszx.slawinski@linux.intel.com>
References: <20230125194649.3485731-1-amadeuszx.slawinski@linux.intel.com>
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
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Functions removing bytes, enum and mixer kcontrols are identical. Unify
them under one function and use it to free associated kcontrols.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 48 +++++-----------------------------------
 1 file changed, 6 insertions(+), 42 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index eb49037d86ae..e66b0d9e387a 100644
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
-	if (dobj->unload)
-		dobj->unload(comp, dobj);
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
-	if (dobj->unload)
-		dobj->unload(comp, dobj);
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
 
@@ -2626,14 +2594,10 @@ int snd_soc_tplg_component_remove(struct snd_soc_component *comp)
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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E6C67E923
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 16:12:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBB52DF2;
	Fri, 27 Jan 2023 16:12:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBB52DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674832372;
	bh=NJzb4TQp2I8milYc4b4QcVDRAaAtQxF+qPtBo22cKzc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ojrpjo3HelUA3xdvl4MzYdOjyxka2Z+43emuwgJSfnuJNOqJ4t5KrrKsy/aVvrlWh
	 c5LvCkPqpODqee/ioTomdQoW32r3tIUY0XA80AE/v+OUtrWPRw/IdWQPleGKWPrYD1
	 nXKOGowNY+9x1AG9gHVIDcdtN3Xz6ik2MbbQZPSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 725A1F8055A;
	Fri, 27 Jan 2023 16:10:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 020B5F80552; Fri, 27 Jan 2023 16:10:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AAC2F80272
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 16:10:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AAC2F80272
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jIAjGFmQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674832219; x=1706368219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NJzb4TQp2I8milYc4b4QcVDRAaAtQxF+qPtBo22cKzc=;
 b=jIAjGFmQaLSIgh16ODrLgS1gtCRYxj9vNyeWbApUkQwHarf3qjhRKsLo
 MtjeW2EQ+PTvB72GYOIHKuQfUY88o5spncP+fOf+uRApQyYcAlymNss63
 WDp3yD4EIMjtuVl9ywhoj63Rs28/1FiBDCEm5xQIL+RlOXnDzFSV3mpiE
 jNVTdCOOEyOffvsi2VfGYNGJJK5KpIgEb+731bY8Tc9Y7kogpnCLlIjb6
 yhdIjnUcbSid1KzmckWHelgTd+fIC5p1Yz6zeBCy9uSizwfv64npWhA6C
 QK17zRzKIl+U2hJQgvrCBDdQIvYXyfo0R9JyHmzg3PNsxN6/ylk6QdAkJ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="324795788"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="324795788"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 07:10:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="908708999"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="908708999"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jan 2023 07:10:15 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 03/11] ASoC: topology: Fix typo in functions name
Date: Sat, 28 Jan 2023 00:11:03 +0100
Message-Id: <20230127231111.937721-4-amadeuszx.slawinski@linux.intel.com>
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

Topology is being abbreviated to "tplg", not "tplc", however, few
functions have typo in name, fix it.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index e9138ec4df8f..b9c29effeb60 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -185,7 +185,7 @@ static const struct soc_tplg_map dapm_map[] = {
 	{SND_SOC_TPLG_DAPM_DECODER, snd_soc_dapm_decoder},
 };
 
-static int tplc_chan_get_reg(struct soc_tplg *tplg,
+static int tplg_chan_get_reg(struct soc_tplg *tplg,
 	struct snd_soc_tplg_channel *chan, int map)
 {
 	int i;
@@ -198,7 +198,7 @@ static int tplc_chan_get_reg(struct soc_tplg *tplg,
 	return -EINVAL;
 }
 
-static int tplc_chan_get_shift(struct soc_tplg *tplg,
+static int tplg_chan_get_shift(struct soc_tplg *tplg,
 	struct snd_soc_tplg_channel *chan, int map)
 {
 	int i;
@@ -779,10 +779,10 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, size_t size)
 	kc.access = le32_to_cpu(mc->hdr.access);
 
 	/* we only support FL/FR channel mapping atm */
-	sm->reg = tplc_chan_get_reg(tplg, mc->channel, SNDRV_CHMAP_FL);
-	sm->rreg = tplc_chan_get_reg(tplg, mc->channel, SNDRV_CHMAP_FR);
-	sm->shift = tplc_chan_get_shift(tplg, mc->channel, SNDRV_CHMAP_FL);
-	sm->rshift = tplc_chan_get_shift(tplg, mc->channel, SNDRV_CHMAP_FR);
+	sm->reg = tplg_chan_get_reg(tplg, mc->channel, SNDRV_CHMAP_FL);
+	sm->rreg = tplg_chan_get_reg(tplg, mc->channel, SNDRV_CHMAP_FR);
+	sm->shift = tplg_chan_get_shift(tplg, mc->channel, SNDRV_CHMAP_FL);
+	sm->rshift = tplg_chan_get_shift(tplg, mc->channel, SNDRV_CHMAP_FR);
 
 	sm->max = le32_to_cpu(mc->max);
 	sm->min = le32_to_cpu(mc->min);
@@ -926,10 +926,10 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, size_t size)
 	kc.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	kc.access = le32_to_cpu(ec->hdr.access);
 
-	se->reg = tplc_chan_get_reg(tplg, ec->channel, SNDRV_CHMAP_FL);
-	se->shift_l = tplc_chan_get_shift(tplg, ec->channel,
+	se->reg = tplg_chan_get_reg(tplg, ec->channel, SNDRV_CHMAP_FL);
+	se->shift_l = tplg_chan_get_shift(tplg, ec->channel,
 		SNDRV_CHMAP_FL);
-	se->shift_r = tplc_chan_get_shift(tplg, ec->channel,
+	se->shift_r = tplg_chan_get_shift(tplg, ec->channel,
 		SNDRV_CHMAP_FL);
 
 	se->mask = le32_to_cpu(ec->mask);
@@ -1160,13 +1160,13 @@ static int soc_tplg_dapm_widget_dmixer_create(struct soc_tplg *tplg, struct snd_
 	kc->access = le32_to_cpu(mc->hdr.access);
 
 	/* we only support FL/FR channel mapping atm */
-	sm->reg = tplc_chan_get_reg(tplg, mc->channel,
+	sm->reg = tplg_chan_get_reg(tplg, mc->channel,
 				    SNDRV_CHMAP_FL);
-	sm->rreg = tplc_chan_get_reg(tplg, mc->channel,
+	sm->rreg = tplg_chan_get_reg(tplg, mc->channel,
 				     SNDRV_CHMAP_FR);
-	sm->shift = tplc_chan_get_shift(tplg, mc->channel,
+	sm->shift = tplg_chan_get_shift(tplg, mc->channel,
 					SNDRV_CHMAP_FL);
-	sm->rshift = tplc_chan_get_shift(tplg, mc->channel,
+	sm->rshift = tplg_chan_get_shift(tplg, mc->channel,
 					 SNDRV_CHMAP_FR);
 
 	sm->max = le32_to_cpu(mc->max);
@@ -1232,10 +1232,10 @@ static int soc_tplg_dapm_widget_denum_create(struct soc_tplg *tplg, struct snd_k
 	kc->access = le32_to_cpu(ec->hdr.access);
 
 	/* we only support FL/FR channel mapping atm */
-	se->reg = tplc_chan_get_reg(tplg, ec->channel, SNDRV_CHMAP_FL);
-	se->shift_l = tplc_chan_get_shift(tplg, ec->channel,
+	se->reg = tplg_chan_get_reg(tplg, ec->channel, SNDRV_CHMAP_FL);
+	se->shift_l = tplg_chan_get_shift(tplg, ec->channel,
 					  SNDRV_CHMAP_FL);
-	se->shift_r = tplc_chan_get_shift(tplg, ec->channel,
+	se->shift_r = tplg_chan_get_shift(tplg, ec->channel,
 					  SNDRV_CHMAP_FR);
 
 	se->items = le32_to_cpu(ec->items);
-- 
2.25.1


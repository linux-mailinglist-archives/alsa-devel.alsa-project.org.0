Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D0467B1FE
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 12:50:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A032DE83;
	Wed, 25 Jan 2023 12:49:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A032DE83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674647430;
	bh=ounQ4d54jQLZpZovB939hajnZgQCnR0FXpbK7Grq9kI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=l02cbxGQrzNGDG7Fvk3Nbbj5N7NWeffhS2KctLeA5D+QeDJ7ejdlXUlN4rhDmcSvT
	 0siTlFXTQlWGBRArIdssXMwK5lqE82qPbsXq1yUEFTEQV1E20uUZxs3ucjgOyr/Y0i
	 vuzSJPzf9i93scdx0nJ6AcIFUvgMHp9ryudUBII4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26556F80539;
	Wed, 25 Jan 2023 12:47:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A7E1F804FD; Wed, 25 Jan 2023 12:46:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93B67F80424
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 12:46:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93B67F80424
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cPNx3rC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674647168; x=1706183168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ounQ4d54jQLZpZovB939hajnZgQCnR0FXpbK7Grq9kI=;
 b=cPNx3rC6NdJV8ZroFV9B8tV9A+b02TDkD06mKF9BdpL2Alf8tzpRwsbM
 IKQP2gMjdG7YGYQmM926r5QxS6wVdDp5Z14ZqZgYsG8IT2vkw412Kasok
 rtCxZ5h2CbLxlxjS00UIkTYOYGC4KoyCXlSIFlqgNroARZGktSsNQ30Uq
 DW3Go9GSiiHd1K/rOn7bLhXKTNum4kLrJd95o5hhdfkB2FjeMueCXHPCm
 tjjmuPSW2FkMYWWKRROU2Yu9Awubch0MuKtkzpznPdvgbnTR1IdaQItFG
 z6AcIZe3qFW+5w29whKWSsur1jO4Esto/4CfbqzUxoLMH9mLVH5bn2YLQ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="324234185"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="324234185"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 03:46:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="612393968"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="612393968"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga003.jf.intel.com with ESMTP; 25 Jan 2023 03:46:02 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 03/11] ASoC: topology: Fix typo in functions name
Date: Wed, 25 Jan 2023 20:46:41 +0100
Message-Id: <20230125194649.3485731-4-amadeuszx.slawinski@linux.intel.com>
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

Topology is being abbreviated to "tplg", not "tplc", however, few
functions have typo in name, fix it.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA3E4D0622
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 19:16:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F2C0177C;
	Mon,  7 Mar 2022 19:15:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F2C0177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646676968;
	bh=NTLg35mDE2YZqrmU9AKIjvw1s1/TEiT+xyq1YULuL7k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Am9xdOFMSEgARriQRjaPqXH9dQ/WmlVKnGUX9Ly38LA56oKRAEjaCAJLQwLFuwoMc
	 96fh2fy3+nVWDPGIi3xIAD/iMugHaupozZ6IPCg1PCBssrJXFEgfk3+pKch4POrwht
	 h4mHjJuFEJVOgn6U8kwewq8qa0sd/4O30iKMkQGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ADBBF80563;
	Mon,  7 Mar 2022 19:11:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3938BF80132; Mon,  7 Mar 2022 19:11:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CADBF8051A
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 19:11:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CADBF8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WyTTqF15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646676696; x=1678212696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NTLg35mDE2YZqrmU9AKIjvw1s1/TEiT+xyq1YULuL7k=;
 b=WyTTqF15jv1b9YtCilZ8FHphbEq2MiHKP3fJt6ywjESoUolkPxSqFc7C
 43g1sgkURasUiLL3V610m/XwIVL2hGQsNp4CjQjYDpbUWWoJLmvgLUjDu
 lut5zb5bP46XXieqr1znUzFLYS3FQxbVWL8hOyuQP6YD0WMoEflqrJMpd
 m4q69hcHodqmBeF7ZCD7H7KoJrC4muvou0Heg0shuy3E2PY44UeRY3X3O
 qKZPrazyWbSwYezjlMnkoZzQlhFyhWbO3aEiQJ9n3paUEv7BwMGMuiYrO
 dBJyLNL7SeQH2EnEjzqiKm/mkQIoyPaslTI4AtKe/cPfiqadcg0QB4Lqs g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254401330"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="254401330"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:28 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="495146679"
Received: from echun1-mobl.amr.corp.intel.com (HELO rsridh2-mobl1.localdomain)
 ([10.251.130.219])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:27 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/18] ASoC: SOF: make struct snd_sof_widget IPC agnostic
Date: Mon,  7 Mar 2022 10:11:04 -0800
Message-Id: <20220307181111.49392-12-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
References: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Parse the UUID token and save it in the new uuid field in struct
snd_sof_widget. struct sof_ipc_comp_ext is no longer needed. So remove
it too.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/topology.h |  5 -----
 sound/soc/sof/sof-audio.h    |  3 +--
 sound/soc/sof/topology.c     | 20 ++++++++++----------
 3 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/include/sound/sof/topology.h b/include/sound/sof/topology.h
index adee6afd1490..33bd9eaffd50 100644
--- a/include/sound/sof/topology.h
+++ b/include/sound/sof/topology.h
@@ -303,9 +303,4 @@ enum sof_event_types {
 	SOF_KEYWORD_DETECT_DAPM_EVENT,
 };
 
-/* extended data struct for UUID components */
-struct sof_ipc_comp_ext {
-	uint8_t uuid[SOF_UUID_SIZE];
-}  __packed;
-
 #endif
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index a8eeffc12b24..5c10df500ffb 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -110,8 +110,7 @@ struct snd_sof_widget {
 	struct list_head list;	/* list in sdev widget list */
 	struct snd_sof_widget *pipe_widget;
 
-	/* extended data for UUID components */
-	struct sof_ipc_comp_ext comp_ext;
+	u8 uuid[SOF_UUID_SIZE];
 
 	void *private;		/* core does not touch this */
 };
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 41927e99ace2..45bac1ac9fdd 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -743,7 +743,7 @@ static const struct sof_topology_token core_tokens[] = {
 static const struct sof_topology_token comp_ext_tokens[] = {
 	{SOF_TKN_COMP_UUID,
 		SND_SOC_TPLG_TUPLE_TYPE_UUID, get_token_uuid,
-		offsetof(struct sof_ipc_comp_ext, uuid)},
+		offsetof(struct snd_sof_widget, uuid)},
 };
 
 /*
@@ -1419,16 +1419,17 @@ static int sof_connect_dai_widget(struct snd_soc_component *scomp,
  *
  * Return: The pointer to the new allocated component, NULL if failed.
  */
-static struct sof_ipc_comp *sof_comp_alloc(struct snd_sof_widget *swidget,
-					   size_t *ipc_size, int index)
+static struct sof_ipc_comp *sof_comp_alloc(struct snd_sof_widget *swidget, size_t *ipc_size,
+					   int index)
 {
 	u8 nil_uuid[SOF_UUID_SIZE] = {0};
 	struct sof_ipc_comp *comp;
 	size_t total_size = *ipc_size;
+	size_t ext_size = sizeof(swidget->uuid);
 
 	/* only non-zero UUID is valid */
-	if (memcmp(&swidget->comp_ext, nil_uuid, SOF_UUID_SIZE))
-		total_size += sizeof(swidget->comp_ext);
+	if (memcmp(swidget->uuid, nil_uuid, SOF_UUID_SIZE))
+		total_size += ext_size;
 
 	comp = kzalloc(total_size, GFP_KERNEL);
 	if (!comp)
@@ -1444,8 +1445,8 @@ static struct sof_ipc_comp *sof_comp_alloc(struct snd_sof_widget *swidget,
 	/* handle the extended data if needed */
 	if (total_size > *ipc_size) {
 		/* append extended data to the end of the component */
-		memcpy((u8 *)comp + *ipc_size, &swidget->comp_ext, sizeof(swidget->comp_ext));
-		comp->ext_data_length = sizeof(swidget->comp_ext);
+		memcpy((u8 *)comp + *ipc_size, swidget->uuid, ext_size);
+		comp->ext_data_length = ext_size;
 	}
 
 	/* update ipc_size and return */
@@ -2276,9 +2277,8 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 
 	swidget->core = comp.core;
 
-	ret = sof_parse_tokens(scomp, &swidget->comp_ext, comp_ext_tokens,
-			       ARRAY_SIZE(comp_ext_tokens), tw->priv.array,
-			       le32_to_cpu(tw->priv.size));
+	ret = sof_parse_tokens(scomp, swidget, comp_ext_tokens, ARRAY_SIZE(comp_ext_tokens),
+			       tw->priv.array, le32_to_cpu(tw->priv.size));
 	if (ret != 0) {
 		dev_err(scomp->dev, "error: parsing comp_ext_tokens failed %d\n",
 			ret);
-- 
2.25.1


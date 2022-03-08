Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DF24D1DC0
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 17:49:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEC501833;
	Tue,  8 Mar 2022 17:49:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEC501833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646758195;
	bh=qpTry2xtJme7DtNAhhYtM85udfZjqGT4pX9G4Qusr+c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g/lnI9UccU+cnrZ4d5BOD9lalxODG46Sanom1GRGyf+lMyWqbylrRj6ppfwPW0vId
	 McPUsX5N6pOHnNCI2CZuL4ayI6Ncb7AUG7dbchMGheF/WUJ2EstlKLzNb1kPQaXkH1
	 XuT0X61Vi4sazlprEN0c2bEi4NfskITZ2433PN48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CED4F805AE;
	Tue,  8 Mar 2022 17:44:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8431F80544; Tue,  8 Mar 2022 17:44:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56EFFF800D2
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 17:44:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56EFFF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ox/ozRGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646757857; x=1678293857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qpTry2xtJme7DtNAhhYtM85udfZjqGT4pX9G4Qusr+c=;
 b=Ox/ozRGk8NclTogwJUmbn/IAApWYJIWxqh4JvGcyCgf2220jKnqkdtBn
 Kxjtk8kMSo+8zeTUJA8TOGEXd44mqTeudQ6faDYF6BtUJF+HQGqQcZpg3
 htLC3DupH6LpbYcwWOjc3ev0iSKeMuM28uRP+d3+p8CXLmH1myF/UMBGL
 BncW4TmOWoFb8nYgjMxhCyDs6kUZvt6mg5xvooyiPgSL/dIofP0btKmC7
 t9NRlB4Kc/PEfM8/FJPEflP/b6FbFQduewJpcoVNKEiz6fZVDXfD0Lc1T
 Oj3McpOoaHuaat4pgmlEIbXD5Q6rUAPikfK6BN+nC0mrdgkPVKoRk9Mw5 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252307237"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252307237"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:57 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="537633262"
Received: from bustam3x-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.251.130.225])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:56 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 11/18] ASoC: SOF: make struct snd_sof_widget IPC agnostic
Date: Tue,  8 Mar 2022 08:43:37 -0800
Message-Id: <20220308164344.577647-12-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
References: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
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
 include/sound/sof/topology.h |  8 --------
 sound/soc/sof/sof-audio.h    |  3 +--
 sound/soc/sof/topology.c     | 21 ++++++++++-----------
 3 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/include/sound/sof/topology.h b/include/sound/sof/topology.h
index adee6afd1490..88560281d420 100644
--- a/include/sound/sof/topology.h
+++ b/include/sound/sof/topology.h
@@ -87,9 +87,6 @@ struct sof_ipc_comp {
  */
 #define SOF_BUF_UNDERRUN_PERMITTED	BIT(1)
 
-/* the UUID size in bytes, shared between FW and host */
-#define SOF_UUID_SIZE	16
-
 /* create new component buffer - SOF_IPC_TPLG_BUFFER_NEW */
 struct sof_ipc_buffer {
 	struct sof_ipc_comp comp;
@@ -303,9 +300,4 @@ enum sof_event_types {
 	SOF_KEYWORD_DETECT_DAPM_EVENT,
 };
 
-/* extended data struct for UUID components */
-struct sof_ipc_comp_ext {
-	uint8_t uuid[SOF_UUID_SIZE];
-}  __packed;
-
 #endif
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index a8eeffc12b24..10330d826d40 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -110,8 +110,7 @@ struct snd_sof_widget {
 	struct list_head list;	/* list in sdev widget list */
 	struct snd_sof_widget *pipe_widget;
 
-	/* extended data for UUID components */
-	struct sof_ipc_comp_ext comp_ext;
+	const guid_t uuid;
 
 	void *private;		/* core does not touch this */
 };
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 41927e99ace2..111ff0f77be4 100644
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
@@ -1419,16 +1419,16 @@ static int sof_connect_dai_widget(struct snd_soc_component *scomp,
  *
  * Return: The pointer to the new allocated component, NULL if failed.
  */
-static struct sof_ipc_comp *sof_comp_alloc(struct snd_sof_widget *swidget,
-					   size_t *ipc_size, int index)
+static struct sof_ipc_comp *sof_comp_alloc(struct snd_sof_widget *swidget, size_t *ipc_size,
+					   int index)
 {
-	u8 nil_uuid[SOF_UUID_SIZE] = {0};
 	struct sof_ipc_comp *comp;
 	size_t total_size = *ipc_size;
+	size_t ext_size = sizeof(swidget->uuid);
 
 	/* only non-zero UUID is valid */
-	if (memcmp(&swidget->comp_ext, nil_uuid, SOF_UUID_SIZE))
-		total_size += sizeof(swidget->comp_ext);
+	if (!guid_is_null(&swidget->uuid))
+		total_size += ext_size;
 
 	comp = kzalloc(total_size, GFP_KERNEL);
 	if (!comp)
@@ -1444,8 +1444,8 @@ static struct sof_ipc_comp *sof_comp_alloc(struct snd_sof_widget *swidget,
 	/* handle the extended data if needed */
 	if (total_size > *ipc_size) {
 		/* append extended data to the end of the component */
-		memcpy((u8 *)comp + *ipc_size, &swidget->comp_ext, sizeof(swidget->comp_ext));
-		comp->ext_data_length = sizeof(swidget->comp_ext);
+		memcpy((u8 *)comp + *ipc_size, &swidget->uuid, ext_size);
+		comp->ext_data_length = ext_size;
 	}
 
 	/* update ipc_size and return */
@@ -2276,9 +2276,8 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 
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


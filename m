Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FD64E9D51
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 19:19:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4D7818EC;
	Mon, 28 Mar 2022 19:18:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4D7818EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648487984;
	bh=cVjtjuhRTk2N7rLFzIbDmQgmbSBCAU+vFt7ouA5INLU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N0U0zuxt0FpDrSKbFQvGHYfXysUw0kHxtOsos3eSYNcwP5ZFJduvBHXfO6uwqOMpA
	 O1Cew2SoZ/3jJA9rt8fE0WBold7i38pmJClHp8zGKVL1+W5R0JZtq/O+K6REGzxx7k
	 RU+b9rm7lxMJzBICpN8DWOHfUDaB265MnY0O+6+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1807CF8053E;
	Mon, 28 Mar 2022 19:16:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 812DAF8052F; Mon, 28 Mar 2022 19:16:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F6EFF8050F
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 19:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F6EFF8050F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ndMJgeFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648487781; x=1680023781;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cVjtjuhRTk2N7rLFzIbDmQgmbSBCAU+vFt7ouA5INLU=;
 b=ndMJgeFzNoSRGZuKeUQdnonNMU+SacBvlaE93DGBQMDXhCZin3TVdc/U
 Pdsq3yxpKmN5A9FkHUtnFXJ9t/KgGOT1Gz791ZJt5GYs41FumdAaNysMu
 5sr/6NhqAZxUmqxy8RcxRg7sezW1XYUBL7tGtJtoqir0LNvN6BJ2WkaJc
 saiVQeU/Xv3NtO2ku2yvagjPx5EF2f39GqjYtRVqOFoDe9BoSg08IN8Sb
 20scPbq7Ko6SBim3vZP6wuw4mW5uARw9IjO0934P0C/zAgekrgH+SZ6eU
 ubcrujiKbWNgZc5FxZkV2C7WSbAb9q6yNeEEu0AwsEr1oWcff9g4sL7xA w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="345494515"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="345494515"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 10:14:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="649141518"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2022 10:14:07 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 08/14] ASoC: Intel: avs: Support link_mask formatted string
Date: Mon, 28 Mar 2022 19:24:04 +0200
Message-Id: <20220328172410.761309-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220328172410.761309-1-cezary.rojewski@intel.com>
References: <20220328172410.761309-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

Allow topology to specify formatted strings so machine board's
predefined ->link_mask can be used to specify SSP port number
automatically.

This is done to help reduce the amount of topology files as many I2S
configurations contain codec of the same type with little to no
differences in number of scenarios supported - the only difference being
the port number codec is connected to.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/topology.c | 59 ++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 739669153f6d..d3fd5e145ee1 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -372,6 +372,26 @@ parse_audio_format_bitfield(struct snd_soc_component *comp, void *elem, void *ob
 	return 0;
 }
 
+static int parse_link_formatted_string(struct snd_soc_component *comp, void *elem,
+				       void *object, u32 offset)
+{
+	struct snd_soc_tplg_vendor_string_elem *tuple = elem;
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(comp->card->dev);
+	char *val = (char *)((u8 *)object + offset);
+
+	/*
+	 * Dynamic naming - string formats, e.g.: ssp%d - supported only for
+	 * topologies describing single device e.g.: an I2S codec on SSP0.
+	 */
+	if (hweight_long(mach->link_mask) != 1)
+		return avs_parse_string_token(comp, elem, object, offset);
+
+	snprintf(val, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, tuple->string,
+		 __ffs(mach->link_mask));
+
+	return 0;
+}
+
 static int
 parse_dictionary_header(struct snd_soc_component *comp,
 			struct snd_soc_tplg_vendor_array *tuples,
@@ -928,7 +948,7 @@ static const struct avs_tplg_token_parser binding_parsers[] = {
 		.token = AVS_TKN_BINDING_TARGET_TPLG_NAME_STRING,
 		.type = SND_SOC_TPLG_TUPLE_TYPE_STRING,
 		.offset = offsetof(struct avs_tplg_binding, target_tplg_name),
-		.parse = avs_parse_string_token,
+		.parse = parse_link_formatted_string,
 	},
 	{
 		.token = AVS_TKN_BINDING_TARGET_PATH_TMPL_ID_U32,
@@ -1323,6 +1343,31 @@ avs_tplg_path_template_create(struct snd_soc_component *comp, struct avs_tplg *o
 	return template;
 }
 
+static int avs_route_load(struct snd_soc_component *comp, int index,
+			  struct snd_soc_dapm_route *route)
+{
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(comp->card->dev);
+	size_t len = SNDRV_CTL_ELEM_ID_NAME_MAXLEN;
+	char buf[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+	u32 port;
+
+	/* See parse_link_formatted_string() for dynamic naming when(s). */
+	if (hweight_long(mach->link_mask) == 1) {
+		port = __ffs(mach->link_mask);
+
+		snprintf(buf, len, route->source, port);
+		strncpy((char *)route->source, buf, len);
+		snprintf(buf, len, route->sink, port);
+		strncpy((char *)route->sink, buf, len);
+		if (route->control) {
+			snprintf(buf, len, route->control, port);
+			strncpy((char *)route->control, buf, len);
+		}
+	}
+
+	return 0;
+}
+
 static int avs_widget_load(struct snd_soc_component *comp, int index,
 			   struct snd_soc_dapm_widget *w,
 			   struct snd_soc_tplg_dapm_widget *dw)
@@ -1338,6 +1383,15 @@ static int avs_widget_load(struct snd_soc_component *comp, int index,
 	tplg = acomp->tplg;
 	mach = dev_get_platdata(comp->card->dev);
 
+	/* See parse_link_formatted_string() for dynamic naming when(s). */
+	if (hweight_long(mach->link_mask) == 1) {
+		kfree(w->name);
+		/* w->name is freed later by soc_tplg_dapm_widget_create() */
+		w->name = kasprintf(GFP_KERNEL, dw->name, __ffs(mach->link_mask));
+		if (!w->name)
+			return -ENOMEM;
+	}
+
 	template = avs_tplg_path_template_create(comp, tplg, dw->priv.array,
 						 le32_to_cpu(dw->priv.size));
 	if (IS_ERR(template)) {
@@ -1380,7 +1434,7 @@ static const struct avs_tplg_token_parser manifest_parsers[] = {
 		.token = AVS_TKN_MANIFEST_NAME_STRING,
 		.type = SND_SOC_TPLG_TUPLE_TYPE_STRING,
 		.offset = offsetof(struct avs_tplg, name),
-		.parse = avs_parse_string_token,
+		.parse = parse_link_formatted_string,
 	},
 	{
 		.token = AVS_TKN_MANIFEST_VERSION_U32,
@@ -1498,6 +1552,7 @@ static int avs_manifest(struct snd_soc_component *comp, int index,
 }
 
 static struct snd_soc_tplg_ops avs_tplg_ops = {
+	.dapm_route_load	= avs_route_load,
 	.widget_load		= avs_widget_load,
 	.dai_load		= avs_dai_load,
 	.link_load		= avs_link_load,
-- 
2.25.1


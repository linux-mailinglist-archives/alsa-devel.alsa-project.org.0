Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B7D4EDACB
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 15:45:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0BCF1A4C;
	Thu, 31 Mar 2022 15:45:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0BCF1A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648734351;
	bh=cVjtjuhRTk2N7rLFzIbDmQgmbSBCAU+vFt7ouA5INLU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=idud+cAku2/dQqz4sAYuvCeeD37ooN6DlSdoXFFa9a0t8B6QNqXC+whc+eQ624M+p
	 MWvpL7NdYwsybAhcCdudyQJtE3xgwExXb+Tnp9Ab+XBWO4gG0asLh7oVf2zlrwJ//v
	 a+wxAHN8XFJCJ8ggptoeDZAUepELFOdDClv1/HME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 835E9F8051A;
	Thu, 31 Mar 2022 15:42:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9D4CF80557; Thu, 31 Mar 2022 15:42:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77073F8051A
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 15:42:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77073F8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XpsP91Hb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648734159; x=1680270159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cVjtjuhRTk2N7rLFzIbDmQgmbSBCAU+vFt7ouA5INLU=;
 b=XpsP91Hb9YmUk3Y7sEXXGK4G/4OtnGrLPhs+R/XAcgnUd0BtucgHfFxm
 +M2xImsrTo4e6GWaOC0qynglwKlObUbwNwqMoD99bxbcVOWrmyqISdZol
 NRU1LIksNHTXm2GDHF8YrcQ4FhGZTgu3N1bKzBOCvHzCzxARdGwAMHBGz
 Ncgz9yrf3oGgMPzsd7OANOYflirXaV/hVkwpVlWpgYYbIvDcapcclLZ+K
 Fy/n4kwITzZzQmz6xaE0S26yrigahHyqYH9hL9Pk1uFLwE6eM0D7n0wCq
 nnqkOioWuyW3DzYa3BFLAECHs9X4i3IlRCzQfj/vzV2ZHDf+6tQHvLjva A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259819182"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="259819182"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:42:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="522349213"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 31 Mar 2022 06:42:33 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 08/14] ASoC: Intel: avs: Support link_mask formatted string
Date: Thu, 31 Mar 2022 15:52:40 +0200
Message-Id: <20220331135246.993089-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331135246.993089-1-cezary.rojewski@intel.com>
References: <20220331135246.993089-1-cezary.rojewski@intel.com>
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


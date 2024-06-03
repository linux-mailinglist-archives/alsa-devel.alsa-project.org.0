Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B38F28D7FF5
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2024 12:28:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 088F7845;
	Mon,  3 Jun 2024 12:28:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 088F7845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717410536;
	bh=67gZRlZBaTdb8h6ch3REGCduvNYrqRietV9ZHi2R820=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ppZNQ7p4bP+xCQ6RcRwYlyA8MqqKrXQ/uW1sHUefUmIPfEttfa9TEWUClKJIcP/Px
	 YJHEyECrzM+tAC64wFeHbvTBqCkomZ9c1bavDIfPha0Re0hrwbtnouWjzWTgZ5u4KG
	 dBye85uBC5bakNxP7imDZr48xqsLGolTHNGLcX1g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DC48F805E9; Mon,  3 Jun 2024 12:27:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4BD7F805F0;
	Mon,  3 Jun 2024 12:27:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00B39F80496; Mon,  3 Jun 2024 12:27:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD773F800FA
	for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2024 12:27:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD773F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RUTIRvov
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717410464; x=1748946464;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=67gZRlZBaTdb8h6ch3REGCduvNYrqRietV9ZHi2R820=;
  b=RUTIRvovDgHz43t3rwO1WqR2Ht97jBqmXKH/2LroAeVkkWJGC9usYoTX
   AjCYSVA1ujECJFs9kv2cSJFEOsm4WVbC/dZxRfj2zGukbBQK1IsDJAVhH
   5WZ0+3aON/wPQ3aejKqLfBMS5AOlZtvktVJz7ApAjF1Z2Em6qDuyQuvYn
   BKux1SOVYIcgZJNXhr995ucqaRJSHIvDQhjM6MgFu8FEa9VmsqVesVRA5
   e5YlVUzlxceEzVGVIjcgJHGmvOj7BY4MyFu5X2vj94n2UdkSXPNFWeonB
   w0buvAdqBNGhwSOzqBuUwTgIulB20gjJ3fHb6Y8ovJTciJdM8uOt8CLfn
   Q==;
X-CSE-ConnectionGUID: 9efDAc0sRtmK2odysyuPYw==
X-CSE-MsgGUID: 4b/VttfSStqSe8stfdG1IA==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="14017221"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000";
   d="scan'208";a="14017221"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 03:27:42 -0700
X-CSE-ConnectionGUID: IKnj8+OsS4m1S9+F3bv42g==
X-CSE-MsgGUID: zuxYrlauT5e6p3GtU3jHtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000";
   d="scan'208";a="37430042"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa008.jf.intel.com with ESMTP; 03 Jun 2024 03:27:40 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Jason Montleon <jmontleo@redhat.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 2/4] ASoC: Intel: avs: Fix route override
Date: Mon,  3 Jun 2024 12:28:16 +0200
Message-Id: <20240603102818.36165-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
References: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NVRTQON52FZO3YBOZYXDODB6WNONVQBA
X-Message-ID-Hash: NVRTQON52FZO3YBOZYXDODB6WNONVQBA
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NVRTQON52FZO3YBOZYXDODB6WNONVQBA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of overriding existing memory strings that may be too short,
just allocate needed memory and point the route at it.

Reported-by: Jason Montleon <jmontleo@redhat.com>
Link: https://github.com/thesofproject/avs-topology-xml/issues/22#issuecomment-2127892605
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/topology.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 02bae207f6ece..b6c5d94a15548 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1545,8 +1545,8 @@ static int avs_route_load(struct snd_soc_component *comp, int index,
 {
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(comp->card->dev);
 	size_t len = SNDRV_CTL_ELEM_ID_NAME_MAXLEN;
-	char buf[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 	int ssp_port, tdm_slot;
+	char *buf;
 
 	/* See parse_link_formatted_string() for dynamic naming when(s). */
 	if (!avs_mach_singular_ssp(mach))
@@ -1557,13 +1557,24 @@ static int avs_route_load(struct snd_soc_component *comp, int index,
 		return 0;
 	tdm_slot = avs_mach_ssp_tdm(mach, ssp_port);
 
+	buf = devm_kzalloc(comp->card->dev, len, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
 	avs_ssp_sprint(buf, len, route->source, ssp_port, tdm_slot);
-	strscpy((char *)route->source, buf, len);
+	route->source = buf;
+
+	buf = devm_kzalloc(comp->card->dev, len, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
 	avs_ssp_sprint(buf, len, route->sink, ssp_port, tdm_slot);
-	strscpy((char *)route->sink, buf, len);
+	route->sink = buf;
+
 	if (route->control) {
+		buf = devm_kzalloc(comp->card->dev, len, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
 		avs_ssp_sprint(buf, len, route->control, ssp_port, tdm_slot);
-		strscpy((char *)route->control, buf, len);
+		route->control = buf;
 	}
 
 	return 0;
-- 
2.34.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1648D7FF7
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2024 12:29:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB9B7DFA;
	Mon,  3 Jun 2024 12:29:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB9B7DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717410561;
	bh=mrRMoWmxvzrAwR8G9TNIstf0By3PMvXmJHxrOKbXUJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MKsaCM+/kk5N0ckk/qk6yiOlH7tKqajNR2KGZzrVlPGPC7/hCna+jcccooJg783On
	 MM3vE8Fwn+YU+9ZpK1Ylgs1dy7bZAc9HVBifZHJ8tR4VKt5Ualt1CpQC/m3MYn/tiQ
	 5n7GQ4JCTDdGtatU1zyamZCxK03kZIuYCca4lJ/A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68A6AF8061C; Mon,  3 Jun 2024 12:28:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93B37F8062E;
	Mon,  3 Jun 2024 12:28:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6146F80496; Mon,  3 Jun 2024 12:27:53 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 61BE2F802DB
	for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2024 12:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61BE2F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QUf+C+M7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717410470; x=1748946470;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mrRMoWmxvzrAwR8G9TNIstf0By3PMvXmJHxrOKbXUJo=;
  b=QUf+C+M7lgHBGsU8Dp1IknRk8Zgd/kToHQro9wZDM5ck/gb8HvkOap2A
   zF9VvF7ZM+w2Z0mQgJvYZwox2NIHIlfoP4ln37L+cggDU7dkOCvuSvmo+
   fGIbVVqY8YVvbpOrqVBhQ+hos3VltK+OE2ZJ350AD4NEGplXE8XJcAMB0
   VC7Gh7vI+LVTa+4H68PPuzC1CQJg/Pleq4OJprCH062iTY2K+E/LMqUok
   nXLD+VJITaXT8REqmXqPdyzad8+HNo8R6AAuJVA5opUlMW/5S6xjeN+lF
   FNKsBUR58mTTw1yruZFUFXemfrqYX8T0POp7mvDhsbx5XtES+he0i7VmM
   Q==;
X-CSE-ConnectionGUID: /HlR4UslSneWPcr9q/k6ww==
X-CSE-MsgGUID: zh4I81A0SgiVnh+mpYgd1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="14017238"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000";
   d="scan'208";a="14017238"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 03:27:47 -0700
X-CSE-ConnectionGUID: TwKTajOsQoiHfU0xQ+QXkA==
X-CSE-MsgGUID: 6/5mpYAsR/GfXFqanzGk5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000";
   d="scan'208";a="37430053"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa008.jf.intel.com with ESMTP; 03 Jun 2024 03:27:45 -0700
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
Subject: [PATCH 4/4] ASoC: topology: Clean up route loading
Date: Mon,  3 Jun 2024 12:28:18 +0200
Message-Id: <20240603102818.36165-5-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
References: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q7ZFTIU4EKDNJCKAOFUVDGQBGVYKXIBD
X-Message-ID-Hash: Q7ZFTIU4EKDNJCKAOFUVDGQBGVYKXIBD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q7ZFTIU4EKDNJCKAOFUVDGQBGVYKXIBD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of using very long macro name, assign it to shorter variable
and use it instead. While doing that, we can reduce multiple if checks
using this define to one.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 1db540aaad451..2ac442644ed4f 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1021,6 +1021,7 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 	struct snd_soc_tplg_hdr *hdr)
 {
 	struct snd_soc_dapm_context *dapm = &tplg->comp->dapm;
+	const size_t maxlen = SNDRV_CTL_ELEM_ID_NAME_MAXLEN;
 	struct snd_soc_tplg_dapm_graph_elem *elem;
 	struct snd_soc_dapm_route *route;
 	int count, i;
@@ -1044,38 +1045,27 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 		tplg->pos += sizeof(struct snd_soc_tplg_dapm_graph_elem);
 
 		/* validate routes */
-		if (strnlen(elem->source, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
-			    SNDRV_CTL_ELEM_ID_NAME_MAXLEN) {
-			ret = -EINVAL;
-			break;
-		}
-		if (strnlen(elem->sink, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
-			    SNDRV_CTL_ELEM_ID_NAME_MAXLEN) {
-			ret = -EINVAL;
-			break;
-		}
-		if (strnlen(elem->control, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
-			    SNDRV_CTL_ELEM_ID_NAME_MAXLEN) {
+		if ((strnlen(elem->source, maxlen) == maxlen) ||
+		    (strnlen(elem->sink, maxlen) == maxlen) ||
+		    (strnlen(elem->control, maxlen) == maxlen)) {
 			ret = -EINVAL;
 			break;
 		}
 
 		route->source = devm_kmemdup(tplg->dev, elem->source,
-					     min(strlen(elem->source),
-						 SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
+					     min(strlen(elem->source), maxlen),
 					     GFP_KERNEL);
 		route->sink = devm_kmemdup(tplg->dev, elem->sink,
-					   min(strlen(elem->sink), SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
+					   min(strlen(elem->sink), maxlen),
 					   GFP_KERNEL);
 		if (!route->source || !route->sink) {
 			ret = -ENOMEM;
 			break;
 		}
 
-		if (strnlen(elem->control, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) != 0) {
+		if (strnlen(elem->control, maxlen) != 0) {
 			route->control = devm_kmemdup(tplg->dev, elem->control,
-						      min(strlen(elem->control),
-							  SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
+						      min(strlen(elem->control), maxlen),
 						      GFP_KERNEL);
 			if (!route->control) {
 				ret = -ENOMEM;
-- 
2.34.1


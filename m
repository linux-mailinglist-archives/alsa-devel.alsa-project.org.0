Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8C288C8AE
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:11:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAFED2C15;
	Tue, 26 Mar 2024 17:11:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAFED2C15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469500;
	bh=9iA0Nx5xyOd4qdcwtHqLz0ah1YLccJBqhCPLpQnQrT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gNDhdyPYB6Z3J51XWPzsebtYWqLN6s3iYDtdqpQNWSnF+ZbCH61PTZuQymfyUXG1a
	 e14fX2m41XmVQ98N6RUJSFqrkVVK2+Oc13hyVtbalpgG2VJBVV20Rl85VNOXWy0XbS
	 s6X/9cDiqBf+D/Xx6HX5EoNyu3BDp/fme76duqOM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53510F89682; Tue, 26 Mar 2024 17:07:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79CEFF8962A;
	Tue, 26 Mar 2024 17:07:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D9C7F806D6; Tue, 26 Mar 2024 17:06:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C39BF805E6
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C39BF805E6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bWcvrPnW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469152; x=1743005152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9iA0Nx5xyOd4qdcwtHqLz0ah1YLccJBqhCPLpQnQrT4=;
  b=bWcvrPnWTKMp6Q97SCdgBysT3LdHi5s+N4E+Z3uCXKzlBaQKg06sNy6f
   aiuSY7EAH3xcGICVgL4jgTcX8UBxPL0Ltw3O45UwtqZ72FiZYoAy+W3QY
   zTYoBxoCSt9HvVnsqIkRXPrxXv3+MhwCiFJ9t+tUyS/Sx3ZkKm445KFai
   KGExzuPTUkqauDWZxl0C9mxVfuSlLCfYJCEBZ4XrlYphh7VSjNziHi2pG
   QBf/OrVBmZ4Ky/GXuzjpgTjYPsgYKFEwSu44KkPP6DY1TmDLEvUPQUnMA
   yHA50EmMhq5/+yLdSszSGaFkUdHIUsRJWg8QQMznJ1eFJviIrflrJbIoW
   w==;
X-CSE-ConnectionGUID: komY/zb9Sfmkax6CZOUJjQ==
X-CSE-MsgGUID: ABh3/ZRhTwax3krOeW6fPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260490"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260490"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482369"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 23/34] ASoC: intel: sof_sdw: Factor out SoundWire DAI creation
Date: Tue, 26 Mar 2024 11:04:18 -0500
Message-Id: <20240326160429.13560-24-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6DJ7VGDAMACWL2YWRDLAQJT3IRSEL7EI
X-Message-ID-Hash: 6DJ7VGDAMACWL2YWRDLAQJT3IRSEL7EI
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6DJ7VGDAMACWL2YWRDLAQJT3IRSEL7EI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Factor out the creation of the SoundWire DAI links into a helper
function. No functional change.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 50 ++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 9f1c49df9cd2..3e6a758c98ab 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1559,6 +1559,34 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 	return 0;
 }
 
+static int create_sdw_dailinks(struct snd_soc_card *card,
+			       struct snd_soc_dai_link **dai_links, int *be_id,
+			       struct sof_sdw_dailink *sof_dais)
+{
+	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	int ret, i;
+
+	for (i = 0; i < SDW_MAX_LINKS; i++)
+		ctx->sdw_pin_index[i] = SDW_INTEL_BIDIR_PDI_BASE;
+
+	/* generate DAI links by each sdw link */
+	while (sof_dais->initialised) {
+		int current_be_id;
+
+		ret = create_sdw_dailink(card, sof_dais, dai_links, &current_be_id);
+		if (ret)
+			return ret;
+
+		/* Update the be_id to match the highest ID used for SDW link */
+		if (*be_id < current_be_id)
+			*be_id = current_be_id;
+
+		sof_dais++;
+	}
+
+	return 0;
+}
+
 static int create_ssp_dailinks(struct snd_soc_card *card,
 			       struct snd_soc_dai_link **dai_links, int *be_id,
 			       struct sof_sdw_codec_info *ssp_info,
@@ -1692,7 +1720,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	int num_ends = 0;
 	struct snd_soc_dai_link *dai_links;
 	int num_links;
-	int i, be_id = 0;
+	int be_id = 0;
 	int hdmi_num;
 	unsigned long ssp_mask;
 	int ret;
@@ -1774,28 +1802,12 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	card->num_links = num_links;
 
 	/* SDW */
-	if (!sdw_be_num)
-		goto SSP;
-
-	for (i = 0; i < SDW_MAX_LINKS; i++)
-		ctx->sdw_pin_index[i] = SDW_INTEL_BIDIR_PDI_BASE;
-
-	/* generate DAI links by each sdw link */
-	while (sof_dais->initialised) {
-		int current_be_id;
-
-		ret = create_sdw_dailink(card, sof_dais, &dai_links, &current_be_id);
+	if (sdw_be_num) {
+		ret = create_sdw_dailinks(card, &dai_links, &be_id, sof_dais);
 		if (ret)
 			goto err_end;
-
-		/* Update the be_id to match the highest ID used for SDW link */
-		if (be_id < current_be_id)
-			be_id = current_be_id;
-
-		sof_dais++;
 	}
 
-SSP:
 	/* SSP */
 	if (ssp_num) {
 		ret = create_ssp_dailinks(card, &dai_links, &be_id,
-- 
2.40.1


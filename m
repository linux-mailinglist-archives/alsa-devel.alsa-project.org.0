Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E6D88C8AC
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:11:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C97FA2C12;
	Tue, 26 Mar 2024 17:11:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C97FA2C12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469485;
	bh=cl79tFpLx86aSOuqh9+F1+bk9CD5uzAwzEa9y9oGOjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S/hq9y1HJTNekVCrReH96w11d7cBsucmYxYiWR8YA8j6BKCVweln5rop94MP+rkxd
	 MpnRudOpVgiBptCrSjWy4BtMu+oTYuAGc+Sgk6r5ml0x8WEhwXoBVekHYF+ZIz5cNZ
	 nEwQPREj4A3YVY8PWDPyhwOAz82PRA9SqAsID4Ls=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E81A7F8961E; Tue, 26 Mar 2024 17:06:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C4F4F80CBE;
	Tue, 26 Mar 2024 17:06:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0D84F802DB; Tue, 26 Mar 2024 17:06:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8141AF80571
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8141AF80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Uhc/kZ0t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469143; x=1743005143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cl79tFpLx86aSOuqh9+F1+bk9CD5uzAwzEa9y9oGOjg=;
  b=Uhc/kZ0tqpWBsdg+26y38tMkfrPzsSd2ZxV8uT9cy1rIjN/mShELEk/+
   kpmZWFPngboSnaxMuvE9Iu3Y3/fow4bXgLwxnroiE8zmUUcB0M1JA/VjX
   5+MdhKXFzyTLhBYWJS1SC4fNSu42Y6Uy2CGmh0sgaPnj+BURcP2zpG3dq
   wFdys9yhJMvAAB/n32+/mbPTQc+Bb17SkX8Xz+K4ke/J55dOlwBWRDkS+
   0/H+5EDWXN87ZuNweSuirbi4BGaAuivL/Dw2MH5F1VmhHLh8rjGYsC0yy
   i0PtgejkDgTryvU36HBbY3G4Oiuz8VMzKykAncLSSLGMNL9MP1e+fWkhT
   g==;
X-CSE-ConnectionGUID: Ccq8WBrNTkOFJFBLcBskxA==
X-CSE-MsgGUID: GQzQ143JQtelhIRdSZ6rAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260416"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260416"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482234"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:51 -0700
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
Subject: [PATCH 13/34] ASoC: Intel: sof_sdw: Factor out BlueTooth DAI creation
Date: Tue, 26 Mar 2024 11:04:08 -0500
Message-Id: <20240326160429.13560-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3UKY2XCEMIK6QPYKEUMLKWDA47S6URTG
X-Message-ID-Hash: 3UKY2XCEMIK6QPYKEUMLKWDA47S6URTG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3UKY2XCEMIK6QPYKEUMLKWDA47S6URTG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Factor out the creation of the BlueTooth DAI links into a helper
function.  No functional change.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 35 +++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 7dc3559bf988..6e2e934e1246 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1722,6 +1722,27 @@ static int create_hdmi_dailinks(struct snd_soc_card *card,
 	return 0;
 }
 
+static int create_bt_dailinks(struct snd_soc_card *card,
+			      struct snd_soc_dai_link **dai_links, int *be_id)
+{
+	struct device *dev = card->dev;
+	int port = (sof_sdw_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
+			SOF_BT_OFFLOAD_SSP_SHIFT;
+	char *name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
+	char *cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", port);
+	int ret;
+
+	ret = init_simple_dai_link(dev, *dai_links, be_id, name,
+				   1, 1, cpu_dai_name, snd_soc_dummy_dlc.name,
+				   snd_soc_dummy_dlc.dai_name, NULL, NULL);
+	if (ret)
+		return ret;
+
+	(*dai_links)++;
+
+	return 0;
+}
+
 static int sof_card_dai_links_create(struct snd_soc_card *card)
 {
 	struct device *dev = card->dev;
@@ -1738,7 +1759,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	bool group_generated[SDW_MAX_GROUPS] = { };
 	struct snd_soc_dai_link *dai_links;
 	int num_links;
-	char *name, *cpu_dai_name;
 	int i, j, be_id = 0;
 	int hdmi_num;
 	unsigned long ssp_mask;
@@ -1899,20 +1919,11 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	if (ret)
 		return ret;
 
+	/* BT */
 	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
-		int port = (sof_sdw_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
-				SOF_BT_OFFLOAD_SSP_SHIFT;
-
-		name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
-		cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", port);
-
-		ret = init_simple_dai_link(dev, dai_links, &be_id, name,
-					   1, 1, cpu_dai_name, snd_soc_dummy_dlc.name,
-					   snd_soc_dummy_dlc.dai_name, NULL, NULL);
+		ret = create_bt_dailinks(card, &dai_links, &be_id);
 		if (ret)
 			return ret;
-
-		dai_links++;
 	}
 
 	WARN_ON(dai_links != card->dai_link + card->num_links);
-- 
2.40.1


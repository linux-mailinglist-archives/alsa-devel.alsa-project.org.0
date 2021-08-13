Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DD33EB77F
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 17:16:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6602C1878;
	Fri, 13 Aug 2021 17:15:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6602C1878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628867775;
	bh=O1D/yRa8Hqwk05M9LzeSkHTzsx+cfWwvUyyMG+vgHfY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rshQRTgF0AY48XCl6os8p596Mgs2bqtSdHCeyEC/lMbwpX0wrZxXk2NsdqJ429EWT
	 X+wJa1v5bhFNa8VhDf5IdeLaXW+K8t9QkqqLMAgW441tUqRktszIjbvYtvHBWqDTMt
	 0dAiz9/u76T52wvDnm39XeaHky+kexmHfC66PqHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57E6FF804DA;
	Fri, 13 Aug 2021 17:12:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB7F2F804AE; Fri, 13 Aug 2021 17:12:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5E6CF804AE
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 17:11:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5E6CF804AE
X-IronPort-AV: E=McAfee;i="6200,9189,10075"; a="215301894"
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; d="scan'208";a="215301894"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 08:11:32 -0700
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; d="scan'208";a="422888868"
Received: from mchatter-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.54.162])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 08:11:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 6/8] ASoC: Intel: use software node API in SoundWire
 machines
Date: Fri, 13 Aug 2021 10:11:14 -0500
Message-Id: <20210813151116.23931-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210813151116.23931-1-pierre-louis.bossart@linux.intel.com>
References: <20210813151116.23931-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, broonie@kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

The function device_add_properties() is going to be removed.
Replacing it with software node API equivalents.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Co-developed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_rt711.c      | 14 ++++++++++++--
 sound/soc/intel/boards/sof_sdw_rt711_sdca.c | 14 ++++++++++++--
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index 510301e09b09..c38b70c9fac3 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -24,12 +24,22 @@
 static int rt711_add_codec_device_props(struct device *sdw_dev)
 {
 	struct property_entry props[MAX_NO_PROPS] = {};
+	struct fwnode_handle *fwnode;
+	int ret;
 
 	if (!SOF_RT711_JDSRC(sof_sdw_quirk))
 		return 0;
 	props[0] = PROPERTY_ENTRY_U32("realtek,jd-src", SOF_RT711_JDSRC(sof_sdw_quirk));
 
-	return device_add_properties(sdw_dev, props);
+	fwnode = fwnode_create_software_node(props, NULL);
+	if (IS_ERR(fwnode))
+		return PTR_ERR(fwnode);
+
+	ret = device_add_software_node(sdw_dev, to_software_node(fwnode));
+
+	fwnode_handle_put(fwnode);
+
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget rt711_widgets[] = {
@@ -129,7 +139,7 @@ int sof_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_l
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 
-	device_remove_properties(ctx->headset_codec_dev);
+	device_remove_software_node(ctx->headset_codec_dev);
 	put_device(ctx->headset_codec_dev);
 
 	return 0;
diff --git a/sound/soc/intel/boards/sof_sdw_rt711_sdca.c b/sound/soc/intel/boards/sof_sdw_rt711_sdca.c
index 94af40e2beb0..4215ddc36419 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711_sdca.c
@@ -24,13 +24,23 @@
 static int rt711_sdca_add_codec_device_props(struct device *sdw_dev)
 {
 	struct property_entry props[MAX_NO_PROPS] = {};
+	struct fwnode_handle *fwnode;
+	int ret;
 
 	if (!SOF_RT711_JDSRC(sof_sdw_quirk))
 		return 0;
 
 	props[0] = PROPERTY_ENTRY_U32("realtek,jd-src", SOF_RT711_JDSRC(sof_sdw_quirk));
 
-	return device_add_properties(sdw_dev, props);
+	fwnode = fwnode_create_software_node(props, NULL);
+	if (IS_ERR(fwnode))
+		return PTR_ERR(fwnode);
+
+	ret = device_add_software_node(sdw_dev, to_software_node(fwnode));
+
+	fwnode_handle_put(fwnode);
+
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget rt711_sdca_widgets[] = {
@@ -130,7 +140,7 @@ int sof_sdw_rt711_sdca_exit(struct snd_soc_card *card, struct snd_soc_dai_link *
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 
-	device_remove_properties(ctx->headset_codec_dev);
+	device_remove_software_node(ctx->headset_codec_dev);
 	put_device(ctx->headset_codec_dev);
 
 	return 0;
-- 
2.25.1


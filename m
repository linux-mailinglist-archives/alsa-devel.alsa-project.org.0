Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9717A39E9AD
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 00:37:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F0E616AF;
	Tue,  8 Jun 2021 00:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F0E616AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623105465;
	bh=UgiAe+PJ5xJeikRwo6WGSQgpLyvGwik9lAZ3TVHwPcA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S6jcE0Ba89jVMOpoPStYnNN0InhZC180O4xLFRSp5+trBUzwfnS9mANveEaQt4kb/
	 /EFLiIbUfPJ/mBruRseQEBSbsNqY2lKGWuha43yRNf+nKw2QNIq/IV6a8UgQcvGJKT
	 WLeTqVEzrcfGnV8aX7rWEXCEhJJGZzpjRdynzhMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 884AAF804C1;
	Tue,  8 Jun 2021 00:35:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E491F800AF; Tue,  8 Jun 2021 00:35:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEF88F8020D
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 00:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEF88F8020D
IronPort-SDR: pUWq3IGnQilCYB0Q+0NJoon7S0mLHZT7SDsjpuj0W4Bio3huPmsa95D3GsdwCvdbDMAokTJKnU
 PlntTJofUseg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="290356235"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="290356235"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:35:14 -0700
IronPort-SDR: M3MOZ6vnr9yV+a4ENN47apvvqob/KbDYbyZn+5HaowpFzikuoAsa7Tk2pnAYsvJnvek2z7mfyl
 zOy904jbOKSw==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="447659484"
Received: from marocham-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.108.70])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:35:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: Intel: boards: use software node API in SoundWire
 machines
Date: Mon,  7 Jun 2021 17:35:02 -0500
Message-Id: <20210607223503.584379-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607223503.584379-1-pierre-louis.bossart@linux.intel.com>
References: <20210607223503.584379-1-pierre-louis.bossart@linux.intel.com>
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

From: Heikki Krogerus <heikki.krogerus@linux.intel.com>

The function device_add_properties() is going to be removed.
Replacing it with software node API equivalents.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_rt711.c      | 20 +++++++++++++++-----
 sound/soc/intel/boards/sof_sdw_rt711_sdca.c | 20 +++++++++++++++-----
 2 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index 04074c09dded..b7c635c0fadd 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -24,19 +24,29 @@
 static int rt711_add_codec_device_props(const char *sdw_dev_name)
 {
 	struct property_entry props[MAX_NO_PROPS] = {};
+	struct fwnode_handle *fwnode;
 	struct device *sdw_dev;
 	int ret;
 
+	if (!SOF_RT711_JDSRC(sof_sdw_quirk))
+		return 0;
+
 	sdw_dev = bus_find_device_by_name(&sdw_bus_type, NULL, sdw_dev_name);
 	if (!sdw_dev)
 		return -EPROBE_DEFER;
 
-	if (SOF_RT711_JDSRC(sof_sdw_quirk)) {
-		props[0] = PROPERTY_ENTRY_U32("realtek,jd-src",
-					      SOF_RT711_JDSRC(sof_sdw_quirk));
+	props[0] = PROPERTY_ENTRY_U32("realtek,jd-src",
+				      SOF_RT711_JDSRC(sof_sdw_quirk));
+
+	fwnode = fwnode_create_software_node(props, NULL);
+	if (IS_ERR(fwnode)) {
+		put_device(sdw_dev);
+		return PTR_ERR(fwnode);
 	}
 
-	ret = device_add_properties(sdw_dev, props);
+	ret = device_add_software_node(sdw_dev, to_software_node(fwnode));
+
+	fwnode_handle_put(fwnode);
 	put_device(sdw_dev);
 
 	return ret;
@@ -144,7 +154,7 @@ int sof_sdw_rt711_exit(struct device *dev, struct snd_soc_dai_link *dai_link)
 	if (!sdw_dev)
 		return -EINVAL;
 
-	device_remove_properties(sdw_dev);
+	device_remove_software_node(sdw_dev);
 	put_device(sdw_dev);
 
 	return 0;
diff --git a/sound/soc/intel/boards/sof_sdw_rt711_sdca.c b/sound/soc/intel/boards/sof_sdw_rt711_sdca.c
index 19496f0f9110..300a52d15506 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711_sdca.c
@@ -24,19 +24,29 @@
 static int rt711_sdca_add_codec_device_props(const char *sdw_dev_name)
 {
 	struct property_entry props[MAX_NO_PROPS] = {};
+	struct fwnode_handle *fwnode;
 	struct device *sdw_dev;
 	int ret;
 
+	if (!SOF_RT711_JDSRC(sof_sdw_quirk))
+		return 0;
+
 	sdw_dev = bus_find_device_by_name(&sdw_bus_type, NULL, sdw_dev_name);
 	if (!sdw_dev)
 		return -EPROBE_DEFER;
 
-	if (SOF_RT711_JDSRC(sof_sdw_quirk)) {
-		props[0] = PROPERTY_ENTRY_U32("realtek,jd-src",
-					      SOF_RT711_JDSRC(sof_sdw_quirk));
+	props[0] = PROPERTY_ENTRY_U32("realtek,jd-src",
+				      SOF_RT711_JDSRC(sof_sdw_quirk));
+
+	fwnode = fwnode_create_software_node(props, NULL);
+	if (IS_ERR(fwnode)) {
+		put_device(sdw_dev);
+		return PTR_ERR(fwnode);
 	}
 
-	ret = device_add_properties(sdw_dev, props);
+	ret = device_add_software_node(sdw_dev, to_software_node(fwnode));
+
+	fwnode_handle_put(fwnode);
 	put_device(sdw_dev);
 
 	return ret;
@@ -144,7 +154,7 @@ int sof_sdw_rt711_sdca_exit(struct device *dev, struct snd_soc_dai_link *dai_lin
 	if (!sdw_dev)
 		return -EINVAL;
 
-	device_remove_properties(sdw_dev);
+	device_remove_software_node(sdw_dev);
 	put_device(sdw_dev);
 
 	return 0;
-- 
2.25.1


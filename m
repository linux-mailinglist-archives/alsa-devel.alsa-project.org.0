Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18078604D49
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 18:24:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9669AEAF;
	Wed, 19 Oct 2022 18:24:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9669AEAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666196697;
	bh=nv5Aa4qEk5WQfKjbAZ8hjOtEPLa+MpX6+KY93ivlvzc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZhnYkDCNpVYaFavta1lYQrhkw8aRxLALwefjILGB4izlx8EZVsHrRIpf9lagl/w09
	 9lj1waaPQQ0L7tkFmc/sUe9juAVh0m/9fzyU9lLoZrZIMRthetu+2nykk3LPwBhRly
	 gssMDl0fRKAKNMCYKs8fAKwErzotMLzeWLZsnZiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6953AF80549;
	Wed, 19 Oct 2022 18:23:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2BDCF80137; Wed, 19 Oct 2022 18:23:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21670F80137
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 18:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21670F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HIIoIdUx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666196629; x=1697732629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nv5Aa4qEk5WQfKjbAZ8hjOtEPLa+MpX6+KY93ivlvzc=;
 b=HIIoIdUxNG44aSYbnZ8+/7h5TvknZuSB8C6O4WLktMUSV/maXi4IT/Dw
 yTXqDLROG/kkvw+OiT7Q+8rZR2zEFfkjOX4mC+9Dut7QnAssJ4EmC1LHh
 SeY05FeIn52uyxz80dSW2+59o0836E93wtbHZGZj5pbSp7l2oOSTzmtUT
 c1GlZ4pkaCiMAUaDW1zKONL3B84PeBVVYF06uoTM4dqJ54cI60Zvijc2U
 03LCfNUhcLGaxEWdOgKOQWPWRVOwfBI3YoMg9dv9w7+RF8wkr+pOmUtOn
 VeYW9nqrU7ERU+kAs2ZJUbUlxJ2SG/Swr0l1p+wybycyim+I22oVRVUmF g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="286856218"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="286856218"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 09:21:25 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="698153820"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="698153820"
Received: from afsinurr-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.16.185])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 09:21:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/10] ALSA: hda: ext: hda_ext_controller: use hlink
 variable/parameter
Date: Wed, 19 Oct 2022 11:21:07 -0500
Message-Id: <20221019162115.185917-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
References: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

Follow the convention and use hlink for consistency.
No functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hdaudio_ext.h         | 16 +++++-----
 sound/hda/ext/hdac_ext_controller.c | 48 ++++++++++++++---------------
 2 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index 83aed26ab1433..8e48a4decfa08 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -117,17 +117,17 @@ struct hdac_ext_link {
 	struct list_head list;
 };
 
-int snd_hdac_ext_bus_link_power_up(struct hdac_ext_link *link);
-int snd_hdac_ext_bus_link_power_down(struct hdac_ext_link *link);
+int snd_hdac_ext_bus_link_power_up(struct hdac_ext_link *hlink);
+int snd_hdac_ext_bus_link_power_down(struct hdac_ext_link *hlink);
 int snd_hdac_ext_bus_link_power_up_all(struct hdac_bus *bus);
 int snd_hdac_ext_bus_link_power_down_all(struct hdac_bus *bus);
-void snd_hdac_ext_link_set_stream_id(struct hdac_ext_link *link,
-				 int stream);
-void snd_hdac_ext_link_clear_stream_id(struct hdac_ext_link *link,
-				 int stream);
+void snd_hdac_ext_link_set_stream_id(struct hdac_ext_link *hlink,
+				     int stream);
+void snd_hdac_ext_link_clear_stream_id(struct hdac_ext_link *hlink,
+				       int stream);
 
-int snd_hdac_ext_bus_link_get(struct hdac_bus *bus, struct hdac_ext_link *link);
-int snd_hdac_ext_bus_link_put(struct hdac_bus *bus, struct hdac_ext_link *link);
+int snd_hdac_ext_bus_link_get(struct hdac_bus *bus, struct hdac_ext_link *hlink);
+int snd_hdac_ext_bus_link_put(struct hdac_bus *bus, struct hdac_ext_link *hlink);
 
 void snd_hdac_ext_bus_link_power(struct hdac_device *codec, bool enable);
 
diff --git a/sound/hda/ext/hdac_ext_controller.c b/sound/hda/ext/hdac_ext_controller.c
index f521d286a3942..d3e9c4ae19ee3 100644
--- a/sound/hda/ext/hdac_ext_controller.c
+++ b/sound/hda/ext/hdac_ext_controller.c
@@ -115,12 +115,12 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_get_ml_capabilities);
 
 void snd_hdac_link_free_all(struct hdac_bus *bus)
 {
-	struct hdac_ext_link *l;
+	struct hdac_ext_link *hlink;
 
 	while (!list_empty(&bus->hlink_list)) {
-		l = list_first_entry(&bus->hlink_list, struct hdac_ext_link, list);
-		list_del(&l->list);
-		kfree(l);
+		hlink = list_first_entry(&bus->hlink_list, struct hdac_ext_link, list);
+		list_del(&hlink->list);
+		kfree(hlink);
 	}
 }
 EXPORT_SYMBOL_GPL(snd_hdac_link_free_all);
@@ -166,7 +166,7 @@ struct hdac_ext_link *snd_hdac_ext_bus_get_link(struct hdac_bus *bus,
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_get_link);
 
-static int check_hdac_link_power_active(struct hdac_ext_link *link, bool enable)
+static int check_hdac_link_power_active(struct hdac_ext_link *hlink, bool enable)
 {
 	int timeout;
 	u32 val;
@@ -176,7 +176,7 @@ static int check_hdac_link_power_active(struct hdac_ext_link *link, bool enable)
 	timeout = 150;
 
 	do {
-		val = readl(link->ml_addr + AZX_REG_ML_LCTL);
+		val = readl(hlink->ml_addr + AZX_REG_ML_LCTL);
 		if (enable) {
 			if (((val & mask) >> AZX_ML_LCTL_CPA_SHIFT))
 				return 0;
@@ -192,26 +192,26 @@ static int check_hdac_link_power_active(struct hdac_ext_link *link, bool enable)
 
 /**
  * snd_hdac_ext_bus_link_power_up -power up hda link
- * @link: HD-audio extended link
+ * @hlink: HD-audio extended link
  */
-int snd_hdac_ext_bus_link_power_up(struct hdac_ext_link *link)
+int snd_hdac_ext_bus_link_power_up(struct hdac_ext_link *hlink)
 {
-	snd_hdac_updatel(link->ml_addr, AZX_REG_ML_LCTL,
+	snd_hdac_updatel(hlink->ml_addr, AZX_REG_ML_LCTL,
 			 AZX_ML_LCTL_SPA, AZX_ML_LCTL_SPA);
 
-	return check_hdac_link_power_active(link, true);
+	return check_hdac_link_power_active(hlink, true);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_link_power_up);
 
 /**
  * snd_hdac_ext_bus_link_power_down -power down hda link
- * @link: HD-audio extended link
+ * @hlink: HD-audio extended link
  */
-int snd_hdac_ext_bus_link_power_down(struct hdac_ext_link *link)
+int snd_hdac_ext_bus_link_power_down(struct hdac_ext_link *hlink)
 {
-	snd_hdac_updatel(link->ml_addr, AZX_REG_ML_LCTL, AZX_ML_LCTL_SPA, 0);
+	snd_hdac_updatel(hlink->ml_addr, AZX_REG_ML_LCTL, AZX_ML_LCTL_SPA, 0);
 
-	return check_hdac_link_power_active(link, false);
+	return check_hdac_link_power_active(hlink, false);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_link_power_down);
 
@@ -254,7 +254,7 @@ int snd_hdac_ext_bus_link_power_down_all(struct hdac_bus *bus)
 EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_link_power_down_all);
 
 int snd_hdac_ext_bus_link_get(struct hdac_bus *bus,
-				struct hdac_ext_link *link)
+				struct hdac_ext_link *hlink)
 {
 	unsigned long codec_mask;
 	int ret = 0;
@@ -265,18 +265,18 @@ int snd_hdac_ext_bus_link_get(struct hdac_bus *bus,
 	 * if we move from 0 to 1, count will be 1 so power up this link
 	 * as well, also check the dma status and trigger that
 	 */
-	if (++link->ref_count == 1) {
+	if (++hlink->ref_count == 1) {
 		if (!bus->cmd_dma_state) {
 			snd_hdac_bus_init_cmd_io(bus);
 			bus->cmd_dma_state = true;
 		}
 
-		ret = snd_hdac_ext_bus_link_power_up(link);
+		ret = snd_hdac_ext_bus_link_power_up(hlink);
 
 		/*
 		 * clear the register to invalidate all the output streams
 		 */
-		snd_hdac_updatew(link->ml_addr, AZX_REG_ML_LOSIDV,
+		snd_hdac_updatew(hlink->ml_addr, AZX_REG_ML_LOSIDV,
 				 AZX_ML_LOSIDV_STREAM_MASK, 0);
 		/*
 		 *  wait for 521usec for codec to report status
@@ -296,10 +296,10 @@ int snd_hdac_ext_bus_link_get(struct hdac_bus *bus,
 EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_link_get);
 
 int snd_hdac_ext_bus_link_put(struct hdac_bus *bus,
-				struct hdac_ext_link *link)
+			      struct hdac_ext_link *hlink)
 {
 	int ret = 0;
-	struct hdac_ext_link *hlink;
+	struct hdac_ext_link *hlink_tmp;
 	bool link_up = false;
 
 	mutex_lock(&bus->lock);
@@ -308,15 +308,15 @@ int snd_hdac_ext_bus_link_put(struct hdac_bus *bus,
 	 * if we move from 1 to 0, count will be 0
 	 * so power down this link as well
 	 */
-	if (--link->ref_count == 0) {
-		ret = snd_hdac_ext_bus_link_power_down(link);
+	if (--hlink->ref_count == 0) {
+		ret = snd_hdac_ext_bus_link_power_down(hlink);
 
 		/*
 		 * now check if all links are off, if so turn off
 		 * cmd dma as well
 		 */
-		list_for_each_entry(hlink, &bus->hlink_list, list) {
-			if (hlink->ref_count) {
+		list_for_each_entry(hlink_tmp, &bus->hlink_list, list) {
+			if (hlink_tmp->ref_count) {
 				link_up = true;
 				break;
 			}
-- 
2.34.1


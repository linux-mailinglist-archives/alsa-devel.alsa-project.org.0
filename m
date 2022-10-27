Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1574B6101E6
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 21:42:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABC7D2DCC;
	Thu, 27 Oct 2022 21:41:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABC7D2DCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666899719;
	bh=5S7qA+u4YIZObxipMP1lfwIipfQRKU0YnoESJVcoEMY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TB2mAORIHnnzqJ6uaFa/z+Sim76xV9Z+MHVe3QQ+4ijemgfllQZofS6bAy8qUHz3S
	 5VzaIzsi/A5PuGBPFGhc59oP0UhQqwcTkyUBdebr0atmZAJIAzY/b76jxBMZ0KwRJD
	 ymT37UgZsiZo/LKhdSY5/b7EpJ171LgpzzyzaPFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A321F805D8;
	Thu, 27 Oct 2022 21:36:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A9F6F80580; Thu, 27 Oct 2022 21:36:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63553F80589
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 21:36:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63553F80589
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mG+2gaa7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666899387; x=1698435387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5S7qA+u4YIZObxipMP1lfwIipfQRKU0YnoESJVcoEMY=;
 b=mG+2gaa7vaMxZXWCWb4jNYrEfiOifs+Dujnetzj51DiTVBKVTTxsbr4G
 2RPKqAFwDo/3pcawHpi9snVcy8haQALk6+3nXQHb5+4C6dN9NJYxVug1h
 yHSiPO85VNaGwj75tV2P3EANp+vtY3P+aEzb4Kts6H917Jz6/SFpoYvtd
 IypImVIK6FadGyzdPvmbqlyCDRSjYRyULvHgxdYUMtXzhqMGXUzJuSi7h
 sPYtI098ctkJu1RdA1/E4H+QnxQ9Vqql0erAoVZ0/GxzNVtJ5M1HX+2Uh
 YygEtCclFBcYfo7cDIDkdPRh/++jLGti0+4QpiGQzvtbMTrG5r9VN8pT1 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="334957872"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="334957872"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:25 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="632527072"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="632527072"
Received: from vmehta-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.6.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 18/21] ASoC: SOF: Intel: add hda_bus_ml_free helper
Date: Thu, 27 Oct 2022 15:35:37 -0400
Message-Id: <20221027193540.259520-19-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
References: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Add helper matching allocation done in hda_bus_ml_get_capabilities().

No functionality change, just clearer code partitioning.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-mlink.c | 14 ++++++++++++++
 sound/soc/sof/intel/hda.c       |  5 ++---
 sound/soc/sof/intel/hda.h       |  2 ++
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index 2cdee03e4a47..76ab9a2e7bb3 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -34,6 +34,20 @@ void hda_bus_ml_get_capabilities(struct hdac_bus *bus)
 		snd_hdac_ext_bus_get_ml_capabilities(bus);
 }
 
+void hda_bus_ml_free(struct hdac_bus *bus)
+{
+	struct hdac_ext_link *hlink;
+
+	if (!bus->mlcap)
+		return;
+
+	while (!list_empty(&bus->hlink_list)) {
+		hlink = list_first_entry(&bus->hlink_list, struct hdac_ext_link, list);
+		list_del(&hlink->list);
+		kfree(hlink);
+	}
+}
+
 void hda_bus_ml_put_all(struct hdac_bus *bus)
 {
 	struct hdac_ext_link *hlink;
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index aa56f2967edc..619179e7f15c 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1201,9 +1201,8 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 		pci_free_irq_vectors(pci);
 
 	hda_dsp_stream_free(sdev);
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	snd_hdac_ext_link_free_all(bus);
-#endif
+
+	hda_bus_ml_free(sof_to_bus(sdev));
 
 	iounmap(sdev->bar[HDA_DSP_BAR]);
 	iounmap(bus->remap_addr);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index f0c9bb6d567d..ea73fd17ae28 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -764,6 +764,7 @@ static inline int hda_codec_i915_exit(struct snd_sof_dev *sdev) { return 0; }
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 
 void hda_bus_ml_get_capabilities(struct hdac_bus *bus);
+void hda_bus_ml_free(struct hdac_bus *bus);
 void hda_bus_ml_put_all(struct hdac_bus *bus);
 void hda_bus_ml_reset_losidv(struct hdac_bus *bus);
 int hda_bus_ml_resume(struct hdac_bus *bus);
@@ -772,6 +773,7 @@ int hda_bus_ml_suspend(struct hdac_bus *bus);
 #else
 
 static inline void hda_bus_ml_get_capabilities(struct hdac_bus *bus) { }
+static inline void hda_bus_ml_free(struct hdac_bus *bus) { }
 static inline void hda_bus_ml_put_all(struct hdac_bus *bus) { }
 static inline void hda_bus_ml_reset_losidv(struct hdac_bus *bus) { }
 static inline int hda_bus_ml_resume(struct hdac_bus *bus) { return 0; }
-- 
2.34.1


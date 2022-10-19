Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2A6604D4F
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 18:25:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5964CAEB4;
	Wed, 19 Oct 2022 18:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5964CAEB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666196756;
	bh=YYHLtN6dxJQHu50Fp8umAAnAt2HdTmOB0YeVYZlrDW0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ATcjAgHLTlu6Zhjw66p0uaBcsuuqn5KKVCsDSAzY6eC33Zzk33RxGukanw7tXVzJ2
	 9ZTrooJR62dhU4vjQZctfQsR1mRWpF9SHisXqGHl32Jx8UUckGexJvSkQLH9oP9VBC
	 EMMiFyTKSH50abCuH/773v6DqRFTCG1pdxNCM/rE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73BD5F80567;
	Wed, 19 Oct 2022 18:24:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48A06F80535; Wed, 19 Oct 2022 18:23:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 356C7F8053B
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 18:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 356C7F8053B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OB6LAKQB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666196632; x=1697732632;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YYHLtN6dxJQHu50Fp8umAAnAt2HdTmOB0YeVYZlrDW0=;
 b=OB6LAKQBlBHx8+dJh7NFm3KRlUm7Pi2hNgU8quRtj6pwx3cjNhO6BDsu
 xSLK4Zs0NhHw0Bty+fRYq2w9keR9zEAiSWGconY8KGtppV4rRkhuKmoVv
 sFDA4Sls6fHy0wFrQxW4aguwPkex0U1GRkU4uxn7RRuL4skVQwcrcpO3g
 rUCAwnXJOki7843WYJtU2795hvxOSN8AWGsxz+sF8Hp7pU7EFcXKQVdK4
 HMCz6RC0JV8IXobKr9k51Cbp+qFYQEtNFAgPq67D/IsdZww6MkhcJuDY2
 a0ONt5x+4tsUTlOARqvionrzOBurQ9FN+3XykONQXPI/ln9sSaknbWvYb Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="286856231"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="286856231"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 09:21:27 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="698153834"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="698153834"
Received: from afsinurr-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.16.185])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 09:21:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/10] ALSA/ASoC: hda: ext: add 'ext' prefix to
 snd_hdac_link_free_all
Date: Wed, 19 Oct 2022 11:21:10 -0500
Message-Id: <20221019162115.185917-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
References: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
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

No functionality change, just prefix addition to clearly identify that
the helper only applies to the 'ext' part for Intel platforms.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hdaudio_ext.h         | 2 +-
 sound/hda/ext/hdac_ext_controller.c | 6 +++---
 sound/soc/intel/avs/core.c          | 2 +-
 sound/soc/intel/skylake/skl.c       | 2 +-
 sound/soc/sof/intel/hda.c           | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index 397ab4fc98283..f0edbadc99023 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -80,7 +80,7 @@ struct hdac_ext_stream {
 int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
 				 int num_stream, int dir);
 void snd_hdac_ext_stream_free_all(struct hdac_bus *bus);
-void snd_hdac_link_free_all(struct hdac_bus *bus);
+void snd_hdac_ext_link_free_all(struct hdac_bus *bus);
 struct hdac_ext_stream *snd_hdac_ext_stream_assign(struct hdac_bus *bus,
 					   struct snd_pcm_substream *substream,
 					   int type);
diff --git a/sound/hda/ext/hdac_ext_controller.c b/sound/hda/ext/hdac_ext_controller.c
index 3730c30470f12..c0b801fa93c09 100644
--- a/sound/hda/ext/hdac_ext_controller.c
+++ b/sound/hda/ext/hdac_ext_controller.c
@@ -108,12 +108,12 @@ int snd_hdac_ext_bus_get_ml_capabilities(struct hdac_bus *bus)
 EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_get_ml_capabilities);
 
 /**
- * snd_hdac_link_free_all- free hdac extended link objects
+ * snd_hdac_ext_link_free_all- free hdac extended link objects
  *
  * @bus: the pointer to HDAC bus object
  */
 
-void snd_hdac_link_free_all(struct hdac_bus *bus)
+void snd_hdac_ext_link_free_all(struct hdac_bus *bus)
 {
 	struct hdac_ext_link *hlink;
 
@@ -123,7 +123,7 @@ void snd_hdac_link_free_all(struct hdac_bus *bus)
 		kfree(hlink);
 	}
 }
-EXPORT_SYMBOL_GPL(snd_hdac_link_free_all);
+EXPORT_SYMBOL_GPL(snd_hdac_ext_link_free_all);
 
 /**
  * snd_hdac_ext_bus_get_hlink_by_addr - get hlink at specified address
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 58a51361c4b11..04a7f49ea00af 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -504,7 +504,7 @@ static void avs_pci_remove(struct pci_dev *pci)
 	snd_hdac_bus_free_stream_pages(bus);
 	snd_hdac_ext_stream_free_all(bus);
 	/* reverse ml_capabilities */
-	snd_hdac_link_free_all(bus);
+	snd_hdac_ext_link_free_all(bus);
 	snd_hdac_ext_bus_exit(bus);
 
 	avs_dsp_core_disable(adev, GENMASK(adev->hw_cfg.dsp_cores - 1, 0));
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 1cfdb04f589fe..c6f319bcd2c4e 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -436,7 +436,7 @@ static int skl_free(struct hdac_bus *bus)
 		free_irq(bus->irq, (void *)bus);
 	snd_hdac_bus_free_stream_pages(bus);
 	snd_hdac_ext_stream_free_all(bus);
-	snd_hdac_link_free_all(bus);
+	snd_hdac_ext_link_free_all(bus);
 
 	if (bus->remap_addr)
 		iounmap(bus->remap_addr);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 1188ec51816bd..c6c6ea8a73f60 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1224,7 +1224,7 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 
 	hda_dsp_stream_free(sdev);
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	snd_hdac_link_free_all(bus);
+	snd_hdac_ext_link_free_all(bus);
 #endif
 
 	iounmap(sdev->bar[HDA_DSP_BAR]);
-- 
2.34.1


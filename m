Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7586D5DC6
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 12:42:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7152F7F4;
	Tue,  4 Apr 2023 12:42:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7152F7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680604978;
	bh=KfGBZudyBZ9lt5YaTLKo6s4hoj8exPpG3tx6NZCKxp8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HhbHKEcjU6saMRNqX3gEMpFrgRqt3ftqGn45i6+6Am0kP5L0kNSDy6mvOjtqHWoYO
	 fxMwvB1GBxwpJ1VRMZrHea5UZUu9HHYREL0UlqNOI2SbfMIcAgKwRtceeZsVPbvm7Z
	 brMX2MnBSkgclmDtMFVRsDnLO9zB1SpMBa3ilYFM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48520F8015B;
	Tue,  4 Apr 2023 12:41:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A782AF8028B; Tue,  4 Apr 2023 12:41:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 319EEF8026D
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 12:41:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 319EEF8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cgbMu9ZG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680604869; x=1712140869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KfGBZudyBZ9lt5YaTLKo6s4hoj8exPpG3tx6NZCKxp8=;
  b=cgbMu9ZG1HPcX68PBWPsDwDVYljlgz/nYb0+lKOH0Pqu34wXC1As8/WB
   +OAOHkuIOpsHMIdbs8oZijqW/3sCGdqZ5E6+1jKGROgGGcwjmwqpX9yps
   1lKwlmnVfwa1j4VL9hiQBEEwN+oIhAFGhi0mOZf1xPwIVv9usc+fjKDJ8
   xigVVPQn1Izly2L7k+2NchJsARpgrcqkjiRmIBolfXoj1SBoMa6hwdT9I
   runRIvhNdcox9cvM8HzBNvn1zcWOx7cP/AK6W67OuqL5WPVV/ksKJPbUL
   lqyrS1NBVIV/4o8YTXx6AZ3o0kQDPePiobcZMgt9zxB+r288rj1Zdy6kd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340877963"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="340877963"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829930134"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="829930134"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:03 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH v2 04/18] ASoC: SOF: Intel: hda-mlink: add return value for
 hda_bus_ml_get_capabilities()
Date: Tue,  4 Apr 2023 13:41:13 +0300
Message-Id: <20230404104127.5629-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
References: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ORCW7ROJJCAY27SZNQG6O3HJQC2SE4E5
X-Message-ID-Hash: ORCW7ROJJCAY27SZNQG6O3HJQC2SE4E5
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, amadeuszx.slawinski@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ORCW7ROJJCAY27SZNQG6O3HJQC2SE4E5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Add return value - this will need additional work in the caller.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-mlink.c | 5 +++--
 sound/soc/sof/intel/hda.h       | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index ac9bf477f413..e426d5e41e52 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -28,10 +28,11 @@
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 
-void hda_bus_ml_get_capabilities(struct hdac_bus *bus)
+int hda_bus_ml_get_capabilities(struct hdac_bus *bus)
 {
 	if (bus->mlcap)
-		snd_hdac_ext_bus_get_ml_capabilities(bus);
+		return snd_hdac_ext_bus_get_ml_capabilities(bus);
+	return 0;
 }
 
 void hda_bus_ml_free(struct hdac_bus *bus)
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 2a43bfc14583..259b34eea677 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -765,7 +765,7 @@ static inline int hda_codec_i915_exit(struct snd_sof_dev *sdev) { return 0; }
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 
-void hda_bus_ml_get_capabilities(struct hdac_bus *bus);
+int hda_bus_ml_get_capabilities(struct hdac_bus *bus);
 void hda_bus_ml_free(struct hdac_bus *bus);
 void hda_bus_ml_put_all(struct hdac_bus *bus);
 void hda_bus_ml_reset_losidv(struct hdac_bus *bus);
@@ -774,7 +774,7 @@ int hda_bus_ml_suspend(struct hdac_bus *bus);
 
 #else
 
-static inline void hda_bus_ml_get_capabilities(struct hdac_bus *bus) { }
+static inline int hda_bus_ml_get_capabilities(struct hdac_bus *bus) { return 0; }
 static inline void hda_bus_ml_free(struct hdac_bus *bus) { }
 static inline void hda_bus_ml_put_all(struct hdac_bus *bus) { }
 static inline void hda_bus_ml_reset_losidv(struct hdac_bus *bus) { }
-- 
2.40.0


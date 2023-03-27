Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C75366CA271
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 13:32:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A839C86E;
	Mon, 27 Mar 2023 13:31:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A839C86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679916741;
	bh=qlk2lobvKNuJGUWMfP6x/Y35TXGbrxF4kAnz+7U+Ju4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P+xuUvTDrFX8t8pz3yCu8Qg0yp2S9EV+GFekYMmbx/hEjK5sefZWlz1yW4mBcvpAk
	 0JArDtFC4lIXL6VJE/K/giNnhnFphnxTWSXIDADt6qpkYZp+qU3ewa6IPOTr91C3vw
	 N+qxmalO8MzHeQWes7NUBVrf1SDYjXYw6e8g05uQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 712E6F80558;
	Mon, 27 Mar 2023 13:29:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B761FF80564; Mon, 27 Mar 2023 13:29:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 374A3F8024E
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 13:29:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 374A3F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=I8zLqlcS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679916571; x=1711452571;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qlk2lobvKNuJGUWMfP6x/Y35TXGbrxF4kAnz+7U+Ju4=;
  b=I8zLqlcSvfGFyIidbre4R8LvSEd/yZfQ98YQ2EHn+ooI7xnD9qlnoYJK
   Y7walCsnDYv8zOt0SHIZYIWTvyrgDUCMVkZVA2vYsQSH3veCtD3aoqotM
   x7za3DPti64oG+F58qvuYXb3KrRf+x6g3inBJ35iNbbiB6q8cPQVHkDgK
   NTC8YOFdYS+vAxHaKdaJGHNykzgLIt54KaKZtkdZeO/YAzbxLol/k/oao
   en4f6VCqg9UpFnmIrv19qPRb2zksnEFf5SALDqgtEbPCrcF54wUXPLCl/
   Xm+I5ANMorv2NUXz4Nz1id5DTFfHNabqanlgNZUhwkVwvuSpHJe1Ut6K8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="367986981"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="367986981"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="857620461"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="857620461"
Received: from asebenix-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.223.110])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:24 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 09/18] ASoC: SOF: Intel: hda-mlink: add convenience helpers
 for SoundWire PM
Date: Mon, 27 Mar 2023 14:29:22 +0300
Message-Id: <20230327112931.23411-10-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
References: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ORZRZCU7S4T6MRREKGEWFZNRNA4E5OIG
X-Message-ID-Hash: ORZRZCU7S4T6MRREKGEWFZNRNA4E5OIG
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ORZRZCU7S4T6MRREKGEWFZNRNA4E5OIG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The updated SoundWire Intel driver will need to rely on Extended
HDaudio links for power management, but it doesn't need to be aware of
all the HDaudio structures. Add convenience helpers to avoid polluting
SoundWire drivers too much with HDaudio information.

Since the SoundWire/Intel solution already takes the lock at a higher
level, the _unlocked PM helpers are used.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hda-mlink.h       |  9 +++++++++
 sound/soc/sof/intel/hda-mlink.c | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
index 6908af849dd5..74737032a632 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -19,6 +19,9 @@ int hdac_bus_eml_power_up_unlocked(struct hdac_bus *bus, bool alt, int elid, int
 int hdac_bus_eml_power_down(struct hdac_bus *bus, bool alt, int elid, int sublink);
 int hdac_bus_eml_power_down_unlocked(struct hdac_bus *bus, bool alt, int elid, int sublink);
 
+int hdac_bus_eml_sdw_power_up_unlocked(struct hdac_bus *bus, int sublink);
+int hdac_bus_eml_sdw_power_down_unlocked(struct hdac_bus *bus, int sublink);
+
 void hda_bus_ml_put_all(struct hdac_bus *bus);
 void hda_bus_ml_reset_losidv(struct hdac_bus *bus);
 int hda_bus_ml_resume(struct hdac_bus *bus);
@@ -55,6 +58,12 @@ hdac_bus_eml_power_down_unlocked(struct hdac_bus *bus, bool alt, int elid, int s
 	return 0;
 }
 
+static inline int
+hdac_bus_eml_sdw_power_up_unlocked(struct hdac_bus *bus, int sublink) { return 0; }
+
+static inline int
+hdac_bus_eml_sdw_power_down_unlocked(struct hdac_bus *bus, int sublink) { return 0; }
+
 static inline void hda_bus_ml_put_all(struct hdac_bus *bus) { }
 static inline void hda_bus_ml_reset_losidv(struct hdac_bus *bus) { }
 static inline int hda_bus_ml_resume(struct hdac_bus *bus) { return 0; }
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index 4cfef4007d0c..310bb4c6822e 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -414,6 +414,18 @@ int hdac_bus_eml_power_down_unlocked(struct hdac_bus *bus, bool alt, int elid, i
 }
 EXPORT_SYMBOL_NS(hdac_bus_eml_power_down_unlocked, SND_SOC_SOF_HDA_MLINK);
 
+int hdac_bus_eml_sdw_power_up_unlocked(struct hdac_bus *bus, int sublink)
+{
+	return hdac_bus_eml_power_up_unlocked(bus, true, AZX_REG_ML_LEPTR_ID_SDW, sublink);
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_power_up_unlocked, SND_SOC_SOF_HDA_MLINK);
+
+int hdac_bus_eml_sdw_power_down_unlocked(struct hdac_bus *bus, int sublink)
+{
+	return hdac_bus_eml_power_down_unlocked(bus, true, AZX_REG_ML_LEPTR_ID_SDW, sublink);
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_power_down_unlocked, SND_SOC_SOF_HDA_MLINK);
+
 void hda_bus_ml_put_all(struct hdac_bus *bus)
 {
 	struct hdac_ext_link *hlink;
-- 
2.40.0


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FC16CA284
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 13:34:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A326884D;
	Mon, 27 Mar 2023 13:33:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A326884D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679916879;
	bh=gCa6nQV4i16oDks1K48R209OcVNXjkuoyRcS6MovXXA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AyQNV9djehbYRtVCt/sr8XdOyO0UW+UQFuaA+KmceKsbZ76J38N4AyRNDCK3AEWDh
	 As9ES9vzIgVCdS9YfLRoHiUDUjVSvi3AwX131kvZLuHrporcPMbkRldwzX+MST8nnB
	 9mnD7FoUKqcmx+tiX5AMLCKOggid16EfC3PHQEow=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20D2AF805BE;
	Mon, 27 Mar 2023 13:30:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB228F805B3; Mon, 27 Mar 2023 13:29:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88FDCF805AB
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 13:29:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88FDCF805AB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=W/g/jRTF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679916596; x=1711452596;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gCa6nQV4i16oDks1K48R209OcVNXjkuoyRcS6MovXXA=;
  b=W/g/jRTFutn788qx0GJc+EM6YMZ7J+iCRdfZcvkRbidT+mdKVBtBEmVV
   diCxWDVLB089l3EStZG3wLYnGSR5UHjjfyZyAP5+CILVLSJNq7VfJWdF9
   bXlX73L/+7tSsL612n3tOGBAmZsAfV/ib3pillEMrYbrxCVhizcs2WX5u
   dSxxjXwCBxZxhpXbtyOFLgZyzskn9D8nkH8I3atVog6pjNtIX26cIumAZ
   thqttF6wNZFkhpmyPQNr0Wkiz7cuiNrsm+yBanUh1eDpS08iIOCc8coLa
   YBOT6A74M6Sp1ySwY51BkOkeG5nqXemlznJcfbhJxiAP84h95YuEoC4T6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="367987087"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="367987087"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="857620598"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="857620598"
Received: from asebenix-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.223.110])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:51 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 18/18] ASoC: SOF: Intel: hda-mlink: add helper to retrieve
 eml_lock
Date: Mon, 27 Mar 2023 14:29:31 +0300
Message-Id: <20230327112931.23411-19-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
References: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MD4IS3JZ4PF5TMKRRHFZ5KCT2XSQJHHX
X-Message-ID-Hash: MD4IS3JZ4PF5TMKRRHFZ5KCT2XSQJHHX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MD4IS3JZ4PF5TMKRRHFZ5KCT2XSQJHHX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

For SoundWire usages, we need to use the global eml_lock to
serialize/protect all accesses to shared registers.  Due to the split
implementation across two subsystems, we need to pass a pointer
around.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hda-mlink.h       |  5 +++++
 sound/soc/sof/intel/hda-mlink.c | 12 ++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
index 17adb748597a..7b6ad0429034 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -52,6 +52,8 @@ int hda_bus_ml_suspend(struct hdac_bus *bus);
 struct hdac_ext_link *hdac_bus_eml_ssp_get_hlink(struct hdac_bus *bus);
 struct hdac_ext_link *hdac_bus_eml_dmic_get_hlink(struct hdac_bus *bus);
 
+struct mutex *hdac_bus_eml_get_mutex(struct hdac_bus *bus, bool alt, int elid);
+
 int hdac_bus_eml_enable_offload(struct hdac_bus *bus, bool alt, int elid, bool enable);
 
 #else
@@ -153,6 +155,9 @@ hdac_bus_eml_ssp_get_hlink(struct hdac_bus *bus) { return NULL; }
 static inline struct hdac_ext_link *
 hdac_bus_eml_dmic_get_hlink(struct hdac_bus *bus) { return NULL; }
 
+static inline struct mutex *
+hdac_bus_eml_get_mutex(struct hdac_bus *bus, bool alt, int elid) { return NULL; }
+
 static inline int
 hdac_bus_eml_enable_offload(struct hdac_bus *bus, bool alt, int elid, bool enable)
 {
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index e38f00bd72ad..a3e5af7319ae 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -800,6 +800,18 @@ int hda_bus_ml_suspend(struct hdac_bus *bus)
 }
 EXPORT_SYMBOL_NS(hda_bus_ml_suspend, SND_SOC_SOF_HDA_MLINK);
 
+struct mutex *hdac_bus_eml_get_mutex(struct hdac_bus *bus, bool alt, int elid)
+{
+	struct hdac_ext2_link *h2link;
+
+	h2link = find_ext2_link(bus, alt, elid);
+	if (!h2link)
+		return NULL;
+
+	return &h2link->eml_lock;
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_get_mutex, SND_SOC_SOF_HDA_MLINK);
+
 struct hdac_ext_link *hdac_bus_eml_ssp_get_hlink(struct hdac_bus *bus)
 {
 	struct hdac_ext2_link *h2link;
-- 
2.40.0


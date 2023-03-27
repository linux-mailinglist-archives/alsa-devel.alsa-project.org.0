Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB386CA279
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 13:33:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A19C1AEA;
	Mon, 27 Mar 2023 13:32:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A19C1AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679916828;
	bh=A8fa1U2k8HIt+aUvT9iAmQ8NFUjhI+mD7u/jz/kl+yk=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NmrZ+gnMZckOIiq4fNAE19YpbpxlDSJRqU0ZeiAzqBt8C9wEcFDZ3rn/o82faw/UL
	 K6AFHLCFmjYnYEevmOXcclgkNffTrxajCoUQoiUk9NizMOBK2SVMmPXumSAjApHhVb
	 eAa/HELd05U8xmC2I/hNQu53eXLTh/5JZ/jnl73o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0EA5F805AF;
	Mon, 27 Mar 2023 13:29:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0083CF805A8; Mon, 27 Mar 2023 13:29:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75AC3F80578
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 13:29:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75AC3F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kgZFiaOl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679916588; x=1711452588;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A8fa1U2k8HIt+aUvT9iAmQ8NFUjhI+mD7u/jz/kl+yk=;
  b=kgZFiaOlTgmGhHygZQOeoiaLfmiOG13SZW+TaeNXudCE9PhWYAQsIrrd
   gnJKRooyjb+RdNBhDsIzyjNjKM0aPlt311dBHII2/XGVLqI9qYSHNy6Lx
   tIl/OizZ+9PRtPP/0z0G0wFF2ZUwL68dByfRCvPS+3yY7tTkLDPLTCWGp
   E0/3U6foQwAQ3MHMOAlmls5IkN3dMhDvFobZrAh4bmpXRJO+iCLMeY3VZ
   tNQ2c6ACNqgvDlFKHF/oyLSZGGzReq7/ZaFM3XkMnLBd/iLFUJiTvg8ib
   QH+se8z6QBHn3h74bKMYlY0kK1yIt/+8mKxACOxz1L/3c75+vH+t8Frce
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="367987053"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="367987053"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="857620544"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="857620544"
Received: from asebenix-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.223.110])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:42 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 15/18] ASoC: SOF: Intel: hda-mlink: program SoundWire LSDIID
 registers
Date: Mon, 27 Mar 2023 14:29:28 +0300
Message-Id: <20230327112931.23411-16-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
References: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 52SDYFGYFAFND3C4PM7AKKXALNLEGVK4
X-Message-ID-Hash: 52SDYFGYFAFND3C4PM7AKKXALNLEGVK4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/52SDYFGYFAFND3C4PM7AKKXALNLEGVK4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Each SoundWire peripheral can be programmed from the manager side
either with a regular command FIFO, or with the HDaudio CORB/RIRB
DMA-based mechanism. The mapping between SoundWire peripheral and SDI
address is handled with the LSDIID register.

This mapping only works of course if each peripheral has a unique
address across all links. This has already been enforced in previous
Intel contributions allowing for an IDA-based solution for the device
number allocation.

The checks on the dev_num are handled at the SoundWire level, but the
locking is handled at the hda-mlink level.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hda-mlink.h       |  5 +++++
 sound/soc/sof/intel/hda-mlink.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
index 64106d439fd8..fc63aec97119 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -41,6 +41,8 @@ int hdac_bus_eml_power_down_unlocked(struct hdac_bus *bus, bool alt, int elid, i
 int hdac_bus_eml_sdw_power_up_unlocked(struct hdac_bus *bus, int sublink);
 int hdac_bus_eml_sdw_power_down_unlocked(struct hdac_bus *bus, int sublink);
 
+int hdac_bus_eml_sdw_set_lsdiid(struct hdac_bus *bus, int sublink, int dev_num);
+
 void hda_bus_ml_put_all(struct hdac_bus *bus);
 void hda_bus_ml_reset_losidv(struct hdac_bus *bus);
 int hda_bus_ml_resume(struct hdac_bus *bus);
@@ -131,6 +133,9 @@ hdac_bus_eml_sdw_power_up_unlocked(struct hdac_bus *bus, int sublink) { return 0
 static inline int
 hdac_bus_eml_sdw_power_down_unlocked(struct hdac_bus *bus, int sublink) { return 0; }
 
+static inline int
+hdac_bus_eml_sdw_set_lsdiid(struct hdac_bus *bus, int sublink, int dev_num) { return 0; }
+
 static inline void hda_bus_ml_put_all(struct hdac_bus *bus) { }
 static inline void hda_bus_ml_reset_losidv(struct hdac_bus *bus) { }
 static inline int hda_bus_ml_resume(struct hdac_bus *bus) { return 0; }
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index 0912989ce729..87e6c5f2f3ea 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -323,6 +323,16 @@ static bool hdaml_link_check_cmdsync(u32 __iomem *lsync, u32 cmdsync_mask)
 	return !!(val & cmdsync_mask);
 }
 
+static void hdaml_link_set_lsdiid(u32 __iomem *lsdiid, int dev_num)
+{
+	u32 val;
+
+	val = readl(lsdiid);
+	val |= BIT(dev_num);
+
+	writel(val, lsdiid);
+}
+
 /* END HDAML section */
 
 static int hda_ml_alloc_h2link(struct hdac_bus *bus, int index)
@@ -698,6 +708,26 @@ int hdac_bus_eml_sdw_power_down_unlocked(struct hdac_bus *bus, int sublink)
 }
 EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_power_down_unlocked, SND_SOC_SOF_HDA_MLINK);
 
+int hdac_bus_eml_sdw_set_lsdiid(struct hdac_bus *bus, int sublink, int dev_num)
+{
+	struct hdac_ext2_link *h2link;
+	struct hdac_ext_link *hlink;
+
+	h2link = find_ext2_link(bus, true, AZX_REG_ML_LEPTR_ID_SDW);
+	if (!h2link)
+		return -ENODEV;
+
+	hlink = &h2link->hext_link;
+
+	mutex_lock(&h2link->eml_lock);
+
+	hdaml_link_set_lsdiid(hlink->ml_addr + AZX_REG_ML_LSDIID_OFFSET(sublink), dev_num);
+
+	mutex_unlock(&h2link->eml_lock);
+
+	return 0;
+} EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_set_lsdiid, SND_SOC_SOF_HDA_MLINK);
+
 void hda_bus_ml_put_all(struct hdac_bus *bus)
 {
 	struct hdac_ext_link *hlink;
-- 
2.40.0


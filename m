Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 334576D5DDB
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 12:46:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC59D82B;
	Tue,  4 Apr 2023 12:45:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC59D82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680605184;
	bh=Xljm84LzTrYhgNeLbLvCYM09CJM6E7ZM78Siq/Vf1Qs=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qtjiLeKj+hz8Viet9tlwjbv5Uwf1yXm5D30+0p0EVQHq4jvllgi4b/gLFUcJeQJy5
	 7k5MFeGPjSCxMw//Oa77G7yJd/PMRg23ye07m3brUT8yNJj4FcXwHw18DkFFgOooXq
	 +8iGj4XRz9O/TeVgFPI5jTGxcEOOK5180QTVR+VA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F88FF805CB;
	Tue,  4 Apr 2023 12:41:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06305F805B3; Tue,  4 Apr 2023 12:41:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B3DFF805B2
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 12:41:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B3DFF805B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=n+iAlnx0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680604901; x=1712140901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xljm84LzTrYhgNeLbLvCYM09CJM6E7ZM78Siq/Vf1Qs=;
  b=n+iAlnx0M4npNB5vb0XKURyM3mbZUvWmlrK3x4L11cdKewPz/wbVt9I1
   4YnmxRf26xLdCWVN7dzMNpcCD3eV4tpJJwdc7AmBPgy82RSf6HEzIsmS5
   sXSrPhd4eG3Tdoln13fVGNT4q18ouMoL6KFBq7OVzk9r9IG3lbWlfhemD
   GtdEGam5xN/qgYBjnj1RZC+NeKdGtnQAtbl+m9xT4wBME2f6UXwQMO11N
   q712ZL8tS/biDdvRNcg7vwCS1LqxEIKrew+PuxqTdgeGwqv1sIYjOSx7u
   el4anOnoyIJagxT9cml5hOumg3G4rbMuW/u/c2lIMROhtOTd98lQyIw0x
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340878102"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="340878102"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829930221"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="829930221"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:36 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH v2 15/18] ASoC: SOF: Intel: hda-mlink: program SoundWire
 LSDIID registers
Date: Tue,  4 Apr 2023 13:41:24 +0300
Message-Id: <20230404104127.5629-16-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
References: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WVTW4SSE62Z67DOFIRPLR44GMTQD5R2B
X-Message-ID-Hash: WVTW4SSE62Z67DOFIRPLR44GMTQD5R2B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WVTW4SSE62Z67DOFIRPLR44GMTQD5R2B/>
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
index 0c71b843f2cf..d626ef964ea7 100644
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
index cbbc8639691c..5810d6f8719c 100644
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


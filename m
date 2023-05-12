Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30229700E1B
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 19:49:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 880ADEA1;
	Fri, 12 May 2023 19:48:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 880ADEA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683913748;
	bh=dt1NhGCq6KNz+7Q8rqjoCnEoN9cKfME3q2gb3EFAMLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fUDaz7U2d/43MJBi7ReBdfnPtZXhHOOJhcyvs5EaVs75+1BJyiZdc18tUOasBwMUC
	 93dkH2l9XXEbhbCQ4Qmw4nUhoXcSp2iNB/nY2ZXoXX+nyWV2YA7Omd8JkmF5TSLZqZ
	 /vIAUfLT/TbFZnwC4l+jAhf/bec5IetNk32oQvhk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BB09F80558; Fri, 12 May 2023 19:48:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8CC2F80553;
	Fri, 12 May 2023 19:48:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA354F80563; Fri, 12 May 2023 19:46:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61144F8053D
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 19:46:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61144F8053D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UdFgc1tg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683913588; x=1715449588;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dt1NhGCq6KNz+7Q8rqjoCnEoN9cKfME3q2gb3EFAMLs=;
  b=UdFgc1tgd7N4gdDhQ4S0P+aVajxNBMrfBfJR6Oi4JNAAzlBmUo7UdH+9
   8/smNyGH9rpt/ykf5vVFaS+7l+uDTAlvoPXdUxA9LEETZBYLibstQwmBk
   JVEmpX5kaHhSTFFLYYw6NAK7AK4nYDN4khBlVzG3+JJkf4j0EVcMr8crI
   CeH+Z65AcZeT7OL+DfZxLJG/Dl62C9urmi+aXnXCCJmDvLSa8oP1vO6eg
   IWJZHSndDC64GkA0oDumtJwLsvy0nUA+wggaWEcgIIWHwjZOkN2N+4ycB
   2eRyb+zvhvcaYr309ZDhgzccIUeoSHti89sVPz1Gng4dAFKd0QBbzlOnS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="349688080"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="349688080"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:46:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="812167807"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="812167807"
Received: from winkelru-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.144.249])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:46:24 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 6/6] ASoC: SOF: Intel: hda-mlink: add helper to program
 SoundWire PCMSyCM registers
Date: Fri, 12 May 2023 12:46:11 -0500
Message-Id: <20230512174611.84372-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512174611.84372-1-pierre-louis.bossart@linux.intel.com>
References: <20230512174611.84372-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3S7ZTPGFHSRAU2EKROOMPDDWPPC4T3CE
X-Message-ID-Hash: 3S7ZTPGFHSRAU2EKROOMPDDWPPC4T3CE
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3S7ZTPGFHSRAU2EKROOMPDDWPPC4T3CE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These registers enable the HDaudio DMA hardware to split/merge data
from different PDIs, possibly on different links.

This capability exists for all types of HDaudio extended links, but
for now is only required for SoundWire. In the SSP/DMIC case, the IP
is programmed by the DSP firmware.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/sound/hda-mlink.h       | 10 +++++++
 sound/soc/sof/intel/hda-mlink.c | 50 +++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
index 5bfa8ae940e4..4f44f0bd5388 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -44,6 +44,9 @@ int hdac_bus_eml_sdw_power_down_unlocked(struct hdac_bus *bus, int sublink);
 
 int hdac_bus_eml_sdw_set_lsdiid(struct hdac_bus *bus, int sublink, int dev_num);
 
+int hdac_bus_eml_sdw_map_stream_ch(struct hdac_bus *bus, int sublink, int y,
+				   int channel_mask, int stream_id, int dir);
+
 void hda_bus_ml_put_all(struct hdac_bus *bus);
 void hda_bus_ml_reset_losidv(struct hdac_bus *bus);
 int hda_bus_ml_resume(struct hdac_bus *bus);
@@ -145,6 +148,13 @@ hdac_bus_eml_sdw_power_down_unlocked(struct hdac_bus *bus, int sublink) { return
 static inline int
 hdac_bus_eml_sdw_set_lsdiid(struct hdac_bus *bus, int sublink, int dev_num) { return 0; }
 
+static inline int
+hdac_bus_eml_sdw_map_stream_ch(struct hdac_bus *bus, int sublink, int y,
+			       int channel_mask, int stream_id, int dir)
+{
+	return 0;
+}
+
 static inline void hda_bus_ml_put_all(struct hdac_bus *bus) { }
 static inline void hda_bus_ml_reset_losidv(struct hdac_bus *bus) { }
 static inline int hda_bus_ml_resume(struct hdac_bus *bus) { return 0; }
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index 2d0c5d5914b1..b7cbf66badf5 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -73,6 +73,7 @@ struct hdac_ext2_link {
 #define AZX_REG_SDW_SHIM_OFFSET				0x0
 #define AZX_REG_SDW_IP_OFFSET				0x100
 #define AZX_REG_SDW_VS_SHIM_OFFSET			0x6000
+#define AZX_REG_SDW_SHIM_PCMSyCM(y)			(0x16 + 0x4 * (y))
 
 /* only one instance supported */
 #define AZX_REG_INTEL_DMIC_SHIM_OFFSET			0x0
@@ -340,6 +341,21 @@ static void hdaml_link_set_lsdiid(u32 __iomem *lsdiid, int dev_num)
 	writel(val, lsdiid);
 }
 
+static void hdaml_shim_map_stream_ch(u16 __iomem *pcmsycm, int lchan, int hchan,
+				     int stream_id, int dir)
+{
+	u16 val;
+
+	val = readw(pcmsycm);
+
+	u16p_replace_bits(&val, lchan, GENMASK(3, 0));
+	u16p_replace_bits(&val, hchan, GENMASK(7, 4));
+	u16p_replace_bits(&val, stream_id, GENMASK(13, 8));
+	u16p_replace_bits(&val, dir, BIT(15));
+
+	writew(val, pcmsycm);
+}
+
 static void hdaml_lctl_offload_enable(u32 __iomem *lctl, bool enable)
 {
 	u32 val = readl(lctl);
@@ -756,6 +772,40 @@ int hdac_bus_eml_sdw_set_lsdiid(struct hdac_bus *bus, int sublink, int dev_num)
 	return 0;
 } EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_set_lsdiid, SND_SOC_SOF_HDA_MLINK);
 
+/*
+ * the 'y' parameter comes from the PCMSyCM hardware register naming. 'y' refers to the
+ * PDI index, i.e. the FIFO used for RX or TX
+ */
+int hdac_bus_eml_sdw_map_stream_ch(struct hdac_bus *bus, int sublink, int y,
+				   int channel_mask, int stream_id, int dir)
+{
+	struct hdac_ext2_link *h2link;
+	u16 __iomem *pcmsycm;
+	u16 val;
+
+	h2link = find_ext2_link(bus, true, AZX_REG_ML_LEPTR_ID_SDW);
+	if (!h2link)
+		return -ENODEV;
+
+	pcmsycm = h2link->base_ptr + h2link->shim_offset +
+		h2link->instance_offset * sublink +
+		AZX_REG_SDW_SHIM_PCMSyCM(y);
+
+	mutex_lock(&h2link->eml_lock);
+
+	hdaml_shim_map_stream_ch(pcmsycm, 0, hweight32(channel_mask),
+				 stream_id, dir);
+
+	mutex_unlock(&h2link->eml_lock);
+
+	val = readw(pcmsycm);
+
+	dev_dbg(bus->dev, "channel_mask %#x stream_id %d dir %d pcmscm %#x\n",
+		channel_mask, stream_id, dir, val);
+
+	return 0;
+} EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_map_stream_ch, SND_SOC_SOF_HDA_MLINK);
+
 void hda_bus_ml_put_all(struct hdac_bus *bus)
 {
 	struct hdac_ext_link *hlink;
-- 
2.37.2


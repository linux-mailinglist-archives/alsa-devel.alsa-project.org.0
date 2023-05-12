Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A90A3700E1C
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 19:49:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AACF2EAC;
	Fri, 12 May 2023 19:48:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AACF2EAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683913760;
	bh=kdPzUEGBiRONzOrtlvhSKrrsD3Yy1AgHk6Vy5KKO4L8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZxlSz7n6oL+ekomvrH3PQawmLWlbOXqQBAx4rMgypr9iVtZ1yw0kqnqXM4hF/sLNV
	 Es1EwLU1kNIrhyk28Bpe3heuboJjnBlS3I283C7Pn470AOiRVbbI/20kaubr1plE77
	 VD6crR5WPQAffM1G3mNqbG0nDJyxcqGWkylTkGGw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A1B5F80578; Fri, 12 May 2023 19:48:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46600F80578;
	Fri, 12 May 2023 19:48:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55FEBF8055C; Fri, 12 May 2023 19:46:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10CB1F8053B
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 19:46:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10CB1F8053B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VLNq4XAw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683913587; x=1715449587;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kdPzUEGBiRONzOrtlvhSKrrsD3Yy1AgHk6Vy5KKO4L8=;
  b=VLNq4XAwNL0Qjqp03Vo1SEqJkpuaI2N7HrzuFuJz/sqagYD1s69tq/YU
   kI/wFuz9yM18mw2HLNiI5+UU5egdAidA7z+fP+fCwjuYhb5OsbCe4mz59
   QGv4dslD4wY7zbg5NfSA/NXXi5MgdH0cEag0Hh0P8i08VW+4gd2PKH+/r
   mK/FCFIE7yo50eFnAebeEEOa2H2Q2DqC4g93XgkFZMt2cgEYy9eosfYR8
   c9BBYk3fTWn1B9AT5oxDj3jbqV27bteRSylbWBckrMcGI5pksD1pDkRC4
   vNp7SkSaFT/7A5qEfaxu1l/8Uv7aL4glMidoCDy7QH0AVKVIzgKgkprT8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="349688061"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="349688061"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:46:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="812167779"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="812167779"
Received: from winkelru-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.144.249])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:46:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 3/6] ASoC: SOF: Intel: hda-mlink: fix base_ptr computation
Date: Fri, 12 May 2023 12:46:08 -0500
Message-Id: <20230512174611.84372-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512174611.84372-1-pierre-louis.bossart@linux.intel.com>
References: <20230512174611.84372-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HZT4ASXCE7IBNGGYLGRYIDOEEOAGHCIF
X-Message-ID-Hash: HZT4ASXCE7IBNGGYLGRYIDOEEOAGHCIF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HZT4ASXCE7IBNGGYLGRYIDOEEOAGHCIF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The base_ptr value needs to be derived from the remap_addr pointer,
not the ml_addr. This base_ptr was used only in debug logs that were
so far not contributed upstream so the issue was not detected. It
needs to be fixed for SoundWire support on LunarLake.

Fixes: 17c9b6ec35c0 ("ASoC: SOF: Intel: hda-mlink: add structures to parse ALT links")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-mlink.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index cfa43d93cbd0..7f5d0ea4abeb 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -96,7 +96,7 @@ struct hdac_ext2_link {
  */
 
 static int hdaml_lnk_enum(struct device *dev, struct hdac_ext2_link *h2link,
-			  void __iomem *ml_addr, int link_idx)
+			  void __iomem *remap_addr, void __iomem *ml_addr, int link_idx)
 {
 	struct hdac_ext_link *hlink = &h2link->hext_link;
 	u32 base_offset;
@@ -136,7 +136,7 @@ static int hdaml_lnk_enum(struct device *dev, struct hdac_ext2_link *h2link,
 	h2link->elid = FIELD_GET(AZX_REG_ML_LEPTR_ID, h2link->leptr);
 
 	base_offset = FIELD_GET(AZX_REG_ML_LEPTR_PTR, h2link->leptr);
-	h2link->base_ptr = hlink->ml_addr + base_offset;
+	h2link->base_ptr = remap_addr + base_offset;
 
 	switch (h2link->elid) {
 	case AZX_REG_ML_LEPTR_ID_SDW:
@@ -369,7 +369,7 @@ static int hda_ml_alloc_h2link(struct hdac_bus *bus, int index)
 	hlink->bus = bus;
 	hlink->ml_addr = bus->mlcap + AZX_ML_BASE + (AZX_ML_INTERVAL * index);
 
-	ret = hdaml_lnk_enum(bus->dev, h2link, hlink->ml_addr, index);
+	ret = hdaml_lnk_enum(bus->dev, h2link, bus->remap_addr, hlink->ml_addr, index);
 	if (ret < 0) {
 		kfree(h2link);
 		return ret;
-- 
2.37.2


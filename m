Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4220D6E9DA
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 19:09:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDA3C16C0;
	Fri, 19 Jul 2019 19:09:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDA3C16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563556195;
	bh=ypAb3v+rYLXbvw2p+zsn1GBWEsYrDljmM/fIG0TOAsE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ioDhu0H1CO0SoDrfxcq+JyqFZuQnBmMXCAI/He7jddtSnqgAnaO4qx0DBGyLLIlUB
	 3ISPfWz42/ssycaZLKtNDijE2SBc1GmntzSacWs4FI/dd6SBleCOH/wcv/VdJcv/ss
	 1Lr4GcldJKog7GbLoNLmJNQvs07xETuB6QxklZWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AD06F80444;
	Fri, 19 Jul 2019 19:06:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66A58F803D7; Fri, 19 Jul 2019 19:06:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FCA8F80228
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 19:06:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FCA8F80228
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 10:06:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,283,1559545200"; d="scan'208";a="191982220"
Received: from cvrozas-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.190.38])
 by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2019 10:06:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 19 Jul 2019 12:06:08 -0500
Message-Id: <20190719170610.17610-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719170610.17610-1-pierre-louis.bossart@linux.intel.com>
References: <20190719170610.17610-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Drake <drake@endlessm.com>, Hui Wang <hui.wang@canonical.com>,
 Curtis Malainey <cujomalainey@google.com>, broonie@kernel.org
Subject: [alsa-devel] [PATCH 4/6] ALSA: hda: intel-nhlt: handle NHLT
	VENDOR_DEFINED DMIC geometry
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The NHLT spec defines a VENDOR_DEFINED geometry, which requires
reading additional information to figure out the number of
microphones.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/intel-nhlt.h | 10 ++++++++--
 sound/hda/intel-nhlt.c     |  6 +++++-
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/sound/intel-nhlt.h b/include/sound/intel-nhlt.h
index 857922f03931..f657fd8fc0ad 100644
--- a/include/sound/intel-nhlt.h
+++ b/include/sound/intel-nhlt.h
@@ -96,16 +96,22 @@ struct nhlt_resource_desc  {
 #define MIC_ARRAY_2CH 2
 #define MIC_ARRAY_4CH 4
 
-struct nhlt_tdm_config {
+struct nhlt_device_specific_config {
 	u8 virtual_slot;
 	u8 config_type;
 } __packed;
 
 struct nhlt_dmic_array_config {
-	struct nhlt_tdm_config tdm_config;
+	struct nhlt_device_specific_config device_config;
 	u8 array_type;
 } __packed;
 
+struct nhlt_vendor_dmic_array_config {
+	struct nhlt_dmic_array_config dmic_config;
+	u8 nb_mics;
+	/* TODO add vendor mic config */
+} __packed;
+
 enum {
 	NHLT_MIC_ARRAY_2CH_SMALL = 0xa,
 	NHLT_MIC_ARRAY_2CH_BIG = 0xb,
diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
index 7ba871e470f2..441ee39520a8 100644
--- a/sound/hda/intel-nhlt.c
+++ b/sound/hda/intel-nhlt.c
@@ -58,6 +58,7 @@ int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
 {
 	struct nhlt_endpoint *epnt;
 	struct nhlt_dmic_array_config *cfg;
+	struct nhlt_vendor_dmic_array_config *cfg_vendor;
 	unsigned int dmic_geo = 0;
 	u8 j;
 
@@ -81,7 +82,10 @@ int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
 			case NHLT_MIC_ARRAY_4CH_2ND_GEOM:
 				dmic_geo = MIC_ARRAY_4CH;
 				break;
-
+			case NHLT_MIC_ARRAY_VENDOR_DEFINED:
+				cfg_vendor = (struct nhlt_vendor_dmic_array_config *)cfg;
+				dmic_geo = cfg_vendor->nb_mics;
+				break;
 			default:
 				dev_warn(dev, "undefined DMIC array_type 0x%0x\n",
 					 cfg->array_type);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

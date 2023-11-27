Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C387F9F40
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 13:07:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3779AA4B;
	Mon, 27 Nov 2023 13:07:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3779AA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701086871;
	bh=FmZHUbgfxcD8wfSdcyZNeRwAwPqOZS+OqQ2TAzPCkmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HYHGg2FuzpBH9qk4tju7fTf9/mFLZSbzSiv2kevT9WcFF7kBH35Q4FXpeUTEDM62w
	 XuTHnSfFwLDwgKOuwBekTVWBVBG2abMbwMHE9JnPKESpFA7eCxGJmWz1l90K/Z3Y8K
	 o5EZv2ATbl9NNrTmTYosefbeyrXloqPVrlFQeQjQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F049F805E4; Mon, 27 Nov 2023 13:06:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2F30F805E7;
	Mon, 27 Nov 2023 13:06:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EAB7F801D5; Mon, 27 Nov 2023 13:06:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3959DF8016E
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 13:06:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3959DF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JEpiLW10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701086794; x=1732622794;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FmZHUbgfxcD8wfSdcyZNeRwAwPqOZS+OqQ2TAzPCkmE=;
  b=JEpiLW10+ByHdOh7kP0MJG1x+aVwylrqUMGFxezi0t+1Xn9HZKjDrYHe
   BQd5gfG/8gIlhdID1vtlKAsFu3FofRANqKZfnj3qzSOgGl2R/mA12Zu5C
   tUGqjjRsOeSXdet5X/r5sukomX1WAf0hFrnM7GO6T/sVCCXLd/DNjBwYV
   3ap+7CSB1VCD4N1z2CZkgr66lFG6R5qM3BI9c6oAxnegvbTbnOfB0NbSU
   kqNMEZosoiprs9B7rlv3MaXKG70GoLzzkpfgQR8f4ycmopbdKu7A3wqHb
   I5bgJH0Y//O//3UhpQBEUiDrj3YkS9gSNc2xyS834xgfD/Ohog03LtjDk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="14249602"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600";
   d="scan'208";a="14249602"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 04:06:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="859035573"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600";
   d="scan'208";a="859035573"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 04:06:25 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	brent.lu@intel.com
Subject: [PATCH 1/2] ALSA: hda: intel-nhlt: add intel_nhlt_ssp_device_type()
 function
Date: Mon, 27 Nov 2023 14:06:56 +0200
Message-ID: <20231127120657.19764-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127120657.19764-1-peter.ujfalusi@linux.intel.com>
References: <20231127120657.19764-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M2UGEVWCHRGQ3R4A2U47TIQB53L6SK4M
X-Message-ID-Hash: M2UGEVWCHRGQ3R4A2U47TIQB53L6SK4M
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M2UGEVWCHRGQ3R4A2U47TIQB53L6SK4M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add a helper function intel_nhlt_ssp_device_type() to detect the type
of specific SSP port. The result is nhlt_device_type enum type which
could be NHLT_DEVICE_BT or NHLT_DEVICE_I2S.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/intel-nhlt.h | 10 ++++++++++
 sound/hda/intel-nhlt.c     | 26 ++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/include/sound/intel-nhlt.h b/include/sound/intel-nhlt.h
index 53470d6a28d6..24dbe16684ae 100644
--- a/include/sound/intel-nhlt.h
+++ b/include/sound/intel-nhlt.h
@@ -143,6 +143,9 @@ intel_nhlt_get_endpoint_blob(struct device *dev, struct nhlt_acpi_table *nhlt,
 			     u32 bus_id, u8 link_type, u8 vbps, u8 bps,
 			     u8 num_ch, u32 rate, u8 dir, u8 dev_type);
 
+int intel_nhlt_ssp_device_type(struct device *dev, struct nhlt_acpi_table *nhlt,
+			       u8 virtual_bus_id);
+
 #else
 
 static inline struct nhlt_acpi_table *intel_nhlt_init(struct device *dev)
@@ -184,6 +187,13 @@ intel_nhlt_get_endpoint_blob(struct device *dev, struct nhlt_acpi_table *nhlt,
 	return NULL;
 }
 
+static inline int intel_nhlt_ssp_device_type(struct device *dev,
+					     struct nhlt_acpi_table *nhlt,
+					     u8 virtual_bus_id)
+{
+	return -EINVAL;
+}
+
 #endif
 
 #endif
diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
index 2c4dfc0b7e34..67d3e834c647 100644
--- a/sound/hda/intel-nhlt.c
+++ b/sound/hda/intel-nhlt.c
@@ -318,3 +318,29 @@ intel_nhlt_get_endpoint_blob(struct device *dev, struct nhlt_acpi_table *nhlt,
 	return NULL;
 }
 EXPORT_SYMBOL(intel_nhlt_get_endpoint_blob);
+
+int intel_nhlt_ssp_device_type(struct device *dev, struct nhlt_acpi_table *nhlt,
+			       u8 virtual_bus_id)
+{
+	struct nhlt_endpoint *epnt;
+	int i;
+
+	if (!nhlt)
+		return -EINVAL;
+
+	epnt = (struct nhlt_endpoint *)nhlt->desc;
+	for (i = 0; i < nhlt->endpoint_count; i++) {
+		/* for SSP link the virtual bus id is the SSP port number */
+		if (epnt->linktype == NHLT_LINK_SSP &&
+		    epnt->virtual_bus_id == virtual_bus_id) {
+			dev_dbg(dev, "SSP%d: dev_type=%d\n", virtual_bus_id,
+				epnt->device_type);
+			return epnt->device_type;
+		}
+
+		epnt = (struct nhlt_endpoint *)((u8 *)epnt + epnt->length);
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL(intel_nhlt_ssp_device_type);
-- 
2.43.0


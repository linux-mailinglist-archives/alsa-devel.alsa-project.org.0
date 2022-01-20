Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CD64956F2
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 00:23:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 660542E10;
	Fri, 21 Jan 2022 00:23:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 660542E10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642721036;
	bh=uH2kXM/iq8U6IPuFRmIvgFpDnlbRgD+EJlBLvo/JR9c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QdXRCA+T56LycKC6aSw9g9OLMbKBdX35WVz1fU3e1lFNzk44R6I/5aztdvAeKF6CP
	 ikvQnMEw0iiLJWEEqhExF6GIMqZOK9sfcfKFoQRQnmF0bnCOVPNu0pbRqkjMpx9Ouo
	 k6sVREVb/hMqr5bkJWFZ1YNPZEpMzR8icIVYff+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8C4BF80510;
	Fri, 21 Jan 2022 00:22:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B72D9F804BB; Fri, 21 Jan 2022 00:22:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D18EF80248
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 00:22:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D18EF80248
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LroJXjV8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642720934; x=1674256934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uH2kXM/iq8U6IPuFRmIvgFpDnlbRgD+EJlBLvo/JR9c=;
 b=LroJXjV8FwtdNcWHXKvntEOhfJEeJopJ+C/dyYDO1pj7peuVGu+n4iOm
 ltTOxRb6kyDNFxrh2VYzppMbNJ2i1PQMnroWHG0ISm/b3+JCMSsAknM5e
 Vzx0Iu5gtRIUwST5wmBux4+GHSqx1r/eZHfl01BQBUby+mFiKSfd8smCf
 lnRI3hdGr6XiPyyXgzYTM2LiId7uQLoxVAponBK/c2rA7OEx1kpXo52GQ
 N0DX3RESJ15BcWYx6G+uQX294cb+GEB8hRpcBrxUN8ZWLlAzyevEECoh1
 srcvKmrg3UqTWnpOOqSQKSYvEVpzTSkAxj/DHdvCle4mIyqOSSmT+KhgW Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="269926958"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="269926958"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:22:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="493637728"
Received: from sthambit-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.44])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:22:07 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: SOF: Intel: Compare sdw adr directly
Date: Thu, 20 Jan 2022 17:21:57 -0600
Message-Id: <20220120232157.199919-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120232157.199919-1-pierre-louis.bossart@linux.intel.com>
References: <20220120232157.199919-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, vkoul@kernel.org, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

We can exclude the sdw unique id and compare the sdw adr directly when
we are finding out identical parts.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 67936be54ef7..8f6765317cfa 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1179,6 +1179,10 @@ static void hda_generic_machine_select(struct snd_sof_dev *sdev,
 #endif
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
+
+#define SDW_CODEC_ADR_MASK(_adr) ((_adr) & (SDW_DISCO_LINK_ID_MASK | SDW_VERSION_MASK | \
+				  SDW_MFG_ID_MASK | SDW_PART_ID_MASK))
+
 /* Check if all Slaves defined on the link can be found */
 static bool link_slaves_found(struct snd_sof_dev *sdev,
 			      const struct snd_soc_acpi_link_adr *link,
@@ -1220,17 +1224,8 @@ static bool link_slaves_found(struct snd_sof_dev *sdev,
 			/* find out how many identical parts are expected */
 			for (k = 0; k < link->num_adr; k++) {
 				u64 adr2 = link->adr_d[k].adr;
-				unsigned int part_id2, link_id2, mfg_id2, version2;
-
-				mfg_id2 = SDW_MFG_ID(adr2);
-				part_id2 = SDW_PART_ID(adr2);
-				link_id2 = SDW_DISCO_LINK_ID(adr2);
-				version2 = SDW_VERSION(adr2);
 
-				if (link_id2 == link_id &&
-				    part_id2 == part_id &&
-				    mfg_id2 == mfg_id &&
-				    version2 == version)
+				if (SDW_CODEC_ADR_MASK(adr2) == SDW_CODEC_ADR_MASK(adr))
 					expected_part_count++;
 			}
 
-- 
2.25.1


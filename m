Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB94976A2EC
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:35:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27BDB1E7;
	Mon, 31 Jul 2023 23:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27BDB1E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690839321;
	bh=2n4TKU74rNZYfrXBq3UHEWB8asICu7rlCFS/IZE4mMI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oT1NVwJqEBjk91to/n+x0Bvy8KDVH2MQaqskFfOICj+VHwFn18jEYx2HcJKfjT/xH
	 rq9EcQGp3hUMzZFJQOsv7/9DTrPTRJieyisYkUi/yJ/gm+u0zSPv4EfEjx1Hc7O3Yn
	 SR00EvnyOc1vRZ6eZwo0E2jCFls9x8bRNvREXPqw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B228BF805A9; Mon, 31 Jul 2023 23:33:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBC1AF80587;
	Mon, 31 Jul 2023 23:33:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 046D1F80552; Mon, 31 Jul 2023 23:33:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4832EF8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:33:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4832EF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Uys6oPyR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839186; x=1722375186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2n4TKU74rNZYfrXBq3UHEWB8asICu7rlCFS/IZE4mMI=;
  b=Uys6oPyRlfxMtGns8PU8erzCdTwA+7jynE48eWQd3oxTT0Cb0n6sjBvg
   51VozyTaI1FgQCf6zXvrI9FHsuYVsQfYcMXdu0AaKrt+9qQPcReeqUcRj
   1tvYOtd4PK3jA05jJxCRhpFrW/uUwefKh/muqvo7v5PoBiEKRASw922un
   PQ+NbkeLC0hQEZX5bj9hYqDpNEPjipJrdAQ0WdJCrL3/EQX2I4sQtLpM0
   esfEsCJskFr+zOtqff9gBDrGbsXhU1aPOFZBt3x1c1LWQ0tAsizvOTItc
   BCfNZKmY6ok3jQOrnHhryehsJ4qzBS+VFVtWNOgfkvYpXMdb5PVOGSyWN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435447498"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="435447498"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:33:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="731708896"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="731708896"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:33:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 1/6] ASoC: SOF: Intel: start simplify the signature of
 link_slaves_found()
Date: Mon, 31 Jul 2023 16:32:37 -0500
Message-Id: <20230731213242.434594-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731213242.434594-1-pierre-louis.bossart@linux.intel.com>
References: <20230731213242.434594-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3E2BXDJKMHY635HHG2XJLR2ZO5WBH7CX
X-Message-ID-Hash: 3E2BXDJKMHY635HHG2XJLR2ZO5WBH7CX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3E2BXDJKMHY635HHG2XJLR2ZO5WBH7CX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Start removing Intel-specific arguments to make that function usable
by other SOC vendors.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 64bebe1a72bb..6d9fafb58581 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1433,13 +1433,11 @@ static void hda_generic_machine_select(struct snd_sof_dev *sdev,
 				  SDW_MFG_ID_MASK | SDW_PART_ID_MASK))
 
 /* Check if all Slaves defined on the link can be found */
-static bool link_slaves_found(struct snd_sof_dev *sdev,
+static bool link_slaves_found(struct device *dev,
 			      const struct snd_soc_acpi_link_adr *link,
-			      struct sdw_intel_ctx *sdw)
+			      struct sdw_intel_slave_id *ids,
+			      int num_slaves)
 {
-	struct hdac_bus *bus = sof_to_bus(sdev);
-	struct sdw_intel_slave_id *ids = sdw->ids;
-	int num_slaves = sdw->num_slaves;
 	unsigned int part_id, link_id, unique_id, mfg_id, version;
 	int i, j, k;
 
@@ -1487,19 +1485,16 @@ static bool link_slaves_found(struct snd_sof_dev *sdev,
 				unique_id = SDW_UNIQUE_ID(adr);
 				if (reported_part_count == 1 ||
 				    ids[j].id.unique_id == unique_id) {
-					dev_dbg(bus->dev, "found %x at link %d\n",
-						part_id, link_id);
+					dev_dbg(dev, "found %x at link %d\n", part_id, link_id);
 					break;
 				}
 			} else {
-				dev_dbg(bus->dev, "part %x reported %d expected %d on link %d, skipping\n",
+				dev_dbg(dev, "part %x reported %d expected %d on link %d, skipping\n",
 					part_id, reported_part_count, expected_part_count, link_id);
 			}
 		}
 		if (j == num_slaves) {
-			dev_dbg(bus->dev,
-				"Slave %x not found\n",
-				part_id);
+			dev_dbg(dev, "Slave %x not found\n", part_id);
 			return false;
 		}
 	}
@@ -1549,7 +1544,7 @@ static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev
 				 * Try next machine if any expected Slaves
 				 * are not found on this link.
 				 */
-				if (!link_slaves_found(sdev, link, hdev->sdw))
+				if (!link_slaves_found(sdev->dev, link, hdev->sdw->ids, hdev->sdw->num_slaves))
 					break;
 			}
 			/* Found if all Slaves are checked */
-- 
2.39.2


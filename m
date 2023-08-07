Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAD6773118
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 23:17:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01C4DDF4;
	Mon,  7 Aug 2023 23:16:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01C4DDF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691443029;
	bh=pNWpos7GtI6st8TwWGN2NHPfdqHdm70wE//qIN5/vb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZfLM3+t5XrHtJkYvYXixUVxI9HV5i5aO/kQiAFrQcJm3ReMbj4WwOKjFzS0NUmtm8
	 CmhUAK81mW8fCzorQosNsBUc59YupQEdt73YR8X8foPrO4NXZQAHFGNgJLtlxHjc/N
	 dryhw4TTP8Qhb1I4hkbHefP16hbeYky0aFRb58ok=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EE52F8067D; Mon,  7 Aug 2023 23:11:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83F6FF8067D;
	Mon,  7 Aug 2023 23:11:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E3E5F805D4; Mon,  7 Aug 2023 23:10:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6E93F80578
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 23:10:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6E93F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HSUBaMow
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691442630; x=1722978630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pNWpos7GtI6st8TwWGN2NHPfdqHdm70wE//qIN5/vb0=;
  b=HSUBaMow4e/KrPsFL7FQo5FWkcomu0ait9Xb0aBa6VtvM0qUDtCh43yL
   XAHZSVuZuyEQgSZw7uF8mgUB1Ltyg0XqxEyrrDKKa4mRvBFjMCQ0DrOMM
   xXcXYjySfYdPrtw2h4/jrSjZ2BeaFWXmFGaNLyWkr8x1jEteNbzsdDSE1
   vg5lgxaLM7k7nZRpbs+0b3Mv9AnpLqix02lDmrZXMYonhxyMhOC1fTFxa
   YSzjnunUGV5DbrUN3/VP3NCd6FPqKYEa1niNCOOCWtDcvbfEjtDPblN9V
   6v0naAu9r7NYLMELezdQE4/0rE11x1138vxhTzDiZ+NdUHHXvDl2nhiyZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350244399"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="350244399"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796465267"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="796465267"
Received: from hweelee-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.181.215])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 20/20] ASoC: SOF: Intel: hda-mlink: add sublink to dev_dbg()
 log
Date: Mon,  7 Aug 2023 16:09:59 -0500
Message-Id: <20230807210959.506849-21-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
References: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 267G6RU6ZYBUQSL5W7TW2YC4GKOUKLH3
X-Message-ID-Hash: 267G6RU6ZYBUQSL5W7TW2YC4GKOUKLH3
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When using more than one sublink for amplifier aggregation, we need to
add the sublink info to debug the programming sequences.

No functional change, only additional precisions in the log.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-mlink.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index 9fbbcc1744db..b592e687a87a 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -831,8 +831,8 @@ int hdac_bus_eml_sdw_map_stream_ch(struct hdac_bus *bus, int sublink, int y,
 
 	val = readw(pcmsycm);
 
-	dev_dbg(bus->dev, "channel_mask %#x stream_id %d dir %d pcmscm %#x\n",
-		channel_mask, stream_id, dir, val);
+	dev_dbg(bus->dev, "sublink %d channel_mask %#x stream_id %d dir %d pcmscm %#x\n",
+		sublink, channel_mask, stream_id, dir, val);
 
 	return 0;
 } EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_map_stream_ch, SND_SOC_SOF_HDA_MLINK);
-- 
2.39.2


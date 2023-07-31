Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1691E76A2E9
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:34:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4186982A;
	Mon, 31 Jul 2023 23:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4186982A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690839298;
	bh=Qisg1jzvkj1V1v1DiOJVrF1PE0elLuMSX6vPM5oWG/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GzggRQ2NauWkJ3OQBNWtfBYNHhDapCD0VZBtMAriEklyTPUFi0f+OKQURXOV7Xghf
	 E/6lhLTvidSPdgv+qgK1nhFSk3uxgcLtMl5TLlQrFnUDnAKiwxfAwTFpXnx/q8qBvv
	 ujEQyWmv+CoiYhNYMVdL2MErkhUnJt/uFnGpL9qk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5866F80564; Mon, 31 Jul 2023 23:33:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CD5DF80552;
	Mon, 31 Jul 2023 23:33:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CF5EF80535; Mon, 31 Jul 2023 23:33:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A179DF80163
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:33:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A179DF80163
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Bnee8Yqw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839188; x=1722375188;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qisg1jzvkj1V1v1DiOJVrF1PE0elLuMSX6vPM5oWG/U=;
  b=Bnee8YqwxtBPTyrGVWtMWT65dODQlZPwZ45n41I9ykJ59bh9FqLM+Uno
   Nk57eU3M13duULL0W6swkvPxY4vjSCBCHT3p5XTgWQxe2ekDlqZps6Qic
   JeLwRlRv7MvgsI8+fM7qQfw5X+qGSS4/nZnCqWiJdd15H/RlYozU7rxAq
   SDbqxlYdqt8z/o50HDzjKqHmpz0okECf2OI41FHDAstaplQDshxfEOdzd
   XXVsiAdFMd4DPtyBfS3RHHlncwtDP9LFm9oZ34MFQTML7RvQcb38lW/82
   Jc4I8Knv9E8zqq/peVrCcLBhA8bAmuz4TAMa6Igjade57pY+VAh0WM3CM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435447515"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="435447515"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:33:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="731708907"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="731708907"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:33:04 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 3/6] ASoC: soc-acpi: improve log messagesin
 link_slaves_found()
Date: Mon, 31 Jul 2023 16:32:39 -0500
Message-Id: <20230731213242.434594-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731213242.434594-1-pierre-louis.bossart@linux.intel.com>
References: <20230731213242.434594-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VS75M2STLQXGWJD3LX6WYPAPCLC6ZSIT
X-Message-ID-Hash: VS75M2STLQXGWJD3LX6WYPAPCLC6ZSIT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VS75M2STLQXGWJD3LX6WYPAPCLC6ZSIT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

use 'part_id' to follow MIPI/SoundWire wording and use more consistent
%#x format.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/soc-acpi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-acpi.c b/sound/soc/soc-acpi.c
index 9319e9b2a033..6d693b2ad5a3 100644
--- a/sound/soc/soc-acpi.c
+++ b/sound/soc/soc-acpi.c
@@ -181,16 +181,16 @@ bool snd_soc_acpi_sdw_link_slaves_found(struct device *dev,
 				unique_id = SDW_UNIQUE_ID(adr);
 				if (reported_part_count == 1 ||
 				    ids[j].id.unique_id == unique_id) {
-					dev_dbg(dev, "found %x at link %d\n", part_id, link_id);
+					dev_dbg(dev, "found part_id %#x at link %d\n", part_id, link_id);
 					break;
 				}
 			} else {
-				dev_dbg(dev, "part %x reported %d expected %d on link %d, skipping\n",
+				dev_dbg(dev, "part_id %#x reported %d expected %d on link %d, skipping\n",
 					part_id, reported_part_count, expected_part_count, link_id);
 			}
 		}
 		if (j == num_slaves) {
-			dev_dbg(dev, "Slave %x not found\n", part_id);
+			dev_dbg(dev, "Slave part_id %#x not found\n", part_id);
 			return false;
 		}
 	}
-- 
2.39.2


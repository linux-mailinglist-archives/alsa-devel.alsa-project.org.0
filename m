Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B27176A348
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:48:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B131FE7B;
	Mon, 31 Jul 2023 23:47:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B131FE7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690840124;
	bh=s/h/nHDpyPDzg5v9orQjSPWTTnDelCpj81jdq4JEjHY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ciNielCLTrU07XhWFF2PGj8hRfu2rFYijxz2I3fh0oAeXuowevtcrw4cvhKnwXF3e
	 B5c4cPapL/ErTEpjTnfLCsJ4n3ze6tTwTQAE6Mjm2vzmxHAXTW5fK+K5Iig04/8ORf
	 S3bcqOQLw8AyCG4v3a6hukf7/7N9J6dhE53ZrLjU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD53FF80551; Mon, 31 Jul 2023 23:44:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1DA5F8061E;
	Mon, 31 Jul 2023 23:44:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C4A3F805B4; Mon, 31 Jul 2023 23:43:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09830F8055C
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09830F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=b/+9ULOX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839801; x=1722375801;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s/h/nHDpyPDzg5v9orQjSPWTTnDelCpj81jdq4JEjHY=;
  b=b/+9ULOXU9CYN6Yqhj2lOODEDP31Fu1zL8fRmBrHbxpx39qK/p79a2aV
   GbjuNZbVzUdupymeaj29NeecP8nTuXVgYXM+0N8XhIA1nShCvu67/CuuS
   9WKJC+3R9zUbGwGS4o+ZxSn3N/JuyvHQhn1ce/q3a5FnxEf+e6J3jfndf
   PJmgQjnl6Fcf7pIMX5ZOV0dQXy5ktif1xF4jwDn1mapTDs7Q8q31FFcZH
   uJO+9SrY5LYCsM1Imtn6StKbD5oxaN9dW5NwBhu26nWHrCF+7z/gMuxgy
   LPVL2nAL/GUxTqlYFZk6o1ZkUrtAYiyPF2kt8VLfcy7gEH8Z3PQcxp20Q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435449779"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="435449779"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763523552"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="763523552"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 13/23] ASoC: intel: sof_sdw: Simplify find_codec_info_acpi
Date: Mon, 31 Jul 2023 16:42:47 -0500
Message-Id: <20230731214257.444605-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
References: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DLWWOH5HAVEU6TLYPOX4ZBTJSONYZE64
X-Message-ID-Hash: DLWWOH5HAVEU6TLYPOX4ZBTJSONYZE64
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DLWWOH5HAVEU6TLYPOX4ZBTJSONYZE64/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Use a return rather than a break and an additional range check.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 6b55bcdccccc..d3222f40d798 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1003,14 +1003,10 @@ static inline int find_codec_info_acpi(const u8 *acpi_id)
 		return -EINVAL;
 
 	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
-		if (!memcmp(codec_info_list[i].acpi_id, acpi_id,
-			    ACPI_ID_LEN))
-			break;
+		if (!memcmp(codec_info_list[i].acpi_id, acpi_id, ACPI_ID_LEN))
+			return i;
 
-	if (i == ARRAY_SIZE(codec_info_list))
-		return -EINVAL;
-
-	return i;
+	return -EINVAL;
 }
 
 /*
-- 
2.39.2


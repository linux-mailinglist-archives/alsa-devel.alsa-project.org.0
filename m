Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2A788C8BC
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:14:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5FABE7F;
	Tue, 26 Mar 2024 17:13:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5FABE7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469648;
	bh=O+Ky+A2ECkzCjjUcmHynmaUbtkzO/Mm/j1upGJTjpl4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sgkH4FKu8v2htUY/AZcD0XMWgA+J/Hp/MsjEmYzWuTVvLuaoe9tKDXex2XIogFgD4
	 NHtgINqpeRdHmxo8aGtzfdXpM3no0aqOlIFh9OhUqKUBsd60Zcz8srC9GbM5zmgqGu
	 JwLo6GbQpVDvazHKN/PCTa4eMq7CTgzEqrvk4HMs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1C94F897CC; Tue, 26 Mar 2024 17:07:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23C32F897C6;
	Tue, 26 Mar 2024 17:07:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48884F80858; Tue, 26 Mar 2024 17:06:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2D0EF805C5
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2D0EF805C5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Aexyoe8w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469161; x=1743005161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O+Ky+A2ECkzCjjUcmHynmaUbtkzO/Mm/j1upGJTjpl4=;
  b=Aexyoe8wxKpJlsmsQXbPQ7BGSq7C3WJgrM2Qa8Rp/VU2/EC3e4y/jolv
   9JVamzPdFGn8+IZsv1+3FJyYofuQkDLFcW8bPwEPVZqkSe4B63gK3z5FS
   gCOUxABzwdws4vmvv/sLNDzLfxefEf/EOXiNFBSISHWixmxpI6plu1qid
   OeRjuRiMZggVsvR3BsJS7EoTiUAfVf3c2OBjSOpowKm02osRg/SkwVHkZ
   QKQnmq1WFcDn7tyZMquBHOexJQseoYn2lgKgaxhc9jXp0UJ1m2L2Eu0vT
   ycXl7rOUoU30c7xhM2RAwjQKUttnB+cDkRUbHx+SandMeKajCEJ6ikncz
   w==;
X-CSE-ConnectionGUID: Cod/0pEYS/ioknsSQpTW+w==
X-CSE-MsgGUID: jLQtq8acQVW3RVA/IbpEeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260551"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260551"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:05:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482479"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:05:04 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Chao Song <chao.song@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 30/34] ASoC: Intel: change cs35l56 name_prefix
Date: Tue, 26 Mar 2024 11:04:25 -0500
Message-Id: <20240326160429.13560-31-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3VPR2TCHW4NFSPQD7LGMKD2MIDTTQOU2
X-Message-ID-Hash: 3VPR2TCHW4NFSPQD7LGMKD2MIDTTQOU2
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3VPR2TCHW4NFSPQD7LGMKD2MIDTTQOU2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

To use sequential amp numbers. I,e, AMP1, AMP2, AMP3, AMP4

Reviewed-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 4 ++--
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index e06efc5b1457..7e53266d831d 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -373,13 +373,13 @@ static const struct snd_soc_acpi_adr_device cs35l56_1_adr[] = {
 		.adr = 0x00013701FA355601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
-		.name_prefix = "AMP8"
+		.name_prefix = "AMP3"
 	},
 	{
 		.adr = 0x00013601FA355601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_3_endpoint,
-		.name_prefix = "AMP7"
+		.name_prefix = "AMP4"
 	}
 };
 
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 007f1ac2327a..0cef3d788a5b 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -464,13 +464,13 @@ static const struct snd_soc_acpi_adr_device cs35l56_1_adr[] = {
 		.adr = 0x00013701FA355601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
-		.name_prefix = "AMP8"
+		.name_prefix = "AMP3"
 	},
 	{
 		.adr = 0x00013601FA355601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_2_endpoint,
-		.name_prefix = "AMP7"
+		.name_prefix = "AMP4"
 	}
 };
 
-- 
2.40.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2912A48D629
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 11:57:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C18A21F29;
	Thu, 13 Jan 2022 11:56:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C18A21F29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642071434;
	bh=K42JSa+QW3UaIuzTP0hhO/S5VNVEbXBxl5jgOoJNEY8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bCLr1EUN/POqotVKWdruPj2mTbz+nOuERnoLTfmInquejk6BF+2GUN081ofbkmEVn
	 eLEmUoFpeH3bnIVl3xrjxI2MQWABbd5UQ4BWFTalfCQI6dvAHfoVqbuNpt2CNiM1nZ
	 P8RmjS84U/prAUYfSCR7QOgJ8F4qKvFnV19ixIOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBB43F804F2;
	Thu, 13 Jan 2022 11:55:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84CE3F804B1; Thu, 13 Jan 2022 11:55:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03DBFF8013F
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 11:55:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03DBFF8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bohM54fW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642071326; x=1673607326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K42JSa+QW3UaIuzTP0hhO/S5VNVEbXBxl5jgOoJNEY8=;
 b=bohM54fW1u0GlChU0kb7r9HOxDq+e8EDaUIxmEGSA7lDf0cJNxrnXHL2
 +pRmgiWN9svNfD7Oa/i5+Kpj2IFGFs+fmsmmHm6Ze0pWBfpYdqvLiaut4
 yw83nnXoM+k4p0Sm8vFXZNOnOwCLJ+4QsRHwzQOCssNqggfzPTIoVZu59
 PU+l0SMkCdNPlAQM+4m3Zsq+jSCRfFgCodo/j4X+ZyN30QfXLwb4dK8qQ
 +gYyb0b6oXRUWxQPJx4etq83OrU/YGLXEkzF0HF9drKv+zQd2I7nYRNFx
 kSMDzyOrCIxZXb2puTK0gYeUGqxLGP03GzkfODaCW2V9SNoTdS5txQxb9 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="330332920"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="330332920"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 02:55:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="475267073"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.25])
 by orsmga006.jf.intel.com with ESMTP; 13 Jan 2022 02:55:21 -0800
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/2] ALSA: hda: intel-dsp-config: reorder the config table
Date: Thu, 13 Jan 2022 18:52:20 +0800
Message-Id: <20220113105220.1114694-3-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113105220.1114694-1-brent.lu@intel.com>
References: <20220113105220.1114694-1-brent.lu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Bard Liao <bard.liao@intel.com>
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

Entries without dmi_table nor codec_hid field need to be placed after
entries with these two fields or they will be always selected.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/hda/intel-dsp-config.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 3a3026fa4a17..4fb90ceb4053 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -249,13 +249,13 @@ static const struct config_entry config_table[] = {
 		}
 	},
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF,
 		.device = 0x02c8,
+		.codec_hid = "ESSX8336",
 	},
 	{
-		.flags = FLAG_SOF,
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x02c8,
-		.codec_hid = "ESSX8336",
 	},
 /* Cometlake-H */
 	{
@@ -278,14 +278,14 @@ static const struct config_entry config_table[] = {
 		}
 	},
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x06c8,
-	},
-		{
 		.flags = FLAG_SOF,
 		.device = 0x06c8,
 		.codec_hid = "ESSX8336",
 	},
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.device = 0x06c8,
+	},
 #endif
 
 /* Icelake */
@@ -351,17 +351,17 @@ static const struct config_entry config_table[] = {
 		}
 	},
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.flags = FLAG_SOF,
 		.device = 0xa0c8,
+		.codec_hid = "ESSX8336",
 	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x43c8,
+		.device = 0xa0c8,
 	},
 	{
-		.flags = FLAG_SOF,
-		.device = 0xa0c8,
-		.codec_hid = "ESSX8336",
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.device = 0x43c8,
 	},
 #endif
 
-- 
2.25.1


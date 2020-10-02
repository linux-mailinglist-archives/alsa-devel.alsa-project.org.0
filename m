Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85355281D96
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 23:23:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA9B31AE9;
	Fri,  2 Oct 2020 23:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA9B31AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601673779;
	bh=4FeaDq5HuaKwDNFKjHPR8zlLXx66MEqwVfArDQdUPDU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JsssPLb0WfjbJ1X9ssh2Zt2Ie3gaGhIhMgwgwzpqCOc4r4aSV4YksjiyUrVUa5mOa
	 Eg8zAkF1xhxvwY0FEvU8w1DChANy93F2qXOMguBrx4csS5PCGVYaXg5FwYov36qqpO
	 brF1E65JBaqfGI/jVETTyutmhG+7bprk9rZRYKfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEF8CF802F7;
	Fri,  2 Oct 2020 23:19:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D7FEF801F9; Fri,  2 Oct 2020 23:19:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7CC9F80247
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 23:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7CC9F80247
IronPort-SDR: 0LqQMZSW9w6lL7Q6YJPtM3PpjWQdn0uLbFHNtdUI8GFJFOZL7693qKzJfCf5DpssPj0EHvWt0q
 Wxylx+QzjaVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9762"; a="247823965"
X-IronPort-AV: E=Sophos;i="5.77,329,1596524400"; d="scan'208";a="247823965"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2020 14:19:19 -0700
IronPort-SDR: kQU+Ws2BkNoqLUrqGj0NM4GFprvNPaenr3sX89/Yo1UqSicEVjZXdXLfrDAXCvEX8H1iQknAl9
 l/JBNlyAVdMw==
X-IronPort-AV: E=Sophos;i="5.77,329,1596524400"; d="scan'208";a="346580620"
Received: from johnthom-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.158.101])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2020 14:19:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: Intel: sof_sdw: add version_id to avoid rt714/rt715
 confusion
Date: Fri,  2 Oct 2020 16:19:02 -0500
Message-Id: <20201002211902.287692-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201002211902.287692-1-pierre-louis.bossart@linux.intel.com>
References: <20201002211902.287692-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jack Yu <jack.yu@realtek.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

RT715 and RT714 are essentially the same chip. In addition, there are
two versions, one supporting SoundWire 1.1 and one supporting
SoundWire 1.2 (SDCA).

The previous configurations assumed that RT714 was SDCA-only, which
isn't correct. Add support for the 4 possible combinations to avoid
confusions.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Jack Yu <jack.yu@realtek.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b56df04775c2..b29946eb4355 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -295,12 +295,28 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x714,
+		.version_id = 3,
+		.direction = {false, true},
+		.dai_name = "rt715-aif2",
+		.init = sof_sdw_rt715_sdca_init,
+	},
+	{
+		.part_id = 0x715,
+		.version_id = 3,
 		.direction = {false, true},
 		.dai_name = "rt715-aif2",
 		.init = sof_sdw_rt715_sdca_init,
 	},
+	{
+		.part_id = 0x714,
+		.version_id = 2,
+		.direction = {false, true},
+		.dai_name = "rt715-aif2",
+		.init = sof_sdw_rt715_init,
+	},
 	{
 		.part_id = 0x715,
+		.version_id = 2,
 		.direction = {false, true},
 		.dai_name = "rt715-aif2",
 		.init = sof_sdw_rt715_init,
-- 
2.25.1


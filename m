Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 339CB669543
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 12:15:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB5A8A75B;
	Fri, 13 Jan 2023 12:14:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB5A8A75B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673608506;
	bh=u9Olfq2Pt2bSzqUBvW/JFgJj6atpdsbc6jOARXZpQlA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=uLyZ9WTLvjqsIxk/GQibVxOgGhTqpoTz5vPVZ2Jr4tGByWnLWhjMXzXBO7sgt+UvD
	 d5jODkN/ISj9xoWoOSZJY8TyeQooXIT8U3IZVH5c6S1A/SmtUxOwZ7v/gMBBq3T0zJ
	 zTZFDJ1MJnI8Hfl4hqH/k3PN4qeW4siZ+Tpx1fjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62BC9F80542;
	Fri, 13 Jan 2023 12:13:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74A98F80425; Fri, 13 Jan 2023 12:13:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EFB6F80539
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 12:13:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EFB6F80539
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LoAi2Fxg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673608406; x=1705144406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u9Olfq2Pt2bSzqUBvW/JFgJj6atpdsbc6jOARXZpQlA=;
 b=LoAi2FxggH+RxRjJKccgcOMRlgZ2UI816mtyRCU6XCe/REUG1ZC4Rx1i
 EhPpEPbpEtjdL+AKXOpGA2Jc10TGYl/9GY/JVyImf8SlVyibfz/tR9DtT
 YnlozNzpTSq5GF2/yYHN+3pnOzTD4ejsxbEzwmiSFkeeF6+wR45zXQFXb
 +q6sJK/JfEFBxEcpum8PaBWH+zlLlnX01/vW4CZ5sjNgmMNHR7HKqWZtY
 UoWKGfdX7zHjYw4b4ETi3yO6uy2qDDM2gNIAriepPuPhtB6DRzh7lAI40
 oFW2bzoaMjE2rfSmLTriGH7kmA2iTHYhoPtz/q/kzT9Oo8I9k7iw0caJC Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="321666383"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="321666383"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 03:13:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="726667102"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="726667102"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga004.fm.intel.com with ESMTP; 13 Jan 2023 03:13:20 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] soundwire: Use asoc_substream_to_rtd() to obtain rtd
Date: Fri, 13 Jan 2023 20:14:10 +0100
Message-Id: <20230113191410.1454566-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113191410.1454566-1-amadeuszx.slawinski@linux.intel.com>
References: <20230113191410.1454566-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Cezary Rojewski <cezary.rojewski@intel.com>

Utilize the helper function instead of casting from ->private_data
directly.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 drivers/soundwire/stream.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index bd502368339e..21b9afb5da94 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1715,7 +1715,7 @@ EXPORT_SYMBOL(sdw_deprepare_stream);
 static int set_stream(struct snd_pcm_substream *substream,
 		      struct sdw_stream_runtime *sdw_stream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *dai;
 	int ret = 0;
 	int i;
@@ -1768,7 +1768,7 @@ EXPORT_SYMBOL(sdw_alloc_stream);
 int sdw_startup_stream(void *sdw_substream)
 {
 	struct snd_pcm_substream *substream = sdw_substream;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct sdw_stream_runtime *sdw_stream;
 	char *name;
 	int ret;
@@ -1812,7 +1812,7 @@ EXPORT_SYMBOL(sdw_startup_stream);
 void sdw_shutdown_stream(void *sdw_substream)
 {
 	struct snd_pcm_substream *substream = sdw_substream;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct sdw_stream_runtime *sdw_stream;
 	struct snd_soc_dai *dai;
 
-- 
2.25.1


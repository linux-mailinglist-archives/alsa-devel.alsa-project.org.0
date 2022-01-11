Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 636A248AC2A
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jan 2022 12:07:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03ED61924;
	Tue, 11 Jan 2022 12:06:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03ED61924
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641899266;
	bh=OtbOL6czH+V9UwzRDcJLW274jPXhpIq7QfZpEbgwKCE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oG7DZKoa+3buoYw3i8haHqzUqoldklCQFue/Hn4VoBezeYCw4/dsnebidDdMzwgP7
	 C4Qzq4x6JXCN3bQG86QpGw1K452NqONEzV1NIoWk2S4uLv/z+5DEYDTpwgMETjxcwe
	 sAnX6RWrBm8y00zw3GWQrMndHQzhY6hqiMQuvIGQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0525BF804AC;
	Tue, 11 Jan 2022 12:06:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 871E4F804AC; Tue, 11 Jan 2022 12:06:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E84D1F80054
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 12:06:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E84D1F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XC4mFaq5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641899163; x=1673435163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OtbOL6czH+V9UwzRDcJLW274jPXhpIq7QfZpEbgwKCE=;
 b=XC4mFaq5vftjzEACB3cHLCrCTjOOpYPDy8k+xW15JlhftKmuCVk8nFaW
 vLdw8ryQjXBsDv9IFmqeeREtHu4vemudRzLsJbIFxXGrS7vUiDHwX23FF
 pQo5S4XKgfLfOZJMHOZISu70WP1sYpBfTPXxj8ORAXSA1dbcJJMMe7R9b
 OHLJwPxica3rsXZ7h/qdlK/0KLLNPucjqbTM/Hu4rX55/gceX10Nvfq4T
 UEu8MEM0+a3V5qGVuueU6i28rqYw8kZVxsqpEC1C0fP7+DRgTKqcF2zmG
 YLoo/n/3mzAzHBuI+JeXodwqUVCkdleMUtNG0NzHZSfC+vCVsS+6svIdg g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="241012608"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="241012608"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 03:05:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="528700936"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga008.jf.intel.com with ESMTP; 11 Jan 2022 03:05:55 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/3] ASoC: topology: Remove superfluous error prints
Date: Tue, 11 Jan 2022 20:05:26 +0100
Message-Id: <20220111190528.445248-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111190528.445248-1-amadeuszx.slawinski@linux.intel.com>
References: <20220111190528.445248-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
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

soc_tplg_check_elem_count(), already prints an error when applicable, so
there is no need to print another one.

Also clean up alignment of arguments in if, so there is no confusion
about what is checked and what is executed if condition is true.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/soc-topology.c | 44 ++++++++++------------------------------
 1 file changed, 11 insertions(+), 33 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 078e1dc19ca6..e0f72ddd72c1 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -685,12 +685,9 @@ static int soc_tplg_dbytes_create(struct soc_tplg *tplg, unsigned int count,
 	int err = 0;
 
 	if (soc_tplg_check_elem_count(tplg,
-		sizeof(struct snd_soc_tplg_bytes_control), count,
-			size, "mixer bytes")) {
-		dev_err(tplg->dev, "ASoC: Invalid count %d for byte control\n",
-			count);
+				      sizeof(struct snd_soc_tplg_bytes_control),
+				      count, size, "mixer bytes"))
 		return -EINVAL;
-	}
 
 	for (i = 0; i < count; i++) {
 		be = (struct snd_soc_tplg_bytes_control *)tplg->pos;
@@ -763,13 +760,9 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, unsigned int count,
 	int err = 0;
 
 	if (soc_tplg_check_elem_count(tplg,
-		sizeof(struct snd_soc_tplg_mixer_control),
-		count, size, "mixers")) {
-
-		dev_err(tplg->dev, "ASoC: invalid count %d for controls\n",
-			count);
+				      sizeof(struct snd_soc_tplg_mixer_control),
+				      count, size, "mixers"))
 		return -EINVAL;
-	}
 
 	for (i = 0; i < count; i++) {
 		mc = (struct snd_soc_tplg_mixer_control *)tplg->pos;
@@ -927,13 +920,9 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, unsigned int count,
 	int err = 0;
 
 	if (soc_tplg_check_elem_count(tplg,
-		sizeof(struct snd_soc_tplg_enum_control),
-		count, size, "enums")) {
-
-		dev_err(tplg->dev, "ASoC: invalid count %d for enum controls\n",
-			count);
+				      sizeof(struct snd_soc_tplg_enum_control),
+				      count, size, "enums"))
 		return -EINVAL;
-	}
 
 	for (i = 0; i < count; i++) {
 		ec = (struct snd_soc_tplg_enum_control *)tplg->pos;
@@ -1111,13 +1100,9 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 	count = le32_to_cpu(hdr->count);
 
 	if (soc_tplg_check_elem_count(tplg,
-		sizeof(struct snd_soc_tplg_dapm_graph_elem),
-		count, le32_to_cpu(hdr->payload_size), "graph")) {
-
-		dev_err(tplg->dev, "ASoC: invalid count %d for DAPM routes\n",
-			count);
+				      sizeof(struct snd_soc_tplg_dapm_graph_elem),
+				      count, le32_to_cpu(hdr->payload_size), "graph"))
 		return -EINVAL;
-	}
 
 	dev_dbg(tplg->dev, "ASoC: adding %d DAPM routes for index %d\n", count,
 		hdr->index);
@@ -1965,11 +1950,8 @@ static int soc_tplg_pcm_elems_load(struct soc_tplg *tplg,
 	if (soc_tplg_check_elem_count(tplg,
 				      size, count,
 				      le32_to_cpu(hdr->payload_size),
-				      "PCM DAI")) {
-		dev_err(tplg->dev, "ASoC: invalid count %d for PCM DAI elems\n",
-			count);
+				      "PCM DAI"))
 		return -EINVAL;
-	}
 
 	for (i = 0; i < count; i++) {
 		pcm = (struct snd_soc_tplg_pcm *)tplg->pos;
@@ -2243,14 +2225,10 @@ static int soc_tplg_link_elems_load(struct soc_tplg *tplg,
 		return -EINVAL;
 	}
 
-	if (soc_tplg_check_elem_count(tplg,
-				      size, count,
+	if (soc_tplg_check_elem_count(tplg, size, count,
 				      le32_to_cpu(hdr->payload_size),
-				      "physical link config")) {
-		dev_err(tplg->dev, "ASoC: invalid count %d for physical link elems\n",
-			count);
+				      "physical link config"))
 		return -EINVAL;
-	}
 
 	/* config physical DAI links */
 	for (i = 0; i < count; i++) {
-- 
2.25.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A8A50A55D
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 18:26:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63009163F;
	Thu, 21 Apr 2022 18:25:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63009163F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650558386;
	bh=9eDQSFAxLTGimAioClhm9WZdxabXWzodBnbtzrryzbo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X4umTa74+ovAWlPcWjz9k86yXXI1cG4OCRB5j/qGwV9f+5buBjJVTX3pisjLxYyHs
	 OZmmzn9+ba7k0HpVuNnhKjbj10okvqbfXfjKmLsZ9oK+roQA0tf2eeSJ0kKMryKsLd
	 a8ZZwI4j+uzmRmPfNYxCABVtqQaPye2azf2YxX0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1909F8047D;
	Thu, 21 Apr 2022 18:25:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1B70F800C1; Thu, 21 Apr 2022 18:25:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53F8CF800C1
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 18:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53F8CF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ngrM3nj/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650558320; x=1682094320;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9eDQSFAxLTGimAioClhm9WZdxabXWzodBnbtzrryzbo=;
 b=ngrM3nj/UPVWBZqmAa8n/9wPommzwXyPwDFn/dVPbcIhknv9Pnl+uUco
 2YJVorSNTWCdUjbnG+doe1QG79ZJpEoXiFLwRwXP8+IcjMgWT7C8ChY1k
 4GjebBu/R4eMEVKn2meZbfeigdDZYMp+ejXcKoXx1254yNnCE5odGZCv6
 BtLmvv/4ORbn+i0ybwcK4KIcRfY8Ma4N3xXyKwBl81g6If2qafUXc5nST
 8EWUKwIWY2tbtOine0MbNcq0urOSi8Ym067S1vxQ/2GanhayLxb0GauES
 1CpeHBixoFtKR4nyzmdExmjOjddXDvr/fR32+OTADFu9K6V0CZDjOkACF A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="289522008"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="289522008"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 09:25:15 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="511144031"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 09:25:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: soc-core: remove always-false path
Date: Thu, 21 Apr 2022 11:25:05 -0500
Message-Id: <20220421162505.302132-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

cppcheck throws the following warning:

sound/soc/soc-core.c:2773:6: style: Condition '!num_widgets' is always
false [knownConditionTrueFalse]
 if (!num_widgets) {
     ^

sound/soc/soc-core.c:2761:18: note: Assuming that condition
'num_widgets<0' is not redundant
 if (num_widgets < 0) {
                 ^
sound/soc/soc-core.c:2766:18: note: Assuming condition is false
 if (num_widgets & 1) {
                 ^
sound/soc/soc-core.c:2772:2: note: Compound assignment '/=', assigned
value is 0
 num_widgets /= 2;
 ^

We should check upfront all error conditions.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/soc-core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index aa687fd126db2..d68e64b73eea7 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2763,6 +2763,11 @@ int snd_soc_of_parse_audio_simple_widgets(struct snd_soc_card *card,
 			"ASoC: Property '%s' does not exist\n",	propname);
 		return -EINVAL;
 	}
+	if (!num_widgets) {
+		dev_err(card->dev, "ASoC: Property '%s's length is zero\n",
+			propname);
+		return -EINVAL;
+	}
 	if (num_widgets & 1) {
 		dev_err(card->dev,
 			"ASoC: Property '%s' length is not even\n", propname);
@@ -2770,11 +2775,6 @@ int snd_soc_of_parse_audio_simple_widgets(struct snd_soc_card *card,
 	}
 
 	num_widgets /= 2;
-	if (!num_widgets) {
-		dev_err(card->dev, "ASoC: Property '%s's length is zero\n",
-			propname);
-		return -EINVAL;
-	}
 
 	widgets = devm_kcalloc(card->dev, num_widgets, sizeof(*widgets),
 			       GFP_KERNEL);
-- 
2.30.2


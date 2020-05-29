Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E0F1E7D63
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 14:38:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2401E17BD;
	Fri, 29 May 2020 14:37:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2401E17BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590755895;
	bh=nhOnY89FBBNd16dw9bjqzzO3r3hVSKX8kufHfL835AE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cNXjGAX3kRQbF1RPYh93kd51OMwHl305CNQnpPp9P6CgsRvHdt7JqWgjsLhKJFA4o
	 XyN75bZDPdFzKbEqYpUIaYqqnddh9fyWLD9DlqGJoQ+Q2d/kfJJO9KJTsQhbHK+o0p
	 G2h2GrIuE80vwNGX4P+9ZjyqEpb38bP+vB9cnAgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E778F80149;
	Fri, 29 May 2020 14:36:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B558F8014E; Fri, 29 May 2020 14:36:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B72CF80107
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 14:36:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B72CF80107
IronPort-SDR: F2kuS9UZDUEItOiWX39+EAP5den4qPxwbB+QPtzY3EfIeyIX4Jlsj/rEULBahMz3I6eHF7clZZ
 6pjERZi/pHHw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 05:36:22 -0700
IronPort-SDR: Ou3mSafNeGzslGWVqsY615sV/UbRJaZ15VP2m44oT843m4Hj65fv2NqCnKVSKShH/3mfo40E+k
 /M4XHX88BoIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,448,1583222400"; d="scan'208";a="414960543"
Received: from snizamud-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.8.208])
 by orsmga004.jf.intel.com with ESMTP; 29 May 2020 05:36:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: reduce verbosity of error messages for sof-dai and
 sof-link
Date: Fri, 29 May 2020 07:36:13 -0500
Message-Id: <20200529123613.13447-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

Recent changes result in multiple dmesg traces such as:

[ 14.410435] Audio Port: ASoC: error at snd_soc_link_startup on Audio
Port: 1

[ 14.410446] sst-mfld-platform sst-mfld-platform: ASoC: error at
snd_soc_dai_startup on media-cpu-dai: 1

These messages are not really errors, when dai and dai-link callbacks
return the value of e.g. snd_pcm_hw_constraint_single() the result is
"Positive if the value is changed, zero if it's not changed, or a
negative error code"

Add a simple test to skip the checks for positive returned values

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-dai.c  | 6 +++++-
 sound/soc/soc-link.c | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 2c6ac3b0afa5..b05e18b63a1c 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -14,10 +14,14 @@
 static inline int _soc_dai_ret(struct snd_soc_dai *dai,
 			       const char *func, int ret)
 {
+	/* Positive, Zero values are not errors */
+	if (ret >= 0)
+		return ret;
+
+	/* Negative values might be errors */
 	switch (ret) {
 	case -EPROBE_DEFER:
 	case -ENOTSUPP:
-	case 0:
 		break;
 	default:
 		dev_err(dai->dev,
diff --git a/sound/soc/soc-link.c b/sound/soc/soc-link.c
index 248e1be4e1eb..f849278beba0 100644
--- a/sound/soc/soc-link.c
+++ b/sound/soc/soc-link.c
@@ -12,10 +12,14 @@
 static inline int _soc_link_ret(struct snd_soc_pcm_runtime *rtd,
 				const char *func, int ret)
 {
+	/* Positive, Zero values are not errors */
+	if (ret >= 0)
+		return ret;
+
+	/* Negative values might be errors */
 	switch (ret) {
 	case -EPROBE_DEFER:
 	case -ENOTSUPP:
-	case 0:
 		break;
 	default:
 		dev_err(rtd->dev,

base-commit: 4a0434502191347ba8f99468f2fb2cdddc20d381
-- 
2.20.1


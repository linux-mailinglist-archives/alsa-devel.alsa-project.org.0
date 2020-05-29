Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E441E7131
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 02:17:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 608ED17C4;
	Fri, 29 May 2020 02:16:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 608ED17C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590711447;
	bh=T7fFs1mNF1KUjptS9GBxwc6+oVXQMVXAsdI8fpfQ/Fg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g13O3wrn5jrGYHwYd8o/9BavtV/tN116OnB+OGukTvwQI1wgDq5JL73vCIf4j0Tby
	 R6k2/vP3iEVEFYNIQzzYT2B58bbf8TkalgW57ky1YfCa67G8HKLNSCLey3j7MvjJiX
	 LNibJ7DZBJC3h1ZjG6wgZFUw16Ers/MSvUGpImXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C01EF8015C;
	Fri, 29 May 2020 02:15:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2325BF80150; Fri, 29 May 2020 02:15:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB970F800E4
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 02:15:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB970F800E4
IronPort-SDR: x5tjW/WgvltmnOFIkhg766eWRi/wWdPEdNfqJO3u0+WCjgW7V04sQMm44tY2j/fuXq+wSCXgvl
 P25Ondm4aLeA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 17:15:32 -0700
IronPort-SDR: jPcTESez/MLW/75X38E4Zl5YTc8M5Ns5YeT/Ij+mj8RNxbUL8LFh8ELeuRcF1G7m0VVhW8rL0y
 H5DwkqhTXQkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,446,1583222400"; d="scan'208";a="292188140"
Received: from xiongj1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.99.4])
 by fmsmga004.fm.intel.com with ESMTP; 28 May 2020 17:15:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: reduce verbosity of error messages for sof-dai and
 sof-link
Date: Thu, 28 May 2020 19:15:26 -0500
Message-Id: <20200529001526.3013-1-pierre-louis.bossart@linux.intel.com>
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

Add a simple test to only log errors when the result is
negative.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-dai.c  | 7 ++++---
 sound/soc/soc-link.c | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 2c6ac3b0afa5..6a0e7560bacc 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -20,9 +20,10 @@ static inline int _soc_dai_ret(struct snd_soc_dai *dai,
 	case 0:
 		break;
 	default:
-		dev_err(dai->dev,
-			"ASoC: error at %s on %s: %d\n",
-			func, dai->name, ret);
+		if (ret < 0)
+			dev_err(dai->dev,
+				"ASoC: error at %s on %s: %d\n",
+				func, dai->name, ret);
 	}
 
 	return ret;
diff --git a/sound/soc/soc-link.c b/sound/soc/soc-link.c
index 248e1be4e1eb..ff053d4c1a49 100644
--- a/sound/soc/soc-link.c
+++ b/sound/soc/soc-link.c
@@ -18,9 +18,10 @@ static inline int _soc_link_ret(struct snd_soc_pcm_runtime *rtd,
 	case 0:
 		break;
 	default:
-		dev_err(rtd->dev,
-			"ASoC: error at %s on %s: %d\n",
-			func, rtd->dai_link->name, ret);
+		if (ret < 0)
+			dev_err(rtd->dev,
+				"ASoC: error at %s on %s: %d\n",
+				func, rtd->dai_link->name, ret);
 	}
 
 	return ret;

base-commit: 4a0434502191347ba8f99468f2fb2cdddc20d381
-- 
2.20.1


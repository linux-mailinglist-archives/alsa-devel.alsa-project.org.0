Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F2BA9A1E
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2019 07:35:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A77311676;
	Thu,  5 Sep 2019 07:35:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A77311676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567661755;
	bh=8Bdlu3JmPljc6yee/KwA/jajcic0vE9verhyt9uWTHk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WP9oHUW/agk26H/nvKXWAei+JligTealEV3lDH/xN2JigGg7Bsk/B1CgSXjYNE/iM
	 zMDc+NhE1oianJxw7QlKwzemv6+2fdHio4K1+TL/fZ3VsfkFyOJeoSssQaikh+nf7j
	 gQqFXceXSBjDDxIbLI8oAx81H3bkm8GxJIVPsA6U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9E05F80529;
	Thu,  5 Sep 2019 07:33:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 369BAF80171; Thu,  5 Sep 2019 07:33:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4084F80171;
 Thu,  5 Sep 2019 07:33:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4084F80171
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2019 22:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,469,1559545200"; d="scan'208";a="212657640"
Received: from test-hp-elitedesk-800-g1-twr.igk.intel.com ([10.237.149.38])
 by fmsmga002.fm.intel.com with ESMTP; 04 Sep 2019 22:33:26 -0700
From: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu,  5 Sep 2019 07:33:00 +0200
Message-Id: <20190905053302.9262-2-pawel.harlozinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905053302.9262-1-pawel.harlozinski@linux.intel.com>
References: <20190905053302.9262-1-pawel.harlozinski@linux.intel.com>
Cc: cezary.rojewski@intel.com, patch@alsa-project.org, tiwai@suse.de,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
Subject: [alsa-devel] [RFC PATCH 2/3] ALSA:core: Add rate 24kHz
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Adds SNDRV_PCM_RATE_24000 at the bottom to keep backward compability
with alsa library.

Signed-off-by: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
---
 include/sound/pcm.h     | 1 +
 sound/core/pcm_native.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index bbe6eb1ff5d2..09d0a2a2dce8 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -119,6 +119,7 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_RATE_192000		(1<<12)		/* 192000Hz */
 #define SNDRV_PCM_RATE_352800		(1<<13)		/* 352800Hz */
 #define SNDRV_PCM_RATE_384000		(1<<14)		/* 384000Hz */
+#define SNDRV_PCM_RATE_24000		(1<<15)		/* 24000Hz */
 
 #define SNDRV_PCM_RATE_CONTINUOUS	(1<<30)		/* continuous range */
 #define SNDRV_PCM_RATE_KNOT		(1<<31)		/* supports more non-continuos rates */
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 11e653c8aa0e..f52f28e3edb1 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2164,13 +2164,13 @@ static int snd_pcm_hw_rule_sample_bits(struct snd_pcm_hw_params *params,
 	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
 }
 
-#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_192000 != 1 << 12
+#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_192000 != 1 << 12 ||  SNDRV_PCM_RATE_24000 != 1 << 15
 #error "Change this table"
 #endif
 
 static const unsigned int rates[] = {
 	5512, 8000, 11025, 16000, 22050, 32000, 44100,
-	48000, 64000, 88200, 96000, 176400, 192000, 352800, 384000
+	48000, 64000, 88200, 96000, 176400, 192000, 352800, 384000, 24000
 };
 
 const struct snd_pcm_hw_constraint_list snd_pcm_known_rates = {
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

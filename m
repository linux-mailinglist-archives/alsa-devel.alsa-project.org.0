Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A160432ABFD
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:02:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C02B18EC;
	Tue,  2 Mar 2021 22:02:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C02B18EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614718978;
	bh=I5AwVFyzUe4w9w4nUmh8AyEpNpgF+WuiQSOfPW29YVY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MMhX35+U61ca6+DKJSnfFysTS+/RcWF7d+KVDWfC9D1VoGwV5wOIy5ebc5yC1VMUR
	 JeRZSVClqRQLecGJgkZjWx9M82EHwkQeaCOEpCJU3GDYRvniACNU0M81ZwD/YhOCEv
	 tpZJR0QYSug7Wq+bzcfQZIhuFGgt3dPk/WWbAuUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BA90F802E7;
	Tue,  2 Mar 2021 22:00:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63243F80424; Tue,  2 Mar 2021 22:00:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 839C6F80271
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:00:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 839C6F80271
IronPort-SDR: M9YFnDCwgCZIG3bcT7dcEiSZSEKqauOA4njJDy1oQBrUGDQfa0aGq2uWhDyh+If9pfReRME2dM
 vFzLzm7A2IWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174623718"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="174623718"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:00:27 -0800
IronPort-SDR: rYagD3WuFaUxFowLXj1s1G2Q4JpFdyrlV/nYjaLu1KBhIIN8YMkU6G49GLSLtjoIEYinitoaMK
 qm13k97Oy6sQ==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="373727792"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:00:26 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/9] ASoC: jz4760: fix set but not used warning
Date: Tue,  2 Mar 2021 14:59:19 -0600
Message-Id: <20210302205926.49063-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302205926.49063-1-pierre-louis.bossart@linux.intel.com>
References: <20210302205926.49063-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

make W=1 warning:

sound/soc/codecs/jz4760.c: In function ‘jz4760_codec_startup’:
sound/soc/codecs/jz4760.c:201:6: error: variable ‘ret’ set but not
used [-Werror=unused-but-set-variable]
  201 |  int ret;
      |      ^~~

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/jz4760.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/jz4760.c b/sound/soc/codecs/jz4760.c
index e8f28ccc145a..f62abf5ad917 100644
--- a/sound/soc/codecs/jz4760.c
+++ b/sound/soc/codecs/jz4760.c
@@ -198,7 +198,7 @@ static int jz4760_codec_startup(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *codec = dai->component;
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(codec);
-	int ret;
+	int ret = 0;
 
 	/*
 	 * SYSCLK output from the codec to the AIC is required to keep the
@@ -207,7 +207,7 @@ static int jz4760_codec_startup(struct snd_pcm_substream *substream,
 	 */
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		ret = snd_soc_dapm_force_enable_pin(dapm, "SYSCLK");
-	return 0;
+	return ret;
 }
 
 static void jz4760_codec_shutdown(struct snd_pcm_substream *substream,
-- 
2.25.1


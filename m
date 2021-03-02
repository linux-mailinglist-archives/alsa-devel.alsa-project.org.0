Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8BA32AC07
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:04:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 306DC18FA;
	Tue,  2 Mar 2021 22:04:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 306DC18FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614719096;
	bh=Do9Z8nXayfA3ujmxvXy6RtrQcGK3ywIgDU2ktHcmCh8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xcaor5eAmjV0Iv8e0U/quJUhE9jZs8O9DrX6ttDfaNo9zltdXllaK+bwop5wetdZs
	 umbDTfWGXceKRQZAjbAV0YcciuhZhPIp6erMcwPwrDVNfnzgzxgjpA5bmJOEVOCZvI
	 QNekDRPf/exfGNK4aOiRXK4xTxYgBvw6sYidT+bk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C124AF804C1;
	Tue,  2 Mar 2021 22:00:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E970CF80423; Tue,  2 Mar 2021 22:00:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB2EEF80088
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:00:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB2EEF80088
IronPort-SDR: 6FC1xnQZwPllojyub0nY1zkwuUZ8luwShuYz8Nad7Z2lzhLl4PE0f0Pdhna/EuSlwgOCF+ganS
 aeD+uHvHpDPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174623766"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="174623766"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:00:32 -0800
IronPort-SDR: aVIV8pIp7CqP7EE65GJVUM/07JdJWkr4lAaCIkijBvqemnWcMJzx1K0pekGlV/ksa+LiIJ1GB8
 yklKlHXgc9ag==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="373727809"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:00:31 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 8/9] ASoC: Intel: bytcr_wm5102: remove unused static variable
Date: Tue,  2 Mar 2021 14:59:25 -0600
Message-Id: <20210302205926.49063-9-pierre-louis.bossart@linux.intel.com>
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

sound/soc/intel/boards/bytcr_wm5102.c:216:40: error:
‘byt_wm5102_dai_params’ defined but not used
[-Werror=unused-const-variable=]
  216 | static const struct snd_soc_pcm_stream byt_wm5102_dai_params = {
      |                                        ^~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bytcr_wm5102.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index f38850eb2eaf..fd584e380340 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -213,14 +213,6 @@ static int byt_wm5102_init(struct snd_soc_pcm_runtime *runtime)
 	return 0;
 }
 
-static const struct snd_soc_pcm_stream byt_wm5102_dai_params = {
-	.formats = SNDRV_PCM_FMTBIT_S16_LE,
-	.rate_min = 48000,
-	.rate_max = 48000,
-	.channels_min = 2,
-	.channels_max = 2,
-};
-
 static int byt_wm5102_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 				  struct snd_pcm_hw_params *params)
 {
-- 
2.25.1


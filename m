Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A104B25D8C5
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 14:41:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18E851B0A;
	Fri,  4 Sep 2020 14:40:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18E851B0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599223267;
	bh=6KqB60MrW3WNzQgjl4OgAHk/j51NXt7stUBTNmifVnE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U59bHMiIub/5H/pi7QWiHbgQrIWY3Qx4JmUybfAY+9faUpnNI2RdGvZvnzBZ+e6Oe
	 0hlyQMVAUoYNEs2PbuB38Mq/lLKrBfCZtjYfl59LMgtvYYprZo5aXrZXeCG5M2xxbF
	 QlR6kUvscoBEw4HzR2rbo8JwkrqjjiSTZH1r7oYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 278C8F80257;
	Fri,  4 Sep 2020 14:39:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46CA9F8024A; Fri,  4 Sep 2020 14:39:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81765F80113
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 14:39:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81765F80113
IronPort-SDR: SOrsJgbslLYNqWFMqSvASNNwdCtJj3AY07sDvJfSFKWPeu6/oscV1+iyPrVFJBjKyf1FT30z0s
 Fe7HYxvtlQSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="155131266"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="155131266"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 05:39:00 -0700
IronPort-SDR: J4YZew0Dk1IP5+Ybqp1fKJnhc/Y2m/80Jo2iBZUOqwOCVN17F2+V0czkpmClSsNxDnF0RSZPyB
 i/ebEq3Z7TxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="339678447"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Sep 2020 05:38:57 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] [RFC] ASoC: core: Do not cleanup uninitialized dais on
 soc_pcm_open failure
Date: Fri,  4 Sep 2020 14:38:54 +0200
Message-Id: <20200904123854.26742-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, tiwai@suse.com, broonie@kernel.org
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

Introduce for_each_rtd_dais_rollback macro which behaves exactly like
for_each_codec_dais_rollback and its cpu_dais equivalent but for all
dais instead.

Use newly added macro to fix soc_pcm_open error path and prevent
uninitialized dais from being cleaned-up.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc.h | 2 ++
 sound/soc/soc-pcm.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index b94ebff12350..09a7d8409ade 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1193,6 +1193,8 @@ struct snd_soc_pcm_runtime {
 	     ((i) < (rtd)->num_cpus + (rtd)->num_codecs) &&		\
 		     ((dai) = (rtd)->dais[i]);				\
 	     (i)++)
+#define for_each_rtd_dais_rollback(rtd, i, dai)		\
+	for (; (--(i) >= 0) && ((dai) = (rtd)->dais[i]);)
 
 void snd_soc_close_delayed_work(struct snd_soc_pcm_runtime *rtd);
 
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 00ac1cbf6f88..4c9d4cd8cf0b 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -812,7 +812,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	return 0;
 
 config_err:
-	for_each_rtd_dais(rtd, i, dai)
+	for_each_rtd_dais_rollback(rtd, i, dai)
 		snd_soc_dai_shutdown(dai, substream);
 
 	snd_soc_link_shutdown(substream);
-- 
2.17.1


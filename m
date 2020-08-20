Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA2A24C99A
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 03:41:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FF8D168A;
	Fri, 21 Aug 2020 03:40:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FF8D168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597974085;
	bh=TD7qAco0gmZRTpvCSFUAiXmY4j2aOWz97Bj0gYA6Cuc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EucBiVObfF7ypqO44c7ZFApiAtgo47BioM7zrGgyQ9YZvEQgxcbVYOpZeQ0JEAQTG
	 SjRVsazfCfRpIMeGdgQFkPcHglqb05KoQ4uWQi8gSOh2PiBWsoNaEH0tNU5kt8GPiz
	 NYneHmLPVqK5IuNSSMEUKbd7/L0AlIqIMunYZRNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAD70F80253;
	Fri, 21 Aug 2020 03:39:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CF60F80218; Fri, 21 Aug 2020 03:39:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EE0DF800D2
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 03:39:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EE0DF800D2
IronPort-SDR: tE7BJ9Bwo13oGeLsHSIRxLYJtc0pcxWMFztk74EHiCtv6I0tvZkPdvlpBq5S5MnEr5VWleX3Rb
 uhDu85T9wM4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9719"; a="153044834"
X-IronPort-AV: E=Sophos;i="5.76,335,1592895600"; d="scan'208";a="153044834"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2020 18:39:29 -0700
IronPort-SDR: OeQNrk1RjGkr2dzUBDGmwBgDz13weajGFlol1/pv9u3gHuptcpKw2MpPWL+yXIS4xQqsNErtp9
 1w5lXc4h7QQg==
X-IronPort-AV: E=Sophos;i="5.76,335,1592895600"; d="scan'208";a="472866129"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2020 18:39:27 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH] ASoC: intel: sof_sdw: add .exit callback function
Date: Thu, 20 Aug 2020 21:45:42 +0800
Message-Id: <20200820134542.8682-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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

We may allocate some resources in sof_sdw_codec_info .init function.
Adding a corresponding .exit function can help to release these resources.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 31 +++++++++++++++++++++++++
 sound/soc/intel/boards/sof_sdw_common.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 2463d432bf4d..4bc1ed757009 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1032,12 +1032,43 @@ static int mc_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static int mc_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct snd_soc_dai_link *link;
+	int ret;
+	int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++) {
+		if (!codec_info_list[i].exit)
+			continue;
+		/*
+		 * We don't need to call .exit function if there is no matched
+		 * dai link found.
+		 */
+		for_each_card_prelinks(card, j, link) {
+			if (!strcmp(link->codecs[0].dai_name,
+				    codec_info_list[i].dai_name)) {
+				ret = codec_info_list[i].exit(&pdev->dev, link);
+				if (ret)
+					dev_warn(&pdev->dev,
+						 "codec exit failed %d\n",
+						 ret);
+				break;
+			}
+		}
+	}
+
+	return 0;
+}
+
 static struct platform_driver sof_sdw_driver = {
 	.driver = {
 		.name = "sof_sdw",
 		.pm = &snd_soc_pm_ops,
 	},
 	.probe = mc_probe,
+	.remove = mc_remove,
 };
 
 module_platform_driver(sof_sdw_driver);
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 12e32439ba46..76d6c0c3839d 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -63,6 +63,7 @@ struct sof_sdw_codec_info {
 		     struct sof_sdw_codec_info *info,
 		     bool playback);
 
+	int (*exit)(struct device *dev, struct snd_soc_dai_link *dai_link);
 	bool late_probe;
 	int (*codec_card_late_probe)(struct snd_soc_card *card);
 };
-- 
2.17.1


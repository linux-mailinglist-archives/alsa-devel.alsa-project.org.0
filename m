Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B197C1F7E2B
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 22:44:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B7931689;
	Fri, 12 Jun 2020 22:43:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B7931689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591994677;
	bh=kNbmdaaWvrG0ZwrSMNWvpMonalkKm8eWb3puO07zkwA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DuBAQB7v4jchsxnjCO165VPB2J7CSYOg4sJVVzK4aDOOwb2bcw3Q5R/QpGEH4A+GV
	 NFLBrckw3pMLSuLvtlIUd4E/cFfNFAaYAg85qcJbiSSTPwBvpJN9Vd3l2ggpflHOJt
	 TvjBr9bmX0rtTbLDYPllwZAqjP3c5wpiodSEoOlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9C61F802BC;
	Fri, 12 Jun 2020 22:41:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADF84F802A8; Fri, 12 Jun 2020 22:41:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCED8F80252
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 22:41:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCED8F80252
IronPort-SDR: MQYAO0B38p4XNMAi5DdnPqbVvW/QGdm9cxKblHrITSIhu8NXT1gL44zwhPo+GgP7f0/d7AYCNh
 O0WFI4Hd8W1g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 13:41:09 -0700
IronPort-SDR: MIeMAJAdhisQmD0wx4iNam4vhpQ7v7m15TxGzhGEaqrhQcEU0+QWBmrTheOG4OgDLZHsoVUjhq
 V6eXj14JoihQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,504,1583222400"; d="scan'208";a="272022967"
Received: from tcampell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.137])
 by orsmga003.jf.intel.com with ESMTP; 12 Jun 2020 13:41:08 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: soc-pcm/compress: reduce verbosity on mapping ok
 messages
Date: Fri, 12 Jun 2020 15:40:50 -0500
Message-Id: <20200612204050.25901-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200612204050.25901-1-pierre-louis.bossart@linux.intel.com>
References: <20200612204050.25901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

With dynamic debug not enabled, we still get these messages:

[   48.133586] sof_sdw sof_sdw: rt711-aif1 <-> SDW0 Pin2 mapping ok
[   48.133595] sof_sdw sof_sdw: rt711-aif1 <-> SDW0 Pin3 mapping ok
[   48.133650] sof_sdw sof_sdw: sdw:1:25d:1308:0 <-> SDW1 Pin2 mapping ok
[   48.133658] sof_sdw sof_sdw: rt715-aif2 <-> SDW3 Pin2 mapping ok
[   48.133666] sof_sdw sof_sdw: intel-hdmi-hifi1 <-> iDisp1 Pin mapping ok
[   48.133672] sof_sdw sof_sdw: intel-hdmi-hifi2 <-> iDisp2 Pin mapping ok
[   48.133677] sof_sdw sof_sdw: intel-hdmi-hifi3 <-> iDisp3 Pin mapping ok
[   48.133712] sof_sdw sof_sdw: snd-soc-dummy-dai <-> Headphone 0 mapping ok
[   48.133733] sof_sdw sof_sdw: snd-soc-dummy-dai <-> Headset mic 1 mapping ok
[   48.133746] sof_sdw sof_sdw: snd-soc-dummy-dai <-> SDW1-speakers 2 mapping ok
[   48.133762] sof_sdw sof_sdw: snd-soc-dummy-dai <-> Microphones 4 mapping ok
[   48.133774] sof_sdw sof_sdw: snd-soc-dummy-dai <-> HDMI1 5 mapping ok
[   48.133798] sof_sdw sof_sdw: snd-soc-dummy-dai <-> HDMI2 6 mapping ok
[   48.133809] sof_sdw sof_sdw: snd-soc-dummy-dai <-> HDMI3 7 mapping ok

This is not really useful for most users, demote to dev_dbg()

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/soc-compress.c | 4 ++--
 sound/soc/soc-pcm.c      | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 4984b6a2c370..415510909a82 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -867,8 +867,8 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 	rtd->compr = compr;
 	compr->private_data = rtd;
 
-	dev_info(rtd->card->dev, "Compress ASoC: %s <-> %s mapping ok\n",
-		 codec_dai->name, cpu_dai->name);
+	dev_dbg(rtd->card->dev, "Compress ASoC: %s <-> %s mapping ok\n",
+		codec_dai->name, cpu_dai->name);
 
 	return 0;
 }
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 08e3daf16384..d8073fef68c9 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2964,9 +2964,9 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 
 	pcm->no_device_suspend = true;
 out:
-	dev_info(rtd->card->dev, "%s <-> %s mapping ok\n",
-		 (rtd->num_codecs > 1) ? "multicodec" : asoc_rtd_to_codec(rtd, 0)->name,
-		 (rtd->num_cpus > 1)   ? "multicpu"   : asoc_rtd_to_cpu(rtd, 0)->name);
+	dev_dbg(rtd->card->dev, "%s <-> %s mapping ok\n",
+		(rtd->num_codecs > 1) ? "multicodec" : asoc_rtd_to_codec(rtd, 0)->name,
+		(rtd->num_cpus > 1)   ? "multicpu"   : asoc_rtd_to_cpu(rtd, 0)->name);
 	return ret;
 }
 
-- 
2.20.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F1A22B565
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 20:07:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96B2F168A;
	Thu, 23 Jul 2020 20:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96B2F168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595527671;
	bh=A98z8pU0bKIKlUsN/pxESQeVL+YpM/qWMTxFspAnFS0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UqDhxCOrqVFnEmytKeNkZ6QTkbPOrB5AT7hNi4aVDKrBZW0OKyyWQLXWq2o67OrSW
	 urEPGABq5HQNgHFkgtC56yD7ccT5VsTQGUQ9S3OhNsIEOIdX2A6YHmd+UkiP12PKHP
	 xBkWDg0AEN54a5t6Ob+u4/1pte2yQ6Ek4WYEMWLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9DEEF800CE;
	Thu, 23 Jul 2020 20:06:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 883ACF80212; Thu, 23 Jul 2020 20:06:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1FA4F800CE
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 20:05:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1FA4F800CE
IronPort-SDR: k1Xu+7mi/TwkgBwBgmDCHGOQgz/Uy1zjLMah+Qn8A+hoQb0sFflPNJDUOtyFMGa5Xl4OKjNpyu
 YpzSX1xz0gOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9691"; a="168729321"
X-IronPort-AV: E=Sophos;i="5.75,387,1589266800"; d="scan'208";a="168729321"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2020 11:05:48 -0700
IronPort-SDR: UBB0Y+kenxJSXKDoO64CeXMSZ6fFh8cgvgS0luQ5jtTNVaVpsTLj0+3/j6Ozv9ixbMzjEqtrBv
 VZzd4Se60wqQ==
X-IronPort-AV: E=Sophos;i="5.75,387,1589266800"; d="scan'208";a="462947765"
Received: from tbae-mobl.gar.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.230.144])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2020 11:05:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: core: use less strict tests for dailink capabilities
Date: Thu, 23 Jul 2020 13:05:33 -0500
Message-Id: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jerome Brunet <jbrunet@baylibre.com>
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

Previous updates to set dailink capabilities and check dailink
capabilities were based on a flawed assumption that all dais support
the same capabilities as the dailink. This is true for TDM
configurations but existing configurations use an amplifier and a
capture device on the same dailink, and the tests would prevent the
card from probing.

This patch modifies the snd_soc_dai_link_set_capabilities()
helper so that the dpcm_playback (resp. dpcm_capture) dailink
capabilities are set if at least one dai supports playback (resp. capture).

Likewise the checks are modified so that an error is reported only
when dpcm_playback (resp. dpcm_capture) is set but none of the CPU
DAIs support playback (resp. capture).

Fixes: 25612477d20b5 ('ASoC: soc-dai: set dai_link dpcm_ flags with a helper')
Fixes: b73287f0b0745 ('ASoC: soc-pcm: dpcm: fix playback/capture checks')
Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-dai.c | 16 +++++++++-------
 sound/soc/soc-pcm.c | 42 ++++++++++++++++++++++++------------------
 2 files changed, 33 insertions(+), 25 deletions(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 98f0c98b06bb..ef1700e5e1bf 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -402,28 +402,30 @@ void snd_soc_dai_link_set_capabilities(struct snd_soc_dai_link *dai_link)
 	struct snd_soc_dai_link_component *codec;
 	struct snd_soc_dai *dai;
 	bool supported[SNDRV_PCM_STREAM_LAST + 1];
+	bool supported_cpu;
+	bool supported_codec;
 	int direction;
 	int i;
 
 	for_each_pcm_streams(direction) {
-		supported[direction] = true;
+		supported_cpu = false;
+		supported_codec = false;
 
 		for_each_link_cpus(dai_link, i, cpu) {
 			dai = snd_soc_find_dai(cpu);
-			if (!dai || !snd_soc_dai_stream_valid(dai, direction)) {
-				supported[direction] = false;
+			if (dai && snd_soc_dai_stream_valid(dai, direction)) {
+				supported_cpu = true;
 				break;
 			}
 		}
-		if (!supported[direction])
-			continue;
 		for_each_link_codecs(dai_link, i, codec) {
 			dai = snd_soc_find_dai(codec);
-			if (!dai || !snd_soc_dai_stream_valid(dai, direction)) {
-				supported[direction] = false;
+			if (dai && snd_soc_dai_stream_valid(dai, direction)) {
+				supported_codec = true;
 				break;
 			}
 		}
+		supported[direction] = supported_cpu && supported_codec;
 	}
 
 	dai_link->dpcm_playback = supported[SNDRV_PCM_STREAM_PLAYBACK];
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index f2c7c85ad40c..aac61df0c50e 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2743,30 +2743,36 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 		if (rtd->dai_link->dpcm_playback) {
 			stream = SNDRV_PCM_STREAM_PLAYBACK;
 
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai)
-				if (!snd_soc_dai_stream_valid(cpu_dai,
-							      stream)) {
-					dev_err(rtd->card->dev,
-						"CPU DAI %s for rtd %s does not support playback\n",
-						cpu_dai->name,
-						rtd->dai_link->stream_name);
-					return -EINVAL;
+			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
+					playback = 1;
+					break;
 				}
-			playback = 1;
+			}
+
+			if (!playback) {
+				dev_err(rtd->card->dev,
+					"No CPU DAIs support playback for stream %s\n",
+					rtd->dai_link->stream_name);
+				return -EINVAL;
+			}
 		}
 		if (rtd->dai_link->dpcm_capture) {
 			stream = SNDRV_PCM_STREAM_CAPTURE;
 
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai)
-				if (!snd_soc_dai_stream_valid(cpu_dai,
-							      stream)) {
-					dev_err(rtd->card->dev,
-						"CPU DAI %s for rtd %s does not support capture\n",
-						cpu_dai->name,
-						rtd->dai_link->stream_name);
-					return -EINVAL;
+			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
+					capture = 1;
+					break;
 				}
-			capture = 1;
+			}
+
+			if (!capture) {
+				dev_err(rtd->card->dev,
+					"No CPU DAIs support capture for stream %s\n",
+					rtd->dai_link->stream_name);
+				return -EINVAL;
+			}
 		}
 	} else {
 		/* Adapt stream for codec2codec links */
-- 
2.25.1


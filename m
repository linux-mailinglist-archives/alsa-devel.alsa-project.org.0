Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 194281AD825
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 10:01:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B559D1672;
	Fri, 17 Apr 2020 10:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B559D1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587110508;
	bh=UaadtfW90bguxm29AtiBNzuUo+TSD5k2C+KZEW/Ox6A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GOm8iMX/WGRKH0rHNe3pA7yNG+R9hlMkgZgOkRqbx7JSRaNGTv8na5fP04obH8kM5
	 w+kK+b9BgUIT5AIu2tCGmQmRv+P/+IbtafZPyb0AfQI4bMv2DPYcLuzmJlm8+3Hzu/
	 Tsf6cneXAPHzy3ZG5a6LRKjCQdgNUQW8PhSfBzhk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5834F8012E;
	Fri, 17 Apr 2020 10:00:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57501F8012E; Fri, 17 Apr 2020 10:00:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=SORTED_RECIPS,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2430DF8012E
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 10:00:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2430DF8012E
IronPort-SDR: wgi0XCmQHAH523m+4l8eg+hzxHNaKG62ZBxjqfznDYY9vbAZ/5IEbryXelC7GeLcufgtDBeysx
 gVefsZvhMmKA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 01:00:10 -0700
IronPort-SDR: Cnos91/ORc4UQO61vbYowcIo4BV46aj6mudq6kL/V/2+7a9vASoeUJbkkq5AUDI/x0g5GWHueR
 z5FHnxiDJgmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; d="scan'208";a="272345810"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 17 Apr 2020 01:00:08 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: intel/skl/hda - fix oops on systems without i915 audio
 codec
Date: Fri, 17 Apr 2020 10:59:57 +0300
Message-Id: <20200417075957.24811-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: hui.wang@canonical.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 jaska.uimonen@linux.intel.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
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

Recent fix for jack detection caused a regression on systems with HDA
audio codec but no HDMI/DP audio via i915 graphics, leading to a kernel
oops at device probe. On these systems, HDA bus instance lookup fails,
as the first ASoC runtime of the card is connected to a dummy codec
(as no HDMI codec is present).

Fixes: 3a24f135e6cc ("ASoC: intel/skl/hda - set autosuspend timeout for hda codecs")
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 34 +++++++++++---------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 35f222ed9912..fc9290fb4e99 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -172,23 +172,25 @@ static int skl_hda_fill_card_info(struct snd_soc_acpi_mach_params *mach_params)
 
 static void skl_set_hda_codec_autosuspend_delay(struct snd_soc_card *card)
 {
-	struct snd_soc_pcm_runtime *rtd =
-		list_first_entry(&card->rtd_list,
-				 struct snd_soc_pcm_runtime, list);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd;
 	struct hdac_hda_priv *hda_pvt;
-
-	if (!codec_dai)
-		return;
-
-	/*
-	 * all codecs are on the same bus, so it's sufficient
-	 * to lookup the first runtime and its codec, and set
-	 * power save defaults for all codecs on the bus
-	 */
-	hda_pvt = snd_soc_component_get_drvdata(codec_dai->component);
-	snd_hda_set_power_save(hda_pvt->codec.bus,
-			       HDA_CODEC_AUTOSUSPEND_DELAY_MS);
+	struct snd_soc_dai *dai;
+
+	for_each_card_rtds(card, rtd) {
+		if (!strstr(rtd->dai_link->codecs->name, "ehdaudio"))
+			continue;
+		dai = asoc_rtd_to_codec(rtd, 0);
+		hda_pvt = snd_soc_component_get_drvdata(dai->component);
+		if (hda_pvt) {
+			/*
+			 * all codecs are on the same bus, so it's sufficient
+			 * to look up only the first one
+			 */
+			snd_hda_set_power_save(hda_pvt->codec.bus,
+					       HDA_CODEC_AUTOSUSPEND_DELAY_MS);
+			break;
+		}
+	}
 }
 
 static int skl_hda_audio_probe(struct platform_device *pdev)
-- 
2.26.0


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A721B17A3
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 22:56:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0BEE168D;
	Mon, 20 Apr 2020 22:55:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0BEE168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587416189;
	bh=UaadtfW90bguxm29AtiBNzuUo+TSD5k2C+KZEW/Ox6A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FWwXIE1aEZirc3zbl8e7PwyRHgGxd2dCmXxUTLGcVc1RujA/fyRYUILhSCLtC2LeO
	 kDLY1JfXBfEM/9sM1qj8w70WAxO7MROkvlWlgC/vJccDncVvmSTqf6BxjKmeEoyHIG
	 d8KTHb9gPuI6ooBuwzDYIYg9J2ACag0EV8mNo51o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5A0FF8020C;
	Mon, 20 Apr 2020 22:54:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06067F801D9; Mon, 20 Apr 2020 22:54:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SORTED_RECIPS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99242F8012F
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 22:54:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99242F8012F
IronPort-SDR: TxP8HC6CLIgtIPOBicnHHvXfki9tghVkS6hKen/DzryUgoSveNJ21V0BATmcIKAdJtIYGmMG/0
 70s8A/sxUHOw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 13:54:36 -0700
IronPort-SDR: dgrIei4BJLwZyW8g1BhCkp9dtzzQ/jIqSorbDtrDn0vOhzvKQRv/Wl0YigTKIJ9Og9Of1+EtIA
 7qHwJ8yFmK8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,407,1580803200"; d="scan'208";a="455831240"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga005.fm.intel.com with ESMTP; 20 Apr 2020 13:54:34 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2] ASoC: intel/skl/hda - fix oops on systems without i915
 audio codec
Date: Mon, 20 Apr 2020 23:54:31 +0300
Message-Id: <20200420205431.13070-1-kai.vehmanen@linux.intel.com>
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


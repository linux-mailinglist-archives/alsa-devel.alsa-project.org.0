Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC516229E98
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 19:37:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6257F1615;
	Wed, 22 Jul 2020 19:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6257F1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595439467;
	bh=ejtNi02ZeSyR3Xp1DmTXdPnfpHmmq4O2Kq+BmPgk4G8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oEe9ArbOyVRs53az4CFBm1tchwp6EGJK8v7C97oXLNLoy21CjC7a4YNHYlUq9QlJa
	 xD02vvukssBntsExKRDTd+czAfX0jdgKeaiH0foMVYzbw2JTiMDTFGgIcXtQ6qroeQ
	 pLkAfiuG/mijBKovvXVKuAHoaLwEzUZ7/P0qEx5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9302FF80150;
	Wed, 22 Jul 2020 19:36:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5B7EF8014C; Wed, 22 Jul 2020 19:35:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A085CF80139
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 19:34:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A085CF80139
IronPort-SDR: zjoGfk7nBwVcfLDsyPYIWSV5iYDNdPBcyp5Ec77fGRvi8S4pLzABEd5IZO9fcvU1F1rPJTy0vu
 Uk2tBgfy3KzQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="130464195"
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="130464195"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 10:34:50 -0700
IronPort-SDR: dp4wJY1K11y4hDiZ6aUt72ahagtltI7vskufZJu+hYnzIHXUojWxhLPF8+HzpO9LKQD6z6m3K2
 vP/bUkUDdWdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="270811957"
Received: from mgorski-all-series.igk.intel.com ([10.237.149.201])
 by fmsmga007.fm.intel.com with ESMTP; 22 Jul 2020 10:34:49 -0700
From: Mateusz Gorski <mateusz.gorski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: skl_hda_dsp_generic: Fix NULLptr dereference in
 autosuspend delay
Date: Wed, 22 Jul 2020 19:35:24 +0200
Message-Id: <20200722173524.30161-1-mateusz.gorski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Mateusz Gorski <mateusz.gorski@linux.intel.com>, cezary.rojewski@intel.com,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
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

Different modules for HDMI codec are used depending on the
"hda_codec_use_common_hdmi" option being enabled or not. Driver private
context for both of them is different.
This leads to null-pointer dereference error when driver tries to set
autosuspend delay for HDMI codec while the option is off (hdac_hdmi
module is used for HDMI).

Change the string in conditional statement to "ehdaudio0D0" to ensure
that only the HDAudio codec is handled by this function.

Fixes: 5bf73b1b1dec ("ASoC: intel/skl/hda - fix oops on systems without i915 audio codec")
Signed-off-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
---
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index ca4900036ead..bc50eda297ab 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -181,7 +181,7 @@ static void skl_set_hda_codec_autosuspend_delay(struct snd_soc_card *card)
 	struct snd_soc_dai *dai;
 
 	for_each_card_rtds(card, rtd) {
-		if (!strstr(rtd->dai_link->codecs->name, "ehdaudio"))
+		if (!strstr(rtd->dai_link->codecs->name, "ehdaudio0D0"))
 			continue;
 		dai = asoc_rtd_to_codec(rtd, 0);
 		hda_pvt = snd_soc_component_get_drvdata(dai->component);
-- 
2.17.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AD07EB78B
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 21:13:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 818FBAE8;
	Tue, 14 Nov 2023 21:12:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 818FBAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699992799;
	bh=u6S64/aQQrePc7oyyGsLxgNV0BbeGsGU0MqbevZ5MQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rxpyp/mS4AhWTqq8OMTlBuu5qu3VBtdod9P/DvDiaVntVJ86z1qG+m4bDp2Jf+36x
	 +O8SE2KXR+BCn9O9cl46rsKU4XPXNQA9yasD7Tr0iKVtQB7jdthz3STqY+x2g5CANm
	 VdiHp4yTSYzyvcBafSqZL/qhanKFslp/PO/CvN0I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70EACF805A9; Tue, 14 Nov 2023 21:11:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B4D0F80587;
	Tue, 14 Nov 2023 21:11:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6796F8057C; Tue, 14 Nov 2023 21:11:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 923D1F8022B
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 21:11:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 923D1F8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CE5+0tPT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699992689; x=1731528689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u6S64/aQQrePc7oyyGsLxgNV0BbeGsGU0MqbevZ5MQY=;
  b=CE5+0tPThGA+mydcuJI2f4hT8OVV1h05wQWD+2WarVycC7yt0DXPq2Df
   lewhH2k6wyRczAE1Roet3TpfKq0b4tuQSderROAnjR8uCdV8q1CvXTWZk
   6uUV4J5Wz5Sp6gw5zluCiKSykhOGYESS4Vbm+IfFWDE++9LkkSDmeWNOz
   EqkV0QBydMKgdbEw5CaFALEUoSSpa96XLvLJcfx6ZJsJ+2J1XDRsofBov
   GwNHvjEYpq8SGo3ZG9mYZ21MeCObBU4Fq6ve1nw3NZDryK1vVp3FOboT1
   Rw8lGB8WE+yZ/Xv8kGWT75zMEg2uyGTfXnCjrTgwdKn5/3ycBkNepV79E
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381134671"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208";a="381134671"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 12:11:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="855422407"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208";a="855422407"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Nov 2023 12:11:26 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 05/16] ALSA: hda: Switch to new stream-format interface
Date: Tue, 14 Nov 2023 21:13:06 +0100
Message-Id: <20231114201317.1348066-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231114201317.1348066-1-cezary.rojewski@intel.com>
References: <20231114201317.1348066-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2QZJWH25D2CLK4Q43PILIYCCEM5345FY
X-Message-ID-Hash: 2QZJWH25D2CLK4Q43PILIYCCEM5345FY
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2QZJWH25D2CLK4Q43PILIYCCEM5345FY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To provide option for selecting different bit-per-sample than just the
maximum one, use the new format calculation mechanism.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/pci/hda/hda_controller.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index c42e9ffff9db..0ec3559cc834 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -151,7 +151,7 @@ static int azx_pcm_prepare(struct snd_pcm_substream *substream)
 	struct azx_dev *azx_dev = get_azx_dev(substream);
 	struct hda_pcm_stream *hinfo = to_hda_pcm_stream(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	unsigned int format_val, stream_tag;
+	unsigned int format_val, stream_tag, bps;
 	int err;
 	struct hda_spdif_out *spdif =
 		snd_hda_spdif_out_of_nid(apcm->codec, hinfo->nid);
@@ -165,11 +165,9 @@ static int azx_pcm_prepare(struct snd_pcm_substream *substream)
 	}
 
 	snd_hdac_stream_reset(azx_stream(azx_dev));
-	format_val = snd_hdac_calc_stream_format(runtime->rate,
-						runtime->channels,
-						runtime->format,
-						hinfo->maxbps,
-						ctls);
+	bps = snd_hdac_stream_format_bps(runtime->format, SNDRV_PCM_SUBFORMAT_STD, hinfo->maxbps);
+
+	format_val = snd_hdac_spdif_stream_format(runtime->channels, bps, runtime->rate, ctls);
 	if (!format_val) {
 		dev_err(chip->card->dev,
 			"invalid format_val, rate=%d, ch=%d, format=%d\n",
-- 
2.25.1


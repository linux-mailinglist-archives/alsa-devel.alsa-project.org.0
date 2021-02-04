Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A0C30E9CF
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 03:02:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5A3D175C;
	Thu,  4 Feb 2021 03:01:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5A3D175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612404155;
	bh=uC0oSc0tq9YwiSUSn7o79RXkrno7BBohq/hnDW/TB5g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bYs06NNQX5nh/85XS0a/+mExlPhqmewhq/xOlcZtvBF6JWeOfvPH3jNt9WPzz7dJk
	 mjBNvanBFAY3GVnkdspZgNJYQR3G5wVnc11o9gJUDEiSm3p2BJzrRu7OzNKJp9X+EO
	 bKuz0iJPgEjLkxiVvwsHt02ms+olxb4H8JSUhzW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE01BF80275;
	Thu,  4 Feb 2021 03:00:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC226F8013C; Thu,  4 Feb 2021 03:00:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 919BDF8013C
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 03:00:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 919BDF8013C
IronPort-SDR: P0yxwylXVXGEwF62MmQxglJ5hq8+8SfMgH0EyCRRfv6e8OdNC3r4aiYqbTE+iCdpYtXA2ff/a2
 KX9noPfO561Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="245227975"
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="245227975"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 18:00:36 -0800
IronPort-SDR: nONynirb+tj5t0sydE4tiSNNc0hHXJNUGwlMi7V3AdFH+fnQApq3UjxFbRP0wrwxcqHYvTJXrS
 YP9qix5ISHCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="433712014"
Received: from jsia-hp-z620-workstation.png.intel.com ([10.221.118.135])
 by orsmga001.jf.intel.com with ESMTP; 03 Feb 2021 18:00:35 -0800
From: Sia Jee Heng <jee.heng.sia@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH RFC 1/4] ASoC: codec: hdmi-codec: Support IEC958 encoded PCM
 format
Date: Thu,  4 Feb 2021 09:42:55 +0800
Message-Id: <20210204014258.10197-2-jee.heng.sia@intel.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210204014258.10197-1-jee.heng.sia@intel.com>
References: <20210204014258.10197-1-jee.heng.sia@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, jee.heng.sia@intel.com,
 pierre-louis.bossart@linux.intel.com
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

Existing hdmi-codec driver only support standard pcm format.
Support of IEC958 encoded format pass from ALSA IEC958 plugin is needed
so that the IEC958 encoded data can be streamed to the HDMI chip.

Signed-off-by: Sia Jee Heng <jee.heng.sia@intel.com>
---
 include/sound/hdmi-codec.h    | 5 +++++
 sound/soc/codecs/hdmi-codec.c | 4 +++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index b55970859a13..4b3a1d374b90 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -34,6 +34,11 @@ struct hdmi_codec_daifmt {
 	unsigned int frame_clk_inv:1;
 	unsigned int bit_clk_master:1;
 	unsigned int frame_clk_master:1;
+	/* bit_fmt could be standard PCM format or
+	 * IEC958 encoded format. ALSA IEC958 plugin will pass
+	 * IEC958_SUBFRAME format to the underneath driver.
+	 */
+	snd_pcm_format_t bit_fmt;
 };
 
 /*
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 0f3ac22f2cf8..422539f933de 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -489,6 +489,7 @@ static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
 	hp.sample_rate = params_rate(params);
 	hp.channels = params_channels(params);
 
+	cf->bit_fmt = params_format(params);
 	return hcp->hcd.ops->hw_params(dai->dev->parent, hcp->hcd.data,
 				       cf, &hp);
 }
@@ -617,7 +618,8 @@ static const struct snd_soc_dai_ops hdmi_codec_spdif_dai_ops = {
 			 SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S20_3BE |\
 			 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_3BE |\
 			 SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |\
-			 SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE)
+			 SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE |\
+			 SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
 
 static int hdmi_codec_pcm_new(struct snd_soc_pcm_runtime *rtd,
 			      struct snd_soc_dai *dai)
-- 
2.18.0


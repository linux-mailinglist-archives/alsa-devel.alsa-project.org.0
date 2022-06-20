Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFCC551266
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 10:17:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D069118A8;
	Mon, 20 Jun 2022 10:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D069118A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655713060;
	bh=vADdhna7FQFqstMcXpeMKuGDfa4BtI+bMMrDxM47pLY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PVoxyUnXALs5HOgv8H0D0uEFbTCQefQ8I5NUdK197pz8MvTg101bBjsFE7comR9pb
	 VIqejWEM3SkK8cGew3kar6tYUiAFlmjKWH6pq3GF+cOhLi04opKJGS9BNY4Qm0RRKv
	 KloByLaDr8bXpG0vpEJuEk23UrkPKoj19x4aeEJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A84C3F805BB;
	Mon, 20 Jun 2022 10:12:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DE95F8052E; Mon, 20 Jun 2022 10:12:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 253A7F8057A
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 10:12:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 253A7F8057A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HLXiwrQq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655712769; x=1687248769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vADdhna7FQFqstMcXpeMKuGDfa4BtI+bMMrDxM47pLY=;
 b=HLXiwrQqJ9sbQRTR2IiJvvynXnXk/OXi1R0HQZ4YMebIqaaPv5WsLpSX
 8KRfSErsa2YcDA60CMRwEWCcP9AI3mCFTuGR/sPmCAzPC5wm7YYaIYj2W
 Ahv+jq3J/7V1PA74v2duq4GPFcuCKqZJz2OMcSWur9NyokJmJLMK+PMHt
 96opy/XNwdg8nxP7rFmn2Rrl2VgqCrB2ibRDgmgSBtzIuPHl832Wj17pU
 0ntCl802vuknhHban3WhpYjlnlER/5xkK29Qv1LYMFB9ApmPyDyRHzTWt
 L9KfZwx6H9SLJvN/LWNeNCyuFuBsLBdu/F3hM8XDSWQ6u0IOv3fzoCQz9 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="305270953"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="305270953"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 01:12:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="591067462"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 20 Jun 2022 01:12:46 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v3 15/17] ASoC: Intel: bdw_rt286: Improve codec_init() quality
Date: Mon, 20 Jun 2022 10:22:24 +0200
Message-Id: <20220620082226.2489357-16-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620082226.2489357-1-cezary.rojewski@intel.com>
References: <20220620082226.2489357-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Drop redundant 'ret' assignemnt, stop ignoring set_jack() return value
and reword local 'component' variable to 'codec' to improve readability.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/boards/bdw_rt286.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index 16bddf4c6dcd..091b8194fdcb 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -61,8 +61,8 @@ static const struct snd_soc_dapm_route card_routes[] = {
 
 static int codec_link_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
-	int ret = 0;
+	struct snd_soc_component *codec = asoc_rtd_to_codec(rtd, 0)->component;
+	int ret;
 
 	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset", SND_JACK_HEADSET | SND_JACK_BTN_0,
 					 &card_headset, card_headset_pins,
@@ -70,8 +70,7 @@ static int codec_link_init(struct snd_soc_pcm_runtime *rtd)
 	if (ret)
 		return ret;
 
-	snd_soc_component_set_jack(component, &card_headset, NULL);
-	return 0;
+	return snd_soc_component_set_jack(codec, &card_headset, NULL);
 }
 
 static int codec_link_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
-- 
2.25.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 656025482AB
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 11:11:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85303182F;
	Mon, 13 Jun 2022 11:10:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85303182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655111489;
	bh=lR4Eg3fFKvbOU46Ba8iw/Y2tPLa+IWjj7O2y08P3DPk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rKvohppBoiIGcyA52XnlRs1Pwr3yqJ9Z0dkYtcDs6JQv5PS5Wq0Es4e/HCN2UwRle
	 5cEzdeaZJFww4nPFQ3nb49oZ0U0m3tplmdxVvClIC6knfQLAlaj0wprxYjPsM9H18R
	 Rav4G3i9AOuY2ABVykttcO0RZ2SO/zPUhxAx6uek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FA78F805C1;
	Mon, 13 Jun 2022 11:06:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66321F805A8; Mon, 13 Jun 2022 11:06:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFE1EF8057D
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 11:06:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFE1EF8057D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mPl7BfjU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655111171; x=1686647171;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lR4Eg3fFKvbOU46Ba8iw/Y2tPLa+IWjj7O2y08P3DPk=;
 b=mPl7BfjUNYI8Hnw5DJ1Ny6apgTfuTX7HZxFHKEZ+VUG+0vvZLcB8HQiA
 ZR87wIt6z/XistJVLLiC+4NUZJCDPtkJ88xtc5XZ8YUT/gx1X3kgDoU6W
 FWtE7QhdA5Qdd8cMGsPFZNhR6+hn90cn2fwHxFGqBWt9bwGCcbRyfXxck
 1/Gytx6pFSc4XFVHjFGlf2NWUN3FddflrLUIC5YOpR3XG0zJdSdMvM2Ek
 1DTIWK6gUgFNV5NWRQNplKncBLUdNjIzDD3C7v2vGReJ96WAtadgTAsSK
 MS11/T/zM1CszczDzG3PduOl6S27YU7WPd2/CmytGw66CLvQIjqIz0sDC w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="275753961"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="275753961"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 02:05:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="639626240"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 13 Jun 2022 02:05:57 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 15/17] ASoC: Intel: bdw_rt286: Improve codec_link_init()
 quality
Date: Mon, 13 Jun 2022 11:15:44 +0200
Message-Id: <20220613091546.1565167-16-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613091546.1565167-1-cezary.rojewski@intel.com>
References: <20220613091546.1565167-1-cezary.rojewski@intel.com>
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
index c21f71b477d5..92fddf6061e8 100644
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


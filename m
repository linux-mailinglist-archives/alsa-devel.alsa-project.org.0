Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85181551571
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 12:09:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B42E1902;
	Mon, 20 Jun 2022 12:08:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B42E1902
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655719751;
	bh=URa45WWB0RKrMiG+Q4VGRLT/z7GxowJZ+7YEpsPOc00=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WvYYXkDF0UUBs+hxf90JHg5NoCbgKPIGkA2Xd5jsFM6V5b6PszkpLXiRqWVimyEjx
	 n4Dg0bzoxgd9mP62a5+on1UYe2fjLgh7fcjuxauqVp2pSbnVz0IZRJ5yhh/ijUbXcH
	 OCJ/O4kdxKWYvqkXGnSEHJOXspytk6jTv7A8H+t4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71CD0F805BF;
	Mon, 20 Jun 2022 12:04:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD491F805BA; Mon, 20 Jun 2022 12:04:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7B4FF805AF
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 12:04:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7B4FF805AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IzpHZRFL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655719462; x=1687255462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=URa45WWB0RKrMiG+Q4VGRLT/z7GxowJZ+7YEpsPOc00=;
 b=IzpHZRFLEw7gwfPfdUtv/zBbkFBQXsWHo3k1fDbnHNne0GT2akAi4Qka
 8G+r2dr0Rma3Xy2nKIqdfsqzJGJis1hUhpfcPYlX1OWnthQYFXL+3PhyQ
 8vH4eCCR6j8tPe55ltzQpxxW4EsbQqpEjrA/DOc3btMVZttwjtLofdzDW
 Uc029TsnFpryNccuiDyw7EpgWW2reMCiR0dch7oUSBMlxR9hfn5PyzN7w
 hH5CkMlZf3hMK4aImblvIWhchmj/A0ummyJWfWVKyJpVMxUd2AIRqANPd
 ek9UcVLQpdK0kAD0Q3ZTpRird63glIa1BxzSpX5qqPbTHtCbHm4ZPqrDx A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="366180731"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="366180731"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 03:04:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="643046421"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 20 Jun 2022 03:04:17 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v4 15/17] ASoC: Intel: bdw_rt286: Improve codec_init() quality
Date: Mon, 20 Jun 2022 12:14:00 +0200
Message-Id: <20220620101402.2684366-16-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620101402.2684366-1-cezary.rojewski@intel.com>
References: <20220620101402.2684366-1-cezary.rojewski@intel.com>
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
index 8604b221b60d..36f984ff56c5 100644
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


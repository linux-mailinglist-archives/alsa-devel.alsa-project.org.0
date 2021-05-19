Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DD7388C12
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 12:51:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C13F168F;
	Wed, 19 May 2021 12:50:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C13F168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621421496;
	bh=7Lr/c0wIdQO/BYlrKPGWYp2sU3Q/5O4y2V8HUWSl33I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SEeoFWOaRq9oYg2OzafhxHCkZa+OFWwNNNdnnn3ggCWoE8bEDiktgjQPOWa1MpepT
	 fXPlsk0M2lGTrasOfFuszbLwMA3GTwzYDdgVHAl5urO7XfwiIvOCZv7wFa6uv5Dh/6
	 U/yac7w5Fz2Ytfi3ky0H8w/bejb4IjwPbBwe9zCg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF062F80259;
	Wed, 19 May 2021 12:49:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCE2EF80246; Wed, 19 May 2021 12:49:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4595FF80153
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 12:49:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4595FF80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="hBMfA8xM"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1621421386; x=1652957386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Lr/c0wIdQO/BYlrKPGWYp2sU3Q/5O4y2V8HUWSl33I=;
 b=hBMfA8xMCDnVWxRzIyL+zRODCC7G3ubsN2F2H8Qd5dSXeMQj+gq/Ap/O
 mMqGP3Z+cUzjUGwEgJXp2TVBMxUj1At4etoW2MYshZzEHXBvNwoKa/ww1
 6QsJqwfwgk2RE2bySs/xSeJTuV8NgkelnwgS0Tr+byZVoAXRiMD+DuF81
 ije6wkvg03enHHhi/E9zaR8GUAGE114OC6zx1kjoDtjQeaCDIpuutigv3
 +Y0Ua4uQzGwZQapmWLQ+W9XYU/vm/7nAEZFNvoVjz8kGHairJdzuJ+Z0U
 mUog9jjdBhC0heL3JDxjvn5XIAvA2N7KJPK1Od/E9v4w3xUeA9Xc41GaT w==;
IronPort-SDR: iv4wS1HmxYxkllRHbBAYvgT3VL5/XGK7LASNbdn1EbxlTHp9eco62uz1G74lx2nPQnAUkq9aDh
 dICoGEhrTGNN/J1HqQ7AUij1+/sG0OoVzYHiX5PZpEJy4lVxVXGYaIlKf1TMzil5wrVLGoSI63
 Fw4gvrJOAUqUy2NKL5MPA2WsD7nzBQvDt6PHh2wXyTMeWqQEXJeLKi0ZDd/VyCFuEtq4YxXCGF
 NAsP8QCCjCtJMt1/LP4iHpzyHJ7tcjZs6hkY3EaknBAPViRB0cID1XrCDJMKMrQA1fpQI4+d/2
 TY0=
X-IronPort-AV: E=Sophos;i="5.82,312,1613458800"; d="scan'208";a="118456744"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 May 2021 03:49:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 03:49:43 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 19 May 2021 03:49:39 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 2/6] ALSA: pcm: Export constraints initialization functions
Date: Wed, 19 May 2021 13:48:38 +0300
Message-ID: <20210519104842.977895-3-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210519104842.977895-1-codrin.ciubotariu@microchip.com>
References: <20210519104842.977895-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: lars@metafoo.de, kuninori.morimoto.gx@renesas.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org,
 joe@perches.com, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Cristian.Birsan@microchip.com, nicolas.ferre@microchip.com
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

Export the functions needed to initialize the constraints. These functions
will be used in soc-pcm to initialize the BE constraints.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 include/sound/pcm.h     | 3 +++
 sound/core/pcm_native.c | 6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 025b4d2ba0fe..2907ed2b937f 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1021,6 +1021,9 @@ int snd_pcm_hw_rule_add(struct snd_pcm_runtime *runtime,
 			snd_pcm_hw_rule_func_t func, void *private,
 			int dep, ...);
 
+int snd_pcm_hw_constraints_init(struct snd_pcm_substream *substream);
+int snd_pcm_hw_constraints_complete(struct snd_pcm_substream *substream);
+
 /**
  * snd_pcm_hw_constraint_single() - Constrain parameter to a single value
  * @runtime: PCM runtime instance
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 8dbe86cf2e4f..54e0eab2a57e 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2400,7 +2400,7 @@ static int snd_pcm_hw_rule_buffer_bytes_max(struct snd_pcm_hw_params *params,
 	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
 }		
 
-static int snd_pcm_hw_constraints_init(struct snd_pcm_substream *substream)
+int snd_pcm_hw_constraints_init(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_pcm_hw_constraints *constrs = &runtime->hw_constraints;
@@ -2523,8 +2523,9 @@ static int snd_pcm_hw_constraints_init(struct snd_pcm_substream *substream)
 		return err;
 	return 0;
 }
+EXPORT_SYMBOL(snd_pcm_hw_constraints_init);
 
-static int snd_pcm_hw_constraints_complete(struct snd_pcm_substream *substream)
+int snd_pcm_hw_constraints_complete(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_pcm_hardware *hw = &runtime->hw;
@@ -2607,6 +2608,7 @@ static int snd_pcm_hw_constraints_complete(struct snd_pcm_substream *substream)
 
 	return 0;
 }
+EXPORT_SYMBOL(snd_pcm_hw_constraints_complete);
 
 static void pcm_release_private(struct snd_pcm_substream *substream)
 {
-- 
2.27.0


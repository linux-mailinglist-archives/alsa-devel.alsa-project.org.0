Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7899B4EECC9
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Apr 2022 14:03:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25AE81AC3;
	Fri,  1 Apr 2022 14:03:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25AE81AC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648814638;
	bh=8LyawD9hWZllrSuMdo8QF3pMioUDcgJtjC8c9TRvJ7w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gsV6fMH3fsJG9tfTtNcDYgVN+Cvcf77A6OBKcEuuARgm/VRmCnrseASnpNYvI+WTJ
	 EjMnjAQ4DZLUH3TG4udXWnxlgP0acCo5tSurLEx8kU67x+CW2Tzi7iaeXzvqxelO1M
	 iwcOrT33OR4Gys1NJEzwPqhDjNx99kZJhWU+WO+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06BC1F80520;
	Fri,  1 Apr 2022 14:02:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A298F8051B; Fri,  1 Apr 2022 14:02:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 805EBF801D8
 for <alsa-devel@alsa-project.org>; Fri,  1 Apr 2022 14:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 805EBF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gq5gYgZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648814539; x=1680350539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8LyawD9hWZllrSuMdo8QF3pMioUDcgJtjC8c9TRvJ7w=;
 b=gq5gYgZANVWfa6rmf7kJFZ/IaRXAZ04uRJ9YXFj0dzLLlOL/YU46vvuD
 Hu9NZtgEJmqlL8E5zUy3+Lg7FtvokZtbgdYiCxqbe6gb/TDYX5kPBprSI
 etuYvxgBVGUcbzZd7R63McyG6mdO21brbNUfBfJC3kP6E1JfXLNrwYe0p
 wozmywrkz7PAgnTw+R/7HeL4JKdPtWlMcxvqJkavsM8sdXvCk4S6YtD/z
 Z3SAC0SwhgkOmM/DnjQyf4ljNi9YpNtriRr2dA2dL6cTlOFg58sbVa0hk
 yY50k1NASBxXs3mG3hVkcfaR5oLf63d6xW4JPj3QQm4cKxKMyBpHx0lZz A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="258945841"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="258945841"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 05:02:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="567431973"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga008.jf.intel.com with ESMTP; 01 Apr 2022 05:02:06 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/6] ASoC: topology: Use for loop instead of while
Date: Fri,  1 Apr 2022 14:01:55 +0200
Message-Id: <20220401120200.4047867-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401120200.4047867-1-amadeuszx.slawinski@linux.intel.com>
References: <20220401120200.4047867-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

The 'while' loop can be replaced with a 'for' loop, making it more clear
about what possible values there are, by having all of it in one place,
instead of scattered around.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 72e50df7052c..bd2155bb6532 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -2550,10 +2550,8 @@ static int soc_tplg_process_headers(struct soc_tplg *tplg)
 {
 	int ret;
 
-	tplg->pass = SOC_TPLG_PASS_START;
-
 	/* process the header types from start to end */
-	while (tplg->pass <= SOC_TPLG_PASS_END) {
+	for (tplg->pass = SOC_TPLG_PASS_START; tplg->pass <= SOC_TPLG_PASS_END; tplg->pass++) {
 		struct snd_soc_tplg_hdr *hdr;
 
 		tplg->hdr_pos = tplg->fw->data;
@@ -2585,8 +2583,6 @@ static int soc_tplg_process_headers(struct soc_tplg *tplg)
 			hdr = (struct snd_soc_tplg_hdr *)tplg->hdr_pos;
 		}
 
-		/* next data type pass */
-		tplg->pass++;
 	}
 
 	/* signal DAPM we are complete */
@@ -2653,10 +2649,10 @@ int snd_soc_tplg_component_remove(struct snd_soc_component *comp)
 {
 	struct snd_card *card = comp->card->snd_card;
 	struct snd_soc_dobj *dobj, *next_dobj;
-	int pass = SOC_TPLG_PASS_END;
+	int pass;
 
 	/* process the header types from end to start */
-	while (pass >= SOC_TPLG_PASS_START) {
+	for (pass = SOC_TPLG_PASS_END; pass >= SOC_TPLG_PASS_START; pass--) {
 
 		/* remove mixer controls */
 		down_write(&card->controls_rwsem);
@@ -2699,7 +2695,6 @@ int snd_soc_tplg_component_remove(struct snd_soc_component *comp)
 			}
 		}
 		up_write(&card->controls_rwsem);
-		pass--;
 	}
 
 	/* let caller know if FW can be freed when no objects are left */
-- 
2.25.1


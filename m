Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDB456A306
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 14:58:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF8A31674;
	Thu,  7 Jul 2022 14:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF8A31674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657198724;
	bh=48xYBzIKX0PEgKorZ5dr85JNDLgv4rXOCMdCy1UhRyk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JooutbOEJ5SfGQ2KcTt1rtJyQ1B1FCsdYxTy2OJHBwKGfsrzcWU5sSVI7V2nzySWx
	 prXKrFHkeIYG8n8D52sVLVrQuk1osrQ6cw6Q/IM9xiZbI9YI87JlLE6hfqSY8OQIIS
	 3LoqImpvG9vroMV3r8dqf9QAT5nd8+egmgXHb0EE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB7AFF80542;
	Thu,  7 Jul 2022 14:56:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9BD9F80537; Thu,  7 Jul 2022 14:56:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F35AF804FB
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 14:56:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F35AF804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="R0Pfb6n+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657198605; x=1688734605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=48xYBzIKX0PEgKorZ5dr85JNDLgv4rXOCMdCy1UhRyk=;
 b=R0Pfb6n+q3aaYowORdIxGxnFZ1CggPHPUsVhfoSgs2zyWXZKXbnKExyB
 lJqSWTREpr8ZCFTvFphys0/hWp+mqpGvmGo4u5YM4eFcoHs8xjvKUbI2K
 gTWByOBYIMmirPcxNOa5li3uHUMh4RUqrJ5vuJY0aAu56t9F5R5KBglgY
 cHb8FJ3Y4XbK7JtvO0rA4U3J+xnXQtiteQV0dgUENbOTlitYHh8YfKIGq
 pKtJSYp25RLyM5L2onzY4CXi4+bgaKV9dMXO65lSQdpw0vEp25PGRbdcN
 C1Kuo3Bl7atVCiDql/IwWJwJ1C6W/vtzmY3VBxeScWDBiWChRzRaSyeJT w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="272810622"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="272810622"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 05:56:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="620781748"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga008.jf.intel.com with ESMTP; 07 Jul 2022 05:56:42 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 3/5] ASoC: codecs: rt286: Set component to NULL on remove
Date: Thu,  7 Jul 2022 14:56:59 +0200
Message-Id: <20220707125701.3518263-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707125701.3518263-1-amadeuszx.slawinski@linux.intel.com>
References: <20220707125701.3518263-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
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

Make sure that component is set to proper value, otherwise we may
dereference freed component in interrupt.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt286.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index b2b0b2b1e4d0..c4f7c4c2d793 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -960,6 +960,7 @@ static void rt286_remove(struct snd_soc_component *component)
 	struct rt286_priv *rt286 = snd_soc_component_get_drvdata(component);
 
 	cancel_delayed_work_sync(&rt286->jack_detect_work);
+	rt286->component = NULL;
 }
 
 #ifdef CONFIG_PM
-- 
2.25.1


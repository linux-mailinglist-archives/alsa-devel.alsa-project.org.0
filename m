Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AE339E99D
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 00:29:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C30B16B0;
	Tue,  8 Jun 2021 00:28:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C30B16B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623104974;
	bh=+fAk3VBnrr6fOeX5n6z/mFtRbv16FTyXC7/WncVPpcs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oe5OkNlPWdg5JWOCLgpPHm5JuZSwUmHhgMHOeNH3j7ncGlxU5fH1kERxsQZJMZ2Qw
	 MqYpRm7aYGXmCnnNePlkyhR/4znE8sbsrJtEaz6dS9Jq6z5UH5X3Qq1l1QqramrMZ0
	 sc56uu+KEDkgNe8XZFPjcHKO4C4i7zzAHRu6KLIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23BA1F80524;
	Tue,  8 Jun 2021 00:23:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D39A9F8050F; Tue,  8 Jun 2021 00:23:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2FCFF8027C
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 00:23:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2FCFF8027C
IronPort-SDR: uCQxOvcaRMwEpN5XBBYNbGUd+cnSF7b5NG7v+/nuLSYj2NgMMQVKlE9J8s1uXDuJkbkCy9ji91
 gOZaY7fN8hcg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="268581965"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="268581965"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:23:16 -0700
IronPort-SDR: W0ESOtZZMW3idHCj0Hhfwm6CBfnw+nvBa9mMkznGnWZw7nq22nRsouGhfGvURBlhIHZ6tyZWFa
 MFVEATj3CoDA==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="449271020"
Received: from ticela-or-160.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.108.70])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:23:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 15/15] ASoC: rt711-sdca: handle mbq_regmap in
 rt711_sdca_io_init
Date: Mon,  7 Jun 2021 17:22:39 -0500
Message-Id: <20210607222239.582139-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607222239.582139-1-pierre-louis.bossart@linux.intel.com>
References: <20210607222239.582139-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Ryan Lee <ryans.lee@maximintegrated.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Shuming Fan <shumingf@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

We currently only hangle rt711->regmap in rt711_sdca_io_init(), and
rt711->mbq_regmap is missing.

Fixes: 7ad4d237e7c4a ('ASoC: rt711-sdca: Add RT711 SDCA vendor-specific driver')
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt711-sdca.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 24a084e0b48a..0b0c230dcf71 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -1500,6 +1500,8 @@ int rt711_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 	if (rt711->first_hw_init) {
 		regcache_cache_only(rt711->regmap, false);
 		regcache_cache_bypass(rt711->regmap, true);
+		regcache_cache_only(rt711->mbq_regmap, false);
+		regcache_cache_bypass(rt711->mbq_regmap, true);
 	} else {
 		/*
 		 * PM runtime is only enabled when a Slave reports as Attached
@@ -1565,6 +1567,8 @@ int rt711_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 	if (rt711->first_hw_init) {
 		regcache_cache_bypass(rt711->regmap, false);
 		regcache_mark_dirty(rt711->regmap);
+		regcache_cache_bypass(rt711->mbq_regmap, false);
+		regcache_mark_dirty(rt711->mbq_regmap);
 	} else
 		rt711->first_hw_init = true;
 
-- 
2.25.1


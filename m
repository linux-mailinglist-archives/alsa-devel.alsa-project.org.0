Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE8667E921
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 16:12:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DE6CAE8;
	Fri, 27 Jan 2023 16:11:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DE6CAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674832351;
	bh=jvjOKtTsN2MnG849lqt/rMmBorVqjY0Kh8Xv4nLZE/k=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jYGQMpJ7XrJO0UiU3Y/T2sD2+relxZLyYYhk/VGPeFX8DC2byUC/U7Hdfpg6tl0yR
	 XlQumO1hH0bDIiG0c7u/8NZTvjSXkwGjjP1dYY8h+eKaMmP+9RGAr+i6rL1lDVNTSr
	 a3lqDF+AvmP3xpDWur/wbU+PzsjS3wLJCeNIpWPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFBB9F80272;
	Fri, 27 Jan 2023 16:10:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 121E4F804F3; Fri, 27 Jan 2023 16:10:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DD4FF8007C
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 16:10:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DD4FF8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Rb8D69M9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674832221; x=1706368221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jvjOKtTsN2MnG849lqt/rMmBorVqjY0Kh8Xv4nLZE/k=;
 b=Rb8D69M9Z4mCSRTP/LgTPvvvRPGjOlWR/4q6jP5fMJegOOaJBB+gPS1T
 ixJTSQ/m8hJgQFOEwcGdX8DiPjh2DNOruFWWh24MTzHZcn9lsDMqWeykK
 Q1N90oIbFAAyTow6VtBquN7phdXWsSrJqAJiPY6tnOOHfaYFDA+J995y1
 K8GV84U+WXGJprLuaY8krLRsS/OQfX0EvprYqfyE69+3d+9pmLKys8A68
 BA1Pst2Eozw6qYgN4poF9mugCiBXXHmNTU2dZ4FIfIf7JxihQwDx+GAkG
 D8388Xdm7aHgprAw0wGzQeJYaQGzSYZEYOnudrHyYGToz6pQYZjTvCTK3 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="324795780"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="324795780"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 07:10:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="908708992"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="908708992"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jan 2023 07:10:13 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 02/11] ASoC: topology: Remove unused SOC_TPLG_PASS_PINS
 constant
Date: Sat, 28 Jan 2023 00:11:02 +0100
Message-Id: <20230127231111.937721-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
References: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The constant is unused, so it can be safely removed.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index b9addbab2b3d..e9138ec4df8f 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -44,9 +44,8 @@
 #define SOC_TPLG_PASS_WIDGET		3
 #define SOC_TPLG_PASS_PCM_DAI		4
 #define SOC_TPLG_PASS_GRAPH		5
-#define SOC_TPLG_PASS_PINS		6
-#define SOC_TPLG_PASS_BE_DAI		7
-#define SOC_TPLG_PASS_LINK		8
+#define SOC_TPLG_PASS_BE_DAI		6
+#define SOC_TPLG_PASS_LINK		7
 
 #define SOC_TPLG_PASS_START	SOC_TPLG_PASS_MANIFEST
 #define SOC_TPLG_PASS_END	SOC_TPLG_PASS_LINK
-- 
2.25.1


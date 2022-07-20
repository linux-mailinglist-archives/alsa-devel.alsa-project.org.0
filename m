Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F67557B6D2
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 14:52:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3C4B175D;
	Wed, 20 Jul 2022 14:51:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3C4B175D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658321522;
	bh=qmc6mT1Pg2bYm00KPG9wnXlps6MUBc9zXaoPAP4xO54=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tYV3caXVim5JXmbkrOqme36aM+nlCZ/r+pPpYO1D+DCHXknvStEvaB+YeomzsToRi
	 /u4bhedeQy70Y9Q4RFME9gbrNdAiXoRyFN5nA8by/QrIJTRdxVLZvXjAZWhDtFuW9/
	 eq4sSkqH5l8ZivEGDgOMcCqpmXOSQpzUTYJrQieg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77A55F80139;
	Wed, 20 Jul 2022 14:51:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4CF3F80139; Wed, 20 Jul 2022 14:50:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 135ECF800BA
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 14:50:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 135ECF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IxYSHWo5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658321454; x=1689857454;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qmc6mT1Pg2bYm00KPG9wnXlps6MUBc9zXaoPAP4xO54=;
 b=IxYSHWo5LYmT7nX5+GoRuyWlcENNZSk1bEcAXdb8M5z5xbDPhmjwFKms
 pjjIoP2MEw7VBL3aYqfmQi1HWSqWREfcdTjbeGLkQpsr3Ns1ofPdG4kOR
 0mtIMAPb2IThbDhk40D9Buiwcxiq0bYhn9IC/x+Aw5/mj7+CiXY9EEG32
 e3AWhlK8UCaDFS2P645EhryoJstoJ9BoyZxfTYWa2bKbywHdWhp+4TmFq
 FoiI4RqL8NLjnTvusDk3zBp7meAoJi2Y5E4akrJTyp/41UDq9BQhPaWd4
 jQI4dTWUOyLFhbf3z1uBB6L0hhVNXkUCdrweFSFiUGK7CASSW3ZQJVdTo g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="287926815"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="287926815"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 05:50:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="601946737"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga007.fm.intel.com with ESMTP; 20 Jul 2022 05:50:46 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Makefile: Fix simultaneous build of KUNIT tests
Date: Wed, 20 Jul 2022 14:51:15 +0200
Message-Id: <20220720125115.1785426-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
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

Using obj-$() := instead of obj-$() += leads to the latter assignment
overwriting earlier value. Fix this by using incremental assignment to
add additional objects to build.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/Makefile b/sound/soc/Makefile
index d4528962ac34..453181ef6c94 100644
--- a/sound/soc/Makefile
+++ b/sound/soc/Makefile
@@ -9,12 +9,12 @@ endif
 
 ifneq ($(CONFIG_SND_SOC_TOPOLOGY_KUNIT_TEST),)
 # snd-soc-test-objs := soc-topology-test.o
-obj-$(CONFIG_SND_SOC_TOPOLOGY_KUNIT_TEST) := soc-topology-test.o
+obj-$(CONFIG_SND_SOC_TOPOLOGY_KUNIT_TEST) += soc-topology-test.o
 endif
 
 ifneq ($(CONFIG_SND_SOC_UTILS_KUNIT_TEST),)
 # snd-soc-test-objs := soc-utils-test.o
-obj-$(CONFIG_SND_SOC_UTILS_KUNIT_TEST) := soc-utils-test.o
+obj-$(CONFIG_SND_SOC_UTILS_KUNIT_TEST) += soc-utils-test.o
 endif
 
 ifneq ($(CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM),)
-- 
2.25.1


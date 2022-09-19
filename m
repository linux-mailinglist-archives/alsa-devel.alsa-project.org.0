Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 566EB5BCB8B
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 14:12:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0E58163A;
	Mon, 19 Sep 2022 14:11:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0E58163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663589569;
	bh=Nx/9veb5WevesyvUKpKnd+n5Huptt0rImBZ2Hu571v0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MVv57nTftteSLDC/7PIiUzqCbxq0wu6BL2ecuK8fTT8XaJjrKoX7LJpGUQNSkssOq
	 /h9wir6nnj7BvBo6hT8cSU0mXfGKkbbBldvZZCZJyQbPjZf9orjj6KduKHqaWUURIl
	 b+C6IRN3GKEhMqG91qcTlXDdT1wgQyFCVnrMS7aA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1220DF8053B;
	Mon, 19 Sep 2022 14:11:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B29D0F800E5; Mon, 19 Sep 2022 14:11:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11E8EF800E5
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 14:11:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11E8EF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="j3F40Qg5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663589474; x=1695125474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nx/9veb5WevesyvUKpKnd+n5Huptt0rImBZ2Hu571v0=;
 b=j3F40Qg5M+DrYBn4yS2aZrgXpR/wVoMs1doSKFF6JbQhruOwc0gUYSZI
 GUhhAcwcPPnx3IKtCfj6qRhCPOWfD01CIlHrFWgS7U4Bp0HiMJlDGr+iF
 0Fqn/8FVRkDwOUbU0ERgsdloHSFxkEw/w7aupauK3eu7PJa7RpykofZ5J
 eaQPhuTxA3eCW3uopaJvxn0N6f5gMVyKCgcnxxWr6DDWExe+1AacDLjai
 Ijr+LskR3PL8RA6YH0PXzEDurIBNoDyijEBaKSGcimjMA2KXs6lqDjGLx
 qH6WmpJGEHfvWWL2E3D4tqjrzus8WezC7pcPnb+V54vsAZ2UzScvZT/L5 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="361121073"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="361121073"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:11:12 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="680826087"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.249.46.168])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:11:06 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/8] ALSA: hda: document state machine for hdac_streams
Date: Mon, 19 Sep 2022 14:10:35 +0200
Message-Id: <20220919121041.43463-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220919121041.43463-1-pierre-louis.bossart@linux.intel.com>
References: <20220919121041.43463-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

The code in this library is far from self-explanatory, hopefully this
state diagram reverse-engineered from the code will help others
understand the expected transitions.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/hda/hdac_stream.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 2dbde3d1cf683..2e98f5fd50e54 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -13,6 +13,39 @@
 #include <sound/hda_register.h>
 #include "trace.h"
 
+/*
+ * the hdac_stream library is intended to be used with the following
+ * transitions. The states are not formally defined in the code but loosely
+ * inspired by boolean variables. Note that the 'prepared' field is not used
+ * in this library but by the callers during the hw_params/prepare transitions
+ *
+ *			   |
+ *	stream_init()	   |
+ *			   v
+ *			+--+-------+
+ *			|  unused  |
+ *			+--+----+--+
+ *			   |    ^
+ *	stream_assign()	   | 	|    stream_release()
+ *			   v	|
+ *			+--+----+--+
+ *			|  opened  |
+ *			+--+----+--+
+ *			   |    ^
+ *	stream_reset()	   |    |
+ *	stream_setup()	   |	|    stream_cleanup()
+ *			   v	|
+ *			+--+----+--+
+ *			| prepared |
+ *			+--+----+--+
+ *			   |    ^
+ *	stream_start()	   | 	|    stream_stop()
+ *			   v	|
+ *			+--+----+--+
+ *			|  running |
+ *			+----------+
+ */
+
 /**
  * snd_hdac_get_stream_stripe_ctl - get stripe control value
  * @bus: HD-audio core bus
-- 
2.34.1


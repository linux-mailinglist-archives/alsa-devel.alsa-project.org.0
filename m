Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9565D21126E
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 20:17:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A2C51695;
	Wed,  1 Jul 2020 20:16:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A2C51695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593627447;
	bh=6hUTwPVKPsW79B6jntxUyQatT/TFPShwrsdQqKnDtak=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gtaHIL9oJvwzMKWKXcHxa6Xq8pkYcAHOtwzJyk7YeuugWlw8uJTwCZoA5JZGpnFfX
	 xm6AJkTsUO+dZ5Ltl8dQ1l9KB658A8zIn3D/aeODMhETXmpsBTs77mJQs1IZXV7eOv
	 pJmCGwaLvi2uVju5RxFsGKieJ2mzSbFKbUvUjqnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20629F802C4;
	Wed,  1 Jul 2020 20:14:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93343F80256; Wed,  1 Jul 2020 20:14:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB954F8021D
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 20:14:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB954F8021D
IronPort-SDR: wSWMG9sXF5b9bB03rsd1Sv4OvfjqKcIgR5CKQwt5CwB+1+RAqvQKlvfhMo88S3L7wREu5orBD/
 Z5Kna3wcf6RQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="145753250"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="145753250"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:13:54 -0700
IronPort-SDR: br8RPn8GsSpUR8qPtDoV5RBuX8S/oILASQFPeooKkpW+9DBjigKqD4eeezHaOolZ8KbiWK3gxQ
 LMt5KedvoNcw==
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="481686364"
Received: from srnatla-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.76.199])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:13:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/7] ASoC: codecs: wm8986: fix missing kernel-doc arguments
Date: Wed,  1 Jul 2020 13:13:16 -0500
Message-Id: <20200701181320.80848-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200701181320.80848-1-pierre-louis.bossart@linux.intel.com>
References: <20200701181320.80848-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Fix W=1 warning

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/wm8996.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/wm8996.c b/sound/soc/codecs/wm8996.c
index 0c176449ee2d..1d3b3f4e66b3 100644
--- a/sound/soc/codecs/wm8996.c
+++ b/sound/soc/codecs/wm8996.c
@@ -2224,6 +2224,9 @@ static void wm8996_free_gpio(struct wm8996_priv *wm8996)
 
 /**
  * wm8996_detect - Enable default WM8996 jack detection
+ * @component: ASoC component
+ * @jack: jack pointer
+ * @polarity_cb: polarity callback
  *
  * The WM8996 has advanced accessory detection support for headsets.
  * This function provides a default implementation which integrates
-- 
2.25.1


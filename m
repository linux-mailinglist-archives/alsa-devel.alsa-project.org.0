Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6AD211271
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 20:18:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60BF11687;
	Wed,  1 Jul 2020 20:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60BF11687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593627488;
	bh=OpHJrbp42+Ge015O1Zt3gDBpYW7oUoReeyDRHZrn8Fw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pBrUjfVTO9mdEoy/9YsqxeL7lUR+IvL37MXuWalKs7G4Ph32sThjTHVfdbMbKlBvi
	 Xg/GRq+cnzoEuyfmmCgr5Lq4ypoeHPhNYzA4zQsohyaszUK+vq3NGFbIHBCRwE2re1
	 6cr1045ttxsOT/bqwVELSwliKbmY4S7V3LP0EyfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 254CDF802DD;
	Wed,  1 Jul 2020 20:14:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E279F802BE; Wed,  1 Jul 2020 20:14:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1287F800C1
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 20:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1287F800C1
IronPort-SDR: WugHB2ckRo4nU7tnX6hqe/qRA85w0okY0dJML0/urX6bEo2qv8QvN3VxJtfpVXWKBgQwNbTGPv
 z7C1ngyYgqWw==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="145753260"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="145753260"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:13:55 -0700
IronPort-SDR: X+dd3kL6EmoimJEOzm6xfA0F33TEKU8dNNMbZD4bcfb/U9bG5WtWNJWx30qMzSfwRe0CjUrTq2
 2Q7wyUudBIYg==
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="481686380"
Received: from srnatla-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.76.199])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:13:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/7] ASoC: codecs: wm8960: fix kernel-doc
Date: Wed,  1 Jul 2020 13:13:17 -0500
Message-Id: <20200701181320.80848-5-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/codecs/wm8960.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index 96c4400e92f8..9dca6e28032a 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -612,7 +612,7 @@ static const int bclk_divs[] = {
  *	triplet, we relax the bclk such that bclk is chosen as the
  *	closest available frequency greater than expected bclk.
  *
- * @wm8960_priv: wm8960 codec private data
+ * @wm8960: codec private data
  * @mclk: MCLK used to derive sysclk
  * @sysclk_idx: sysclk_divs index for found sysclk
  * @dac_idx: dac_divs index for found lrclk
-- 
2.25.1


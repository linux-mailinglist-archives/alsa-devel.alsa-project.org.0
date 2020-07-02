Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBAD212ACC
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 19:05:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D26416CE;
	Thu,  2 Jul 2020 19:04:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D26416CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593709543;
	bh=MwtLk1E6gRqn0/h0CrKWiB4oHXtJTIlVt7N4F8MIb4E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p8IO5hseyqMiQpxftZZltQnyo7jVbVjc5qhCSsIGFWJTBfIysuYBrHnfmvUsp2fxF
	 PqYKNP8mRFGoz6moy6TQmUsAkLB/AgcCQPt++TNb+Z2auXlVIFR7lslcLjkqYa3BKQ
	 bzRowfxwgLgRcY+iscahj7LIbpk0wu9oC3KG8QPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A58EFF80306;
	Thu,  2 Jul 2020 18:59:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 640EAF802FD; Thu,  2 Jul 2020 18:59:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBE4FF802C4
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 18:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBE4FF802C4
IronPort-SDR: mDbuo3pp36Y/LMNBFuflg7Ig2fRfxg/lQWyLKw+w6RI+TdVBlB6/Rb0DPRbu6KDK5jldMu/laE
 L1xL0G1O8FAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="126583327"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="126583327"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 09:59:26 -0700
IronPort-SDR: vGxT/CuKUh5jLpdKvlQm4zKG/12W+Hvv5itYzMUGo5sqS2C+x6tg9gr9gWEKdq5CBJqV8TjrJu
 yNKQDXS38xbA==
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="426014917"
Received: from nzbastur-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.182])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 09:59:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 8/8] ASoC: uniphier: aio-core: fix kernel-doc
Date: Thu,  2 Jul 2020 11:59:01 -0500
Message-Id: <20200702165901.164100-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702165901.164100-1-pierre-louis.bossart@linux.intel.com>
References: <20200702165901.164100-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, broonie@kernel.org,
 "moderated list:ARM/UNIPHIER ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

Fix W=1 warning - wrong parameter description and bad format

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/uniphier/aio-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/uniphier/aio-core.c b/sound/soc/uniphier/aio-core.c
index 9bcba06ba52e..b8195778953e 100644
--- a/sound/soc/uniphier/aio-core.c
+++ b/sound/soc/uniphier/aio-core.c
@@ -93,9 +93,9 @@ void aio_iecout_set_enable(struct uniphier_aio_chip *chip, bool enable)
 
 /**
  * aio_chip_set_pll - set frequency to audio PLL
- * @chip  : the AIO chip pointer
- * @source: PLL
- * @freq  : frequency in Hz, 0 is ignored
+ * @chip: the AIO chip pointer
+ * @pll_id: PLL
+ * @freq: frequency in Hz, 0 is ignored
  *
  * Sets frequency of audio PLL. This function can be called anytime,
  * but it takes time till PLL is locked.
@@ -267,7 +267,6 @@ void aio_port_reset(struct uniphier_aio_sub *sub)
 /**
  * aio_port_set_ch - set channels of LPCM
  * @sub: the AIO substream pointer, PCM substream only
- * @ch : count of channels
  *
  * Set suitable slot selecting to input/output port block of AIO.
  *
-- 
2.25.1


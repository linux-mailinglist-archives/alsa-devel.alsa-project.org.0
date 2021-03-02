Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A56F32ABFC
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:02:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ED3E18FD;
	Tue,  2 Mar 2021 22:01:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ED3E18FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614718941;
	bh=V5HCpa1hfLlj2Q8n3NQMxE78/sXJ4hJEXWR8fW7ndCY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z5Acr6UYfQm7Rr3o8wQUUfB+om+70X6h/WdxX2kx7X8QLBYzWk0mKdRtFwTn8pi+7
	 Y8ctSRjUZgdwr21oWGsXID+BgyLDccmAMZghKmicx4T4KiZr61aAEb69SRNgR86YTS
	 Ix6z8gump+OQlcDluINFMoRZLHj4kTfYN4RrGWQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44753F80277;
	Tue,  2 Mar 2021 22:00:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CB01F8032D; Tue,  2 Mar 2021 22:00:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8ED0F80088
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:00:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8ED0F80088
IronPort-SDR: 8UjP+QnDr/mtE0+tGLJ2EFMIGAiEryFLXpj4Csdc0ze1l5hsSSo0R6QuQ58ahFAMiHaUgFjxZP
 x8Dyp2ZpaPeg==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174623707"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="174623707"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:00:26 -0800
IronPort-SDR: rf4P7g4JrDOeoXpZIlmLpzFgofa/tPFvLTxNtN3FQ8EPZ8iaxr3xDnju7zMrv35oLm8Q487tA4
 1ErR1pHR8lCw==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="373727784"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:00:25 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/9] ASoC: cs4270: fix kernel-doc
Date: Tue,  2 Mar 2021 14:59:18 -0600
Message-Id: <20210302205926.49063-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302205926.49063-1-pierre-louis.bossart@linux.intel.com>
References: <20210302205926.49063-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

Add missing parameter (which happens to be ignored)

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/cs4270.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs4270.c b/sound/soc/codecs/cs4270.c
index ddd95c8269ed..2d239e983a83 100644
--- a/sound/soc/codecs/cs4270.c
+++ b/sound/soc/codecs/cs4270.c
@@ -400,6 +400,7 @@ static int cs4270_hw_params(struct snd_pcm_substream *substream,
  * cs4270_dai_mute - enable/disable the CS4270 external mute
  * @dai: the SOC DAI
  * @mute: 0 = disable mute, 1 = enable mute
+ * @direction: (ignored)
  *
  * This function toggles the mute bits in the MUTE register.  The CS4270's
  * mute capability is intended for external muting circuitry, so if the
-- 
2.25.1


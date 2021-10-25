Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CCC439EEE
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 21:04:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23F1A16E4;
	Mon, 25 Oct 2021 21:03:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23F1A16E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635188646;
	bh=Vl7md2wy+tZFAWLivDTZpnUuFA5m5I2ZJUYjjE2IPeU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lbgFGfFSHRzCl07eNEkOBvnaTNqUl07aVNF/FASrdP/pjy+vQL3pu0w46zHia0AFW
	 zORg1QHaxWA1YjUG3vv/gIZc70pgQFA8OCMk7tAwqq6sXf7df8vZaoa8Wp6aDc1wIR
	 QNbFSGGiPp9akVnfaSQs0sDh3GSD0se1519/PjXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8721F80515;
	Mon, 25 Oct 2021 21:00:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C89DF804E7; Mon, 25 Oct 2021 21:00:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2AD2F8032B
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 21:00:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2AD2F8032B
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="216908162"
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="216908162"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 11:59:56 -0700
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="554318467"
Received: from ssubbar1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.118.197])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 11:59:55 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/8] ASoC: nau8821: fix kernel-doc
Date: Mon, 25 Oct 2021 13:59:28 -0500
Message-Id: <20211025185933.144327-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025185933.144327-1-pierre-louis.bossart@linux.intel.com>
References: <20211025185933.144327-1-pierre-louis.bossart@linux.intel.com>
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

make W=1 reports warnings:

sound/soc/codecs/nau8821.c:1192: warning: Function parameter or member
'component' not described in 'nau8821_set_fll'

sound/soc/codecs/nau8821.c:1192: warning: Function parameter or member
'pll_id' not described in 'nau8821_set_fll'

sound/soc/codecs/nau8821.c:1192: warning: Function parameter or member
'source' not described in 'nau8821_set_fll'

sound/soc/codecs/nau8821.c:1192: warning: Excess function parameter
'codec' description in 'nau8821_set_fll'

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/nau8821.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 4ea56d2f9509..2757d2eeb48a 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -1178,7 +1178,9 @@ static void nau8821_fll_apply(struct nau8821 *nau8821,
 
 /**
  * nau8821_set_fll - FLL configuration of nau8821
- * @codec:  codec component
+ * @component:  codec component
+ * @pll_id:  PLL requested
+ * @source:  clock source
  * @freq_in:  frequency of input clock source
  * @freq_out:  must be 256*Fs in order to achieve the best performance
  *
-- 
2.25.1


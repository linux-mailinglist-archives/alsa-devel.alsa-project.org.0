Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 105946E9DC
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 19:10:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EE2F16C9;
	Fri, 19 Jul 2019 19:09:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EE2F16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563556245;
	bh=5rE/nGd8mLLklrAJYMufSgbZcctxWN/+B02orvoYlWo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HY/zlXbj/AOrLTR6jjQbaU4L/i9etL5Om2JoAUSN0MLb4uyQVx4uHzMMxSWGeVLqP
	 xUPDBXo2QoWHCWJGifhLDfnoQp86eyLYDYvKFX7vLbiOMUdnLbONVeMERl9yYbWyCk
	 2RQiG+wfFip+lxxtG9Lgm7ZakgAc0ohUhKHoeuIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D33D2F80481;
	Fri, 19 Jul 2019 19:06:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8D3EF803D7; Fri, 19 Jul 2019 19:06:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55301F80363
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 19:06:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55301F80363
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 10:06:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,283,1559545200"; d="scan'208";a="191982219"
Received: from cvrozas-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.190.38])
 by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2019 10:06:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 19 Jul 2019 12:06:07 -0500
Message-Id: <20190719170610.17610-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719170610.17610-1-pierre-louis.bossart@linux.intel.com>
References: <20190719170610.17610-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Drake <drake@endlessm.com>, Hui Wang <hui.wang@canonical.com>,
 Curtis Malainey <cujomalainey@google.com>, broonie@kernel.org
Subject: [alsa-devel] [PATCH 3/6] ALSA: hda: intel-nhlt: remove useless OR
	operation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Each assignment is final so there's no point in doing an OR.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/hda/intel-nhlt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
index b9d00c1b25d5..7ba871e470f2 100644
--- a/sound/hda/intel-nhlt.c
+++ b/sound/hda/intel-nhlt.c
@@ -73,13 +73,13 @@ int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
 			switch (cfg->array_type) {
 			case NHLT_MIC_ARRAY_2CH_SMALL:
 			case NHLT_MIC_ARRAY_2CH_BIG:
-				dmic_geo |= MIC_ARRAY_2CH;
+				dmic_geo = MIC_ARRAY_2CH;
 				break;
 
 			case NHLT_MIC_ARRAY_4CH_1ST_GEOM:
 			case NHLT_MIC_ARRAY_4CH_L_SHAPED:
 			case NHLT_MIC_ARRAY_4CH_2ND_GEOM:
-				dmic_geo |= MIC_ARRAY_4CH;
+				dmic_geo = MIC_ARRAY_4CH;
 				break;
 
 			default:
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

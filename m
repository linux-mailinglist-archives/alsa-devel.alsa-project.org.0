Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C86D28E04
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 01:45:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7FCC1696;
	Fri, 24 May 2019 01:44:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7FCC1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558655103;
	bh=Eq5UEUCliZHKGeEJJn1W8anGlTMGM0kASlOzLNhI5Ew=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cO8Xugy+yig2YpA5oUnoME5922Lno4y/9dE/TgjRxzl6IMbDsY2lCI53B81/a6v6G
	 DxpgHRmHkKl4W9L4QVb3+FRZCqxgqqbz6DbihuWKfozRpsGrmpz9jntlc9RSZ/Qqvk
	 v+13FzJQmhYoNOqoJIW0Ad2A2WHfGrd8MQ2r5MkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B60EF8973D;
	Fri, 24 May 2019 01:40:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B13F3F8972E; Fri, 24 May 2019 01:40:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAF63F89718
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 01:40:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAF63F89718
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 16:40:39 -0700
X-ExtLoop1: 1
Received: from mgastonx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.128.35])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2019 16:40:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 23 May 2019 18:39:51 -0500
Message-Id: <20190523233951.31122-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523233951.31122-1-pierre-louis.bossart@linux.intel.com>
References: <20190523233951.31122-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Drake <drake@endlessm.com>, Hui Wang <hui.wang@canonical.com>,
 Curtis Malainey <cujomalainey@google.com>, broonie@kernel.org
Subject: [alsa-devel] [RFC PATCH 6/6] [HACK] ASoC: Intel: NHLT: handle
	VENDOR_DEFINED DMIC geometry
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

The NHLT spec defines a VENDOR_DEFINED geometry without defining how
many microphones are supported. Fall back to 2ch until we have better
information or experimental evidence on what to do.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/common/intel-nhlt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/intel-nhlt.c b/sound/soc/intel/common/intel-nhlt.c
index d93ecc32d996..86f8a7f3f059 100644
--- a/sound/soc/intel/common/intel-nhlt.c
+++ b/sound/soc/intel/common/intel-nhlt.c
@@ -81,7 +81,10 @@ int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
 			case NHLT_MIC_ARRAY_4CH_2ND_GEOM:
 				dmic_geo |= MIC_ARRAY_4CH;
 				break;
-
+			case NHLT_MIC_ARRAY_VENDOR_DEFINED:
+				dev_dbg(dev, "VENDOR_DEFINED DMIC array_type, using 2CH_SMALL\n");
+				dmic_geo |= NHLT_MIC_ARRAY_2CH_SMALL;
+				break;
 			default:
 				dev_warn(dev, "undefined DMIC array_type 0x%0x\n",
 					 cfg->array_type);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

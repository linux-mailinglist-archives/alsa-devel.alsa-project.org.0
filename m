Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F4C4EECD7
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Apr 2022 14:05:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B85C1918;
	Fri,  1 Apr 2022 14:04:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B85C1918
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648814706;
	bh=1U5depfYt/u2kbEpPbWdvWaNrKM0r9KePLowB6sh1KE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lLtV3tBywFEKTrpF0rr4tfzOLqpSVSpTDdN7IsdUM38oYi+mEULJA/qUKjbppTJhx
	 MCyh3izQ8b+2ZjjilDW67mbVYJ/0/u9DM2wvcb0/yXXT5fXTdEqxbBoNpI45OhV0Fe
	 sIkV8okhiKnZbIfvBz7IxdVrvuBk11hLPf4PkJj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9784F80537;
	Fri,  1 Apr 2022 14:02:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11AC5F80527; Fri,  1 Apr 2022 14:02:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49CD2F80517
 for <alsa-devel@alsa-project.org>; Fri,  1 Apr 2022 14:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49CD2F80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JQUpf7Z2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648814545; x=1680350545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1U5depfYt/u2kbEpPbWdvWaNrKM0r9KePLowB6sh1KE=;
 b=JQUpf7Z2JAqvktGhxrYsgETA1gNUmmLLB1Jy0sZjzOY5qy2U6LkbBd9o
 Z8+LjOUAUpr1MlT7+p+Xjmb5mdTa16lq0ynUzzQpBmBBeP6/4VugzUdNd
 Bjiv0b+hD7rKqJTx2Fb+V2s3JbWmCUJW5ilhD8tzAeTGi7dEnuDlLTfyZ
 bb9NCI6mKQwABNtZ6hDRybiGGsAhOWzESos9yVgcxK6p2fa9IMOn+GUwI
 Uol9y3ei9ozrvV2qDeFIR4Eti/BJ21ZKr57yugc6dMviSKgMWHcvijRqC
 rT9avn51tGY7QirxMeY57CqgKasRBRuEG+Pu99g1eghbfPoJFsUX5F88/ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="258945883"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="258945883"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 05:02:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="567432065"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga008.jf.intel.com with ESMTP; 01 Apr 2022 05:02:16 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 5/6] ASoC: topology: Correct error message
Date: Fri,  1 Apr 2022 14:01:59 +0200
Message-Id: <20220401120200.4047867-6-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401120200.4047867-1-amadeuszx.slawinski@linux.intel.com>
References: <20220401120200.4047867-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
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

Error message refers to mixer, but it is used for various other types of
controls, so change it to refer to generic "controls".

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 4e7dabcd69a4..3390bf0f8295 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -237,7 +237,7 @@ static inline void soc_control_err(struct soc_tplg *tplg,
 	struct snd_soc_tplg_ctl_hdr *hdr, const char *name)
 {
 	dev_err(tplg->dev,
-		"ASoC: no complete mixer IO handler for %s type (g,p,i) %d:%d:%d at 0x%lx\n",
+		"ASoC: no complete control IO handler for %s type (g,p,i) %d:%d:%d at 0x%lx\n",
 		name, hdr->ops.get, hdr->ops.put, hdr->ops.info,
 		soc_tplg_get_offset(tplg));
 }
-- 
2.25.1


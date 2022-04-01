Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 847F24EECD4
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Apr 2022 14:04:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3201A1AB0;
	Fri,  1 Apr 2022 14:04:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3201A1AB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648814693;
	bh=N6NfxZHXxXFFv18aQesiaGnM/IbG+3X5X0YYB9JhCOU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SNEuhv+FpfzEBJv12g6Nij4YWl1xQRtcRlL/TfodE6ZEX+mzTnGwe1pQ/EBdCgAgs
	 iN0rjHRvSCZtyAK4JBfdFwBKD/Janaoas2Y3FvfxiREppleWfQ5cZienDTJ927cak0
	 RUcMqRbMjcvzm5sUdJIqiGIqA2rTjjh7svKto/0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FFB4F80536;
	Fri,  1 Apr 2022 14:02:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49601F8047D; Fri,  1 Apr 2022 14:02:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94E63F80518
 for <alsa-devel@alsa-project.org>; Fri,  1 Apr 2022 14:02:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94E63F80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kS5bx2Z9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648814543; x=1680350543;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N6NfxZHXxXFFv18aQesiaGnM/IbG+3X5X0YYB9JhCOU=;
 b=kS5bx2Z9d0TMd/daz/of8cT0hwUIrcoHcNWUzh71r8pu6slKPCmdypZu
 pkjakpMUOMkNvADgh1NATOv9HDgpdWkgthAXoDel2OyBuhIlKrFJTnMCQ
 4yeqXI1j71TdDpbnYpCn7hLJ6sSI0IazBBa3VaHh2dNYd38HzK4x5cFja
 SPCABnmwOSIJhTzjR0D33CxjxbU/gpqcL1hptz+5WogynG+wSIZ07lv0N
 U/XrE3SR2Ev5BITEwOUUNOOFNN93Nq3zPsUmcvs6GVZ17LdtBGHsIjVu/
 ZTzFVMI361ey7/PEATiV++JNT/cMaqsSB7+aLbgx5JQ/gOiKxECVDU/gV A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="258945863"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="258945863"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 05:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="567432020"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga008.jf.intel.com with ESMTP; 01 Apr 2022 05:02:12 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/6] ASoC: topology: Return bool instead of int
Date: Fri,  1 Apr 2022 14:01:57 +0200
Message-Id: <20220401120200.4047867-4-amadeuszx.slawinski@linux.intel.com>
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

In practice soc_tplg_is_eof() returns boolean value and caller uses the
return value in such way, so convert the function to really do it.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index f5446aac8ac6..f8e482d616fb 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -104,13 +104,13 @@ static int soc_tplg_check_elem_count(struct soc_tplg *tplg, size_t elem_size,
 	return 0;
 }
 
-static inline int soc_tplg_is_eof(struct soc_tplg *tplg)
+static inline bool soc_tplg_is_eof(struct soc_tplg *tplg)
 {
 	const u8 *end = tplg->hdr_pos;
 
 	if (end >= tplg->fw->data + tplg->fw->size)
-		return 1;
-	return 0;
+		return true;
+	return false;
 }
 
 static inline unsigned long soc_tplg_get_hdr_offset(struct soc_tplg *tplg)
-- 
2.25.1


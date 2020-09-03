Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC7325D3DB
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 10:43:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E27FF1AC8;
	Fri,  4 Sep 2020 10:42:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E27FF1AC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599208993;
	bh=/6ovzl882hppiTLycTx4/fkgDv74abJvRaN/tprMr0U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q8wiX8I5K4WJgaSfp6RbIcny4PPL0BvgviLXRow3H6Sgh3vmdLBh2qIUuFuIiiMaR
	 cgysm2Utd3CpxovQSFidekXceI3VNC2wf9jxWzeM6WSI5JDGspRDk44lT/dAlNSnWu
	 kHNX0wqVViLVEW6bu3pA8PNAFw0mqnIVwl8c97NE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD2F6F80113;
	Fri,  4 Sep 2020 10:40:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5D44F802BC; Fri,  4 Sep 2020 10:40:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62F21F801DA
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 10:40:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62F21F801DA
IronPort-SDR: wB4Uf8Zcf4ZEgDZ9Z9h2onvgvTIYDeCvr4jisNACJsRs0hYACNY5jgol0XqhVwGgKCuX9mayp7
 /HvCdVIwanog==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="137231243"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="137231243"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 01:40:39 -0700
IronPort-SDR: 50nrgL/5igyKZdf4Mkjq06CHEwygX49SYgPoXEadfUSnhVQ8//e63PjAdPFQH3xjsA6qGhXJyX
 SDI9X/Po3KqQ==
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="478402092"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 01:40:35 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 1/3] ASoC: soc-dai: clarify return value for
 get_sdw_stream()
Date: Fri,  4 Sep 2020 04:46:48 +0800
Message-Id: <20200903204650.31098-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200903204650.31098-1-yung-chuan.liao@linux.intel.com>
References: <20200903204650.31098-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Previous changes move to use ERR_PTR(-ENOTSUPP), but it's not clear
what implementations can return in case of errors. Explicitly document
that NULL is not a possible return value, only ERR_PTR with a negative
error code is valid.

Fixes: 308811a327c38 ('ASoC: soc-dai: return proper error for get_sdw_stream()')
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reported-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/soc-dai.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 776a60529e70..8b693dade9c6 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -471,7 +471,8 @@ static inline int snd_soc_dai_set_sdw_stream(struct snd_soc_dai *dai,
  * This routine only retrieves that was previously configured
  * with snd_soc_dai_get_sdw_stream()
  *
- * Returns pointer to stream or -ENOTSUPP if callback is not supported;
+ * Returns pointer to stream or an ERR_PTR value, e.g.
+ * ERR_PTR(-ENOTSUPP) if callback is not supported;
  */
 static inline void *snd_soc_dai_get_sdw_stream(struct snd_soc_dai *dai,
 					       int direction)
-- 
2.17.1


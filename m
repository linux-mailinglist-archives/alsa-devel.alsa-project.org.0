Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D75C2AFAB0
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 22:46:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B21DC17B6;
	Wed, 11 Nov 2020 22:45:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B21DC17B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605131171;
	bh=/fah4MreZydpVobV0t/Q9ymIZiJW/HDpEPxYsL2284s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FYAZnfErPo4IZ3BxEY4taPNegfmrYpJNdEyPQ80J/1nz/87I4FttUj9lGQdTZDdA/
	 4RuuMWL0T/eG6+9iILzQCMFufZHZUTp+bZfEQr5De6hbeC5kck1AIqBAJSCj7Pen5N
	 nu8OHpdAwFyRAGAoquFIH7hF58CQqzSrupmzSrG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5235EF804D2;
	Wed, 11 Nov 2020 22:43:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91398F8025E; Wed, 11 Nov 2020 22:43:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57FEAF801F5
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 22:43:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57FEAF801F5
IronPort-SDR: C1DHJnBs0cjspMQf2/HBT80RZlC29OUKeOnWMG+xp5EPjhvGRYLnQXVMPDh/0dj3FvAv7AwEow
 JPY5QJgFZg9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="149495733"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="149495733"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 13:43:34 -0800
IronPort-SDR: pBX9ZLo/Gkfao9G71OczxuFZeai1hDtt6U3EXumM5oQphEgh4clj4KDUHdoVJHVMTKyjYqiLoz
 q+8jvybor7Fw==
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="356808086"
Received: from cmurill1-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.130.147])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 13:43:34 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: codecs: max98373-sdw: align regmap use with other
 codecs
Date: Wed, 11 Nov 2020 15:43:18 -0600
Message-Id: <20201111214318.150529-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111214318.150529-1-pierre-louis.bossart@linux.intel.com>
References: <20201111214318.150529-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

It's not clear why this driver has an additional call to
regmap_mark_dirty(), remove to align with others.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/max98373-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index fa589d834f9a..ec2e79c57357 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -247,7 +247,7 @@ static __maybe_unused int max98373_suspend(struct device *dev)
 	struct max98373_priv *max98373 = dev_get_drvdata(dev);
 
 	regcache_cache_only(max98373->regmap, true);
-	regcache_mark_dirty(max98373->regmap);
+
 	return 0;
 }
 
-- 
2.25.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1672C223D
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 10:58:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5FBF167C;
	Tue, 24 Nov 2020 10:57:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5FBF167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606211909;
	bh=+XRisdyUc7S7ECeAFTnxtH3gBzTtcWt0QGEctoFNHws=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HoBSicyfjZLDy1KdM4KAPnJJM8OSdRE8SngTyDAMwabm8MVSuwNV75R5yc0TYxkXw
	 ugGzImDVC0V7ClW+zaRtqQfLdAqfsbmmuktZxj5ioYTjo2KKNsdt1mUktMvSfJ/eJG
	 X5GmZnQvOHi2bJULVUPCYcNZz5CtIHfKMJfsK02U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 790C7F800C1;
	Tue, 24 Nov 2020 10:56:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 627E2F80165; Tue, 24 Nov 2020 10:56:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C74DF8015A
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 10:56:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C74DF8015A
IronPort-SDR: V8qR2wxDu+Jfrbnerpe3pewmFjzyae+XO+LJZl7rZnhIF1N0Jcw1j63A81gJ9SQdYqXod4GFAI
 WuMMwtjwoK3Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="159686946"
X-IronPort-AV: E=Sophos;i="5.78,365,1599548400"; d="scan'208";a="159686946"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 01:56:43 -0800
IronPort-SDR: 5jd8yRAizv3BSsVWv7oyy6W6Jpg58Nv7gkOtYzcelj/HiH/RC+y3+AuVcVtzuzLqsXwHlgX5+o
 7qyyatCQkdOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="358764289"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga008.jf.intel.com with ESMTP; 24 Nov 2020 01:56:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 0A4FEFC; Tue, 24 Nov 2020 11:56:39 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-acpi@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: [PATCH v1] ASoC: Intel: catpt: Replace open coded variant of
 resource_intersection()
Date: Tue, 24 Nov 2020 11:56:28 +0200
Message-Id: <20201124095628.54373-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

Since we have resource_intersection() helper, let's utilize it here.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

Promised clean up for recently introduced helper.

This has dependency to the patches currently in linux-pm tree. Other than that
everything else is already in upstream. Hence, logically it's better to push
thru Rafael's tree than wait one more cycle.

 sound/soc/intel/catpt/core.h   | 11 -----------
 sound/soc/intel/catpt/loader.c |  2 +-
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.h
index 0f53a0d43254..a64a0a77dcb7 100644
--- a/sound/soc/intel/catpt/core.h
+++ b/sound/soc/intel/catpt/core.h
@@ -22,17 +22,6 @@ void catpt_sram_free(struct resource *sram);
 struct resource *
 catpt_request_region(struct resource *root, resource_size_t size);
 
-static inline bool catpt_resource_overlapping(struct resource *r1,
-					      struct resource *r2,
-					      struct resource *ret)
-{
-	if (!resource_overlaps(r1, r2))
-		return false;
-	ret->start = max(r1->start, r2->start);
-	ret->end = min(r1->end, r2->end);
-	return true;
-}
-
 struct catpt_ipc_msg {
 	union {
 		u32 header;
diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
index 40c22e4bb263..ff7b8f0d34ac 100644
--- a/sound/soc/intel/catpt/loader.c
+++ b/sound/soc/intel/catpt/loader.c
@@ -267,7 +267,7 @@ static int catpt_restore_fwimage(struct catpt_dev *cdev,
 		r2.start = off;
 		r2.end = r2.start + info->size - 1;
 
-		if (!catpt_resource_overlapping(&r2, &r1, &common))
+		if (!resource_intersection(&r2, &r1, &common))
 			continue;
 		/* calculate start offset of common data area */
 		off = common.start - r1.start;
-- 
2.29.2


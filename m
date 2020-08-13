Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E711C243FB6
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 22:14:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 944D2169F;
	Thu, 13 Aug 2020 22:13:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 944D2169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597349652;
	bh=VtIsvrjzwpD7C+/OEdhdkuaGUUW9ScUB0oKuVr4r9GQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b/bZEgIYPgmvoh/pXZRx/qeVjdJz3O3+2PvxO6lvtL8VBOfvjOo9F2wDptBJcrzEh
	 vV/9hXb3363nBaMPodegqJrqTlMN2J+hBxBgu3Nm9Sw7iPicwB/T37J5g2fLhG/+i6
	 +pz/LBB+pInaM1DiSBecgedU439IvX1ZHhHzuBHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D3D4F8036C;
	Thu, 13 Aug 2020 22:02:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AA56F80342; Thu, 13 Aug 2020 22:02:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2CE5F8014C
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 22:02:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2CE5F8014C
IronPort-SDR: Q0aF8iB7anOXlFbS2bmIHAWXJQN5fgngbkVj/wa9oUJf4/y+LtjUThKVgRkmB7E2rTFdqa6puh
 bMe7dnp+x7zA==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="134374675"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="134374675"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:10 -0700
IronPort-SDR: zw4lUaxrTcXJTrwzN86IAWd6bjIhXqLjgOusAmXaTxl2g8Zd+/5brGFZz9ycHnqnE5EhFsYolP
 y2j+qonHE2aA==
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="495506325"
Received: from jctorres-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.137.200])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:08 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 17/21] ASoC: Intel: Skylake: cldma: remove redundant
 initialization
Date: Thu, 13 Aug 2020 15:01:43 -0500
Message-Id: <20200813200147.61990-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200813200147.61990-1-pierre-louis.bossart@linux.intel.com>
References: <20200813200147.61990-1-pierre-louis.bossart@linux.intel.com>
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

Fix cppcheck warning:

sound/soc/intel/skylake/skl-sst-cldma.c:248:10: style: Variable 'ret'
is assigned a value that is never used. [unreadVariable]
 int ret = 0;
         ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/skylake/skl-sst-cldma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-sst-cldma.c b/sound/soc/intel/skylake/skl-sst-cldma.c
index 36f697c61074..b91f7a652a2b 100644
--- a/sound/soc/intel/skylake/skl-sst-cldma.c
+++ b/sound/soc/intel/skylake/skl-sst-cldma.c
@@ -245,7 +245,7 @@ static int
 skl_cldma_copy_to_buf(struct sst_dsp *ctx, const void *bin,
 			u32 total_size, bool wait)
 {
-	int ret = 0;
+	int ret;
 	bool start = true;
 	unsigned int excess_bytes;
 	u32 size;
-- 
2.25.1


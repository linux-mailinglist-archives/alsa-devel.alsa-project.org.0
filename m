Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FF85E5F2E
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 12:00:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AF561F2;
	Thu, 22 Sep 2022 12:00:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AF561F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663840858;
	bh=QylrjU+4O7+wJLk6wYw6iipOPhmcz4SPOmfsaeKuKos=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sWplrf2tHVPaKV2VGM2eNI4zfT7QKrQg83YbN00krYGXVD36GHwfpHStaEChxFCQ1
	 hDM69R7u3Ydylto4yTUg3onZZS33eTiafFhJZPpR7Pbjy9fN7RYG+N7fzhqHZPHNxX
	 D3J3pXZiSGc/qBXW0sAI9wvkeuqlBotD8QnRLA6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6DC1F8030F;
	Thu, 22 Sep 2022 11:59:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08800F80107; Thu, 22 Sep 2022 11:59:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73347F8020D
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 11:59:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73347F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NHitN7JP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663840792; x=1695376792;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QylrjU+4O7+wJLk6wYw6iipOPhmcz4SPOmfsaeKuKos=;
 b=NHitN7JPAkHzNo5bm3hIHl0+HIOdMvQSQK2dAbwUQkfH0E5ZrkPe17BY
 GPhRz/YUbZ2SeGjyeD0qvkeTcg77PoYoa+Klyca4+/04LLZu94acr7nIT
 RU7ymk7hZ6IVTUZGfsDfF6qD584+U9mpZfPsBnEajT685TpgabfbmPoHd
 w5hzbjdWJXbdKrho29oBoz27MvAjHcw0/Iw/cilhCDh4DnSbRve8Qb1Ok
 cKgWRhhoRKrbh1P//YGKZ1hApju8c2t6TN1u53EC90doXcoCHFipzXW0p
 q7yv93CBQ67KyFcUg+ytxlAUxT7pvSEzYITVS8W2c6FsX1xQFiWshTUpB Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="300240608"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="300240608"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 02:59:38 -0700
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="650458349"
Received: from icostanz-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.251.210.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 02:59:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: es8316: fix register sync error in suspend/resume tests
Date: Thu, 22 Sep 2022 11:59:12 +0200
Message-Id: <20220922095912.27010-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 FRED OH <fred.oh@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

The SOF CI tests report failures with the following error thrown

kernel: es8316 i2c-ESSX8336:00: Unable to sync registers 0x0-0x1. -121

ES8336 only supports I2C read/write one byte a time, so we do need to
set the .use_single_read and .use_single_write flags to avoid this
sync issue.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: FRED OH <fred.oh@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/es8316.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 8643014472ae6..056c3082fe02c 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -815,6 +815,8 @@ static const struct regmap_access_table es8316_volatile_table = {
 static const struct regmap_config es8316_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
+	.use_single_read = true,
+	.use_single_write = true,
 	.max_register = 0x53,
 	.volatile_table	= &es8316_volatile_table,
 	.cache_type = REGCACHE_RBTREE,
-- 
2.34.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A64431FD24E
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 18:37:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45F0F1671;
	Wed, 17 Jun 2020 18:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45F0F1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592411865;
	bh=DP8Bi0nQk1pHuedRP9ixUPTybgHt491vCgiTaxy7Qv0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jJtY3H2Ss00WuCUSfSvG6SXTdiutd2TPm2YsWWNtxn3wA0SOrwbsEcZaPUcqbJwBE
	 xKvlosDZMSHIewGDR9L/Ua03Q9bsSz1yllsZrnIcD3FET8WRedFym6r6r/EOud2rej
	 hqSt+cD5eUpEV4qsSXq5dn/YOgmTNK33Wv7Xfepg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15B81F80116;
	Wed, 17 Jun 2020 18:36:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8465DF80171; Wed, 17 Jun 2020 18:36:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E972DF80101
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 18:35:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E972DF80101
IronPort-SDR: ANjTMokzD+mIdhJiv4KhmSY9x5FG5DY2cr8CskqOeISS65nzApBYKBimQZm/cCpHn2bG/cwitg
 PZo3mFPJMRcA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 09:35:40 -0700
IronPort-SDR: jOucAAYMAlYSucXyIDrAZaY7fp+jYsy2wCWVwARFFF1TuEE7mrW5odAZjoNSzrvmQWXMFQnWDr
 Ik3n3/HVkd8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,523,1583222400"; d="scan'208";a="308843739"
Received: from zdsmith-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.128])
 by orsmga008.jf.intel.com with ESMTP; 17 Jun 2020 09:35:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] soundwire: intel: fix memory leak with devm_kasprintf
Date: Wed, 17 Jun 2020 11:35:36 -0500
Message-Id: <20200617163536.17401-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Daniel Baluta <daniel.baluta@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
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

The dais are allocated with devm_kcalloc() but their name isn't
resourced managed and never freed. Fix by also using devm_ for the dai
names as well.

Fixes: c46302ec554c5 ('soundwire: intel: Add audio DAI ops')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 4cfdd074e310..c7422740edd4 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -930,8 +930,9 @@ static int intel_create_dai(struct sdw_cdns *cdns,
 
 	 /* TODO: Read supported rates/formats from hardware */
 	for (i = off; i < (off + num); i++) {
-		dais[i].name = kasprintf(GFP_KERNEL, "SDW%d Pin%d",
-					 cdns->instance, i);
+		dais[i].name = devm_kasprintf(cdns->dev, GFP_KERNEL,
+					      "SDW%d Pin%d",
+					      cdns->instance, i);
 		if (!dais[i].name)
 			return -ENOMEM;
 
-- 
2.20.1


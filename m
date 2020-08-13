Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDE1243FB4
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 22:13:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86D941689;
	Thu, 13 Aug 2020 22:12:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86D941689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597349581;
	bh=Tl1k5PTKceqMTh3pOb8+pPOnLb7vjFQN/a0geY3CCtk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QYaaJ3umwrQmEONequgh3vJMp4AB5aJyRk83yD1qVBkZnhfqPrRoM4yNqKq92WNJP
	 l52MWnSBdX2xMVcuqr63vh86ypht+OseVacrA5TTqED7UBF2xSUGvvaW0YkW3qomWM
	 w/4iw7Xipje7uOFqOxxPC6r5eU+WHBssbOj9afdE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDB41F8034D;
	Thu, 13 Aug 2020 22:02:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AE41F80323; Thu, 13 Aug 2020 22:02:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEE08F802E8
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 22:02:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEE08F802E8
IronPort-SDR: l1OgNCohLkdlVyr/ylo5McTiutcdQtSxJ26wcmdVVvjSmtE1nyTGlTYH3T7xA03JlJ3jVXEvLn
 lvidjJabmuLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="134374677"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="134374677"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:10 -0700
IronPort-SDR: qFQcayTnOYVBtiXAb1swA5ake24bt2wRpx81ntSm3DR17w0LIHWXDX4nLDSvrIXkv/dThRBzIE
 LO1P5tj53iYg==
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="495506329"
Received: from jctorres-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.137.200])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:08 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 18/21] ASoC: Intel: Skylake: sst-utils: remove redundant
 assignment
Date: Thu, 13 Aug 2020 15:01:44 -0500
Message-Id: <20200813200147.61990-19-pierre-louis.bossart@linux.intel.com>
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

sound/soc/intel/skylake/skl-sst-utils.c:240:10: style: Variable 'ret'
is assigned a value that is never used. [unreadVariable]
 int ret = 0;
         ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/skylake/skl-sst-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-sst-utils.c b/sound/soc/intel/skylake/skl-sst-utils.c
index b233f89517c1..57ea815d3f04 100644
--- a/sound/soc/intel/skylake/skl-sst-utils.c
+++ b/sound/soc/intel/skylake/skl-sst-utils.c
@@ -237,7 +237,7 @@ int snd_skl_parse_uuids(struct sst_dsp *ctx, const struct firmware *fw,
 	struct uuid_module *module;
 	struct firmware stripped_fw;
 	unsigned int safe_file;
-	int ret = 0;
+	int ret;
 
 	/* Get the FW pointer to derive ADSP header */
 	stripped_fw.data = fw->data;
-- 
2.25.1


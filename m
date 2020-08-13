Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B051243FA7
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 22:09:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5E901693;
	Thu, 13 Aug 2020 22:08:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5E901693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597349341;
	bh=fz/OtuVwk0WmeNoguWb3o6Bl/nnEHYdfxcAbOFVD7B0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PIT3x/jAofxA1O0L6Uk4TDUFwnzvpg8SOhFoDQHxzXKhYk449sKy4c7n+lSR4vkM6
	 sU3q7fJd0QPCn+gPgxeInzR6UZETNMKyj2kXLQI3DHYGmmN2Npro6IVY+Jmd1y9LYl
	 RgdB5csAIzedtPnx1/FCLy5sqyZlULRee60treZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62E58F802E1;
	Thu, 13 Aug 2020 22:02:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5391CF80306; Thu, 13 Aug 2020 22:02:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FF80F80162
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 22:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FF80F80162
IronPort-SDR: 0bOWTfVqf6W2vqVb8PkPLowtjHuwixcohDAdCdSF0ZThYZnxGpEtF3HJiU39FhL6fMnHcrk+QL
 xErO42MWaEOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="134374659"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="134374659"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:07 -0700
IronPort-SDR: oJOTc5lv9xR1sLWQ25efCX/reXSsMQd0Qeg3BDD/ewK8YrtHhEEN8xCRybnfSqLHWXAkK4w9P1
 G+xftXYhIgNQ==
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="495506310"
Received: from jctorres-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.137.200])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:05 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/21] ASoC: Intel: Baytrail: (cosmetic) align function
 parameters
Date: Thu, 13 Aug 2020 15:01:38 -0500
Message-Id: <20200813200147.61990-13-pierre-louis.bossart@linux.intel.com>
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

sound/soc/intel/baytrail/sst-baytrail-ipc.c:339:8: style:inconclusive:
Function 'sst_byt_stream_new' argument 3 names different: declaration
'get_write_position' definition
'notify_position'. [funcArgNamesDifferent]

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/baytrail/sst-baytrail-ipc.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/intel/baytrail/sst-baytrail-ipc.h b/sound/soc/intel/baytrail/sst-baytrail-ipc.h
index 755098509327..cc960b79e9e1 100644
--- a/sound/soc/intel/baytrail/sst-baytrail-ipc.h
+++ b/sound/soc/intel/baytrail/sst-baytrail-ipc.h
@@ -26,8 +26,7 @@ extern struct sst_ops sst_byt_ops;
 
 /* stream API */
 struct sst_byt_stream *sst_byt_stream_new(struct sst_byt *byt, int id,
-	uint32_t (*get_write_position)(struct sst_byt_stream *stream,
-				       void *data),
+	uint32_t (*notify_position)(struct sst_byt_stream *stream, void *data),
 	void *data);
 
 /* stream configuration */
-- 
2.25.1


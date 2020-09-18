Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1FF27084A
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 23:30:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35FDB1691;
	Fri, 18 Sep 2020 23:30:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35FDB1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600464652;
	bh=1PG/WpIggRVr4vN8KWaI8pgYooHNQsrRlk7bFccbzeY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I5FWQJePCGSAP1Lf5CM99/htLvPUfiSE5+RZksdHyjAn0he4MxuHf5yQyplwTI1kM
	 b+RtDzhkNT0cFZR1hhGKTAfKWDG9j2kkjaZ2zhUSjBnNPyr0EOVcuVBVTbNg3nax6H
	 fKM2zBWZQ4qrZkPmIQIKa1S8duOJCs5+2RLbuZVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C204F8015C;
	Fri, 18 Sep 2020 23:29:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFCFCF801F7; Fri, 18 Sep 2020 23:29:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97ABFF8012D
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 23:28:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97ABFF8012D
IronPort-SDR: K4oByi+DhFGlyx5br3YtXvBBdVwM8pD7v5sXOQQrLY+pdIbcHoGDIRYAsY/v6mGNriiI+wErum
 M6c3SJkwOUYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9748"; a="160953755"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="160953755"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 14:28:51 -0700
IronPort-SDR: Rg91LNxQ+oVeHTfOH4CgSQufBBIFgdE8b0fBMFGED3HJjqyYcz617NySfGZjqHCrbfVIWmuSX5
 a+gNYl2/y+SA==
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="452919321"
Received: from msalazar-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.41.172])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 14:28:50 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] topology: use inclusive language in documentation
Date: Fri, 18 Sep 2020 16:28:32 -0500
Message-Id: <20200918212832.249184-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918212832.249184-1-pierre-louis.bossart@linux.intel.com>
References: <20200918212832.249184-1-pierre-louis.bossart@linux.intel.com>
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

Use codec_provider and codec_consumer for bclk and fsync

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/topology.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/topology.h b/include/topology.h
index 4ade20df..d1feee4d 100644
--- a/include/topology.h
+++ b/include/topology.h
@@ -658,8 +658,8 @@ extern "C" {
  *
  *	id "1"				# used for binding to the config
  *	format "I2S"			# physical audio format.
- *	bclk   "master"			# Platform is master of bit clock
- *	fsync  "slave"			# Platform is slave of fsync
+ *	bclk   "codec_provider"		# Codec provides the bit clock
+ *	fsync  "codec_consumer"		# Codec follows the fsync
  * }
  * </pre>
  *
-- 
2.25.1


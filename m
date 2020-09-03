Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DF725CA06
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:13:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 874CA193F;
	Thu,  3 Sep 2020 22:12:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 874CA193F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599164020;
	bh=drRL8/ck8AitVxFqAly+f6FazZSeN3y75m1kGXBVFL4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G7w7QJYLjZqw7TIwi9ayvnR0QVWZ9PGxYOiEj3liGTqTQMY1a36GXGzvnl/uCYCnX
	 YHLYNQmldWixthm/SNo8d8mtWFKAzuiJ9bgBVuK2s9UgwraQnUTpNZxWlaAw3Ws/PY
	 99rEeAE/EolvM8eUjfSSIcn2px8cxm0b03e6OgEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85A70F802C4;
	Thu,  3 Sep 2020 22:11:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4455DF80278; Thu,  3 Sep 2020 22:11:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 322CAF80217
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:10:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 322CAF80217
IronPort-SDR: JbPkAmyLD2wnzoqogM2bffJ0h/IZGZ0MY41JH4EQmCUAfafRaBRyG+EBtD92VH9ZzzBX/gO07P
 cBR2Chr5kcBA==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="242471259"
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; d="scan'208";a="242471259"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 13:10:48 -0700
IronPort-SDR: AB6qyFq4t8thP8TS+3Dbxba/zc7I3cA1uUEkWRGrbcQt8VRn6YmkveewrhON2ibhQqqEd6K2kz
 UHVaTvKLLXbw==
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; d="scan'208";a="447033089"
Received: from mrcordie-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.195.28])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 13:10:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 3/3] topology: use inclusive language in documentation
Date: Thu,  3 Sep 2020 15:10:24 -0500
Message-Id: <20200903201024.1109914-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200903201024.1109914-1-pierre-louis.bossart@linux.intel.com>
References: <20200903201024.1109914-1-pierre-louis.bossart@linux.intel.com>
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

Use codec_provider and codec_follower for bclk and fsync

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/topology.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/topology.h b/include/topology.h
index 4ade20df..fcf9361d 100644
--- a/include/topology.h
+++ b/include/topology.h
@@ -658,8 +658,8 @@ extern "C" {
  *
  *	id "1"				# used for binding to the config
  *	format "I2S"			# physical audio format.
- *	bclk   "master"			# Platform is master of bit clock
- *	fsync  "slave"			# Platform is slave of fsync
+ *	bclk   "codec_provider"		# Codec provides the bit clock
+ *	fsync  "codec_follower"		# Codec follows the fsync
  * }
  * </pre>
  *
-- 
2.25.1


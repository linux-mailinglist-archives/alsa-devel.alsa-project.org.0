Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B1F25D9A7
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 15:33:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06DB01B05;
	Fri,  4 Sep 2020 15:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06DB01B05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599226387;
	bh=jcOEvJWUtJ0nyPs9aK7IwQQaryD6zNUsGPa7+oOXSIw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VbQRc9AFLNoYAw3pX8ZQCG73HfuHjCUzHCG0rpHANYyNYezCpmhxRQ0+wqeAERF6l
	 7TpfcjaNbmOWy1Y8/oyo9PglafuvWdufhO27JqKYJHD47FvWkHQy/7/SFauUPYB6aM
	 r7OLgDqScm75srOf7Zz3yWisL6vPB3Tt7wMgn5yo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4B55F802E2;
	Fri,  4 Sep 2020 15:29:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 468D6F802E9; Fri,  4 Sep 2020 15:29:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B937CF801DA
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 15:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B937CF801DA
IronPort-SDR: 4fNOSW+BBZbmvZQOUP7nQnN8eJ0oKNT6GKcchrzV/pON68FIhXMB5m6ikAhkkHh+7XAx49G7nL
 a9sXQvWYOc5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="137259560"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="137259560"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 06:29:39 -0700
IronPort-SDR: BXa9/td1v241rsvKXCx7pB3BJEjeNghe+CEDIk34norpbH01tahhlysf7kLh6ymNrgCeMbcph4
 PXWQ75TK/q/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="284416713"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 04 Sep 2020 06:29:37 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 05/16] ASoC: SOF: use the sof_ipc_comp reserved bytes for
 extended data
Date: Fri,  4 Sep 2020 16:27:33 +0300
Message-Id: <20200904132744.1699575-6-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200904132744.1699575-1-kai.vehmanen@linux.intel.com>
References: <20200904132744.1699575-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, Keyon Jie <yang.jie@linux.intel.com>,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

From: Keyon Jie <yang.jie@linux.intel.com>

Use the 32bit reserved member of the struct sof_ipc_comp as the extended
data length, this will help to minimize the ABI change for adding new
extended data to the struct sof_ipc_comp, usually only minor ABI version
bump needed for every update with this new solution.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof/topology.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/sof/topology.h b/include/sound/sof/topology.h
index 796b6c8e851d..d12736e14b69 100644
--- a/include/sound/sof/topology.h
+++ b/include/sound/sof/topology.h
@@ -57,8 +57,8 @@ struct sof_ipc_comp {
 	uint32_t pipeline_id;
 	uint32_t core;
 
-	/* reserved for future use */
-	uint32_t reserved[1];
+	/* extended data length, 0 if no extended data */
+	uint32_t ext_data_length;
 } __packed;
 
 /*
-- 
2.27.0


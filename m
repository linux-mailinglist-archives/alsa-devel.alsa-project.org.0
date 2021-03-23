Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 995CA345719
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 06:09:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01096165E;
	Tue, 23 Mar 2021 06:08:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01096165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616476146;
	bh=tHDNjEv+lZtOQdCXRVlxI1AueFsyBEH6DDiJsskcbv0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qpM9AYFTfIzAmdZEX4t2fsOIgX18p+l4oHzDjkcn0X+AO065Hy/Se3jN8sW6iqqpt
	 FsByWVLvyMUfyYqcnh5gaMHm0LX8+D1h4tv7tvik4rjATpF1vuGrPQ2eJGBphfHlxt
	 cDvzwTS631XhzRdfOALcx6pDEAtU+9SIpJ5o8J5c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9409DF80104;
	Tue, 23 Mar 2021 06:07:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94429F8028D; Tue, 23 Mar 2021 06:07:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EB72F80257
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 06:07:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EB72F80257
IronPort-SDR: Duc36UAAD5pefFq4dElkpQXQ+RtmKmGx3S6xznYnIh24+CuPl8xZIRUEfhZQtdAdRLWbAMuI8O
 i78YNao2xYAA==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="189805380"
X-IronPort-AV: E=Sophos;i="5.81,270,1610438400"; d="scan'208";a="189805380"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 22:07:12 -0700
IronPort-SDR: 2g+QbbLTG9piWLLnkm6TrIcb4ktNShOK5MGWU9XimSPag/ptxen6c2QGdV7ejFvWxXuWROapG8
 7mtnXOfCLmiw==
X-IronPort-AV: E=Sophos;i="5.81,270,1610438400"; d="scan'208";a="414800903"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 22:07:11 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 1/2] soundwire: add definition for DPn BlockPackingMode
Date: Tue, 23 Mar 2021 13:07:00 +0800
Message-Id: <20210323050701.23760-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210323050701.23760-1-yung-chuan.liao@linux.intel.com>
References: <20210323050701.23760-1-yung-chuan.liao@linux.intel.com>
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

For some reason we don't have an enum for this concept. Add
definitions following Table 102 of the SoundWire 1.2 specification.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/linux/soundwire/sdw.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index eaa1486bdca9..350436db6ddb 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -125,6 +125,12 @@ enum sdw_dpn_grouping {
 	SDW_BLK_GRP_CNT_4 = 3,
 };
 
+/* block packing mode enum */
+enum sdw_dpn_pkg_mode {
+	SDW_BLK_PKG_PER_PORT = 0,
+	SDW_BLK_PKG_PER_CHANNEL = 1
+};
+
 /**
  * enum sdw_stream_type: data stream type
  *
-- 
2.17.1


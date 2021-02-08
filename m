Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E393143B3
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 00:26:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8268E16BC;
	Tue,  9 Feb 2021 00:25:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8268E16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612826774;
	bh=uXiwV0IfvZZHga0zDkRCrcA8Y/suOV6LG2oxsvYzILY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FnLUCTTuHCTzxzGi02YeWYnB3vjstdKNQrGfT/QJoAcjJTt6mlS5mqA0wanP3pWXI
	 zHC1mRM4rC/aYFUQYj1pxiLxTNXSO8X+OkJQNmpzAnvubew7uMw8veWSRoSiDTlzMY
	 gVIKXRBmU7Qdyv/7ejTpF5nsNMt4wSAtFbK2SiDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62AB3F80264;
	Tue,  9 Feb 2021 00:23:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFC5BF8026B; Tue,  9 Feb 2021 00:23:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39E71F8026B
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 00:23:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39E71F8026B
IronPort-SDR: xxGcqb3Bx4MR/XhL+FXyYemxJTX9tB7xLL9pyBF7X0D7BrRcjjuQeAyn8jDTQhQ49bx4Ex1Z6q
 Nk7qJIeNukGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="243295604"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="243295604"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:22:19 -0800
IronPort-SDR: j7KFrM7kikS2cuaKwgHvBYmtwCmUy9fXin67dhsqBEni0Kf31Qsi4mTM4vjgXruhktdUv9vDz5
 BcRPoQIHm4Cw==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="585854684"
Received: from pmane-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.145.183])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:22:18 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/5] ASoC: SOF: ext_manifest: use explicit number for elem_type
Date: Mon,  8 Feb 2021 17:21:49 -0600
Message-Id: <20210208232149.58899-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208232149.58899-1-pierre-louis.bossart@linux.intel.com>
References: <20210208232149.58899-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?Karol=20Trzci=C5=84ski?= <karolx.trzcinski@linux.intel.com>
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

From: Fred Oh <fred.oh@linux.intel.com>

Use explicit number to define elem_type enum instead of using
SOF_IPC_EXT_*.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Karol Trzciński <karolx.trzcinski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/ext_manifest.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sound/sof/ext_manifest.h b/include/sound/sof/ext_manifest.h
index 7abc4f0bd3ad..2a7e055584f9 100644
--- a/include/sound/sof/ext_manifest.h
+++ b/include/sound/sof/ext_manifest.h
@@ -58,9 +58,9 @@ struct sof_ext_man_header {
 /* Extended manifest elements types */
 enum sof_ext_man_elem_type {
 	SOF_EXT_MAN_ELEM_FW_VERSION		= 0,
-	SOF_EXT_MAN_ELEM_WINDOW			= SOF_IPC_EXT_WINDOW,
-	SOF_EXT_MAN_ELEM_CC_VERSION		= SOF_IPC_EXT_CC_INFO,
-	SOF_EXT_MAN_ELEM_DBG_ABI		= SOF_IPC_EXT_USER_ABI_INFO,
+	SOF_EXT_MAN_ELEM_WINDOW			= 1,
+	SOF_EXT_MAN_ELEM_CC_VERSION		= 2,
+	SOF_EXT_MAN_ELEM_DBG_ABI		= 4,
 	SOF_EXT_MAN_ELEM_CONFIG_DATA		= 5, /**< ABI3.17 */
 	SOF_EXT_MAN_ELEM_PLATFORM_CONFIG_DATA   = 6,
 };
-- 
2.25.1


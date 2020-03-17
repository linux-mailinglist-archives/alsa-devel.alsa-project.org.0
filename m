Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E20D2188A9A
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 17:41:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 787191800;
	Tue, 17 Mar 2020 17:40:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 787191800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584463270;
	bh=3SIPzm+G/OtrCbtP1YIZ1/Nj/eSNqJELwIip5gje2qg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MHpkcp0P4B4W6yEQ+POxA5Rn5X6w4ZEpTJHYV1FHzgSBIX0Cfggoyk9g16XzXNM16
	 K+681cvQwf2+KAmm95B5VqViIztY52+m6MdA8qrhiwDrwT/BHJm1ndf5Zl8uxE7lwP
	 eNhIs4WQQt67VrwFKDEvTSBkqTd/7jCKMRfTgfsQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A3C7F802A9;
	Tue, 17 Mar 2020 17:36:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EC3EF8023E; Tue, 17 Mar 2020 17:34:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 317B0F80217
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 17:34:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 317B0F80217
IronPort-SDR: RB2vbut3KQ2Msz7BHcOt8mwZeGv5ekNW5eCJz1TmppxXb+XwkyDWVFBY7lqjUTj/EKBWjMy+Cb
 0B0SKYaC7MSA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 09:34:21 -0700
IronPort-SDR: 6BIqOOvma6RNOLMRBAepKDE3VHAk0ldRPdykOIJX1x6dIeKrvLlh1AehpMC98LGpRL7925f+XI
 gpaTr407/LuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,565,1574150400"; d="scan'208";a="244533168"
Received: from aavila-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.36.39])
 by orsmga003.jf.intel.com with ESMTP; 17 Mar 2020 09:34:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 06/17] soundwire: cadence: fix a io timeout issue in S3 test
Date: Tue, 17 Mar 2020 11:33:18 -0500
Message-Id: <20200317163329.25501-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200317163329.25501-1-pierre-louis.bossart@linux.intel.com>
References: <20200317163329.25501-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>, Rander Wang <rander.wang@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
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

From: Rander Wang <rander.wang@intel.com>

After system resumes from S3, io timeout occurs when setting one
unused master on Comet Lake platform. In this case, the master is
reset to default state, and FIFOLEVEL is reset to default value,
but msg_count used for tracing FIFOLEVEL is still with old value,
so FIFOLEVEL will not be set if a new msg FIFO usage is equal to
the old msg_count.

This patch updates msg_count to default value of FIFOLEVEL when
resetting master.

Tested on Comet Lake platform.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index dc29556eaf94..37e16199933c 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -1068,6 +1068,9 @@ int sdw_cdns_init(struct sdw_cdns *cdns)
 	cdns_writel(cdns, CDNS_MCP_SSP_CTRL0, CDNS_DEFAULT_SSP_INTERVAL);
 	cdns_writel(cdns, CDNS_MCP_SSP_CTRL1, CDNS_DEFAULT_SSP_INTERVAL);
 
+	/* reset msg_count to default value of FIFOLEVEL */
+	cdns->msg_count = cdns_readl(cdns, CDNS_MCP_FIFOLEVEL);
+
 	/* flush command FIFOs */
 	cdns_updatel(cdns, CDNS_MCP_CONTROL, CDNS_MCP_CONTROL_CMD_RST,
 		     CDNS_MCP_CONTROL_CMD_RST);
-- 
2.20.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1184D2D9B
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 12:02:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D696417AA;
	Wed,  9 Mar 2022 12:01:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D696417AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646823739;
	bh=YMkzaEErX6AgAuAdDcSEKVs9osKSTDiB9RLL7v6C3kY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pfFrGpPXW5h2kaP0iPi2MA9SyP0GxXhd9PPg9EfCWOidJOZJ1eNpnVCzWCfSaHlQ9
	 g5og4P1D/oPn/Wh/n5nu/KFse9FzvXqugfh0OO05EBURLtmWBG6NYzrUiPn9Nb61C+
	 qaXpnyzUoWkFJpcS84ghzT2nARSG4J3cBIyuXeGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D182F800D2;
	Wed,  9 Mar 2022 12:01:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12276F80155; Wed,  9 Mar 2022 12:01:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3203DF80155
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 12:01:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3203DF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fOV0Vnb/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646823665; x=1678359665;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YMkzaEErX6AgAuAdDcSEKVs9osKSTDiB9RLL7v6C3kY=;
 b=fOV0Vnb/ttxyQG+tgTtS/pXWtnI+ZYoxtHfG7z2BMf0B8pFi9NuYdpBg
 ix8sqUGkW7QUUI2NxxZ+Y61rv7LCoq6LNbwnOPWCEmZ1B0xvIT+x0YtQM
 1QUfTQt16oVfgHBjgJDhzGl57SvlQHFP72+mpuL7PdDttEWN9buhiiWTm
 pzTpSMWPwQDCL0DI+8DcWoy1ebvphTk0Wg5FllbRNX2Y8v42RxxMHkqxF
 xDIpLTlWII2/7HDot7vG0xMPnRscfC+bh6MI2KUKR3oEWjadWQsHy0KEy
 A7P900Tl+aMtng+bdM3eECn5pjeOFtos//qx5s5LPzZLNxK38d222wc6y g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="255138201"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="255138201"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 03:00:58 -0800
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="554073542"
Received: from mweingar-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.219.87])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 03:00:56 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc-msg-injector: Use devm_kzalloc() for the
 rx_buffer
Date: Wed,  9 Mar 2022 13:01:04 +0200
Message-Id: <20220309110104.18370-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

The rx_buffer is cleared before sending an IPC to make sure that when the
/sys/kernel/debug/sof/ipc_msg_inject file is read we will have correct
information in the buffer (no random or stale data).

But if the user reads the file before sending any message the buffer might
contain garbage which should not be interpreted.

To prevent this, clear the rx_buffer on allocation.

Fixes: cac0b0887e53 ("ASoC: SOF: Convert the generic IPC message injector into SOF client")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-client-ipc-msg-injector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
index bce103da4c49..dba6cfd7db09 100644
--- a/sound/soc/sof/sof-client-ipc-msg-injector.c
+++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
@@ -137,7 +137,7 @@ static int sof_msg_inject_probe(struct auxiliary_device *auxdev,
 		return -ENOMEM;
 
 	priv->tx_buffer = devm_kmalloc(dev, SOF_IPC_MSG_MAX_SIZE, GFP_KERNEL);
-	priv->rx_buffer = devm_kmalloc(dev, SOF_IPC_MSG_MAX_SIZE, GFP_KERNEL);
+	priv->rx_buffer = devm_kzalloc(dev, SOF_IPC_MSG_MAX_SIZE, GFP_KERNEL);
 	if (!priv->tx_buffer || !priv->rx_buffer)
 		return -ENOMEM;
 
-- 
2.35.1


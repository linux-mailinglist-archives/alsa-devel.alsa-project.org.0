Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4979A2F71
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 08:11:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 643CE1666;
	Fri, 30 Aug 2019 08:11:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 643CE1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567145510;
	bh=5ofIIf8R1RVTI6psUgSGoEHhWRz7oGRF8iK1FPq4QD4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XNnB+aiuH+c+Q3n2VAoB3dh6LiVG7MmdjvgOk9kMjbu9jT1fV/HabAoap9Q815mJt
	 h6rqKyJIZWv+rIflVBL/MfgANKNT6XTsBSuR0n4SgTv9vxBs/euvvl9pmQxYxf1vtI
	 X2mNYToKkTX4MVtjEVLVuXiqOn2A0a6RV8NamlD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6827F80362;
	Fri, 30 Aug 2019 08:10:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0355F80369; Fri, 30 Aug 2019 08:10:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9C7BF800D1;
 Fri, 30 Aug 2019 08:09:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9C7BF800D1
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 23:09:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,445,1559545200"; d="scan'208";a="172141707"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga007.jf.intel.com with ESMTP; 29 Aug 2019 23:09:54 -0700
From: Bard liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 30 Aug 2019 02:11:35 +0800
Message-Id: <20190829181135.16049-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, Blauciak@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, broonie@kernel.org, bard.liao@intel.com
Subject: [alsa-devel] [PATCH] soundwire: bus: set initial value to
	port_status
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

port_status[port_num] are assigned for each port_num in some if
conditions. So some of the port_status may not be initialized.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index f6a1e4b4813d..33f41b3e642e 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -835,7 +835,7 @@ static int sdw_handle_port_interrupt(struct sdw_slave *slave,
 static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 {
 	struct sdw_slave_intr_status slave_intr;
-	u8 clear = 0, bit, port_status[15];
+	u8 clear = 0, bit, port_status[15] = {0};
 	int port_num, stat, ret, count = 0;
 	unsigned long port;
 	bool slave_notify = false;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7673117F9
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 13:08:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D28F17C2;
	Thu,  2 May 2019 13:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D28F17C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556795322;
	bh=3muwujY3Rb0ir0gt2mT2icGeL4kg1JanP8FaCsvzCo8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k7xzfwkl0w7Ntiddj6j62DZcwAhswiv6V6T5kWSYChbkTEj+ZQNxCdmw88fOuw1bV
	 m+C9vz96618fy7Qa+ueaJIDb9s/Dp4+Iyis45IlK4R3brDnnb6I8bCwXsPTq1RxAW3
	 raK61N3ymz12Ls0fg8BqMfn3d/Iv4zsdVbshpzZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D73ACF89757;
	Thu,  2 May 2019 13:00:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C748F89749; Thu,  2 May 2019 13:00:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E497F89744
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 13:00:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E497F89744
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q5pHCxpn"
Received: from localhost.localdomain (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3AEAF2089E;
 Thu,  2 May 2019 11:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556794837;
 bh=1A74646puAjURq5Qq3C1h6TqzTfKtfb7ZZr985nSD08=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q5pHCxpnr4+QePhDKlCY725qQVvLWDD8N7JBRLv+Vs00qlBURZZaAi8caqjYIbF/l
 MDt8UTUfHe1AqarESepP5xmtmJ+wPJE4EYbmjHWEIJvTFl3BjHTwqxe/GfyakASDNg
 jnYcglJ6wthgsSWCQy205dw2wTZqoj3ydvVRDAkQ=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Date: Thu,  2 May 2019 16:29:26 +0530
Message-Id: <20190502105930.9889-11-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502105930.9889-1-vkoul@kernel.org>
References: <20190502105930.9889-1-vkoul@kernel.org>
MIME-Version: 1.0
Cc: Greg KH <gregkh@linuxfoundation.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Shreyas NC <shreyas.nc@intel.com>
Subject: [alsa-devel] [PATCH 10/14] soundwire: avoid multiple assignments
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Modify the code to avoid multiple assignments by assigning to variable
after error checks in soundwire bus.

CHECK: multiple assignments should be avoided

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/bus.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 16b2a3b2662d..aac35fc3cf22 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -812,12 +812,13 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 	sdw_modify_slave_status(slave, SDW_SLAVE_ALERT);
 
 	/* Read Instat 1, Instat 2 and Instat 3 registers */
-	buf = ret = sdw_read(slave, SDW_SCP_INT1);
+	ret = sdw_read(slave, SDW_SCP_INT1);
 	if (ret < 0) {
 		dev_err(slave->bus->dev,
 			"SDW_SCP_INT1 read failed:%d\n", ret);
 		return ret;
 	}
+	buf = ret;
 
 	ret = sdw_nread(slave, SDW_SCP_INTSTAT2, 2, buf2);
 	if (ret < 0) {
@@ -910,12 +911,13 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		 * Read status again to ensure no new interrupts arrived
 		 * while servicing interrupts.
 		 */
-		_buf = ret = sdw_read(slave, SDW_SCP_INT1);
+		ret = sdw_read(slave, SDW_SCP_INT1);
 		if (ret < 0) {
 			dev_err(slave->bus->dev,
 				"SDW_SCP_INT1 read failed:%d\n", ret);
 			return ret;
 		}
+		_buf = ret;
 
 		ret = sdw_nread(slave, SDW_SCP_INTSTAT2, 2, _buf2);
 		if (ret < 0) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

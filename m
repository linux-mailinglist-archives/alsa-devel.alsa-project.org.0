Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E799117FB
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 13:09:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 071E6173B;
	Thu,  2 May 2019 13:08:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 071E6173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556795365;
	bh=NMH6EpyqK5zzUyakKqQCT5Il58oCzZw5ugyNT+73DPM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A8/qQd5YZ0Dplja7eXO8fKyjhrc7fBz86v5P3HCwUzoV4Bh2+597xo2WiBOWUPaVH
	 jNKkuemRuo+2Y6B5roHnCyzRU1cr6Tm/eJ3xf55bXKzSn1Axl7lRAspxOZ7vkkMSL0
	 SvmtZjKkzsEJKms1QS9OaJfiJH+Oiij7UPwruvKA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0A66F8974F;
	Thu,  2 May 2019 13:00:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96E85F89750; Thu,  2 May 2019 13:00:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45656F8974A
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 13:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45656F8974A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m2AOHFy3"
Received: from localhost.localdomain (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D5AE0208C4;
 Thu,  2 May 2019 11:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556794839;
 bh=9tCtHCXFTD+z3idObz6Mh7l5kzSf30X9HL8hZmlNGDE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m2AOHFy3jbEb9GOdnHpMIcKZvu2Er9phTbbZHQbDtyVXpnhnh9+bJB1hBPr03EB7j
 s2XKLOv62RlZN/TVrMTMq7entyS6nXEB2NYKf0M2FrXp9n0RmiHmadOEdlR1azJgrW
 seTRtkk8pV9JeSFc0mMex1j3lYgwwj03sNQkNhDo=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Date: Thu,  2 May 2019 16:29:27 +0530
Message-Id: <20190502105930.9889-12-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502105930.9889-1-vkoul@kernel.org>
References: <20190502105930.9889-1-vkoul@kernel.org>
MIME-Version: 1.0
Cc: Greg KH <gregkh@linuxfoundation.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Shreyas NC <shreyas.nc@intel.com>
Subject: [alsa-devel] [PATCH 11/14] soundwire: fix more typos
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

Found few more typos in the code, fix them

CHECK: 'and and' may be misspelled - perhaps 'and'?
CHECK: 'smaple' may be misspelled - perhaps 'sample'?

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/stream.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index bffa535294ed..debb67882df4 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -89,7 +89,7 @@ static int _sdw_program_slave_port_params(struct sdw_bus *bus,
 
 	/*
 	 * Data ports are FULL, SIMPLE and REDUCED. This function handles
-	 * FULL and REDUCED only and and beyond this point only FULL is
+	 * FULL and REDUCED only and beyond this point only FULL is
 	 * handled, so bail out if we are not FULL data port type
 	 */
 	if (type != SDW_DPN_FULL)
@@ -233,7 +233,7 @@ static int sdw_program_master_port_params(struct sdw_bus *bus,
 
 	/*
 	 * we need to set transport and port parameters for the port.
-	 * Transport parameters refers to the smaple interval, offsets and
+	 * Transport parameters refers to the sample interval, offsets and
 	 * hstart/stop etc of the data. Port parameters refers to word
 	 * length, flow mode etc of the port
 	 */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

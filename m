Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1105711802
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 13:10:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86CB617D1;
	Thu,  2 May 2019 13:10:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86CB617D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556795455;
	bh=J217pAJN1IyjT/YWHZkTYbcLFrARmNkg67lNqmcqjh4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=foPYh+cZWpdQPFx4OwpoW3BKQUz+j4CVgmDSC8em52DCLXN99aZfl0y5DIbID5gDS
	 YTYlt2fOd+Al5JXufpDzr6w3v/usAI3k411xWTRfpMrBXOq5y7pcqjpNhv0TxQPvMp
	 zDP8qio2x5Bq49SlyGw5LdBPQDT+VxS9/vs3g38U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1407EF89769;
	Thu,  2 May 2019 13:00:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC7DCF8975B; Thu,  2 May 2019 13:00:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97287F89756
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 13:00:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97287F89756
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pTxr/exW"
Received: from localhost.localdomain (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 694012089E;
 Thu,  2 May 2019 11:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556794845;
 bh=vDqakhdvMhRiNZluGfBfkn/mYMDUZXvWHTTD0L06hvg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pTxr/exW7aBIM11oznnR1bfkq2uT6iCTe7NdbzUupuAWnzHQestrFZ9skTFkvP2zM
 D8izxuWJX6gzjpz7Loq4ohEnh+o+P1dIoc381Bu9k4gnr9k21pliK0dMDGt/txSDOc
 GAzJA+7edZ9LLc4gSRuDd8g0pKL6UBRtkzaDj524=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Date: Thu,  2 May 2019 16:29:29 +0530
Message-Id: <20190502105930.9889-14-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502105930.9889-1-vkoul@kernel.org>
References: <20190502105930.9889-1-vkoul@kernel.org>
MIME-Version: 1.0
Cc: Greg KH <gregkh@linuxfoundation.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Shreyas NC <shreyas.nc@intel.com>
Subject: [alsa-devel] [PATCH 13/14] soundwire: add a blank line between
	functions
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

For improving code readability it helps to have a blank line between
function so add when missing.

Checkpatch complains:
CHECK: Please use a blank line after function/struct/union/enum
declarations

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/stream.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index debb67882df4..d01060dbee96 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -52,6 +52,7 @@ static int sdw_find_row_index(int row)
 	pr_warn("Requested row not found, selecting lowest row no: 48\n");
 	return 0;
 }
+
 static int _sdw_program_slave_port_params(struct sdw_bus *bus,
 					  struct sdw_slave *slave,
 					  struct sdw_transport_params *t_params,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

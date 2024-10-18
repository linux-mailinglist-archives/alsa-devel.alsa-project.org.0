Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0199A5E61
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2024 10:14:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FF1FE9D;
	Mon, 21 Oct 2024 10:14:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FF1FE9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729498495;
	bh=TT/Z8roXUv+CIl4XMwPuOonF5RLHtqCyRlLckPzMurs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iGUQrFkiZO2K1Vu7p4vC9fwdimzunsjgqBS+0yCQdYkfT/Ebil6/BsZkp3pdBkPkg
	 Rg5flt6gTU3eUPsEQxuoCurxpSOTbFrBbvpoD7YiSVaOzcKbpaR/i3ezRWKzKJQE3s
	 rgSYYLVNVeOy2KHFsFXUdonCWBW6CjipnzCan3dY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EFCCF805FF; Mon, 21 Oct 2024 10:13:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E4A0F80656;
	Mon, 21 Oct 2024 10:13:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68822F80448; Fri, 18 Oct 2024 11:08:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-out.aladdin-rd.ru (mail-out.aladdin-rd.ru [91.199.251.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D913F80149
	for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2024 11:07:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D913F80149
From: Daniil Dulov <d.dulov@aladdin.ru>
To: <stable@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Daniil Dulov <d.dulov@aladdin.ru>, Vinod Koul <vkoul@kernel.org>, Bard
 Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Sanyog Kale
	<sanyog.r.kale@intel.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>, Richard
 Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 5.10 1/1] soundwire: cadence: Fix error check in
 cdns_xfer_msg()
Date: Fri, 18 Oct 2024 12:07:14 +0300
Message-ID: <20241018090714.399076-2-d.dulov@aladdin.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241018090714.399076-1-d.dulov@aladdin.ru>
References: <20241018090714.399076-1-d.dulov@aladdin.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.20.125]
X-ClientProxiedBy: EXCH-2016-03.aladdin.ru (192.168.1.103) To
 EXCH-2016-02.aladdin.ru (192.168.1.102)
X-MailFrom: D.Dulov@aladdin.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7BXUHGCFZAQAGLIRODF6ACJB6S5NED6H
X-Message-ID-Hash: 7BXUHGCFZAQAGLIRODF6ACJB6S5NED6H
X-Mailman-Approved-At: Mon, 21 Oct 2024 08:13:23 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7BXUHGCFZAQAGLIRODF6ACJB6S5NED6H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Richard Fitzgerald <rf@opensource.cirrus.com>

commit 7f6bad4dfde0ec1d479fdcbbb62bccdbf3a93bb4 upstream.

_cdns_xfer_msg() returns an sdw_command_response value, not a
negative error code.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20220917154822.690472-1-rf@opensource.cirrus.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Daniil Dulov <d.dulov@aladdin.ru>
---
 drivers/soundwire/cadence_master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index d3e9cd3faadf..2492250ad1bd 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -692,7 +692,7 @@ cdns_xfer_msg(struct sdw_bus *bus, struct sdw_msg *msg)
 	for (i = 0; i < msg->len / CDNS_MCP_CMD_LEN; i++) {
 		ret = _cdns_xfer_msg(cdns, msg, cmd, i * CDNS_MCP_CMD_LEN,
 				     CDNS_MCP_CMD_LEN, false);
-		if (ret < 0)
+		if (ret != SDW_CMD_OK)
 			goto exit;
 	}
 
-- 
2.25.1


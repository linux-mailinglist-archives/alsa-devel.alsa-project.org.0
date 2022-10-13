Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA71A5FCFB4
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Oct 2022 02:20:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AEAE53D5;
	Thu, 13 Oct 2022 02:20:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AEAE53D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665620456;
	bh=VZBw5DsUX6oh/4FnMOXMdw0076F1lklCffGNz1UYs/M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DNdLjAQXcZtsNDbGMm/qALp7ljqhLyaNIXnoI4p0Bz5ESFlGqgt53Ki00FE60awo+
	 XPTRmd3Dgs5wJtHzozdHo/AnUAq8sJF/QsaykBNlmfD4Pdvo1Euajnv9NWwSTS3cx6
	 7Nm9vb9dwK7rolItLTO7SU5O4SiQmANOVRpSeQxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E05A0F800F4;
	Thu, 13 Oct 2022 02:20:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63C4CF802DB; Thu, 13 Oct 2022 02:19:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B00DF80132
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 02:19:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B00DF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p2Lrfrgp"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 81032B81CCC;
 Thu, 13 Oct 2022 00:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67937C43470;
 Thu, 13 Oct 2022 00:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665620391;
 bh=VZBw5DsUX6oh/4FnMOXMdw0076F1lklCffGNz1UYs/M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p2LrfrgpfyQHdg5xxLOLD1d5l4Ec0RjLn+EIoxkclILYUOnzRaEPGLNi4h4bKA7LR
 0422IYp8zCItRGaW0g/nDrD10JnLVcJYJHogSTTS8knMvL77FtbpqhljuSKxJPFslZ
 Np0MX56B/1+AboWyur75hfJbtf/q+QsOa/BH4629f8lf774ICRGoEL/h7BpAv40Pn+
 nckfgpGXmB/YncE0kBgF3XmzvgMQitF575MyL2qk1aAivON6U6L2odbneGAArPC6aP
 zUfP60Yh1+8SB42U1DDiKVqzyo5RbF0MvNg9F2Tz3J1aOakJHfcv5Nc875vAvkicRe
 NZPOe/1S8euSA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 27/63] soundwire: cadence: Don't overwrite
 msg->buf during write commands
Date: Wed, 12 Oct 2022 20:18:01 -0400
Message-Id: <20221013001842.1893243-27-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013001842.1893243-1-sashal@kernel.org>
References: <20221013001842.1893243-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, yung-chuan.liao@linux.intel.com
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

From: Richard Fitzgerald <rf@opensource.cirrus.com>

[ Upstream commit ba05b39d265bdd16913f7684600d9d41e2796745 ]

The buf passed in struct sdw_msg must only be written for a READ,
in that case the RDATA part of the response is the data value of the
register.

For a write command there is no RDATA, and buf should be assumed to
be const and unmodifable. The original caller should not expect its data
buffer to be corrupted by an sdw_nwrite().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20220916103505.1562210-1-rf@opensource.cirrus.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soundwire/cadence_master.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 4fbb19557f5e..42c5fae80efb 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -544,9 +544,12 @@ cdns_fill_msg_resp(struct sdw_cdns *cdns,
 		return SDW_CMD_IGNORED;
 	}
 
-	/* fill response */
-	for (i = 0; i < count; i++)
-		msg->buf[i + offset] = FIELD_GET(CDNS_MCP_RESP_RDATA, cdns->response_buf[i]);
+	if (msg->flags == SDW_MSG_FLAG_READ) {
+		/* fill response */
+		for (i = 0; i < count; i++)
+			msg->buf[i + offset] = FIELD_GET(CDNS_MCP_RESP_RDATA,
+							 cdns->response_buf[i]);
+	}
 
 	return SDW_CMD_OK;
 }
-- 
2.35.1


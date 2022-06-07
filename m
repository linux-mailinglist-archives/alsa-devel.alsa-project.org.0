Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C82154081A
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 19:55:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18574193C;
	Tue,  7 Jun 2022 19:54:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18574193C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654624500;
	bh=0/OPehuoJpxf3SgM/ilGfsr7BWC3yKaBiuwbOz7xEW8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EjTXZfPUXK0bcZUjvZcYj6+Iiu5pW8eDNsZKYajx5be4JWWaciNYs5Rn9UL5rG2/x
	 qUBYsNPsvaJtOe2ZsPT6hpi6PZbFLBt11HAJrXQJXpWPxIy8ZnBI/ERsS1OYzpW7GH
	 d7sIqozD4ydH10U5HZrE6b0wl6beA7SPmf6i3CVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B71DF80248;
	Tue,  7 Jun 2022 19:54:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B212F800ED; Tue,  7 Jun 2022 19:54:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63CA7F800ED
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 19:53:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63CA7F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IGrZrtMT"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9AB30B80B66;
 Tue,  7 Jun 2022 17:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFF3C385A5;
 Tue,  7 Jun 2022 17:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654624433;
 bh=0/OPehuoJpxf3SgM/ilGfsr7BWC3yKaBiuwbOz7xEW8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IGrZrtMTH9gRLwB8yPNJd5A0TLZQxYh2B/IDe2O2nSOs3/BWGfxNWPbpnfZr5kJjB
 nei/fz9+FoC6pHZM9n2m7j8GaWCWZ6o3PQgiGmsU86+oVymQA/89k8vtCLB8Hfj4fF
 2nd9TexvB5eFW7dk/funp9gxwzhv6BTYlAK7aRas29ItS9hxeswr8fAR67pqLAVI1y
 5feZYp9yQxBIaTH1tfpCjBIpvOYjoVxsqh3WODlnXR9bxKLiKCQvQ67m0l+uIdoqPL
 1T5YFUiEHDuai7IOqq9aKcMvilW+mEt69vtpql6IwvGiz/kXrADGOo5K3D/fMq0I7Y
 z+FS2YOauiSaw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 20/60] soundwire: qcom: adjust autoenumeration
 timeout
Date: Tue,  7 Jun 2022 13:52:17 -0400
Message-Id: <20220607175259.478835-20-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607175259.478835-1-sashal@kernel.org>
References: <20220607175259.478835-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
 Vinod Koul <vkoul@kernel.org>, agross@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 yung-chuan.liao@linux.intel.com,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

[ Upstream commit 74da272400b46f2e898f115d1b1cd60828766919 ]

Currently timeout for autoenumeration during probe and bus reset is set to
2 secs which is really a big value. This can have an adverse effect on
boot time if the slave device is not ready/reset.
This was the case with wcd938x which was not reset yet but we spent 2
secs waiting in the soundwire controller probe. Reduce this time to
1/10 of Hz which should be good enough time to finish autoenumeration
if any slaves are available on the bus.

Reported-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20220506084705.18525-1-srinivas.kandagatla@linaro.org
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soundwire/qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 54813417ef8e..249f1b69ec94 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -99,7 +99,7 @@
 
 #define SWRM_SPECIAL_CMD_ID	0xF
 #define MAX_FREQ_NUM		1
-#define TIMEOUT_MS		(2 * HZ)
+#define TIMEOUT_MS		100
 #define QCOM_SWRM_MAX_RD_LEN	0x1
 #define QCOM_SDW_MAX_PORTS	14
 #define DEFAULT_CLK_FREQ	9600000
-- 
2.35.1


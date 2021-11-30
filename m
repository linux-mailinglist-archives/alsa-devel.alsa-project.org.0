Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B28463873
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 15:59:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9650222A;
	Tue, 30 Nov 2021 15:58:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9650222A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638284345;
	bh=wT6Yv+elh3txeBLhbEvLBuKm5sBf05O+PvP2/IgNLdg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DWTUWsfmr2FKKXaJQWFO+Huz1tPCGnUgXCSAFugQzkY/8qUPtCvwOjyY7wAqgtsYw
	 HdJfUxxlI8VZqR+i3qZq+MTCMbYuQpVP+KX4HNBHac7JHRxvFe/RobdsZGKhinMBaY
	 KhZ9ZF/spY0gFN4NxjOH248Y9VcI3WciLAgyODTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3E60F8053E;
	Tue, 30 Nov 2021 15:53:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0588F80539; Tue, 30 Nov 2021 15:52:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A66B7F8052E
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 15:52:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A66B7F8052E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RW0Z343f"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D2849B81A49;
 Tue, 30 Nov 2021 14:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9234AC53FC1;
 Tue, 30 Nov 2021 14:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638283968;
 bh=wT6Yv+elh3txeBLhbEvLBuKm5sBf05O+PvP2/IgNLdg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RW0Z343fnL6kyTPfpuD0H2/ZYkRvycF4isP8bfm7mjwDVwNoi2Yv2/G+ZgUaaQhdt
 2Ba8xWwmSpkqBvpZfqJMu5HpTxYd3lpKLSpJ77RmU+C72gDZ19gCCK5PDWfma5bQgS
 +8oMzK51DtBT6iYVZXePklV0dBNITbm0H1N27vqvOwOme0xewAEIWlfO1o3NQrYHYA
 pUKU6iXZWGoGhf9UbBnmPAmqYgc5S0iTgEx9IDuWt3xEbWBAWpeOBnLFShHfHIqsDq
 8leCAUP/wH/uMYXA0NpgppN+oc2Kiar1jDPCCYO5a8FpNUNjrTZ6nnyQuW/8oETacs
 1TpqxNsAbn6Wg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 02/17] ASoC: qdsp6: q6adm: improve error reporting
Date: Tue, 30 Nov 2021 09:52:26 -0500
Message-Id: <20211130145243.946407-2-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130145243.946407-1-sashal@kernel.org>
References: <20211130145243.946407-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>
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

[ Upstream commit 0a270471d68533f59c5cfd631a3fce31a3b17144 ]

reset value for port is -1 so printing an hex would not give us very
useful debug information, so use %d instead.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20211116114721.12517-5-srinivas.kandagatla@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/qcom/qdsp6/q6adm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
index 932c3ebfd2524..dd796afad91e7 100644
--- a/sound/soc/qcom/qdsp6/q6adm.c
+++ b/sound/soc/qcom/qdsp6/q6adm.c
@@ -391,7 +391,7 @@ struct q6copp *q6adm_open(struct device *dev, int port_id, int path, int rate,
 	int ret = 0;
 
 	if (port_id < 0) {
-		dev_err(dev, "Invalid port_id 0x%x\n", port_id);
+		dev_err(dev, "Invalid port_id %d\n", port_id);
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -510,7 +510,7 @@ int q6adm_matrix_map(struct device *dev, int path,
 		int port_idx = payload_map.port_id[i];
 
 		if (port_idx < 0) {
-			dev_err(dev, "Invalid port_id 0x%x\n",
+			dev_err(dev, "Invalid port_id %d\n",
 				payload_map.port_id[i]);
 			kfree(pkt);
 			return -EINVAL;
-- 
2.33.0


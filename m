Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 676AE463875
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 15:59:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8FD42250;
	Tue, 30 Nov 2021 15:58:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8FD42250
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638284389;
	bh=eHm3/0AdxWr5tIKBQI2fRkronTffXkuGvZxWgCOEYl4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=as3X9Z6gGvXi3qf3aaboxZivxX42DZ8IXADlsMeRuOOsqUi9GUzz35IadN+7s9gDV
	 5/EQI6+bz2HKyCsCGa0qSIDE9EzTgn7PqE0rm1uVmwIGpxOAWxy1lQM9sgePkzyCeo
	 +k3AXMd06eRcwFLNijWWZCQXNp5T+JahvSCD6XPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DFA2F805A0;
	Tue, 30 Nov 2021 15:53:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1142F80544; Tue, 30 Nov 2021 15:53:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3DFAF8020D
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 15:52:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3DFAF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jV55h4hb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 2375BCE1A50;
 Tue, 30 Nov 2021 14:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF31C53FC7;
 Tue, 30 Nov 2021 14:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638283971;
 bh=eHm3/0AdxWr5tIKBQI2fRkronTffXkuGvZxWgCOEYl4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jV55h4hbTlFCzPHcgVgkAM35yyI3qukNkl2LqRIn0/JWJ2fjqPSrIw2tnVepOt/jt
 vXcFobEk5aHDpitVxR9iHpS9Er2DiWp1bSPFrE2JUa6UITk5ujjKviGMcyhCjtIiTj
 XCUv6W/AzdIp/6TOqraS+v+tbTskzzLdwPk0iLkt82hPrPk8VymIOYKV7wajWEEgzv
 OhxNVbmJGTThi9ivbpbLKzE2eqpvhivz+aVvj/KIyD7nlqNXP247myQUVBTwR5TuH2
 UaWpe7kvzQWCn7e7RjQNd413mKPDNBFLP8aMKUK0PrfMrPI83nlFgU6bLE3m2j6Uop
 0O6nKvhVj/mPA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 03/17] ASoC: qdsp6: q6routing: validate port id
 before setting up route
Date: Tue, 30 Nov 2021 09:52:27 -0500
Message-Id: <20211130145243.946407-3-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130145243.946407-1-sashal@kernel.org>
References: <20211130145243.946407-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, stephan@gerhold.net, tiwai@suse.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>, ultracoolguy@disroot.org
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

[ Upstream commit 6712c2e18c06b0976559fd4bd47774b243038e9c ]

Validate port id before it starts sending commands to dsp this would
make error handling simpler.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20211116114721.12517-6-srinivas.kandagatla@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/qcom/qdsp6/q6routing.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index 44eee18c658ae..a5bc7a60d119e 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -320,6 +320,12 @@ int q6routing_stream_open(int fedai_id, int perf_mode,
 	}
 
 	session = &routing_data->sessions[stream_id - 1];
+	if (session->port_id < 0) {
+		dev_err(routing_data->dev, "Routing not setup for MultiMedia%d Session\n",
+			session->fedai_id);
+		return -EINVAL;
+	}
+
 	pdata = &routing_data->port_data[session->port_id];
 
 	mutex_lock(&routing_data->lock);
-- 
2.33.0


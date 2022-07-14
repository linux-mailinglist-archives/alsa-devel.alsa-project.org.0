Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C850574379
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:35:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1EBC18CF;
	Thu, 14 Jul 2022 06:34:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1EBC18CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657773331;
	bh=O8tlw0dNGRaykhtvOszk9r/8Y1NGnYjj0OZ9LrffeaM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XkWwugco9/rbowT1f7E2dzfnXestCJBEA3fSKZRXh8ZkbGD6ApBzPPeIWtCWMkCk9
	 h2+E/sA8ColXn1f5QqpR4K3W1QePxUT9FWal7cct0fGqLYe34R5AxMfJYGyvVy7c/G
	 9vpjySV5zmGtL57gN3pLj+ItIWk61m4OAKB5DxK4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1932FF80672;
	Thu, 14 Jul 2022 06:25:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99F8CF8065D; Thu, 14 Jul 2022 06:25:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1704FF80621
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 06:25:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1704FF80621
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SFfon5oD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8ECB0B8237B;
 Thu, 14 Jul 2022 04:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A189C385A5;
 Thu, 14 Jul 2022 04:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772710;
 bh=O8tlw0dNGRaykhtvOszk9r/8Y1NGnYjj0OZ9LrffeaM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SFfon5oDgtBx5x2XTWX6KVMSYc4QNvsDsmNmRCV3PJehTdvS6URi0N6DXYVM1/HEz
 axXL0YazCmKLQ0xvaUm5k3oi2tRJzigs5juWaDMr6Yi5S5XxmKNvFMUDITpnxdLP4m
 mZtR1d6XJNlF4fF4ZUw5XFIAA19V4+Z4mYZPlYpfJQZFyyw6RM6HdW/vZeJjeHwC4l
 U6673bEZp+CrqdZ6tpcw5UClkVzkfCR/o0tL3dAGM+ux9Fa7MWMWy2oVnHmSAWjFYK
 RKjSWhTbQiE8aLFZKV3SmyiTTLmdMKDSXGV0jztdPt7/SEktWZuOITc8zzm6r+ywT1
 EmVDJVwH7KfzA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 17/28] ASoC: madera: Fix event generation for
 OUT1 demux
Date: Thu, 14 Jul 2022 00:24:18 -0400
Message-Id: <20220714042429.281816-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042429.281816-1-sashal@kernel.org>
References: <20220714042429.281816-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
 tiwai@suse.com, lgirdwood@gmail.com, rf@opensource.cirrus.com,
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

[ Upstream commit e3cabbef3db8269207a6b8808f510137669f8deb ]

madera_out1_demux_put returns the value of
snd_soc_dapm_mux_update_power, which returns a 1 if a path was found for
the kcontrol. This is obviously different to the expected return a 1 if
the control was updated value. This results in spurious notifications to
user-space. Update the handling to only return a 1 when the value is
changed.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220623105120.1981154-4-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/madera.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index f4ed7e04673f..d3e7a591b5a8 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -618,7 +618,13 @@ int madera_out1_demux_put(struct snd_kcontrol *kcontrol,
 end:
 	snd_soc_dapm_mutex_unlock(dapm);
 
-	return snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
+	ret = snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
+	if (ret < 0) {
+		dev_err(madera->dev, "Failed to update demux power state: %d\n", ret);
+		return ret;
+	}
+
+	return change;
 }
 EXPORT_SYMBOL_GPL(madera_out1_demux_put);
 
-- 
2.35.1


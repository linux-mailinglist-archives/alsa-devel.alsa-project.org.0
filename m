Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 243CC61F849
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 17:06:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C31BE83B;
	Mon,  7 Nov 2022 17:05:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C31BE83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667837173;
	bh=xD95zUNAQgJy90NkPhVmGd7rPUx4jnJPotUs0/QHgXs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lwgAHMI1MfihVYfME0cVwT6KREz7Nu36i70gyn6DmeuN5bdFnk1sH+hqzUCqFGo4b
	 /hrcgpyfYWcSlPhmKfRdmbmG4j0xsjV5BBC/Ip3AvrlqlSAlyaIdU/KtJ5WFdKhkcJ
	 FZouYe7YoUOItIp6Dy1r/4MhB4r67JVsvTI6r7LI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C4D0F8055A;
	Mon,  7 Nov 2022 17:05:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A897FF804DF; Mon,  7 Nov 2022 17:04:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BF4AF804DF
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 17:04:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BF4AF804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="Rx8u/wqs"
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk
 [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C024C66028EA;
 Mon,  7 Nov 2022 16:04:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667837092;
 bh=xD95zUNAQgJy90NkPhVmGd7rPUx4jnJPotUs0/QHgXs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rx8u/wqsxB2UekVdI46dYFJ3WyqS+vqn/6gljNuxlENp5KBaK0wPPqyp49CCDeFIR
 5H120fxAWVOksFogb6bE+BBSGh0sI5FbZJc5MgFo241bJV/T37E5js25UW9d3T+fze
 6h6U4ocXMaZ9Nm5Zs9af+T+oR62W4C2JCZLPA7p2AzV5dQUqO2xC8SuYKAwYW0hvAp
 eQtKUTalBOXgvAAasuI0uwpqBd4Ud6GFptoK2h0ms/JI0vRsc7P7f/7bVAPoD0v66T
 MO4lCwj7TB9G7rs1esYd0uYovddJ1g2ueO5i+gyj6VJaVxvz2QKXiChxs6R2kOGQZC
 jFwk+hcQOB6tA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/9] ASoC: mediatek: mt2701-wm8960: Register to module device
 table
Date: Mon,  7 Nov 2022 11:04:30 -0500
Message-Id: <20221107160437.740353-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107160437.740353-1-nfraprado@collabora.com>
References: <20221107160437.740353-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Miaoqian Lin <linmq006@gmail.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

Register the compatibles for this module on the module device table so
it can be automatically loaded when a matching device is found on the
system.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 sound/soc/mediatek/mt2701/mt2701-wm8960.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt2701/mt2701-wm8960.c b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
index 0cdf2ae36243..a184032c15b6 100644
--- a/sound/soc/mediatek/mt2701/mt2701-wm8960.c
+++ b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
@@ -161,6 +161,7 @@ static const struct of_device_id mt2701_wm8960_machine_dt_match[] = {
 	{.compatible = "mediatek,mt2701-wm8960-machine",},
 	{}
 };
+MODULE_DEVICE_TABLE(of, mt2701_wm8960_machine_dt_match);
 #endif
 
 static struct platform_driver mt2701_wm8960_machine = {
-- 
2.38.1


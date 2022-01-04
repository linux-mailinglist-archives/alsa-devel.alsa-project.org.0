Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E968484F77
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 09:43:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2D8716E7;
	Wed,  5 Jan 2022 09:42:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2D8716E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641372202;
	bh=MnCHmYD8GhcQvplyaz646shc0f9Z5QKMYNSkGDt8Hyw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dxET1HxNJFbvAeEtxmO9HKN49KvtroLqrb3xnOBVJQR7ldTqTqD7x3IdTPNqTB1pg
	 xP4Mue2trtzivbpUlgsR8nZNMJK+DIOVLlUBW0CEtHtLh+njs2+akiqgSf+4LxpRBu
	 V7qL+WXEHdW7r+AM5WMhzJzjVibjhIpf3cMMJJFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D1A7F8020C;
	Wed,  5 Jan 2022 09:42:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEBC5F80089; Tue,  4 Jan 2022 14:23:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C115F80089
 for <alsa-devel@alsa-project.org>; Tue,  4 Jan 2022 14:22:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C115F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=alyssa.is header.i=@alyssa.is
 header.b="OZiaGNwz"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="G0uiJfQ9"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7010458037E;
 Tue,  4 Jan 2022 08:22:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 04 Jan 2022 08:22:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=x5C85cwYmXa+FbDexCIyc1oYxS
 CbENr7yiJVmNRGzGA=; b=OZiaGNwzJOshvmTiENK8tHDvOHOgYTtTRd0zpnlNwF
 eTV3bybRCpJMDDMiUt4S8WkGMZ1oFWOhAUrmJcm6rrJAciJl6gqnt6ErWuT+QRNI
 5PZEPhgmKF9cqT1OmFA33/5zABM6cm9l8+O0nd+wGN/8STs5Wv/41j0xSN5oGCwQ
 F358kbVLaSF2B8Gd2CJDlEJgON1UeDNq4dN8Vb7yKmAOPzXEZZTuTUISGP65IHC8
 3WSHLm0NbiBVtAUykWcZrQEsX6a8lSQtUlZpqECNQyuje0uIvjAuObe7+6X4/lrW
 5r9RgI4+S1Ibnuy7ic3Qrd7TpEX7tw/boXlztIF6PEsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=x5C85cwYmXa+FbDex
 CIyc1oYxSCbENr7yiJVmNRGzGA=; b=G0uiJfQ9XWC2aY+QBWnNQjZ7s6b2hNagp
 XAZc7AO3DH/rQTMoDRbcuii40aPt/3TO7SqpRn67SfL4qEg1KJCQxeQfWu7dFEbp
 QkYJfEs2fekEsCLz/vLQh/GnR9bgk2x4jbiZ/6arQcjYMpHR7PaQR5z3Yj7mkVvf
 lpV6Ba0nMjfTr5M6ekpXOK9P0gJxXNBs2c83Q/vaLzMsJYPW7wPKvr5Clr9Bmpp/
 N2DtWW2gjpGBuaEjr7+qm2Xjl9WKhWzuVO33Nv7kWJ5dgWOF+Vmf6YYSAMVAkF5z
 O+2CZZLrzu8H0tAvduXfnldeZd+Rt0ubNLjM58+9tWlpLBev3XsiA==
X-ME-Sender: <xms:L0rUYRNOSDzWNI9dQ_pPE9njYjzHtrSWG_gJMcqGC-BZ-x-JY90VgA>
 <xme:L0rUYT9saFwoccwFMLW0K14QBUaHTcLt0YfAaAcVT2SLAzx3_M1_VP7yVXWbCsKUh
 6s3njwvpHwRvpPRQA>
X-ME-Received: <xmr:L0rUYQQJK43rj0fw4yfL1QRwWgl8zrxlzNArcs5oWnUtPNiKF465XoaAvDXcYsWysqzfam4fgkqrB2mOVtwf1iBOXwMCj7WU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudeffedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetlhihshhsrgcu
 tfhoshhsuceohhhisegrlhihshhsrgdrihhsqeenucggtffrrghtthgvrhhnpeehvdffgf
 fhteeijefgteeftdfghfdvheeuhedvjedugfeggfeljefgleefvefgfeenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehqhihlihhsshesgidvvd
 dtrdhqhihlihhsshdrnhgvth
X-ME-Proxy: <xmx:L0rUYdva_9Gc3MQ2ChA80KQ2O9fV5u8_alech2-Lgxe13x5NU82VXQ>
 <xmx:L0rUYZe1uDDxKkJ1DNCWjHETo0B4bhuo0U0WPeItOjaTbUN59ol70g>
 <xmx:L0rUYZ2X5YtEuB17piUBoiA1cejCFHHtIRIwA7WEU7VWmVJizNX87w>
 <xmx:L0rUYV5o_bkLvxd1srFu7dI1thDZGtTT27oBG8-E37Yfzxdo8I5QmQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Jan 2022 08:22:54 -0500 (EST)
Received: by x220.qyliss.net (Postfix, from userid 1000)
 id D1C8B3D3; Tue,  4 Jan 2022 13:22:53 +0000 (UTC)
From: Alyssa Ross <hi@alyssa.is>
To: Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: fsl_mqs: fix MODULE_ALIAS
Date: Tue,  4 Jan 2022 13:22:16 +0000
Message-Id: <20220104132218.1690103-1-hi@alyssa.is>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 05 Jan 2022 09:42:15 +0100
Cc: Alyssa Ross <hi@alyssa.is>,
 "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:FREESCALE SOC SOUND DRIVERS" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
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

modprobe can't handle spaces in aliases.

Fixes: 9e28f6532c61 ("ASoC: fsl_mqs: Add MQS component driver")
Signed-off-by: Alyssa Ross <hi@alyssa.is>
---
 sound/soc/fsl/fsl_mqs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 27b4536dce44..ceaecbe3a25e 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -337,4 +337,4 @@ module_platform_driver(fsl_mqs_driver);
 MODULE_AUTHOR("Shengjiu Wang <Shengjiu.Wang@nxp.com>");
 MODULE_DESCRIPTION("MQS codec driver");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform: fsl-mqs");
+MODULE_ALIAS("platform:fsl-mqs");

base-commit: c9e6606c7fe92b50a02ce51dda82586ebdf99b48
-- 
2.33.0


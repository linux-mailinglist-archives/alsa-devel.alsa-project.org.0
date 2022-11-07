Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B4361F86D
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 17:08:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 143FA847;
	Mon,  7 Nov 2022 17:07:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 143FA847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667837297;
	bh=bP8o3ce5ZgXYubneNGO6GUzIYsV6S7bzhWTdLtO4yUs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Oh7XrI3mg5ux7if8oKTR9l2aWC3VocZylgXqanpdbUdvLaTJFvOw0akjg/G700YRF
	 MBUIsiRmttGRSfajm1JXZwkB8/30+CuPgTZKQZVvH5/XvoNQSNMdv68xS+k8h1MSfP
	 jbYvH47USHa+CWP5O2oTknRBFM9y2y9VuajUDl4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FEA9F80589;
	Mon,  7 Nov 2022 17:05:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD9EAF805AB; Mon,  7 Nov 2022 17:05:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B601F80589
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 17:05:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B601F80589
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="B2Ep22Np"
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk
 [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BE87566028B0;
 Mon,  7 Nov 2022 16:05:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667837116;
 bh=bP8o3ce5ZgXYubneNGO6GUzIYsV6S7bzhWTdLtO4yUs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B2Ep22NpGLHP5/VWW983UeeWT9Jv6oVhDPstT7b4AK3Ja3Jlj2EOCivxH/eXfWbsF
 g44fjgHkbLkZ+MtzgHP61Pnij2w68rASg2JsrADGE9Xa9FpnDx8u1s3HPEhCtBkI1N
 ue0bi2D6ACxLmroy5kFfawfTY0FP0cGg2g69KMctlJfemQWrUWo3kqMQoXxsnIr357
 NemKv0btLzMj3qxlMCGZlSAOvDiCGxZh2ge03bUZ5D2v+F3MIn2fRLxNNkw4O4q0dB
 VECXJLkTMVB0iqi6GVbFSxNbZfD76HrppGwwXgY5wWoQcmLJc34DWu6EyE5hpr1x1p
 hMHW+a5dqIiBg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 9/9] ASoC: mediatek: mt8195-mt6359: Register to module device
 table
Date: Mon,  7 Nov 2022 11:04:37 -0500
Message-Id: <20221107160437.740353-10-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107160437.740353-1-nfraprado@collabora.com>
References: <20221107160437.740353-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-mediatek@lists.infradead.org, Trevor Wu <trevor.wu@mediatek.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
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

 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index 480ed3e08d5b..61be66f47723 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -1544,6 +1544,7 @@ static const struct of_device_id mt8195_mt6359_dt_match[] = {
 	},
 	{},
 };
+MODULE_DEVICE_TABLE(of, mt8195_mt6359_dt_match);
 
 static struct platform_driver mt8195_mt6359_driver = {
 	.driver = {
-- 
2.38.1


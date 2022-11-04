Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D48B61A347
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 22:25:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEFFB15C2;
	Fri,  4 Nov 2022 22:24:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEFFB15C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667597120;
	bh=uuFnxcWfl5++HD7bZPixLE+GB/VdJsnKSziUJa+HwpM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XzxR5XXDZvEQRfh0nwx3oZJ0SD8eMgH/WRS8oayoDgXr8IFPQNhEqdl50ueehEE/D
	 Zs1JCKkDI/LDcIP7Fnsr+Scl7KCqp7+Pem6r2MBu/HWLTzCS8uvN6FnEvCa34Jf7BP
	 xHR7f4XU4swggIx7ueGsgP2PrDH81LjT3jKySSSY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A28BF8049E;
	Fri,  4 Nov 2022 22:24:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26DA7F8047D; Fri,  4 Nov 2022 22:24:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FB93F80149
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 22:24:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FB93F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="AsC3JSUi"
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk
 [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 26FFB660298A;
 Fri,  4 Nov 2022 21:24:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667597055;
 bh=uuFnxcWfl5++HD7bZPixLE+GB/VdJsnKSziUJa+HwpM=;
 h=From:To:Cc:Subject:Date:From;
 b=AsC3JSUiy8ATScgoKbobipTzEIeVkpxY7awI94quhKG+i4VkQevrmJCg0ey1kG/IN
 QTs735SZ3cltlzwM/HEzsg/9w3ZdTHdTN61DXBO979AxB2d3i1+vsVzhTZTCxnHu8d
 ipqJXY4mOx+wj5VEo/wJhMlRQcEmE3kbXR7wf1Mmu8KGsediEn6OEPv7tZYXBwwuuQ
 s3g12ZKk6E/nFdG4bfdH+Wn4i+t6gA7P0BzSliCwDxys5vhmYN6Jb5muyTGIZA1wZb
 5qmi/tb066woqT/IN8Rde7vKYYYARokJu4jJBKt1LGtY2SHzkwU0kyRe9trcKWXVzw
 jcwbOsIOvNttA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: mediatek: mt8183-da7219: Register to module device
 table
Date: Fri,  4 Nov 2022 17:24:07 -0400
Message-Id: <20221104212409.603970-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Miaoqian Lin <linmq006@gmail.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
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

 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 9f22d3939818..0e572fe28c58 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -842,6 +842,7 @@ static const struct of_device_id mt8183_da7219_max98357_dt_match[] = {
 	},
 	{}
 };
+MODULE_DEVICE_TABLE(of, mt8183_da7219_max98357_dt_match);
 #endif
 
 static struct platform_driver mt8183_da7219_max98357_driver = {
-- 
2.38.1


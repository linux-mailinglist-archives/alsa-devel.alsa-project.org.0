Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9372A61A34B
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 22:25:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C62515CC;
	Fri,  4 Nov 2022 22:24:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C62515CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667597146;
	bh=4x6YPaSsnp7l5LhtBdIx6pawY/Pm4zMTHDGs5Rl+wRo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q98zYfcBaDHsMbKK1J6jgq21SQ7XfEkQVeU7oJvlFQ8ck6VAOIucE/J2pZvt9dwuV
	 BIc4/vVhcvdkCxBsDGCS9Z0Gvpco92XjoGeCEDkdAyT0YLIMsL9jD4xmcZWPxDAjdn
	 Y1iwC7Ba57u57qTvgFOriJZCeUtJQMmaN4ZuxKws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF301F80155;
	Fri,  4 Nov 2022 22:24:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07672F804E7; Fri,  4 Nov 2022 22:24:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF495F80431
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 22:24:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF495F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="iC4TGS2o"
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk
 [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DC937660299D;
 Fri,  4 Nov 2022 21:24:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667597058;
 bh=4x6YPaSsnp7l5LhtBdIx6pawY/Pm4zMTHDGs5Rl+wRo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iC4TGS2ogjVhkGL0pALVY4e71LQVnQG1zb+B7PJrFMpaRfIpC9NcAm0TLl3ovrWmo
 2oiZr6P2kvJwzNx9Cjc4NWXLlhAAAG9S7XaMtV/+2BDZ/q60hdSehhpt5zFbqcfsQK
 7OtuBV3Ptf3ypdFVTuvO+ynGTXBUt1s9Mqd9vdAn0hJ6jb+GNTJI3Fp/NX17JzbcT+
 3CKrAgowixNpY4x103zcJ8z4etOT6OrkurOAhK6y6NTzKAoYdOuVW85q6i0I8XulHB
 VwVtiWVqc/v9Jdo/gcHX5mz6h8KVJkVSQQvrKX7yJWxgRyusKrT/MEfhPY1oucvldo
 IegR/DY6AKQNQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: mediatek: mt8183-mt6358: Register to module device
 table
Date: Fri,  4 Nov 2022 17:24:08 -0400
Message-Id: <20221104212409.603970-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104212409.603970-1-nfraprado@collabora.com>
References: <20221104212409.603970-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Tzung-Bi Shih <tzungbi@kernel.org>,
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

 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index a86085223677..8fb473543cf9 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -835,6 +835,7 @@ static const struct of_device_id mt8183_mt6358_ts3a227_max98357_dt_match[] = {
 	},
 	{}
 };
+MODULE_DEVICE_TABLE(of, mt8183_mt6358_ts3a227_max98357_dt_match);
 #endif
 
 static struct platform_driver mt8183_mt6358_ts3a227_max98357_driver = {
-- 
2.38.1


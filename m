Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2E961F86A
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 17:08:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68DAE1DA;
	Mon,  7 Nov 2022 17:07:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68DAE1DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667837281;
	bh=oWRkrDOmNJ2dmIVe5ehfgdnkPnZtvtRMYH1LSztA4/Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G9DyGiQr/mHYTZZM6JRXHkwA6XWKbFmXvFpXfgYSt9f9FXym4zy4sYh+k3siXSao7
	 /7BjvtpoEuHTFipO8F9mv27pXz3/UwEVJBYU04DwuS4Opero6HrP5kZkd+ZBjiIpDc
	 FnTrIi+E+eyoecnvWb/+MLFGDkmCt205wD1RWtq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2308F80557;
	Mon,  7 Nov 2022 17:05:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39E45F805A8; Mon,  7 Nov 2022 17:05:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0389EF80587
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 17:05:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0389EF80587
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="RPN1eQI+"
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk
 [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D1D266602965;
 Mon,  7 Nov 2022 16:05:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667837113;
 bh=oWRkrDOmNJ2dmIVe5ehfgdnkPnZtvtRMYH1LSztA4/Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RPN1eQI+7jezHkamwk1HZ83zy7ukfs4L6sTCR6xZHpu/bu1zpRls/3yENC7JX7xvR
 a/FoukoFapv9GKGXxmAiAF89zt6I4untu+Unf5lDZxoIbFoXqrwLV/0KYafeZOlKXx
 /SdtT5fK7JCl75PnyRZ+mbhOvToMtYXVoVhlRyZHBvlF5BxYDs/0fOVLCVKDzAuFPf
 FXkO73a5CVSewIyHYP9P8QhRLITCkE+3ZW9iKMhVI5RyPoEtksEDFMHTAEy9GvdUfI
 YAN9xsthNEmATiRdln1fYBhhweSTNXFiBVeF32tvUhXJT0xUbTMxuuDg36DhuGoRbc
 OF1/GDse4c1SA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 8/9] ASoC: mediatek: mt8192-mt6359: Register to module device
 table
Date: Mon,  7 Nov 2022 11:04:36 -0500
Message-Id: <20221107160437.740353-9-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107160437.740353-1-nfraprado@collabora.com>
References: <20221107160437.740353-1-nfraprado@collabora.com>
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

 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index b93c3237ef2d..16660eda577e 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -1261,6 +1261,7 @@ static const struct of_device_id mt8192_mt6359_dt_match[] = {
 	},
 	{}
 };
+MODULE_DEVICE_TABLE(of, mt8192_mt6359_dt_match);
 #endif
 
 static const struct dev_pm_ops mt8192_mt6359_pm_ops = {
-- 
2.38.1


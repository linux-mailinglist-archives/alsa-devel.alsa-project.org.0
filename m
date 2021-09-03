Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 296F63FFF70
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 13:50:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9FF01868;
	Fri,  3 Sep 2021 13:50:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9FF01868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630669855;
	bh=3at1ibZbtPC8r/w+jSt45l3Y4Z/Il14VGIEjpIjEWvs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EQdGSnPXevC0DDtU2rdrf7tyv9qTgLlFWOxuhRmBOTGkxfzW+qyvGRiSsRJCxnBaq
	 bRKRf/6SUNiapTvUHeV3O6mmnjs/e4SfN2RNdAOneX2sWZc+67mpNsnNb9bNg+uUvV
	 9PSkhEMXE1NYJSJILqFu/ZG+hV/IBnXhz4mUbwtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23D30F80256;
	Fri,  3 Sep 2021 13:49:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88739F80254; Fri,  3 Sep 2021 13:49:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49EF0F8020D
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 13:49:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49EF0F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="j+2I4zP+"
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 9DD213F09E; 
 Fri,  3 Sep 2021 11:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1630669768;
 bh=cY308Ok8pbsAlAgAmdVbKjTzNIY9q0Cqnz5SkkmxGdk=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=j+2I4zP+/n4UObG3A2xBnhb7ei1OJ24PTYqJUHMCJv22TbfMRULUIjhZVU8hPuUg1
 158qWcex1GrdacaaHpcPkRIsjo7u/YC4QrKcE2O4FJ5WFEyhIVVf9yITKhJIaCDxty
 xdE2MHyxeodC1uBA9Xo6hEOMZCRo4L7Nh88oYmXi512jWw1ukgjy2sFdOYkciqeNUH
 vP/A/qANY5AT2WitK1R/pinLDOAzw0xtFso7hn6CfBc7al1F3mJPdAujnKKBO1pEST
 6dWsOTWN9/VzR1+ynXuSxRxqSpFp7cU5SVkrVh5tdVTsO1NrBso5NX2/Xk7DxlLaAl
 QfHdOAxyfKAZQ==
From: Colin King <colin.king@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: mt8195: Fix unused initialization of pointer
 etdm_data
Date: Fri,  3 Sep 2021 12:49:28 +0100
Message-Id: <20210903114928.11743-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

The pointer etdm_data is being inintialized with a value that is never
read, it is later being re-assigned a new value. Remove the redundant
initialization.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 7378e42f2766..ac591d453e1e 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2094,7 +2094,7 @@ static int mtk_dai_etdm_set_sysclk(struct snd_soc_dai *dai,
 {
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	struct mtk_dai_etdm_priv *etdm_data = afe_priv->dai_priv[dai->id];
+	struct mtk_dai_etdm_priv *etdm_data;
 	int dai_id;
 
 	dev_dbg(dai->dev, "%s id %d freq %u, dir %d\n",
-- 
2.32.0


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD4C61F853
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 17:06:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F350F86E;
	Mon,  7 Nov 2022 17:05:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F350F86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667837198;
	bh=kyJUl4AIfO/bUHE12xVqYeJlBk+GtcwnhEWyl6Ffr50=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tj2fCHsiGuZ/Wfs9UUbvZ/eX8ds8V/4aZnpyLWwxTvNqqbuLa/ZJKepM/bghXGuHs
	 zOzOcRm8RU/nRoWXMvCX3K5MXjtYht6kQYyzplJVqOWudepzaASAVdm/xK9Xvt2R/z
	 DeJF8Q6DhldFS3E794A4X+pUpcX/31N1tA2OlcIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B652F8056F;
	Mon,  7 Nov 2022 17:05:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91FC7F80567; Mon,  7 Nov 2022 17:05:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D0ABF8052E
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 17:04:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D0ABF8052E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="IOE585/b"
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk
 [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BF4CD66028B1;
 Mon,  7 Nov 2022 16:04:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667837095;
 bh=kyJUl4AIfO/bUHE12xVqYeJlBk+GtcwnhEWyl6Ffr50=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IOE585/bBs1Urpz+7wizZVDFh28yo+XQgY1LV95IGy7snk4vB2ayP4Kr9Qgip953p
 1x7+QGeKcKehO/RwmLvWCDGRyfXAhP4RWK0oNu19trya1DW8OXRZTfRn+10yEhd+d0
 ePdN1Zh74GiBYHnBcHACyueDl5acGdC7SgE4yMfc0k3kJgWmqfdfqbdpyXout9aWxu
 ZGJMjfGkvvoIZ7FNxcvQ9Q36MseW9Mo4pHfTrKeuQaL69darwdw/27znC0zRJBMvIc
 Pny7MhxqMz4oV3uBz7U+9VqdKgcrVxCbtTYEtwh+zXeH+JUHRogTzXCXkwcnIPOtF2
 mR5GPYij1YTgA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/9] ASoC: mediatek: mt6797-mt6351: Register to module device
 table
Date: Mon,  7 Nov 2022 11:04:31 -0500
Message-Id: <20221107160437.740353-4-nfraprado@collabora.com>
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

 sound/soc/mediatek/mt6797/mt6797-mt6351.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt6797/mt6797-mt6351.c b/sound/soc/mediatek/mt6797/mt6797-mt6351.c
index d2f6213a6bfc..784c201b8fd4 100644
--- a/sound/soc/mediatek/mt6797/mt6797-mt6351.c
+++ b/sound/soc/mediatek/mt6797/mt6797-mt6351.c
@@ -242,6 +242,7 @@ static const struct of_device_id mt6797_mt6351_dt_match[] = {
 	{.compatible = "mediatek,mt6797-mt6351-sound",},
 	{}
 };
+MODULE_DEVICE_TABLE(of, mt6797_mt6351_dt_match);
 #endif
 
 static struct platform_driver mt6797_mt6351_driver = {
-- 
2.38.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A49682ACA7
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jan 2024 11:57:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE67AF52;
	Thu, 11 Jan 2024 11:56:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE67AF52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704970626;
	bh=INSFLjKGWUsq8D7Gv8F3E/m7g3Zw056cbg7I8BkqRIk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AKOcym619bWEt1ZLvbpXTwXyLpAuRk+JGlK7mE5LDyDtkXAuH11f8khejiiDFzif8
	 k69yfTBj0nlX7VnoWfG5kAEXidSvQtDm0wgFMmhPLyoQNBDG2g+Zj4qxghDxZYgYhB
	 H/g0qB1k0qgnxTqyAWD/KBfU/kSs3QlziHPjG+gY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D80BDF8069F; Thu, 11 Jan 2024 11:55:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A9D6F80680;
	Thu, 11 Jan 2024 11:55:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E92AF802DB; Thu, 11 Jan 2024 11:53:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61C59F800F5
	for <alsa-devel@alsa-project.org>; Thu, 11 Jan 2024 11:53:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61C59F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=OumW6osQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704970379;
	bh=INSFLjKGWUsq8D7Gv8F3E/m7g3Zw056cbg7I8BkqRIk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OumW6osQ54b6FN4QQ5pFj7u91fs0CI6pFd0zZ+wlCvnEn8f3OWOs8vW2JcClOCh2j
	 poZAzt8E2OIhTSxn+C3TyiMlBjvTzOVJv4pUepYve7s1dvMaCxJd9BdSc10mIi+B6B
	 cxCnVYBMpwTcPwxodsHKcKrBOICZ6SevL8dySA5jiZlwu08PnLVq7O8Lqm6s6hlfin
	 S5WP+d/I/rwkRxQSiLcYgbTHqC14ncBil6IkuuSozoNsPG41F6tp2GaolSXnNTKiFd
	 Xrg785MqlGJ5kEfFv/QfcNdcZuA+Wv46lp3kSj50YaTukvS0ffctf7xYZ+kEFHUMIo
	 8fTIVjiX9lVXw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D541F3781FCB;
	Thu, 11 Jan 2024 10:52:58 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ribalda@chromium.org,
	nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de,
	kuninori.morimoto.gx@renesas.com,
	nfraprado@collabora.com,
	alsa-devel@alsa-project.org,
	trevor.wu@mediatek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 7/7] ASoC: mediatek: mt8195-afe-pcm: Drop .remove_new()
 callback
Date: Thu, 11 Jan 2024 11:52:47 +0100
Message-ID: <20240111105247.117766-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
References: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FF5IE2FL6N7JW5KN4E46RM3D6G4KPMFW
X-Message-ID-Hash: FF5IE2FL6N7JW5KN4E46RM3D6G4KPMFW
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FF5IE2FL6N7JW5KN4E46RM3D6G4KPMFW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As we're calling devm_pm_runtime_enable() in the probe function of this
driver we don't need to disable it on remove as that's devm managed:
drop the .remove_new() callback entirely.

While at it, also add the sentinel comment to the last of_device_id
entry.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 620d7ade1992..de848d872ce6 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3193,16 +3193,9 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void mt8195_afe_pcm_dev_remove(struct platform_device *pdev)
-{
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		mt8195_afe_runtime_suspend(&pdev->dev);
-}
-
 static const struct of_device_id mt8195_afe_pcm_dt_match[] = {
-	{.compatible = "mediatek,mt8195-audio", },
-	{},
+	{ .compatible = "mediatek,mt8195-audio" },
+	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mt8195_afe_pcm_dt_match);
 
@@ -3218,7 +3211,6 @@ static struct platform_driver mt8195_afe_pcm_driver = {
 		   .pm = &mt8195_afe_pm_ops,
 	},
 	.probe = mt8195_afe_pcm_dev_probe,
-	.remove_new = mt8195_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8195_afe_pcm_driver);
-- 
2.43.0


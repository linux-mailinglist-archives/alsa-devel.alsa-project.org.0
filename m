Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1B892BFE5
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 18:27:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC1461919;
	Tue,  9 Jul 2024 18:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC1461919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720542468;
	bh=9mx+xXOJIbL4Gruc64zMLczRT2keXw6OrRtVSMDAPx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B5+9lgMdt0+XmgJPYwVvfmyetoPTUgxwtgJfLzeyCauINFFQlkX+P0FEEb0seSx9O
	 pxPXglE2V8Nia2s6zq0XV89Znf/P05zzdPuL7rjFFdYcxnf8t2Pzhdq+Em8b/mTQWW
	 /ZaFVxpRFwDNq3kZT7t4dxGNgyJKxmvKnCM+jcGc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8369CF806DE; Tue,  9 Jul 2024 18:25:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C107CF806D2;
	Tue,  9 Jul 2024 18:25:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65CA2F805D5; Tue,  9 Jul 2024 18:25:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C93AF805D3
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 18:25:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C93AF805D3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rzjb4GGg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A7AD5CE1292;
	Tue,  9 Jul 2024 16:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB50C4AF0A;
	Tue,  9 Jul 2024 16:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542332;
	bh=9mx+xXOJIbL4Gruc64zMLczRT2keXw6OrRtVSMDAPx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rzjb4GGgqrrv4tgwlE7+GVnSpO6ZgTGPAPuJnK7gGZf4yYMEtl9/W7ZH0fFhjgRvw
	 cQv+j9FvAVPzpCrxkJSnp0pQSKscVI+ESZBoexHaR338U028LTkUqXHgeSTSBIcp24
	 FgrEf5f+WOdKERCBgGYCOIyMqfxxt2Sp4QMccM+E4QrxljA0sB1fxVFvnnqWkMxUYP
	 X7hwzPrTsUmfrnqe06lAgoFPL7tKYhPXNis7zsNOVZNtKxyJFRIt0UXwx9VpOEVyiO
	 OJSmQs/SCGNdHrcU3KQbZz/JTAc0xQBbgKnJJ5/fekKZ4bjKF6vwjCbF9pZbt1mDQn
	 pGcUDpSMs940g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Primoz Fiser <primoz.fiser@norik.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	jarkko.nikula@bitmer.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 06/17] ASoC: ti: omap-hdmi: Fix too long driver
 name
Date: Tue,  9 Jul 2024 12:24:50 -0400
Message-ID: <20240709162517.32584-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162517.32584-1-sashal@kernel.org>
References: <20240709162517.32584-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.162
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6L42A5XBXIN7F4DWBU3LEZFOGKRWOI7Z
X-Message-ID-Hash: 6L42A5XBXIN7F4DWBU3LEZFOGKRWOI7Z
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6L42A5XBXIN7F4DWBU3LEZFOGKRWOI7Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Primoz Fiser <primoz.fiser@norik.com>

[ Upstream commit 524d3f126362b6033e92cbe107ae2158d7fbff94 ]

Set driver name to "HDMI". This simplifies the code and gets rid of
the following error messages:

  ASoC: driver name too long 'HDMI 58040000.encoder' -> 'HDMI_58040000_e'

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Link: https://lore.kernel.org/r/20240610125847.773394-1-primoz.fiser@norik.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/ti/omap-hdmi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index 3328c02f93c74..1dfe439d13417 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -353,11 +353,7 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 	if (!card)
 		return -ENOMEM;
 
-	card->name = devm_kasprintf(dev, GFP_KERNEL,
-				    "HDMI %s", dev_name(ad->dssdev));
-	if (!card->name)
-		return -ENOMEM;
-
+	card->name = "HDMI";
 	card->owner = THIS_MODULE;
 	card->dai_link =
 		devm_kzalloc(dev, sizeof(*(card->dai_link)), GFP_KERNEL);
-- 
2.43.0


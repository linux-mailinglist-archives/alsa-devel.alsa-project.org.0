Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85132749036
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 23:50:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA7EC7F1;
	Wed,  5 Jul 2023 23:49:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA7EC7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688593795;
	bh=VTB4I9zZ57rcfuMONYpW7VWpXed1exZT873tCPi37oM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B/++wSlEYMHPfou3V0SqwFJYwV49lz28ChIEvvhQqS5OFTC71KjS8Dfi1TDU8cak4
	 vUgrjiULS2YcKeIfwU11mu4d7i+D3v2KVlf+IkaNP8jFDEXp9x+SjRKPS5yjBpvJUu
	 tJGwiwl6aI1b401NC8QhIm8BUU9eoxh/Y/XLR+wc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90F67F80132; Wed,  5 Jul 2023 23:48:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CE58F80549;
	Wed,  5 Jul 2023 23:48:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85786F80125; Wed,  5 Jul 2023 23:48:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18459F80124
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 23:48:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18459F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=SQFVyoMK
Received: from localhost (unknown [188.24.137.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1874C6606F9F;
	Wed,  5 Jul 2023 22:48:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688593688;
	bh=VTB4I9zZ57rcfuMONYpW7VWpXed1exZT873tCPi37oM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SQFVyoMKB0OqLynwIk63QP7mYFo2d0969SBpY7m2h/uP4rnElyu4enFCXc7tI6K/C
	 4o7881+ipfyOAHQS3a7GKwU1gyAFQuadTOmBxFLJr/yOiOYu7HJ6VNH2iLCf+GLzTX
	 EuclGphI/aQfIhlLAI31lGha7xv6mLQlQL+Tesb77UFAtXASdISNpwZs7NNWZ3Zift
	 WgmYcKhjAv0gz5WotbgEh+GlsNrQvFXRDLrFCpYvl/emtuS3ISDRl0Yvqg5n2FG6fW
	 vrZLJb4AnrolDtfF3dSh7eghnPGABBHSXeSLIPTbnX3bBLzaJ66LG/9xsDqSIsnFnf
	 m7GoKeB8MNZgg==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v3 1/3] ASoC: amd: vangogh: Make use of DRV_NAME
Date: Thu,  6 Jul 2023 00:47:58 +0300
Message-ID: <20230705214800.193244-2-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705214800.193244-1-cristian.ciocaltea@collabora.com>
References: <20230705214800.193244-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6Y5QWL7SI6HGMM3FO545E7GDIIOPQGEY
X-Message-ID-Hash: 6Y5QWL7SI6HGMM3FO545E7GDIIOPQGEY
X-MailFrom: cristian.ciocaltea@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6Y5QWL7SI6HGMM3FO545E7GDIIOPQGEY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The "acp5x_mach" string is provided for both driver name and
MODULE_ALIAS. Since they need to match, ensure DRV_NAME macro is used in
both locations.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index e5bcd1e6eb73..5e36179cf611 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -381,7 +381,7 @@ static int acp5x_probe(struct platform_device *pdev)
 
 static struct platform_driver acp5x_mach_driver = {
 	.driver = {
-		.name = "acp5x_mach",
+		.name = DRV_NAME,
 		.pm = &snd_soc_pm_ops,
 	},
 	.probe = acp5x_probe,
-- 
2.41.0


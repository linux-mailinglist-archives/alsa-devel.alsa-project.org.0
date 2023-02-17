Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EE169A9F4
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 12:12:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 021A4EF4;
	Fri, 17 Feb 2023 12:11:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 021A4EF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676632346;
	bh=DAuXTtqmkoDGzsllM35093kOPQ0tDer14y1VqAIQIps=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gLMcLQYBW2y+7Km3MaL4mZtqw3SI99+tlao6SKnCPg71NssQk6yMFPILSkLelwx2n
	 cH1FdqvCzIgO8sOvbIBikBSraFl8pBwG54/RLofBibGpKr7ys5ZREWxu7rNDbnkCe+
	 AD6YttM1EQ0taGXWN5JrTrTGAYawPRfdSDDosK08=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67BFFF80552;
	Fri, 17 Feb 2023 12:10:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E214AF80171; Fri, 17 Feb 2023 12:09:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CB13F8047C
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 12:09:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CB13F8047C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=b1Tsv/Wl
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C8D4166021C8;
	Fri, 17 Feb 2023 11:09:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676632175;
	bh=DAuXTtqmkoDGzsllM35093kOPQ0tDer14y1VqAIQIps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b1Tsv/WlcxK/fXr3fMVjaCFOqVIntQNRVj4eeNVNA8EDRP85Rzd7bIubVTyvUb1iP
	 vzVHAe9HdSEeJ+EGMuJAu2ccfKoaZ+kL4JyD79HqlPVt/JvYCO4mvhUSyE9yy7AZVx
	 Qilw5CKDaorYmFA2FBnqXOHb+7Npap+qBHRKzHwhkUZWgXpHYLItYeoWgXsxkOHod7
	 bmZ0L5WmZ52SZGm8kLWsWzbN0DaOpnFmf16VZIYlQQUOxUXqd3Ki5QuK18DCMjLJ6a
	 82S/zw9F2kcdSHzL1tuqfu/k/Zrp+kOgRbBLW/01/Q9hNi16LQwt4XrRE5jjtLgD/W
	 SW+I73LCE7AnA==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v2 6/9] ASoC: amd: vangogh: Check Bit Clock rate before
 snd_soc_dai_set_pll
Date: Fri, 17 Feb 2023 11:08:47 +0000
Message-Id: <20230217110850.1045250-7-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230217110850.1045250-1-lucas.tanure@collabora.com>
References: <20230217110850.1045250-1-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5VAM2PP7JUBBYB7IQBFQXW5M272W7XZK
X-Message-ID-Hash: 5VAM2PP7JUBBYB7IQBFQXW5M272W7XZK
X-MailFrom: lucas.tanure@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Lucas Tanure <lucas.tanure@collabora.com>, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5VAM2PP7JUBBYB7IQBFQXW5M272W7XZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Check bit clock is valid before setting it with snd_soc_dai_set_pll

Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index e7183d8ac3a2..c746605b63a1 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -119,13 +119,19 @@ static int acp5x_nau8821_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *dai = snd_soc_card_get_codec_dai(card, ACP5X_NUVOTON_CODEC_DAI);
-	int ret;
+	int ret, bclk;
 
 	ret = snd_soc_dai_set_sysclk(dai, NAU8821_CLK_FLL_BLK, 0, SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		dev_err(card->dev, "can't set FS clock %d\n", ret);
-	ret = snd_soc_dai_set_pll(dai, 0, 0, snd_soc_params_to_bclk(params),
-				  params_rate(params) * 256);
+
+	bclk = snd_soc_params_to_bclk(params);
+	if (bclk < 0) {
+		dev_err(dai->dev, "Fail to get BCLK rate: %d\n", bclk);
+		return bclk;
+	}
+
+	ret = snd_soc_dai_set_pll(dai, 0, 0, bclk, params_rate(params) * 256);
 	if (ret < 0)
 		dev_err(card->dev, "can't set FLL: %d\n", ret);
 
-- 
2.39.2


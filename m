Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEB778A060
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 19:06:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F17AE72;
	Sun, 27 Aug 2023 19:05:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F17AE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693155970;
	bh=xyshS61kGazW0xYKaF9opMK/Xa2fYOjK5ZH9KHpV3mY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=blZWPxjo5hwgBu40psr3nMP0jy1m9PfEBxTCZizRexNpsfYR4yXOVdlRm4BXHNVEO
	 0UHNVEs+L04EChR06fZWrqEdBKQVB+iEj+1ITEcRKIIRikh3ztCJfd2kyCLNamRlpN
	 859WgetpgGjyelQaCYuPfQzklAfjJrdHNEuHOGAU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56D21F805EF; Sun, 27 Aug 2023 19:02:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EE64F805FA;
	Sun, 27 Aug 2023 19:02:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17F75F800F5; Fri, 25 Aug 2023 17:37:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.astralinux.ru (mail.astralinux.ru [217.74.38.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98548F800AE
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 17:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98548F800AE
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 202671868942;
	Fri, 25 Aug 2023 18:37:07 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new,
 port 10032)
	with ESMTP id v73nNLLpUn7Y; Fri, 25 Aug 2023 18:37:06 +0300 (MSK)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 87BBD1867579;
	Fri, 25 Aug 2023 18:37:06 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new,
 port 10026)
	with ESMTP id I_6nBa4-AHub; Fri, 25 Aug 2023 18:37:06 +0300 (MSK)
Received: from rbta-msk-lt-302690.astralinux.ru (unknown [10.177.233.189])
	by mail.astralinux.ru (Postfix) with ESMTPSA id 72BA51868950;
	Fri, 25 Aug 2023 18:37:04 +0300 (MSK)
From: Alexandra Diupina <adiupina@astralinux.ru>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Alexandra Diupina <adiupina@astralinux.ru>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Eason Yen <eason.yen@mediatek.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] asoc: mediatek: common: Remove check of return value of
 mtk_memif_set_addr() and mtk_memif_set_format()
Date: Fri, 25 Aug 2023 18:36:50 +0300
Message-Id: <20230825153650.20923-1-adiupina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MailFrom: adiupina@astralinux.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 64F7PGD3WYJ2OLQQYZ6T7SAHRHJDT33A
X-Message-ID-Hash: 64F7PGD3WYJ2OLQQYZ6T7SAHRHJDT33A
X-Mailman-Approved-At: Sun, 27 Aug 2023 17:02:16 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/64F7PGD3WYJ2OLQQYZ6T7SAHRHJDT33A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The mtk_memif_set_addr() and mtk_memif_set_format() functions always retu=
rns 0, so it is
necessary to remove the check of its return value (which was
probably specified by analogy with the check of return values
for other functions) to make the code more readable

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: df799b9502ed ("ASoC: mediatek: common: refine hw_params and hw_pre=
pare")
Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/media=
tek/common/mtk-afe-fe-dai.c
index 882cdf86c8bf..3c8a11c5958d 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -143,15 +143,10 @@ int mtk_afe_fe_hw_params(struct snd_pcm_substream *=
substream,
 		  substream->runtime->dma_bytes);
=20
 	/* set addr */
-	ret =3D mtk_memif_set_addr(afe, id,
+	mtk_memif_set_addr(afe, id,
 				 substream->runtime->dma_area,
 				 substream->runtime->dma_addr,
 				 substream->runtime->dma_bytes);
-	if (ret) {
-		dev_err(afe->dev, "%s(), error, id %d, set addr, ret %d\n",
-			__func__, id, ret);
-		return ret;
-	}
=20
 	/* set channel */
 	ret =3D mtk_memif_set_channel(afe, id, channels);
@@ -170,12 +165,7 @@ int mtk_afe_fe_hw_params(struct snd_pcm_substream *s=
ubstream,
 	}
=20
 	/* set format */
-	ret =3D mtk_memif_set_format(afe, id, format);
-	if (ret) {
-		dev_err(afe->dev, "%s(), error, id %d, set format %d, ret %d\n",
-			__func__, id, format, ret);
-		return ret;
-	}
+	mtk_memif_set_format(afe, id, format);
=20
 	return 0;
 }
--=20
2.30.2


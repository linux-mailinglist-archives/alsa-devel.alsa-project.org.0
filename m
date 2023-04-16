Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEC16E356E
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Apr 2023 08:31:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44E9BDEE;
	Sun, 16 Apr 2023 08:30:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44E9BDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681626702;
	bh=8A5T35VNZ2LeUOTJ+8oTmKlsHuLguA2XcosSd3AHRxU=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Bk8iAMsKqG7g1VWBUUUXnJdjom/r5YU8QEBRltUcSwTu2+YyYJzVsy+PWSGmZG9Uk
	 /N4nuodIpJAQftXWkXhdk105HXpaQ9eIFRzsCdSmY6sT7DmsWuvwH7tVVK04sMgMwY
	 9aWHSOYB8wROWfHkELQwRT0OA5NfmqV2qXzEcLEc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB76FF8025D;
	Sun, 16 Apr 2023 08:30:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A6A4F80266; Sun, 16 Apr 2023 08:29:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr
 [80.12.242.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A8EAF80149
	for <alsa-devel@alsa-project.org>; Sun, 16 Apr 2023 08:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A8EAF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=orange.fr header.i=@orange.fr header.a=rsa-sha256
 header.s=t20230301 header.b=SEYoFLJ6
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id nvtHpgynZXvOInvtIpyMwd; Sun, 16 Apr 2023 08:29:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1681626578;
	bh=4/y1p+J5P4sf9MxwjHggSXgJ0J0v9pbQqECTb6NgUf0=;
	h=From:To:Cc:Subject:Date;
	b=SEYoFLJ6cBxSp77oZjHGudkSCN1Wdu0QQVaXUXyD9Tc7lStPCIDuudzD3KLpRMLp+
	 Pxw34MSPnY20YyCGeujLsredFK6iTizuhxu0H3P0Td9pvLCOZXzpigRMvq45ejxB3R
	 1blo9xNCmMMkqV7eRL48PBVqbiQFOxyhbxZUZlsBS8RGwGD3vKAcB03EiwF6wycErv
	 65wMuxCHWjOSFmughp/lS19wEEEXywu/G4DHvYkWAzVZebWM02j1cTkMlf1yHvLQeg
	 oYG8rJABQnn3qBdK7bVNkUYGVfgR4ZJ/oJgLgkohRx0lhhNJDl81g9uTJRicEwoFsV
	 17SKFihW4aQeA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 16 Apr 2023 08:29:38 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: fsl: Simplify an error message
Date: Sun, 16 Apr 2023 08:29:34 +0200
Message-Id: 
 <c167c16a535049d56f817bbede9c9f6f0a0f4c68.1681626553.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LDWN3I55YSBL6HUJLKIE5PKWOZNYY6EC
X-Message-ID-Hash: LDWN3I55YSBL6HUJLKIE5PKWOZNYY6EC
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LDWN3I55YSBL6HUJLKIE5PKWOZNYY6EC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dev_err_probe() already display the error code. There is no need to
duplicate it explicitly in the error message.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/fsl/fsl-asoc-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index bffa1048d31e..40870668ee24 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -858,7 +858,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, &priv->card);
 	if (ret) {
-		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed: %d\n", ret);
+		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
 		goto asrc_fail;
 	}
 
-- 
2.34.1


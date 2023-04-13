Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AED6E066F
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 07:29:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F4611DE;
	Thu, 13 Apr 2023 07:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F4611DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681363781;
	bh=MlpfhSGmhaTBOXmsMz9tvKmv3bCJYV5veDR+Rl1z59g=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mCeoxDgEve/uceLjgiX3JIhXOKZBNr9ddcF8ZafQuD3UCVtXpX/oPnTohitarIfEH
	 Y5lYPgyCLQQZRA8QeN/YEQrCkw4if1Qh2K3nso2Fn3NSz4/1qw7/Dx7F2Se53bsz9I
	 JCitysKXD0dYUGT9b+sOWJXAs0FWdc73Yrh6QYN8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A36CEF8025E;
	Thu, 13 Apr 2023 07:28:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73A01F8032B; Thu, 13 Apr 2023 07:28:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr
 [80.12.242.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AED2AF800E5
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 07:28:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AED2AF800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=orange.fr header.i=@orange.fr header.a=rsa-sha256
 header.s=t20230301 header.b=nZEHyBk/
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id mpVbpJJcvfW5impVbpzK6l; Thu, 13 Apr 2023 07:28:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1681363717;
	bh=HJ4uYohqhO5JqFEjEQUtiBcTsfOr+xM3+1DXKHvV6cY=;
	h=From:To:Cc:Subject:Date;
	b=nZEHyBk/1Xb/k7IkI84pd/6i44tpo4Ff3pgJ7RyPDu0zQ9KVAw6KdKGwes24HQdPI
	 w6YlUxHyK6JkpqatV0INzjTy6N+YkMSMRMrqtWJHM2mCK1VYOrHq9z0p7I6ajndQHf
	 /d1dOGA+w58EvmCp7euupSd7OKat3OelxhBa4+J9dqdpKdzsnHk51Q2nEmur/KaBZK
	 qeC+nP7l60AUlsbqGWWenboze1Bqbtdt8fHbZrz1UisCFQQYn+GTjSRql1TDN1fFG1
	 yWzXV6rBvtH+3CC8vta28nh9NoTwAMsQikBn8PaWEM9JAMDEThvxX2oHQULikFKlLp
	 V69Ur+VhEifvA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 13 Apr 2023 07:28:37 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: da7218: Use devm_clk_get_optional()
Date: Thu, 13 Apr 2023 07:28:33 +0200
Message-Id: 
 <51976b2515d7007ba5c8aa7524892f147d7cdd51.1681363691.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GJ7NXRMPBUK2QJ7PKSIBTC7MAZC7DDAE
X-Message-ID-Hash: GJ7NXRMPBUK2QJ7PKSIBTC7MAZC7DDAE
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GJ7NXRMPBUK2QJ7PKSIBTC7MAZC7DDAE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use devm_clk_get_optional() instead of hand writing it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/codecs/da7218.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/da7218.c b/sound/soc/codecs/da7218.c
index 91372909d184..d9c28e701613 100644
--- a/sound/soc/codecs/da7218.c
+++ b/sound/soc/codecs/da7218.c
@@ -2893,14 +2893,10 @@ static int da7218_probe(struct snd_soc_component *component)
 	da7218_handle_pdata(component);
 
 	/* Check if MCLK provided, if not the clock is NULL */
-	da7218->mclk = devm_clk_get(component->dev, "mclk");
+	da7218->mclk = devm_clk_get_optional(component->dev, "mclk");
 	if (IS_ERR(da7218->mclk)) {
-		if (PTR_ERR(da7218->mclk) != -ENOENT) {
-			ret = PTR_ERR(da7218->mclk);
-			goto err_disable_reg;
-		} else {
-			da7218->mclk = NULL;
-		}
+		ret = PTR_ERR(da7218->mclk);
+		goto err_disable_reg;
 	}
 
 	/* Default PC to free-running */
-- 
2.34.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA34F660A22
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Jan 2023 00:14:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCC4B100AF;
	Sat,  7 Jan 2023 00:13:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCC4B100AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673046884;
	bh=9QuuyD08K7AM++1vpIeF0GhtGMMNya1f8XKBBSWk3gI=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Q0u2BF0iGjwcg3/Slx8nPRbqas690QZkEoeFseO9kWyhAEnr2YYSVVndse02Vplmu
	 ODCMJ4dyfv79/26eJv+Cnb5xo/b+N/JnFQwNI+jR57rxNz3/asrvkjah12S1uabFQt
	 nCGJrbVEqZLSVINXntzokAWDK7l4xAOI0/efQjRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99248F800C0;
	Sat,  7 Jan 2023 00:13:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84607F800C0; Sat,  7 Jan 2023 00:13:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF8ABF800C0
 for <alsa-devel@alsa-project.org>; Sat,  7 Jan 2023 00:13:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF8ABF800C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IrzUhFGn
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9CBABB81DD7;
 Fri,  6 Jan 2023 23:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B29C433D2;
 Fri,  6 Jan 2023 23:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673046828;
 bh=9QuuyD08K7AM++1vpIeF0GhtGMMNya1f8XKBBSWk3gI=;
 h=From:Date:Subject:To:Cc:From;
 b=IrzUhFGnBS2THLiY8q3qzSU1Z8XU53slg4fTTdklU0dsTXGjwoUxHZfVr60t1waqU
 QT0M002tDAIGl4jmq7uCFDRuE6JDNlPePr4BEJL4bkXXmpnHupM1XuBVPQ42O08en9
 NUYbWRlaajZALxpaGiURajVxuc3SHtK80eeXxq0dM3HUsukII1499fAGsHhzKfK0kK
 WEiZVjwWjixdd11GgzRdIu4U1fnp+FhfMZAKTrh7uC57fR2jiVYcVsqcwJms5wEGH+
 gkx2Noew5FOXxE2xJcAHAXG/akt8vhjWs8NxfRRsdXwj4l59f+O/cv+Fdi9L2VQkbK
 JSUgxKzwY7myg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 06 Jan 2023 23:13:37 +0000
Subject: [PATCH] ASoC: fsl-asoc-card: Log error code when we fail to register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230106-asoc-fsl-err-log-v1-1-49d845c99434@kernel.org>
X-B4-Tracking: v=1; b=H4sIACGruGMC/x2N0QrCMAwAf2Xk2UC7zYH+iviQxnQLjlYSUGHs3
 +18vIPjNnAxFYdrt4HJW11raRBPHfBCZRbUR2PoQz+EGCYkr4zZVxQzXOuM4yWeEw2ZJx6hZYlc
 MBkVXo7wU+156JdJ1u//dLvv+w9FhqhteQAAAA==
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
X-Mailer: b4 0.12-dev-8b3d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=954; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9QuuyD08K7AM++1vpIeF0GhtGMMNya1f8XKBBSWk3gI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjuKspaaObCWe8J+qEwUnrz1fm3UEPH90SCr0Mx92e
 iCuVd2WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY7irKQAKCRAk1otyXVSH0EReB/
 4gSdZxhmyVKd7vuXzWNqXr5WSKCbC7PvnGA/dZY1Q28SmudSE4lMaH7MHto1u8I212ASDS9qrzWQtN
 Zb7EA9XygGvHLLvbIRXAmNmZ8pUT3HI7McDgPvy+oSpVFyETSpTREf9kLMeUqUcmhFYfq//LmWSXMj
 jHgybfKgL0xXvVAMZO4Ks++bj+kZHQt8lMCXuSbz+Os4hiwetnexhU7kEm815iQbCD2xRJ69M7kmDl
 MtwPdpMRAjiU3agtlQIcGZI4AP3Ypmq2XZu1wDOlRUpK5eVw76OYQml6EXjZL4qJZGFxZVE0dp2Qca
 3kWbLJ+vQC0hIX+a6fBmuiC6aTbest
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The chances are that any error we see here will be EPROBE_DEFER but let's
actually tell the user so they know.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl-asoc-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index c836848ef0a6..58834e56a278 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -855,7 +855,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, &priv->card);
 	if (ret) {
-		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
+		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed: %d\n", ret);
 		goto asrc_fail;
 	}
 

---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20230106-asoc-fsl-err-log-4915ba3fc6c4

Best regards,
-- 
Mark Brown <broonie@kernel.org>

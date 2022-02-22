Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D434C04B0
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 23:36:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4C681860;
	Tue, 22 Feb 2022 23:35:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4C681860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645569371;
	bh=j06UWM1AEU5A2BB6VUESY5qC/Xkykt/L6UkBhedKpiM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mqlxoKzFi2LBOWE0EO6mdN1rCjHQj6G28QQcZYAupgjOq4vzzt5aAJb6MEsHxnsdX
	 NTQ2CuLLR2h076XOJRmIqt/rKAn+NuZBMI/pgv1anFA2HUf76mPDvucJIYnMbBAkUb
	 alnN5JQPdyf/2Ro0FzAU3/5FAiPdP6zvETFiAeyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 480D9F801F5;
	Tue, 22 Feb 2022 23:35:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E999F801EC; Tue, 22 Feb 2022 23:35:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34FC1F80118
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 23:35:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34FC1F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AsipGnS0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7DC8760500;
 Tue, 22 Feb 2022 22:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11ED1C340E8;
 Tue, 22 Feb 2022 22:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645569298;
 bh=j06UWM1AEU5A2BB6VUESY5qC/Xkykt/L6UkBhedKpiM=;
 h=From:To:Cc:Subject:Date:From;
 b=AsipGnS0dterPFgU45OMjSdZoan+C1DNRhwWTEtcVNdARv2tpDA7iSaDW6+K5yxL3
 HRVn94hq9o2FbQk7HaVzljt00uf4ZR9M3lz3a6znMVhLt2iXixamQTCwUjVK0PLfRo
 0mtTT6/+jf7X4x+pqQDeIQfWPxgI274HkAQWmKFPbA/EWoDPH8sd7zrCSG0ex2RSfz
 t084LWEhS8CTfO0lP/PTBwV73/i8hYgCyNhQN0VqktRAqlNUM5SUiztGZTgR6H1eKD
 fsBj3xb/SmJP+GSjKWwfs3gzDSb+Op/tJdZAiYGIDm1C/MrDHy3lUfDlKMdISWYvb1
 oc1Jdbaz6uAug==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: es8316: Use modern ASoC DAI format terminology
Date: Tue, 22 Feb 2022 22:34:53 +0000
Message-Id: <20220222223453.3190333-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=908; h=from:subject;
 bh=j06UWM1AEU5A2BB6VUESY5qC/Xkykt/L6UkBhedKpiM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFWTGognjdeK0BWacc1Rfd1N53aAs6QFaJ/2iT12c
 HEwBtyeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhVkxgAKCRAk1otyXVSH0FvYB/
 0dqQEfnkb7NUJwjdDdroNWvv+CIQdA5dPonXIxzDBEDiZntYhJKJB9S7/DOGt7rBpU+QEBDKi2F6wx
 zKAyH/ciouU06mk29JJWGEg3XR475q8HlSTKr0sA2viVocaOMl8noGCbjI0ia/t+jzSDs0jD2Mx8LO
 cdCyhsA+PqN3XvC4ApCOJYjsk8IwiDbKPZ1lkdBnxCRl1FMBH0+6lMNeLXX7jGKEVqGVK2R5oaO51m
 yga4KDVMBA3NlMcC0ku2VBA28rSU24WzE9hVDED3VHWni54hmDNk3wovoXXk5+3hu8JtT39yV5mZ7e
 OL7RmxYjayFn3wtfJIW2xTmrOiAQIr
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

As part of moving to remove the old style defines for the bus clocks update
the es8316 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/es8316.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 8f30a3ea8bfe..ff33eab6f9de 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -401,8 +401,8 @@ static int es8316_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	u8 clksw;
 	u8 mask;
 
-	if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBS_CFS) {
-		dev_err(component->dev, "Codec driver only supports slave mode\n");
+	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) != SND_SOC_DAIFMT_CBC_CFC) {
+		dev_err(component->dev, "Codec driver only supports consumer mode\n");
 		return -EINVAL;
 	}
 
-- 
2.30.2


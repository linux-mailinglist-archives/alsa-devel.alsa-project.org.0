Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B43604C05D1
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 01:17:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5762218E2;
	Wed, 23 Feb 2022 01:17:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5762218E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645575475;
	bh=5oLrvBGlk5TtiifvBYJmnZEBp594/9M24c1f9iDTbbc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KE+HpIgP1m6cVRPR9yKIbnF3/bZxbQdj29gHxGHP/te0W9jdypqJeqibRirNAPdgX
	 uD685oigY+HPkw0+w2QJ3UJyw8K/Q/ksMiAr43oSJTzv5B888miFjxxMgtJnla2Gan
	 uihaKZjhblXtUBBb4CKTzszypa/mGD4Q9nR4y7ps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4439F800D1;
	Wed, 23 Feb 2022 01:16:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6C0BF801EC; Wed, 23 Feb 2022 01:16:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A4CFF800D1
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 01:16:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A4CFF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LmXlBYuz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 13E6960FB6;
 Wed, 23 Feb 2022 00:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A424C340E8;
 Wed, 23 Feb 2022 00:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645575400;
 bh=5oLrvBGlk5TtiifvBYJmnZEBp594/9M24c1f9iDTbbc=;
 h=From:To:Cc:Subject:Date:From;
 b=LmXlBYuz2eKU6Y81K+LP4fngIKRQdPzaXtqkiaYihQ7ZqZyVLIyOSC0mB32GQ9Ik3
 Sic97o2kZJ+L1Ocw0ybptSe2kXqT3zDUZJCgfItSsheFgTn8iiPZu/gM+awtcns9AD
 Ni9tp8ZUGLORMEbQu9vR30/0smmQ33JFZDgnQ/lVTBbSaU00G/Ylr8wWT8JfaZzxi3
 xED+7R7F5O5ocQQhXk5tsvrFTqk3feLVf6aFh/IJdzh5jGkPpiJY5awGing3zWc+64
 TYOUmteCMtWpKTUiv3hZ0G67QQ7Bf3zeA+5VYWxCI349oIc0zhW4EKMMXAwdH1OIVQ
 km1X8aVjmo5xQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: ml26124: Use modern ASoC DAI format terminology
Date: Wed, 23 Feb 2022 00:16:36 +0000
Message-Id: <20220223001636.1321505-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=990; h=from:subject;
 bh=5oLrvBGlk5TtiifvBYJmnZEBp594/9M24c1f9iDTbbc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFXyg1IZHdoq01JOBQTTeCiaUTuw3U8YeDfGc8a3e
 a4UpQFCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhV8oAAKCRAk1otyXVSH0GlPB/
 9xJGmYlYwjgMVKKNzHRN928cLlkPKCIExFRQY/sVHZrdan/tkyCpOdVA9BNMBZhg62IIMY6v9t60Hh
 ar+Mw6IfIdd/jwaiu/idJimIfn9+fd9Cu6q61FxWhdPcsXj1JbkXjnXabCQN5Elcdiyr7WETD7GXKu
 g4mOyLF5XD8wgHZ9mwIf4zECn9mSzNwBYuV8uEdfcWWRUrPK5asWRApWEDoFfjb1rgU6anlNlicNDD
 5+Jo0/yeTpUmfU+gc5kzzwFJc32NdILss8WEeFSHfUY3DdnHjtV+ztszaXhlHD2m0o6iyRgNAPPvHf
 5ooDz+mlTXPDTRmgGlkVmp4aAeduCV
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
the ml26124 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/ml26124.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/ml26124.c b/sound/soc/codecs/ml26124.c
index 4d7c0be2a4aa..0823527e4a75 100644
--- a/sound/soc/codecs/ml26124.c
+++ b/sound/soc/codecs/ml26124.c
@@ -402,12 +402,11 @@ static int ml26124_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	unsigned char mode;
 	struct snd_soc_component *component = codec_dai->component;
 
-	/* set master/slave audio interface */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		mode = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		mode = 0;
 		break;
 	default:
-- 
2.30.2


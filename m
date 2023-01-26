Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD5C67D13C
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 17:23:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2468E7E;
	Thu, 26 Jan 2023 17:22:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2468E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674750198;
	bh=SQ5jhsryjRdmabv2oRisOi9tQKyvrV7uZidDTYhHI+4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=IMQvupJgi6aD2S65kIimMp5I7WNvc3uSSJBTnkqQ2lNaHBEHL9JuX1rsGWhht/2rL
	 CebLlGoV+AjIWUDtzejRwrqSOyaPeSv5Cr4a16POCyWas8oBgAjfo2OL5UqsGlIUZc
	 5SqAt/RNVhHdkspp727c6RDYbvUuQJJr4Bewzxe4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C04BF800AE;
	Thu, 26 Jan 2023 17:22:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BFB7F8027D; Thu, 26 Jan 2023 17:22:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0DFDF80224
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 17:22:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0DFDF80224
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tKJBVZ/7
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B9F5618C8;
 Thu, 26 Jan 2023 16:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F9FC4339B;
 Thu, 26 Jan 2023 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674750131;
 bh=SQ5jhsryjRdmabv2oRisOi9tQKyvrV7uZidDTYhHI+4=;
 h=From:To:Cc:Subject:Date:From;
 b=tKJBVZ/7CYeBmXjWhJfISoo9OgvN+nP8c6o/lEwoWCEA00cwyMVwJtPCKFZLxD0vl
 Q3FM+145xjx8ORpanpSKifs4LiSRp2gVje4g1u8R7jzd9R/OxVdORNc7YihRoj2aH7
 4EEOiRUoG0UHW1KE1FPzd+xK+f3OmhNXmuplTwjEhYb79YU4vDR3O6MnMhuUGgkBmE
 GO4HvXPRl52Nfck9OUn3XXgGUQ9Bt9Sst1W33Yzqj0yhiSxvRhkxBAooVp2d0GmD/n
 VjxsznI8CqNG3BA36PdUJCnyAL3v00x11Dz+cB8ZN3e63rdlKWwYtiHT4s0yktVKtt
 uN+xGm5XebOVw==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] [v2] ASoC: cs42l56: fix DT probe
Date: Thu, 26 Jan 2023 17:21:24 +0100
Message-Id: <20230126162203.2986339-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: alsa-devel@alsa-project.org, Zheyu Ma <zheyuma97@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 James Schulman <james.schulman@cirrus.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

While looking through legacy platform data users, I noticed that
the DT probing never uses data from the DT properties, as the
platform_data structure gets overwritten directly after it
is initialized.

There have never been any boards defining the platform_data in
the mainline kernel either, so this driver so far only worked
with patched kernels or with the default values.

For the benefit of possible downstream users, fix the DT probe
by no longer overwriting the data.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: reword changelog
---
 sound/soc/codecs/cs42l56.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index 26066682c983..3b0e715549c9 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -1191,18 +1191,12 @@ static int cs42l56_i2c_probe(struct i2c_client *i2c_client)
 	if (pdata) {
 		cs42l56->pdata = *pdata;
 	} else {
-		pdata = devm_kzalloc(&i2c_client->dev, sizeof(*pdata),
-				     GFP_KERNEL);
-		if (!pdata)
-			return -ENOMEM;
-
 		if (i2c_client->dev.of_node) {
 			ret = cs42l56_handle_of_data(i2c_client,
 						     &cs42l56->pdata);
 			if (ret != 0)
 				return ret;
 		}
-		cs42l56->pdata = *pdata;
 	}
 
 	if (cs42l56->pdata.gpio_nreset) {
-- 
2.39.0


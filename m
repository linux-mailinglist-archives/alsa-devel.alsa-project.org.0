Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED8E54A646
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 04:24:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 014E51933;
	Tue, 14 Jun 2022 04:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 014E51933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655173490;
	bh=OhAGgrsd2hb8cxfZVSqxF5k5FDAbFKwyrNdGMaFnscM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R1iuGvWGZGXMV2ZGSKaLVS0d4s/STtJZcI+1zdhyvppaLVS8ZkztHxOcfsscyAuC/
	 Kk/IOS2Z8VoIlpgswEWs8ExF36WPHVNJj5JGgUsX/jDvGPw50EKwu4bwmJ8ej+89Wl
	 Qe2pqzb9ZRpHuolh6mMlcYWZA8iqZH5Bh3LQPzaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E67D1F806FA;
	Tue, 14 Jun 2022 04:10:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE803F8071C; Tue, 14 Jun 2022 04:10:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97490F806FA
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 04:10:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97490F806FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XHvGOJSs"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8CAD461121;
 Tue, 14 Jun 2022 02:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55AC6C34114;
 Tue, 14 Jun 2022 02:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655172629;
 bh=OhAGgrsd2hb8cxfZVSqxF5k5FDAbFKwyrNdGMaFnscM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XHvGOJSs3TkaTzfVkZJxgyDXJ/Rpkn0C1J5ak+Az+lQLcq4gPUkYsurqNKYtftnZt
 OTCTUgnX5mKK8NlGYlmuAyIss/Hhyhr4Y5hkeUpKGq3HdEXBdf0TPZpqbhjQqa2Qr9
 K9ULQPzD62ik2jrUOksoAZXb+Ohe9vpish9T+Bjdsi2P9ULjACEY6bUUWPH6xVbw0q
 Jq9uclsA2+Q5VNRPDgN0pTyVPkBkxAALCrtt1MGuDDIh+lxS6NChp9jg5ecVQQ6K59
 ljI5K960lxMWoH0pjDFvxa0tJt499JgYtRTU4/ygUSqYra2iJpbSMiyJI9yCH9OCrp
 MyEMGihbyFckQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 06/14] ASoC: wm8962: Fix suspend while playing
 music
Date: Mon, 13 Jun 2022 22:10:11 -0400
Message-Id: <20220614021019.1100929-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614021019.1100929-1-sashal@kernel.org>
References: <20220614021019.1100929-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 patches@opensource.wolfsonmicro.com,
 Charles Keepax <ckeepax@opensource.cirrus.com>, tiwai@suse.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 Adam Ford <aford173@gmail.com>
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

From: Adam Ford <aford173@gmail.com>

[ Upstream commit d1f5272c0f7d2e53c6f2480f46725442776f5f78 ]

If the audio CODEC is playing sound when the system is suspended,
it can be left in a state which throws the following error:

wm8962 3-001a: ASoC: error at soc_component_read_no_lock on wm8962.3-001a: -16

Once this error has occurred, the audio will not work again until rebooted.

Fix this by configuring SET_SYSTEM_SLEEP_PM_OPS.

Signed-off-by: Adam Ford <aford173@gmail.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220526182129.538472-1-aford173@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm8962.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 0e8008d38161..d46881f96c16 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3861,6 +3861,7 @@ static int wm8962_runtime_suspend(struct device *dev)
 #endif
 
 static const struct dev_pm_ops wm8962_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 	SET_RUNTIME_PM_OPS(wm8962_runtime_suspend, wm8962_runtime_resume, NULL)
 };
 
-- 
2.35.1


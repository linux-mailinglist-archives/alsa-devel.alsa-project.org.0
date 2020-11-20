Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 065AF2BB09B
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:33:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BEE2170D;
	Fri, 20 Nov 2020 17:32:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BEE2170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605889979;
	bh=YKAPydPIWqqjvFa7UzQnBAAVi+TGKaJPKa4etHyS8xs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gvj8+Vtkc7nOvEcD7r1s95/oHH2IA2QT1pXTesSPXIBaX8Fb/1Y9Vgwfrn5VHGjxQ
	 zsoj7bqExlBfMbTEkQvjdQCejP23Cvvrl7dGNKg6Eri7urWxB1ZGE7JTDMslemF3S3
	 JJTKXtTDwxik8qKPqmLta04JgVtIxFs5kGlBIg9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57184F804BC;
	Fri, 20 Nov 2020 17:20:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79DE2F805F0; Fri, 20 Nov 2020 17:20:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8821AF805ED
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:20:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8821AF805ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zcUeRzqS"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75F102240B;
 Fri, 20 Nov 2020 16:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605889198;
 bh=YKAPydPIWqqjvFa7UzQnBAAVi+TGKaJPKa4etHyS8xs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zcUeRzqSLSYOtxViNaugsGF1R38va5qadZ3/yPd3SqOdpmd2C/olttpbb0e3TpAqA
 eaAi2NxBUIkSoZMqPtDYO5lsUcnccytQTElY/uGA9hk0KcrfN/Si/HMWylbXNxxw38
 lvAilkHu86bpdcs/4JiLV60O4ij4CWGAEQLHRYbQ=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: [PATCH 36/38] ASoC: max98925: drop driver pm=NULL assignment
Date: Fri, 20 Nov 2020 17:16:50 +0100
Message-Id: <20201120161653.445521-36-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120161653.445521-1-krzk@kernel.org>
References: <20201120161653.445521-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
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

There is no point to explicitly set driver .pm field to NULL.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/codecs/max98925.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/max98925.c b/sound/soc/codecs/max98925.c
index e18d0022c3f4..ddaccc24b0cb 100644
--- a/sound/soc/codecs/max98925.c
+++ b/sound/soc/codecs/max98925.c
@@ -639,7 +639,6 @@ static struct i2c_driver max98925_i2c_driver = {
 	.driver = {
 		.name = "max98925",
 		.of_match_table = of_match_ptr(max98925_of_match),
-		.pm = NULL,
 	},
 	.probe  = max98925_i2c_probe,
 	.id_table = max98925_i2c_id,
-- 
2.25.1


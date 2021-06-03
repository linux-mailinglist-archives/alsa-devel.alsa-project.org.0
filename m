Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CA039A76A
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Jun 2021 19:10:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32F5D170F;
	Thu,  3 Jun 2021 19:10:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32F5D170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622740250;
	bh=Dksp/bCgj6burLYfea58pNgbY4OU8wSkl1Iduw4ho3k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PC8l0fcVWDjNA9UiogbHh/kfoBReHYguW4S1WGq0zxiYqsgkntmY/qHy/ADuFBEX4
	 QpQeFfKGxXFRkc4P+Rbv7ENcnW4+vCDcjuBST6EDQGzMY6Uzag76mvpVMHOT15Mkl2
	 xAIbgINuKGAp//DKIf1K6bHxv1Q9UCg3NJDg7TBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A8ADF804D1;
	Thu,  3 Jun 2021 19:07:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB75EF80269; Thu,  3 Jun 2021 19:07:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0B88F80103
 for <alsa-devel@alsa-project.org>; Thu,  3 Jun 2021 19:07:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0B88F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lJrvBo/E"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2585613F1;
 Thu,  3 Jun 2021 17:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622740062;
 bh=Dksp/bCgj6burLYfea58pNgbY4OU8wSkl1Iduw4ho3k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lJrvBo/Eu8Hp54nYWWirsxYKqXBKam9ZPJc5Hj3keEsaQA/p+GF/TJjiiuUq/xMdD
 12qnyD+Qd9NL2EOpo0+NxonXlEY9AYpggo85Fqgw65FEwxRiU/vjDTWmTnw9I2luNx
 Z0ehd+UvjcgKDBS6BitEnnYn3leyzU0K3I4aGZf/rY72bImKkGbBKwbHe2VkgaIpek
 iY+PdPONAaIw2d531wUJ1OG9aR8aQYGSM92ZjGBcJUGW3ZMSWpxHcnsHYIvG2woAU7
 gqWdbf5Np6DPDHLw6Lrm6Xi0c8b8XazWn9eovmlvnisRDhDlA3OAZqxSghq4/zglZW
 35JQzMXXQezgQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 06/43] ASoC: codecs: lpass-rx-macro: add missing
 MODULE_DEVICE_TABLE
Date: Thu,  3 Jun 2021 13:06:56 -0400
Message-Id: <20210603170734.3168284-6-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210603170734.3168284-1-sashal@kernel.org>
References: <20210603170734.3168284-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
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

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

[ Upstream commit d4335d058f8430a0ce2b43dab9531f3a3cf9fe2c ]

Fix module loading by adding missing MODULE_DEVICE_TABLE.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20210510103844.1532-1-srinivas.kandagatla@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 7878da89d8e0..b7b9c891e2f0 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3581,6 +3581,7 @@ static const struct of_device_id rx_macro_dt_match[] = {
 	{ .compatible = "qcom,sm8250-lpass-rx-macro" },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, rx_macro_dt_match);
 
 static struct platform_driver rx_macro_driver = {
 	.driver = {
-- 
2.30.2


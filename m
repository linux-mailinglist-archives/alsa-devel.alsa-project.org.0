Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3944E7850
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 16:45:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 475FB1753;
	Fri, 25 Mar 2022 16:44:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 475FB1753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648223119;
	bh=MxjfPO5Hu8lxnbNlv3PHfZL7yAYCiHiBwpLVE8ki6Xw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vji0s8WhOGQPKg8LSS2nNE2bX3Wyk2x2BpYLxsMaXvWZX6t3rv3XWJN2eKADwwKXl
	 jiqYb8lI6e2RvlVFzaY/EwHWejwBaJZBASw2Pd7RiGuEL+j1v0+t3RlWXsbUJaAARA
	 iFUVsC7My1AXfGYrZgT2xgGbd8vLA/wqY1mfWh84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71848F804CC;
	Fri, 25 Mar 2022 16:43:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 508D5F80162; Fri, 25 Mar 2022 16:43:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4B8EF8025B
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 16:43:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4B8EF8025B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o4V+Vymj"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5D5EDB8292D;
 Fri, 25 Mar 2022 15:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F68CC340F4;
 Fri, 25 Mar 2022 15:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648223015;
 bh=MxjfPO5Hu8lxnbNlv3PHfZL7yAYCiHiBwpLVE8ki6Xw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o4V+VymjMQkFJEt4gkwkNzCDxS/MU8a3UHkRgUyByV1OwlzXkP5H1djUbmzGVu6Z/
 Rn7dJx0HpDZFXBhHET/Xih5WprL1GUjiy8q/njFQ1nnNsun8/7OuFSWsyDj63tWPI+
 lWk/PPo7fpHUHZh91WkayRQZBLi6Hjf3JguME1NulyCwYzJ42F1Ud81NfRbob0QsVx
 b6TEBgMWaXZEdPhwP24i1bvRek5HqTuH7e8bOEvffaUAVl5MMdM6jb9eUL7grO39d3
 fIZLAo6N4IBh7VIz6CczuvoMwTGLofJiiV/b6AmATr/Ke4BrW4eDelvzuYwfs40u9d
 mUjI41osa7elg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [PATCH v1 3/3] ASoC: atmel: Don't squash error codes from
 atmel_ssc_set_audio()
Date: Fri, 25 Mar 2022 15:42:41 +0000
Message-Id: <20220325154241.1600757-4-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220325154241.1600757-1-broonie@kernel.org>
References: <20220325154241.1600757-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=936; h=from:subject;
 bh=MxjfPO5Hu8lxnbNlv3PHfZL7yAYCiHiBwpLVE8ki6Xw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiPeLwScNimwcJqOuirx43swpWUrA9sQ89hZEbtiq8
 0QtbEzeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYj3i8AAKCRAk1otyXVSH0CZfB/
 9qU4Nopmfu7fuEPjZZxPeB+fpyWghIB+yGf9xewKWs/TfZnsjmgMsbJZmAnjvPeMZnZUvPC+XlyS2s
 SyyhcQGA8XmEc+iAP98Qn908s1e1oGC9UEth+o35arETOqpLwy4rtliiH5vmAmvMXHEVHhvZSohC8B
 tQfVUnBnG2Az8OlVqSwLkjmXfPzdf2BiEdFCILoOXDMdp+Y67CjcPAvnmTmLw9+8KFaq/vKpWjFRN7
 ZyQePXnGsOYeEX/sQn1RlxE+XWxfNh3Jf6FdboIhb8ks9/8I8TRXABp6JTsDVXazxjiTmxPU9vWMZr
 mzocfc4BUeA4+xkAaohfrPgS5B55lh
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

The AT91SAM9G20-EK audio driver is replacing any error code returned by
atmel_ssc_set_audio() with -EINVAL which could be unhelpful for debugging.
Pass through the error code, and include it in the log message we print for
good measure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/sam9g20_wm8731.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/atmel/sam9g20_wm8731.c b/sound/soc/atmel/sam9g20_wm8731.c
index d771843011ea..0365b583ba70 100644
--- a/sound/soc/atmel/sam9g20_wm8731.c
+++ b/sound/soc/atmel/sam9g20_wm8731.c
@@ -127,8 +127,8 @@ static int at91sam9g20ek_audio_probe(struct platform_device *pdev)
 
 	ret = atmel_ssc_set_audio(0);
 	if (ret) {
-		dev_err(&pdev->dev, "ssc channel is not valid\n");
-		return -EINVAL;
+		dev_err(&pdev->dev, "ssc channel is not valid: %d\n", ret);
+		return ret;
 	}
 
 	card->dev = &pdev->dev;
-- 
2.30.2


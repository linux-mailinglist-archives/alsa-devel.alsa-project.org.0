Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C57F7C8C60
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Oct 2023 19:38:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11955829;
	Fri, 13 Oct 2023 19:38:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11955829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697218734;
	bh=HJT283gufmNTKZ1HBQ/5iGWVvMQLBiV0kx1VBpmJJ2o=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RiSNf5XD1N6DJnzY1xnVtKzr1151mO+WPj0oSf+dkTnw9lZrE5gwoZPAXCAOAxtkc
	 FLl7jJjbmOm6+4gg2bCrVyLgwkbOSZGiney8UAAWBJn8Rx6VeS5mjO6Ik58rxJeHDh
	 7433K3QxEHbp4NG4RUq09lJDp3GMt7+ubEOtAWX8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CD6CF80166; Fri, 13 Oct 2023 19:37:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF959F8027B;
	Fri, 13 Oct 2023 19:37:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D856EF802BE; Fri, 13 Oct 2023 19:37:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 448C1F8019B
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 19:37:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 448C1F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Hh2dLgaV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0799FCE3209;
	Fri, 13 Oct 2023 17:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA7FEC433C8;
	Fri, 13 Oct 2023 17:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697218658;
	bh=HJT283gufmNTKZ1HBQ/5iGWVvMQLBiV0kx1VBpmJJ2o=;
	h=From:Date:Subject:To:Cc:From;
	b=Hh2dLgaVMsg08SS9GArO1W/6DeLTcXQhQ5sUQbYuB26xBHcm48kAyKz28jwDPPkF/
	 OEwu1nH+YpE9d0Yfvm1bVR5exlTowmYY4KjepN07FD7NZ2hfCwsOwguvuorkH24hX5
	 eUJHm+cwxKiyRstBVYfj9pRBNSgjBpMi0qKCrl4tVn2pSDZNC8jsSo5mOu8BvC0PpQ
	 ZuQqpA5O0P6YoyrLVCGjf84zgEcr2I0umirU/hT78DLnpURA0H+wpdxb9EOJ2cwuwY
	 +wh+eF9L406GFV2sw0AKgytpy/UuHo23vISKpMj2+/3eod5vizMR6n1Vt7lLWyD/U3
	 tP0BRGaxgw0YA==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 13 Oct 2023 18:37:33 +0100
Subject: [PATCH] ASoC: dwc: Fix non-DT instantiation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231013-asoc-fix-dwc-v1-1-63211bb746b9@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFyAKWUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDA0Nj3cTi/GTdtMwK3ZTyZF0DMyNLk0TjFGMzc1MloJaColSgFNi46Nj
 aWgBOVaAjXgAAAA==
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HJT283gufmNTKZ1HBQ/5iGWVvMQLBiV0kx1VBpmJJ2o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlKYBgq42EeqOZ620pMX7z5W9hELZSAYwy4YNTO
 S+uXAn88ZiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZSmAYAAKCRAk1otyXVSH
 0NgfB/4xxyVdMMJQWFk24fk2jmqzHiHSBcyUZxRVj8niv5wH4r3RjJx6aZToR776cRsXQfCR228
 ZD4MHe/kyNV4aIpS7dpt3vU9eDVaugyovL1FJMPbrgXKokQNlqAQevLZgmzDCl2aknq2dgNxhjA
 h/j1ZAWqFFXrpd62ntGfmMaXX2SyGTpneB9rJ47egALZo2lXuqY+bHnxNUKajLHJoV9SfVYgxux
 myxewmqBUBmJA8FXtTjguqwdGxtF5iFbWtW6+HNEwCcY109lNthgo8omZbfDC4QOv9jc2+eUAGT
 pS6eOJ6X0ehJAUa0f9Fz2PjQeZkZBnG/MAP5pW+JQOpEB4UL
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 3EUJW2PQ63EIR3FCE3M5T5LOJ7WGHBFD
X-Message-ID-Hash: 3EUJW2PQ63EIR3FCE3M5T5LOJ7WGHBFD
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3EUJW2PQ63EIR3FCE3M5T5LOJ7WGHBFD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit d6d6c513f5d2 ("ASoC: dwc: Use ops to get platform data")
converted the DesignWare I2S driver to use a DT specific function to
obtain platform data but this breaks at least non-DT systems such as
AMD.  Revert it.

Fixes: d6d6c513f5d2 ("ASoC: dwc: Use ops to get platform data")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/dwc/dwc-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 2ff619a29655..c04466f5492e 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -917,7 +917,7 @@ static int jh7110_i2stx0_clk_cfg(struct i2s_clk_config_data *config)
 
 static int dw_i2s_probe(struct platform_device *pdev)
 {
-	const struct i2s_platform_data *pdata = of_device_get_match_data(&pdev->dev);
+	const struct i2s_platform_data *pdata = pdev->dev.platform_data;
 	struct dw_i2s_dev *dev;
 	struct resource *res;
 	int ret, irq;

---
base-commit: fbfe616ad40c06d68b83b657a94cd2e709dda37b
change-id: 20231013-asoc-fix-dwc-06294a3d3675

Best regards,
-- 
Mark Brown <broonie@kernel.org>


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C11AF4C06D0
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 02:20:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36F80189F;
	Wed, 23 Feb 2022 02:19:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36F80189F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645579231;
	bh=vMG8ncA01sUteJVcDHhOSrnXfdUB98jh2AkQVH7mALI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NBOBW16fRG7TjvWgt63724LONhMXlfrBO65okGIj5OKoizx1sc4Phbn5KeOWdIzMV
	 +U38+9gC7B476u19po0FJy71aIq4SfJ/Pi7edJJsHghTZ6ZSdgFbc/q6jEASMJrnJR
	 soPm7x7Vx9ZhQBszm9KokbE08rqF+aH79BBiRJbM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85BA0F80118;
	Wed, 23 Feb 2022 02:19:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87DF9F801EC; Wed, 23 Feb 2022 02:19:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44A34F800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 02:19:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44A34F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WRAVGL2X"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EB60AB81DC9;
 Wed, 23 Feb 2022 01:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6218CC340E8;
 Wed, 23 Feb 2022 01:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645579157;
 bh=vMG8ncA01sUteJVcDHhOSrnXfdUB98jh2AkQVH7mALI=;
 h=From:To:Cc:Subject:Date:From;
 b=WRAVGL2XAbqkaSpJ4EjxsAIbNo4u7pJL0LRb79TkKUokR3X6eJ5wC0f2FIMMlHT1A
 mQ2fRSHgstGbNnXDdlgu5FGm6TzpYWFrLZbD0nIZAl44G5lKs1yRn253ay74l9N7os
 JBDeBIrHFT0djdrNgg275aY6uTDkTlql8VQmtjxYXzJ+5coNSXZBgd9Hxfx1APv3qx
 C4LmROt4Z3zKbKmxKBu53oC1dn78E99+/lp0vFS5dc6OoPnOsLpqcJRqLfNAtiSPXa
 5c+5oGNAOdtYJXTwNJh+hH5TH5PPOvnPmuyyR9AWM5wBCfgAEKGUecCa3xBDO9ohyq
 4PfcBwZiGLbfw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@codeaurora.org>
Subject: [PATCH] ASoC: sc7280: Really depends on SOUNDWIRE
Date: Wed, 23 Feb 2022 01:19:12 +0000
Message-Id: <20220223011913.2753938-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=823; h=from:subject;
 bh=vMG8ncA01sUteJVcDHhOSrnXfdUB98jh2AkQVH7mALI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFYtNqud2hbDV6DEaNK2Ec6G6FUTvPTp71P70BD/x
 4ivd2cCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhWLTQAKCRAk1otyXVSH0IzIB/
 9XVPFB21qMNLoVbpYKB0ZxZyyZiaNWdimvsfklhGjN8IGmrogzjXC2SagarQ5o0VfeSVEZciRawhrh
 dIIZDMLGHK4T/rMK5Rxrrurvnt0xopYa/fAqJxKoZhc3FlBa/kNCRHipuAivT7JYoHyIk2WQ81ofYb
 WNAGJjiaC+maU7mloGtDgtWtTidAVpdQt6Xw/H4mlIpiagqGGOupdlZ8qgL7ZXUezqDmG1ryhtTeu5
 unakmcNugN3cboHNU0lTpcNjZHmTnN4kdp29iDPw63iL98xjCHdTF5VheHQdqMXuXuKtJMheHth5hG
 NfPTG1IB+Usnvo/3nwh64Yc0zPHBHs
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

The sc7280 driver really does depend on SOUNDWIRE since it calls various
sdw_ functions (eg, sdw_enable_stream(), sdw_prepare_stream()) which do
not have stubs when that is disabled so we can't build with COMPILE_TEST.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index dd5949eb6b15..f09dc0fcff0b 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -178,7 +178,7 @@ config SND_SOC_SC7180
 
 config SND_SOC_SC7280
 	tristate "SoC Machine driver for SC7280 boards"
-	depends on I2C && SOUNDWIRE || COMPILE_TEST
+	depends on I2C && SOUNDWIRE
 	select SND_SOC_QCOM_COMMON
 	select SND_SOC_LPASS_SC7280
 	select SND_SOC_MAX98357A
-- 
2.30.2


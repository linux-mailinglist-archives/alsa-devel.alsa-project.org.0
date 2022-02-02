Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D74F4A78AE
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 20:26:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B756178C;
	Wed,  2 Feb 2022 20:25:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B756178C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643829997;
	bh=otQxkdwooj7PTpO/ZHHuxTzyh3YPqvH+t7aKhJx6S1U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kv+bB71aNLYSbNDxSLzsHDuHPwXJeFqofpTZeJk7OouwAP8qKqx6+SHSvADMyBOCT
	 D+yx2lkxfDJu95guX1UvB7bX5l1L7IVkYEiL3tRys8OdShgR5BlB/CJUr7wTwMtUJ5
	 JD+Dhc+tDdiJGomDELHi4dxPdH7j7LRbMIbD2VuE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3174F80525;
	Wed,  2 Feb 2022 20:24:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA0E2F80518; Wed,  2 Feb 2022 20:24:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88B16F80130
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 20:23:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88B16F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oYUqfdk8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E3487B83256;
 Wed,  2 Feb 2022 19:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85165C340EC;
 Wed,  2 Feb 2022 19:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643829832;
 bh=otQxkdwooj7PTpO/ZHHuxTzyh3YPqvH+t7aKhJx6S1U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oYUqfdk8KyaVrgE1einkXrn/4loVkkpbwAUQThwcOWaxBi3DMt1j2Ev/0h7dYP3T5
 ZLWg+scYc6T2zvNyzrPiVBwtIzYRiRIE+MnKRzeOILvTIw4Enuw5lQ09nTF89G24d/
 vkDafWdXEMic6Dx4CpODYrzrUJbdk9F8z5gouwU0uZz0/Rv0pXF+EJU44ewI/uM98j
 NkdA8p3ssAEIjmdpMj34gt4U97hdbiBKxjCo2XBzt9r844CI2OhShlizpj8FUdU3ph
 CyDhCWJu9iL9L+N0DbUK6E5RLgHSzU9dHsTsfbDXP1OalTLFYIa6mlC0n1W2ZLeK5Z
 W4TqGdrqXKCGA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH v1 4/6] ASoC: max9759: Remove spurious gpiolib select
Date: Wed,  2 Feb 2022 19:23:31 +0000
Message-Id: <20220202192333.3655269-5-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202192333.3655269-1-broonie@kernel.org>
References: <20220202192333.3655269-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=645; h=from:subject;
 bh=otQxkdwooj7PTpO/ZHHuxTzyh3YPqvH+t7aKhJx6S1U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+toyWVQJLLrmEUPi9owp5t/9k8N/ELkvnQfVkS5Z
 BLhPHIWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfraMgAKCRAk1otyXVSH0OWOB/
 4nvpvpuSfUvgBOzIIahSc1R90pCkc9s4BVPlTtcik1epq0v5BzH+vXShPBjiPkQFbQfi02oj1CACuH
 1pDZtA9iNx7GE0bJ7YUlJmEcWHWpkYzXdk8WVuVQ9cxRMDtR8J2Qa/QJDOcYOfe7B3E/xP/scVK8Rf
 rV+HWUjgGeX7Z2ZNFvGqOcO3dWQDUr18RZ2+W1nzyULva4OyEjDLXNsQuqvj6duiFUiLq7R2GEu0fp
 z7LE+aFM/9vsad3GT/tjgkhvpqO1YjjDi/VoC55mYY6J1mLYVq2xTjHzt2ojDtkS61Mj8UDdqP56Fz
 Tq7TNEsQMTf0Nc0XRs9DuTcsC0wpF6
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

The usage of GPIOs is optional in the code so don't force on gpiolib when
building it, avoiding warnings in randconfigs.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 54eb6005f99c..cee4330fce93 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1912,7 +1912,7 @@ config SND_SOC_LM4857
 
 config SND_SOC_MAX9759
 	tristate "Maxim MAX9759 speaker Amplifier"
-	select GPIOLIB
+	depends on GPIOLIB
 
 config SND_SOC_MAX9768
 	tristate
-- 
2.30.2


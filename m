Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 018B94A78AC
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 20:26:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 985CC1783;
	Wed,  2 Feb 2022 20:25:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 985CC1783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643829964;
	bh=vlWMjjqn0NVmvDNd0G2CcPnUtlGnOe53KMMwW1Tf5R4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uNJYV5A8FzsQ8nAIBiF8gvPN2Mzi5x01fos4Bti2zxXLujI0EyfNP4uef8d1Hak9X
	 n4QWUUIbZ16I2IpMzFRVqdS7m9dnYelaJCKntidHqemN4dxtthdpI9lknNE/sSKk/D
	 qw3SuPC143lsirZ0Bky94RDGDrva8JwcRIAeGpdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 634E6F80130;
	Wed,  2 Feb 2022 20:24:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7204BF804B0; Wed,  2 Feb 2022 20:23:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36FF5F80130
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 20:23:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36FF5F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="N3LJ93rI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 58BA3B83255;
 Wed,  2 Feb 2022 19:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3570C004E1;
 Wed,  2 Feb 2022 19:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643829831;
 bh=vlWMjjqn0NVmvDNd0G2CcPnUtlGnOe53KMMwW1Tf5R4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N3LJ93rIJfbG64z++baCCW//tIUlSUdwP3lKrYCm5xrrd8qsH9sfndpkNEJYdKEMM
 wSTNJCRXmDavVdAvabwlIGDf4a4XAUJwahEAiclH6DQhLBWkDQYMCHLRtUPlcETr/f
 1Sllft96okYgMSWmp7F0LLpznGGy/LifjHTdl8VGBcMKYNOBewaoYM5waONSbWXbIz
 dZsxA+YwpGrSFJyr1e69fssA65JsEdT5IbuPAIxIkpvRKvffM4Xa6dEHsF3NElxvtz
 5SjXDEcbapDNVu8+1BrLstzwQAIm6FH73po66Y18hGzXBAVdwNMwuZwHLPlq8XNOAP
 AKeZHOWDstJjQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH v1 3/6] ASoC: simple-amplifier: Remove spurious gpiolib select
Date: Wed,  2 Feb 2022 19:23:30 +0000
Message-Id: <20220202192333.3655269-4-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202192333.3655269-1-broonie@kernel.org>
References: <20220202192333.3655269-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=637; h=from:subject;
 bh=vlWMjjqn0NVmvDNd0G2CcPnUtlGnOe53KMMwW1Tf5R4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+toxMq4mzrZwM8U8dAAtviN8csZ7SOVrWGBnE7gb
 sPEWljqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfraMQAKCRAk1otyXVSH0OTPB/
 0YMUrViI5Qsunye4Vr7vFEYREIphrNQpVhBYSbA8/I5ra60GzgDVJ2dMFW3Wfxiy4Vke6vN1i2IlXU
 zERUJv7Jh+QK0mQjowuMwe9nHE/t42DnCPcnnSqTIZCZUlrVWyb/W8F0xINLsAP6RQ6ybJN2/451Hz
 h4Erq/8wIuJebyOiPP4cM7C7dhfF6CzstsfI3sFOenDmdaf75Ab9rGvjmUWVFnjosaR6c1fhslx1b+
 tQMapb8+xWUuGI75Ek2PKo1a+/Wi0wVWJABEWCcq/Cp46GLQlH6UyekvWh7yN/4A6QOeDvEwtlJ7iP
 FZloHwywKf/n2deczwFrlFpyGjoXBA
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
 sound/soc/codecs/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 196b5d9b08c3..54eb6005f99c 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1391,7 +1391,6 @@ config SND_SOC_SIGMADSP_REGMAP
 
 config SND_SOC_SIMPLE_AMPLIFIER
 	tristate "Simple Audio Amplifier"
-	select GPIOLIB
 
 config SND_SOC_SIMPLE_MUX
 	tristate "Simple Audio Mux"
-- 
2.30.2


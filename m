Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F16854A78AB
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 20:25:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DBE6177F;
	Wed,  2 Feb 2022 20:24:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DBE6177F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643829938;
	bh=Bqwdg+1JYoR1Jcs0ULJYBzEphX3nOhl1z+8t92YyLws=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k5Zy7TbL0/KirLU+yAx/y8lvQZzWYFZkgXsPI5k1LMU5JXWE1BhHifEPqRCLsDuBq
	 +vXBm0qnHtlTkgR9KAn3y1skVuAJHLbYZJTPrJlmVvYD8YVExlGyLVIQT95yRgKx0k
	 z2+TfHijuRNxmnylBC5YOfYgsjWVypKBWEEVCKQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96096F80516;
	Wed,  2 Feb 2022 20:23:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A25CF804B4; Wed,  2 Feb 2022 20:23:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CDAAF80095
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 20:23:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CDAAF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="f+qHQAZB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4A1EFB83257;
 Wed,  2 Feb 2022 19:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3DB5C340ED;
 Wed,  2 Feb 2022 19:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643829828;
 bh=Bqwdg+1JYoR1Jcs0ULJYBzEphX3nOhl1z+8t92YyLws=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f+qHQAZBAFjPTIigttZslh92H8DngS1LczIp1ZMAgqpli+FfkBDfn8o4x1d7A8WCg
 0CCIMBt5YPznJ7TANTBMN7SXJaeskAyzXvirnmC44iBA5ZqCIfr4VlPiTWgbwxHeHM
 v3ltBIm+33cxCSFtaBps2Lhpg4BMb00mymPVhvl+FlaEGCuB1Ryxf1FY3FYLFTN9S1
 55jOba1/Um+kJlZMd8Yb1TDIVsYJ2qxL4SR2odq3TMOoo+oWOPrEQ08JaOcg5a6lPL
 Q8+5X0uVNvCyxmLjJTGjokB867QL+qi7xoXsTxB3B4L3gV59HU8gWTpnPiJRDEbSzU
 FUpRLZNTHeaVA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH v1 1/6] ASoC: dmic: Remove spurious gpiolib select
Date: Wed,  2 Feb 2022 19:23:28 +0000
Message-Id: <20220202192333.3655269-2-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202192333.3655269-1-broonie@kernel.org>
References: <20220202192333.3655269-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=683; h=from:subject;
 bh=Bqwdg+1JYoR1Jcs0ULJYBzEphX3nOhl1z+8t92YyLws=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+towqPd1/hxuVjkvn7DqKV2px+QoR93IAs5sWv+y
 tHxhmfaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfraMAAKCRAk1otyXVSH0Lp2B/
 0aRDf7hKF1G/FHgNb0hkAjmgqh25L+/x6YZj3U8UGN3iUBojqNI/x2PS9xBzW7qe8QCjFIFjEVrzHP
 4hcYKjbn9i3y23570jh5qU/6trh51dhy3e+od0bQpe2C3Vn7N0S4zXX3M7zvNM8CdyOZ7EoOWg1mii
 ZcdcR94uWnqDiShMXGRspiM69U2boQIiRmGkC4E5rFN0A9h+EFGWeA5nPgazjAIQBerQJIypGRxQKk
 CADuQF20JiDG47WKUBgiFwZKQ/33uvbbK2zmoG5eKk7sDKBQs1gALT98NESKcFNHU6P8U6dsUvQC3c
 zDBPoue9ocQ+hWzKjmo98uGYoBwPAC
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
index d3e5ae8310ef..18159d560c74 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -842,7 +842,6 @@ config SND_SOC_DA9055
 
 config SND_SOC_DMIC
 	tristate "Generic Digital Microphone CODEC"
-	depends on GPIOLIB
 	help
 	  Enable support for the Generic Digital Microphone CODEC.
 	  Select this if your sound card has DMICs.
-- 
2.30.2


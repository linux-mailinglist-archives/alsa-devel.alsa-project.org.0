Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 996454A78B0
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 20:26:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37EED1781;
	Wed,  2 Feb 2022 20:26:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37EED1781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643830016;
	bh=HiWIkSxrYKH1VG4Gbtzbmoi6V1g9hJe1PYVEdhEr17w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WOxKau9sT/9wXVFM0jG3Ob1FXWr/UsshjBv988LoynblPAaT8TLKKiZGV/wlCG0LL
	 9L27wpWUa1kixz1kUCkDBHLLDFqw3TI/cwhAtaAgStTXYa3nMCS26FzQy7qGUhKk6Q
	 we0yDE3Jkqf00HSv81EBImz2nXW+KLy1nAE8Q3lk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68990F8052F;
	Wed,  2 Feb 2022 20:24:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1771F80517; Wed,  2 Feb 2022 20:23:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE4A4F804FF
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 20:23:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE4A4F804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NTPu2FNa"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 79082B83257;
 Wed,  2 Feb 2022 19:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 183FDC340ED;
 Wed,  2 Feb 2022 19:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643829834;
 bh=HiWIkSxrYKH1VG4Gbtzbmoi6V1g9hJe1PYVEdhEr17w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NTPu2FNabm2fR9iIqIo1lPMaK8SjxAdCazo5g2F7V5me1XW1Lj8QFyZRodtiZP5zl
 mYWpf6qvMZWQKtZTbKkLrHKW6n5bU8/BCyHJ/EdxM56a266EoqA7TOWWAX4Ri14shg
 fAMt7PfaN5iIl4uVvg/9i+kBo+fNtUvtyOry7JtFVOOgeGrkb0BMRGfJ06hmBIMBS6
 A2w7g9LDbpDZjs4LlOyOjak++HKWlQePQNoOjgjoy+4r040tfM/cyVNHguMe53VAKo
 fBPFNQRpB4LHDbJOufiYCwVaQ1ONYA91/SloVPuuPtrAcHMzt+wR6Osj7ocdyD/EQY
 /1LPbXlVbEBFw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH v1 5/6] ASoC: zl38060: Remove spurious gpiolib select
Date: Wed,  2 Feb 2022 19:23:32 +0000
Message-Id: <20220202192333.3655269-6-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202192333.3655269-1-broonie@kernel.org>
References: <20220202192333.3655269-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=703; h=from:subject;
 bh=HiWIkSxrYKH1VG4Gbtzbmoi6V1g9hJe1PYVEdhEr17w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+tozV13wQ17qEzm7anPFDUZZ3pC66JrQlONK7Ruk
 EIpIRAqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfraMwAKCRAk1otyXVSH0FIFB/
 915D+7BfcbnwEScVJ2BkRacAI951JOoo+okGH7DU9iAiO8+WyCsPS/DMOKiyM01Y3K0CM5plXY9OUU
 qbvetOYyCARZGpugNgpe2VSZImqqd+mxVA6MbZ61pu/8DLhBFAgE+iqxkZ2VSlbrLggDs2dCtnvm7m
 bOAAMCTPH2snqviv4Pv3Qtq8y2kMUhZLU5D8ENyOXyaHrGYNFhAcikDHBgS7i6WPT6Y/COriXEWV75
 xcLFJ+NtWCksf+xt8lJVORo2O7MTDbt7rh/pvyPsY7hwkt9f3FirwmEIEnqUY0WA0QQ/8IYrkl8RkK
 ZU83uutgqPlBfmLyU60QjK6eLk7Sv5
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
index cee4330fce93..8a2e1c61f616 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1898,7 +1898,6 @@ config SND_SOC_WSA881X
 config SND_SOC_ZL38060
 	tristate "Microsemi ZL38060 Connected Home Audio Processor"
 	depends on SPI_MASTER
-	select GPIOLIB
 	select REGMAP
 	help
 	  Support for ZL38060 Connected Home Audio Processor from Microsemi,
-- 
2.30.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 791BA53BA47
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:58:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D79817EB;
	Thu,  2 Jun 2022 15:57:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D79817EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654178291;
	bh=NeDYffPh1grI/6GxifzALRBVAir/zapwQauikcKJtp0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N+hgAg5mjYxAgKtuKX+Ho5q278n647LYxBgc3t8Te/nzTyxBa+HRerB3PFS+sxaCQ
	 E5eJRzP5B97BjPSQ7ifS25PoFZwClL43VTg7XP9LUsTq3VcoUpKJ9xdRWk70LKzUnT
	 hNQhDzwz0ASzOOsGy9bX2IhoG5zNwYSAWtDanO64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7097EF805A9;
	Thu,  2 Jun 2022 15:53:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76965F8056F; Thu,  2 Jun 2022 15:53:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B4F4F80558
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B4F4F80558
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sg1s6+uL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 80A86617CF;
 Thu,  2 Jun 2022 13:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3703FC3411A;
 Thu,  2 Jun 2022 13:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654178016;
 bh=NeDYffPh1grI/6GxifzALRBVAir/zapwQauikcKJtp0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sg1s6+uL3QxKYafWeXClbIFYXxM4NnPjyop2n2TLlzVZzfGtxwBnTec3yf0IZS5Ys
 D7JysXO0Qa4C3wMeC4p3GR0RrwWL3wg2knoTrs5bMsI+a8h0gItsya45Sj7xk1t6WX
 pItzEjV+aownmO0qSRWfpYBKeLJ1oQaX3Mv52iF5iLIf6sgWrF2s1N1Lg6/rOIhjFi
 W4SKtKz8VEOovLJW2l80I3sZIRFmjw6z5cBROs2jP2h1ydwNKmCVHNYlhMWuUHyVvp
 zZXq2GIU5FipWDXjyp3+lmzdZkmEwtqZo++fPakC6bk1Xb30NdzrdDeLjFRHVYeewN
 tCG+UtfEXeT1w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 13/20] ASoC: tlv320adc3xxx: Use modern ASoC DAI format
 terminology
Date: Thu,  2 Jun 2022 15:53:09 +0200
Message-Id: <20220602135316.3554400-14-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602135316.3554400-1-broonie@kernel.org>
References: <20220602135316.3554400-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=898; h=from:subject;
 bh=NeDYffPh1grI/6GxifzALRBVAir/zapwQauikcKJtp0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimMCYAZ6ethlwl9fJSNdo2ntdXIFOBUxFQJzm+4GM
 6FX8rWiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpjAmAAKCRAk1otyXVSH0ER5B/
 9pr4Heer+JYNUXfLtygJynyM9gqYH4OmONDKFUIzKZbtugugH2NX9kIHkVvw+5BFmOGW3gvmjD5R+p
 PC/nVgF4W1/JL/UeGKV+2oLvduOkZttUw+SwSpt0LNkPIlSe8lbig2L3KXjgSigUYDMpRXvsbPxXyI
 0Mmlj6Xk0iv+trYDc3ubvLE6x5SrZd8aFKxbdpI2SP6fZERK6E0/CS0umNXqpOF4OjXjHR6IZH9yyF
 Tz3WXjUB4TxWDCkMw6pydLsTq3b6oMJwg0Cp7MT/J10Gcqmevmf0oR6YXzIEZ8/hg6NPfOrKY4EDwx
 8lSeBBsBlt2sMImDe4ZR8h1+o8+ATd
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

As part of moving to remove the old style defines for the bus clocks update
the tlv320aic3xxx driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tlv320adc3xxx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index 9176885bfc39..ab2c613ac0a0 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -1255,8 +1255,7 @@ static int adc3xxx_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	int master = 0;
 	int ret;
 
-	/* set master/slave audio interface */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 	case SND_SOC_DAIFMT_CBP_CFP:
 		master = 1;
 		clkdir = ADC3XXX_BCLK_MASTER | ADC3XXX_WCLK_MASTER;
-- 
2.30.2


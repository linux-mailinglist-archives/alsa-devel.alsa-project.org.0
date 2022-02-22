Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA204C056E
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 00:42:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B17D318CD;
	Wed, 23 Feb 2022 00:41:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B17D318CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645573341;
	bh=b0Yrw6AijktqmcZ5sbnJTFvkuRvsvDeSnGcTpNUPICw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WTtjLQmULuoEPWNd9+CTfO/cZdnS8vL/ITseV4Ap8Lp+Ej+TMTadAbEGGu5OtgUnT
	 N2E//J1NlJArmFoEil8SCMMy/XWKsxcPNTvJO5a3Ex2jusMwQnm1mOV30W/V2RmJGH
	 nOI4Ej/IKnfCTXqYBEYmgiS5i8gC8+S6MD+itark=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7D0CF800F5;
	Wed, 23 Feb 2022 00:40:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60DB2F80311; Wed, 23 Feb 2022 00:40:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D61BF80118
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 00:40:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D61BF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HGUNFn5T"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C679E6113E;
 Tue, 22 Feb 2022 23:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CCC5C340F0;
 Tue, 22 Feb 2022 23:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645573235;
 bh=b0Yrw6AijktqmcZ5sbnJTFvkuRvsvDeSnGcTpNUPICw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HGUNFn5Tarmn9Xmzfv0yuNxFS1n2BkUkuV1Jn5OQWTc1HWiqIfVjWdPMDCjy32Wxl
 acm5m6wvKRAP3oy43tQu2AZZwklosoJn/ZF/KlE4AHG24H/qjvEn9UJenUZ39XfTWU
 mBwNZg5cW7UUgzLRr0IiN1INTybxosTDNNyK0Y355+aVrmE53PGJyLDP49ArDTMqsG
 EG6m6Aiyqdo8L0lVnVMLbqXlsIQzhq4GkGR93ZRoQAJsm9j34JThUrW7iLit3B9Wgy
 fWvfrrZF7a/wa1nuQ7g2NVVOmttK7kZb6SCwFn/PHkSY6E/OVAkrjhveGoNvgRTHKY
 87eE1vSX93/NQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 03/10] ASoC: max98371: Use modern ASoC DAI format terminology
Date: Tue, 22 Feb 2022 23:40:19 +0000
Message-Id: <20220222234026.712070-3-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222234026.712070-1-broonie@kernel.org>
References: <20220222234026.712070-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=923; h=from:subject;
 bh=b0Yrw6AijktqmcZ5sbnJTFvkuRvsvDeSnGcTpNUPICw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFXQmimh+xaUbSU0HTYOwLVVaQmZOgXUKw0AzIWLR
 aVCB8cOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhV0JgAKCRAk1otyXVSH0JmmCA
 CGKMhgjM5Q3IwATX6namrCCVi9sUqsbYFtnolmcsfEDqwfRsVZLr4q+nD7+QHzO6z44Xlo1byabef6
 4nWBu/9AHcpoKLYTy5aMnRN1p4drIkUZzPL1TZiouSQiZyivjR0n2W+BWn9VVRnlWZv6LL75DhCQtT
 5SS9wYpoxRp7OTPEdkeUUphTZLZrP8xrmhOrZAkQKd8YgPO+0V/+2QpzyVPlUpjaGTXkVHmLCOjh3f
 pzPkck2VbhUEJBWxPsG3ifHUi7np+BZ0WO2zjVvaIdwzJwdhEQvaWOduPCKWPrB85xOYPA2pe9z687
 Fus9Pck4kq5Sq8wJTmePdYuTmIEyEH
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Peter Rosin <peda@axentia.se>
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
the max98371 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98371.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max98371.c b/sound/soc/codecs/max98371.c
index e424779db02b..8d42f523e420 100644
--- a/sound/soc/codecs/max98371.c
+++ b/sound/soc/codecs/max98371.c
@@ -184,8 +184,8 @@ static int max98371_dai_set_fmt(struct snd_soc_dai *codec_dai,
 	struct max98371_priv *max98371 = snd_soc_component_get_drvdata(component);
 	unsigned int val = 0;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		dev_err(component->dev, "DAI clock mode unsupported");
-- 
2.30.2


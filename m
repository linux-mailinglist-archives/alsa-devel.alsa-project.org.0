Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E85AC732E43
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 12:30:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D527851;
	Fri, 16 Jun 2023 12:29:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D527851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686911448;
	bh=qM1zyWhIcnuGdrWVUOFioXZD/zskQZe1GJXMqbI3dQE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VVLZgL7SvC3F6XPpDBoUbVXhTHpJBZdf4IkPnfcYagijJDrrGMgXRy+QBNjqgbsqG
	 Aqy8wgEagkj75GaIzavLI2ZyXw8fgiuYoElyILdQaegb0qvdDuWr1HlmtcVWbOvMQI
	 UJYYX7kRoTdDerzXYd0lkeFq84qJH6IbInc1PyqE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 997A4F80589; Fri, 16 Jun 2023 12:27:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17038F80589;
	Fri, 16 Jun 2023 12:27:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEE7CF80609; Fri, 16 Jun 2023 12:27:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 970F1F805FF
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 12:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 970F1F805FF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QxF0fuYN
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7883E62544;
	Fri, 16 Jun 2023 10:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D193C433C9;
	Fri, 16 Jun 2023 10:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686911216;
	bh=qM1zyWhIcnuGdrWVUOFioXZD/zskQZe1GJXMqbI3dQE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QxF0fuYN70eK0b265nEwb13m9ALRLmzWnxTz7ru5zSgqkS4Lz06Ni8wHIUDclBQ1I
	 TSJjvL2tT8JCcS9fGT1kI4n1XB+IcKkWJbZjpQv02hP3M2F+oJ30F0EaVe9rSQLRnm
	 jyYXADPEyHVN3QUBgZZ5/opiX99uNjzgiSj8VmDvT5Ik40aw4QfQ5D1cgirOCm7POZ
	 JXeSZEB89n+2M6JKEF5Tz18+m0hPk7yp1dl/31NiM5xfro6QMzHPgYy4g/wwwUMkW+
	 ySsqmlrzkWPR0nydx3Gc3+lTUIIBy2eTaV48UQbGUxn3fAflUjhADRvmGtPhhnS7by
	 ZY+XU+Z4+Plgw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Chancel Liu <chancel.liu@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	Xiubo.Lee@gmail.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.1 15/26] ASoC: fsl_sai: Enable BCI bit if SAI works
 on synchronous mode with BYP asserted
Date: Fri, 16 Jun 2023 06:26:12 -0400
Message-Id: <20230616102625.673454-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616102625.673454-1-sashal@kernel.org>
References: <20230616102625.673454-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.34
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LBDTNFZKRVAYGK7YHZFPI7GEX63ELPFK
X-Message-ID-Hash: LBDTNFZKRVAYGK7YHZFPI7GEX63ELPFK
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LBDTNFZKRVAYGK7YHZFPI7GEX63ELPFK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chancel Liu <chancel.liu@nxp.com>

[ Upstream commit 32cf0046a652116d6a216d575f3049a9ff9dd80d ]

There's an issue on SAI synchronous mode that TX/RX side can't get BCLK
from RX/TX it sync with if BYP bit is asserted. It's a workaround to
fix it that enable SION of IOMUX pad control and assert BCI.

For example if TX sync with RX which means both TX and RX are using clk
form RX and BYP=1. TX can get BCLK only if the following two conditions
are valid:
1. SION of RX BCLK IOMUX pad is set to 1
2. BCI of TX is set to 1

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>
Link: https://lore.kernel.org/r/20230530103012.3448838-1-chancel.liu@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/fsl_sai.c | 11 +++++++++--
 sound/soc/fsl/fsl_sai.h |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 6d88af5b287fe..b33104715c7ba 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -491,14 +491,21 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 	regmap_update_bits(sai->regmap, reg, FSL_SAI_CR2_MSEL_MASK,
 			   FSL_SAI_CR2_MSEL(sai->mclk_id[tx]));
 
-	if (savediv == 1)
+	if (savediv == 1) {
 		regmap_update_bits(sai->regmap, reg,
 				   FSL_SAI_CR2_DIV_MASK | FSL_SAI_CR2_BYP,
 				   FSL_SAI_CR2_BYP);
-	else
+		if (fsl_sai_dir_is_synced(sai, adir))
+			regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx, ofs),
+					   FSL_SAI_CR2_BCI, FSL_SAI_CR2_BCI);
+		else
+			regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx, ofs),
+					   FSL_SAI_CR2_BCI, 0);
+	} else {
 		regmap_update_bits(sai->regmap, reg,
 				   FSL_SAI_CR2_DIV_MASK | FSL_SAI_CR2_BYP,
 				   savediv / 2 - 1);
+	}
 
 	if (sai->soc_data->max_register >= FSL_SAI_MCTL) {
 		/* SAI is in master mode at this point, so enable MCLK */
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 697f6690068c8..c5423f81e4560 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -116,6 +116,7 @@
 
 /* SAI Transmit and Receive Configuration 2 Register */
 #define FSL_SAI_CR2_SYNC	BIT(30)
+#define FSL_SAI_CR2_BCI		BIT(28)
 #define FSL_SAI_CR2_MSEL_MASK	(0x3 << 26)
 #define FSL_SAI_CR2_MSEL_BUS	0
 #define FSL_SAI_CR2_MSEL_MCLK1	BIT(26)
-- 
2.39.2


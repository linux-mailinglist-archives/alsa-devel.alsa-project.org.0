Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F9E53C8D1
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 12:36:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F102182B;
	Fri,  3 Jun 2022 12:35:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F102182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654252605;
	bh=nJ8sR/7uNfDFxKQtPiKZF1Cb0Sh5pkP764KwxqOHpm4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TH7ImPKS34popoY7cNziNOF3vI2Mmi7hy8nrVp1ABOy1/WlSDGA8Pp9Xtp0V1pNtN
	 EAfutSqKUMCMIMFHg5pp9DG9QxE4XAb+gH8oCO1HEsIHcqM1FnXFTPjwdbrfurOBob
	 j6h8yaq/USsTZg8j3xWZBiDA1zXyntrLz6xK7zVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D0D4F804D1;
	Fri,  3 Jun 2022 12:35:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5EE5F804CC; Fri,  3 Jun 2022 12:35:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F8C6F800F5
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 12:35:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F8C6F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YTf0Eeea"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5B498CE230F;
 Fri,  3 Jun 2022 10:35:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70271C385A9;
 Fri,  3 Jun 2022 10:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654252538;
 bh=nJ8sR/7uNfDFxKQtPiKZF1Cb0Sh5pkP764KwxqOHpm4=;
 h=From:To:Cc:Subject:Date:From;
 b=YTf0Eeeadte/qeMtG8c29mBf0K+xqx9992VweHcSzuQDxr0PYhdfvXtFGJuMsL4bS
 +lfCObzsLtQm6u/zr3bufoAaXnz8kyXZYSYUr/+gjgC21CoNbvCJAEgdR8MxK00CjS
 GLGXsiXD/ozqxXWC6TIN5ZHSR2v7jvZVjRpMbpzNdabxDbUlx+1210fR/jokQ6tqFd
 trZRpau85SaWUkIrdKCwUvIkLdg8uglxApHtOofJ/hlp9IgWKV+ofKSVi5suxf1WRD
 y5+ix3gC/AXmjY3Yf9Mzv6vrYRwGNSxdaARopx/NkjmrahNANf+lSypU47miKW6XCx
 7+kjHQLDf8UcQ==
From: Mark Brown <broonie@kernel.org>
To: Hui Wang <hui.wang@canonical.com>, wtli@nuvoton.com, kchsu0@nuvoton.com,
 ctlin0@nuvoton.com, David Lin <ctlin0.linux@gmail.com>
Subject: [PATCH] ASoC: nau8822: Don't reconfigure PLL to the same values
Date: Fri,  3 Jun 2022 12:35:30 +0200
Message-Id: <20220603103530.3844527-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1663; h=from:subject;
 bh=nJ8sR/7uNfDFxKQtPiKZF1Cb0Sh5pkP764KwxqOHpm4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimeOibQS1ww8oXIf7y+g6PNrFLrlGC60Z5r5rhNaq
 c4C8VoCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpnjogAKCRAk1otyXVSH0M4XB/
 4i5G4+NEkaPX33JnfISMZ5eBRnMMXoD2LP95cuzdG7DQLkcNz9+hHsxb5Llxw9Xo74uET8tAxWxdWU
 EbNsU8VPNzJnCFamv5RhD/6qh00aiIc9nvd2CcUN6e6KOXVy4D6T/H8bR/yxVU+h7UPayQmVVBHd3T
 ev58SX6nLy5AXLLHdmYZrTcqMD9bCY8tNqmjI5oPbxlMWlPMHcZkmOFVlU9VwxGwO27hWolA9qJY8+
 +T7qV4FQztT7nQitU8NvX0o7paLgPp9mQjllg3E6seIBdmmCtTQvuq85sZwf8E/1y6tV9WDpSa8qRO
 tZBjeXNARTRgPzr0wGfMAh6IiKRkSt
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

When we configure the PLL record the input and output frequency, then if we
get asked to configure the same values again just skip reprogramming the
hardware. This makes things a bit easier to use for machine drivers since
it means they don't need to keep track of if they've programmed the PLL
so much.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/nau8822.c | 7 +++++++
 sound/soc/codecs/nau8822.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index 08f6c56dc387..f4f68b549e1a 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -726,6 +726,10 @@ static int nau8822_set_pll(struct snd_soc_dai *dai, int pll_id, int source,
 	struct nau8822_pll *pll_param = &nau8822->pll;
 	int ret, fs;
 
+	if (freq_in == pll_param->freq_in &&
+	    freq_out == pll_param->freq_out)
+		return 0;
+
 	fs = freq_out / 256;
 
 	ret = nau8822_calc_pll(freq_in, fs, pll_param);
@@ -762,6 +766,9 @@ static int nau8822_set_pll(struct snd_soc_dai *dai, int pll_id, int source,
 	snd_soc_component_update_bits(component,
 		NAU8822_REG_POWER_MANAGEMENT_1, NAU8822_PLL_EN_MASK, NAU8822_PLL_ON);
 
+	pll_param->freq_in = freq_in;
+	pll_param->freq_out = freq_out;
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/nau8822.h b/sound/soc/codecs/nau8822.h
index b45d42c15de6..547ec057f853 100644
--- a/sound/soc/codecs/nau8822.h
+++ b/sound/soc/codecs/nau8822.h
@@ -198,6 +198,8 @@ struct nau8822_pll {
 	int mclk_scaler;
 	int pll_frac;
 	int pll_int;
+	int freq_in;
+	int freq_out;
 };
 
 /* Codec Private Data */
-- 
2.30.2


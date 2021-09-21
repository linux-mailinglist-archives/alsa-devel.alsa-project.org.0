Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D887413BCF
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 22:54:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9380D15E2;
	Tue, 21 Sep 2021 22:53:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9380D15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632257675;
	bh=8DBkiOWm6wOCNpJNFJUT9zhhxnVozD5Xe2M0CFtyLmI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rqjiGUEouXQo2DPCI5tQOKc3OMVhVBmp1z2KNBsLGfM7/PXMXrXn3W9q29EsSW9Wc
	 0a6LCithWPyZbQMK3+gCPnbYmaDCxD6ZS2U2QTRyeai/k/b9zu3Ova5tVrFewDBDal
	 JzjsXK5ZnenVSQxR1cSRaI6kcDbNfj/273WmwOZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A4BBF80124;
	Tue, 21 Sep 2021 22:53:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E558EF80268; Tue, 21 Sep 2021 22:53:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3797F80124
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 22:53:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3797F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oDOKLZF5"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D48661002;
 Tue, 21 Sep 2021 20:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632257588;
 bh=8DBkiOWm6wOCNpJNFJUT9zhhxnVozD5Xe2M0CFtyLmI=;
 h=From:To:Cc:Subject:Date:From;
 b=oDOKLZF5g17zTaSBEfRfsWkGwkX9Qsw3xGyaFi4c+pn29sf/EfMihljOSd21EkDiZ
 ZUN6xVS0+ZSePuAZEN5L/5z+iRM16sWafXlRz985UnB3O70yMaYlPAK0Ko4GKnRkAr
 caAKwyDYXOpXRg/yGZaXc/L0qa43PkhIjDO/21GO3hUNg7eAxcixFnUnqLtJp5eNRH
 r12UI5kIzuiwh482yrA+qAOdfa9KzCCBcwMfdDSvDCwPZWArkfMJaanxQXmu+bKooP
 uqc3brzQPhDA8lyNfX0d2AY4K3vzBegABdeip9HCEVb9TpSz+C+QkkcMVP3UFzkGJU
 DrrPDKWwP9zCA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: zl38060: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 21:51:17 +0100
Message-Id: <20210921205117.4393-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=933; h=from:subject;
 bh=8DBkiOWm6wOCNpJNFJUT9zhhxnVozD5Xe2M0CFtyLmI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSkWlEanQx32ybBvVLT/iZ1ivxreTtFPGANVV4OJ9
 yDx7KtSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpFpQAKCRAk1otyXVSH0JWCB/
 0dRiISA08QKV90pwLC4u0rkg9HVjw96QuKg5WKy+SotH6oPl2O8rQOeMR1+WEyNAOUt6cN13SWNtvh
 xdEJu+L1XJsdrpEcJ3hj1cq52rTQ3DkRJ5Ofv2izeTeh7nEfsokN1U+1rOwoLEwKaVrakIWxf1yyz4
 0Q+cOyDy61dCN8+kh5/dtlje1EEbvTKT4aRMHbGtTlb8kENVtnwM/JIFql1HrGFtFbmlF4C1emGQHv
 kh/chk9Nr+y2mInF8Ofe85IMsPJE6GhUpO+GruJMPVnq70FUQIHq1VrVxE4h0PSUQUTPX6iMg5bTr/
 LyIq4MQcyJvOqT63b7OVx31OJY9aDI
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
the zl38060 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/zl38060.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/zl38060.c b/sound/soc/codecs/zl38060.c
index d21a72314d37..d20ec1571010 100644
--- a/sound/soc/codecs/zl38060.c
+++ b/sound/soc/codecs/zl38060.c
@@ -250,8 +250,8 @@ static int zl38_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		/* always 32 bits per frame (= 16 bits/channel, 2 channels) */
 		err = regmap_update_bits(priv->regmap, REG_TDMA_CFG_CLK,
 					 CFG_CLK_MASTER | CFG_CLK_PCLK_MASK,
-- 
2.20.1


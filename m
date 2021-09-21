Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A545413C2B
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 23:15:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04EF3169E;
	Tue, 21 Sep 2021 23:14:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04EF3169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632258939;
	bh=7aZeUplfK5FIw57TTz+BqraFodfiICmaUpVRsJfChZE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WXUtN1c6pZnUwX2CTCxyKnyZE5gATIg/LRhffpB8c0jz0LTta57iFoSjoz6DJ2o8e
	 WHnMh8mJbM00avQZI7mXTNgfIj2OvNMhAHieAGKBrcuD2FAOxFCeWOjPxtCSY/qeUB
	 IpHeITszTKrNeabaFJUt0NfjtBK6tZ81JgPq5XmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDD0AF8051D;
	Tue, 21 Sep 2021 23:12:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24EA3F804E5; Tue, 21 Sep 2021 23:11:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BA13F804F1
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 23:11:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BA13F804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WQbRVDe4"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B61B61186;
 Tue, 21 Sep 2021 21:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632258706;
 bh=7aZeUplfK5FIw57TTz+BqraFodfiICmaUpVRsJfChZE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WQbRVDe4WvqDZA4ffxruKWJglpyB6dcfnWG0XGgZyC1HgUunTwpfzYybyW/aSoo5J
 SVCukBxp4U96twUUGaYNQbEcSx6yjMM20tveE7OgQjWzpXMUT5NKwhjsF9Si7pPb8h
 v1jej0+PstTomnQgmC/fk82pisHMxU8BcLAgnauv9BRbu5kUgn5o9e7PnGbBwcTWzl
 BAbM9wulk2D4XS1wTj9RSMFqAvUOcBvAPs1AaKlk64noAkYwqS9HvmCZ3c522HRAPQ
 CWSDYflhh3C5l52OprCS87X+BW/j4DxKPkJulPAa0494lnfTPbzYYpBLNj+8xxKipc
 gXIbrU/h4nDFg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH 09/16] ASoC: imx-card: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:10:33 +0100
Message-Id: <20210921211040.11624-9-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921211040.11624-1-broonie@kernel.org>
References: <20210921211040.11624-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=755; h=from:subject;
 bh=7aZeUplfK5FIw57TTz+BqraFodfiICmaUpVRsJfChZE=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhkQvz0fPdU2bGeb66oX2Zk5MffO3LNb/lqzrToemOqMST06R
 8kOdjMYsDIxcDLJiiixrn2WsSg+X2Dr/0fxXMINYmUCmMHBxCsBEhMPZ/4p9XvysPDHv8AvFdLVua5
 ODSx+2u8jJGcg/S1jx8kxN0QknX964Kcyn5QvMf60x/6x10XvSbf4VPa9nXJFgeGx5yFd84/RnXyqD
 7fysd/N9fV36b+7asHkHuJfF6NmfXFue/UTg5+xKg5wVWy0PWHZcq9XZ6G1b/Ki9e0lf5pkSUyP+C6
 zlp86/qlsWvXBqzP5dk1623lWPMD++5m9mll96nlS7whnnr3EcS+u2f18ksIEtilNUxGKSxDpV1sQH
 Ml5ci4KuPhOKSs3nVONqC9AtXFD2UD8oy8m9Z5nurW1vBSe43Y25Lxd7z8yk1nLX+f4DTCzTk5sWZM
 VotMt2l1b0KPyIu3btytKZ3Q+sAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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
the imx-card driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/imx-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 58fd0639a069..e9fe3fc2f261 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -652,7 +652,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 					       NULL, &link->dai_fmt);
 		if (ret)
 			link->dai_fmt = SND_SOC_DAIFMT_NB_NF |
-					SND_SOC_DAIFMT_CBS_CFS |
+					SND_SOC_DAIFMT_CBC_CFC |
 					SND_SOC_DAIFMT_I2S;
 
 		/* Get tdm slot */
-- 
2.20.1


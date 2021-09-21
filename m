Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C574B413C9C
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 23:38:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6187B1693;
	Tue, 21 Sep 2021 23:37:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6187B1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632260313;
	bh=P9Ovn67dgqfY8uXNhC7cS74K5PnBw7legwEUgP0ObyU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TwAfU8S1ciiP1I6XquOhtKFNr47tafeYGaH4MhKO7JZGsHPXeEiJJDdNyQPOle7Sr
	 DVc+6nr0nb5rKiORdKkZYerHH+sx0lb1ND0I8/0J2ynBN7iPpKCl6GQtskSXBnI/Pw
	 jhPTeA2Eh6vWRzPf9XdGv3GaXv8O9ScgyxEIbGGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38B25F804C1;
	Tue, 21 Sep 2021 23:36:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3300AF804BD; Tue, 21 Sep 2021 23:36:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69B22F80124
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 23:36:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69B22F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BM+WZmOt"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB6FB61019;
 Tue, 21 Sep 2021 21:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632260210;
 bh=P9Ovn67dgqfY8uXNhC7cS74K5PnBw7legwEUgP0ObyU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BM+WZmOt5xnz2Os+TA8gO7xWletdWiABtmeL17sjiVUSjF1MjAVgUj2o9w2MZflMy
 khgJ/G1Ywn4tC0Dh9Wv+WM0QFKiU6HCYQRmCGa6TmjccbSBRjWqqZt7CfKbRuHasEs
 1g9EZZrSZPA/Z+pL4J9QRc+T2zjv0AQFuYXn1QQ1iccY8DbYJGm+lA8R0/9EYU4DNB
 +MqRSSpT4wmhBTZSW+TkbmSaUcs8pcXb/A6O23BfLVaSNQ4K1fXzTyvkwqCMnx6EBo
 lkgIpJSGDeYjZtUv8kiatOU0O3zRPxWOkQTOrjBrKroGEVg+TnsmOuuXgAh2bI7bL1
 bGtwUXpkXK7eQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH v2 03/16] ASoC: fsl-audmix: Update to modern clocking
 terminology
Date: Tue, 21 Sep 2021 22:35:29 +0100
Message-Id: <20210921213542.31688-3-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921213542.31688-1-broonie@kernel.org>
References: <20210921213542.31688-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028; h=from:subject;
 bh=P9Ovn67dgqfY8uXNhC7cS74K5PnBw7legwEUgP0ObyU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSk8U/VULECrfRVtYmjLkQHqSef5Im/jvNVDsuT2f
 q6fnzNeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpPFAAKCRAk1otyXVSH0Ip9B/
 40JcBPo/Iy2pwoa3fgS1cUud4yUnNFMtNvn9E4E2JgzGOFo3JpjVs+4QU8XHWopOpdu6sWEZgozuHY
 AGGSSrAE4KXO87agaRGQZPo+ZentL9kWFleAvPcZbg2TlpJoPKucYqTaiOKbF7zKZJjnrzK0E1f+ZQ
 t4kkOO7nzVZIlRGt4D4qkjxu5QH353zqqN5+Kd51flzKn+cjFeCS9g27HGgCLhAcQPzePyXajYoz9q
 11XbZSAkEAyLnyZh1RaWUqnDIxbZ5Hw5KXEWajZl6RDu7YUdk/Ga1yM6FIZa41k2jGMJRk8Q7zchnn
 vboXrJ+TzwzPjknVnejDk5hEkc1lSK
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
the fsl-audmix driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_audmix.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index f931288e256c..6dbb8c99f626 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -257,10 +257,10 @@ static int fsl_audmix_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	/* For playback the AUDMIX is slave, and for record is master */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-	case SND_SOC_DAIFMT_CBS_CFS:
+	/* For playback the AUDMIX is consumer, and for record is provider */
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.20.1


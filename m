Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5BC413C2E
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 23:16:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBA031696;
	Tue, 21 Sep 2021 23:15:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBA031696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632258975;
	bh=ZYj9NVMXeaIG3c9cdYAHfhF0zFKiS0Xyjbv1Scqzlvo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nyQo4nHP/Edp9QmIIQb8vx3BwlYDVoZzw8gTc0XkXugXxYPXb94FIDPFg3MGHd32F
	 t+/pDJx4vr6V+Iucoq9u4jxLZZm3Am4vaXY3RyF89WC790vVeyEUmsi1mIY/DvI/Iq
	 c515Bo5YGREs9HsIoge+1dOKHhbVNyAQgFuTtnOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E554F80525;
	Tue, 21 Sep 2021 23:12:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA1C9F80510; Tue, 21 Sep 2021 23:11:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E7E2F80508
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 23:11:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E7E2F80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Mr0Guyef"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F5E561183;
 Tue, 21 Sep 2021 21:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632258712;
 bh=ZYj9NVMXeaIG3c9cdYAHfhF0zFKiS0Xyjbv1Scqzlvo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Mr0GuyefhvVeR0nM8SDDyk4j159FtxaSTcHgqy1M4EDxjYhWtE+5Bs47ooBDhfnbV
 7LjvmK+ro766qUGNErxhYcg62nEOIa+vt1jxMldHIFjT9VigTmMwPQyD0l1sNp/We0
 15r+Jef08ki9QMUtmJnuG8ynU9NtF52iVX8p4z64T2CA0iu6G2ehjf8sQj8d68TMvx
 cbUGVU5YAkaZdAugEudmqO/kglPId6ji6SzEltQ4IbUgQL+pfEOF7U0bsZCncDfQIe
 /aJpVs5r422fu9gBQntTIy2NtJ/06NPcYnQQH50Z6yYiC9t5hMmMI27HL/HqSG+CBy
 te4tW+OVitLjA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH 11/16] ASoC: imx-hdmi: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:10:35 +0100
Message-Id: <20210921211040.11624-11-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921211040.11624-1-broonie@kernel.org>
References: <20210921211040.11624-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089; h=from:subject;
 bh=ZYj9NVMXeaIG3c9cdYAHfhF0zFKiS0Xyjbv1Scqzlvo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSknjtcMsmrJyiDMZhALEfCUW3kcme+k7rrv2Ads1
 L4E5sfqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpJ4wAKCRAk1otyXVSH0O9iB/
 9pRzQxjZIl3Fc/XKPL64rTxsLnj3IYHpU9Q0CsfSx1HxH+0qkGfXnIbmMBfDYzzle6NYJUqQ3Q5tZj
 g4CN92av9QbHJaGCqx2Aior8veJkxcTsnCIQeyxBbR8F4bf6V7z/wAVKh2WUPCqiCproI5tdwI0pCH
 /8fHRv94b7Ft9Xm8wZZTJhOT0G1EUzSlrar9thdh11xpnUY+VfHK3SjjfaC0QU2amIElZXIHI2bfEw
 FNQEugAPmY8eqVYYEfrIam60yiqJ7j4QwM8ewqkInYdAZmui1asHk+nlmB/LFH+kDqw5uXVhg0VqOG
 Qm6bP2TDDCbTh5eeVd4BZH7NZq5H4T
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
the imx-hdmi driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/imx-hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index 34a0dceae621..c15e930fa2a6 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -171,7 +171,7 @@ static int imx_hdmi_probe(struct platform_device *pdev)
 		data->dai.codecs->name = "hdmi-audio-codec.1";
 		data->dai.dai_fmt = data->dai_fmt |
 				    SND_SOC_DAIFMT_NB_NF |
-				    SND_SOC_DAIFMT_CBS_CFS;
+				    SND_SOC_DAIFMT_CBC_CFC;
 	}
 
 	if (hdmi_in) {
@@ -181,7 +181,7 @@ static int imx_hdmi_probe(struct platform_device *pdev)
 		data->dai.codecs->name = "hdmi-audio-codec.2";
 		data->dai.dai_fmt = data->dai_fmt |
 				    SND_SOC_DAIFMT_NB_NF |
-				    SND_SOC_DAIFMT_CBM_CFM;
+				    SND_SOC_DAIFMT_CBP_CFP;
 	}
 
 	data->card.dapm_widgets = imx_hdmi_widgets;
-- 
2.20.1


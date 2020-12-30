Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AEA2E7A94
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Dec 2020 16:45:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF2F3184B;
	Wed, 30 Dec 2020 16:45:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF2F3184B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609343150;
	bh=B6KEEyF4RQKJhn/Tlgm2gPhwOX1a1c48tzMAbskoqNY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qGSj+vNcrTeHiUxAJVG4PScJ1wISrcOJWUjpdrPZLhzQYfw6Z71BeFZ2AH78egmia
	 HSWly1OaedPz02BhS1y/PySEY0Kn6iCr1KeGgu/IkjYOTZLbtNUXSlHtxqhYNTZjNc
	 LiCvef+0QwqflnRlCCNbbGTaqg8meg6M+Nlmq6NI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15538F80141;
	Wed, 30 Dec 2020 16:45:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE850F8020B; Wed, 30 Dec 2020 16:44:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 818FBF80141
 for <alsa-devel@alsa-project.org>; Wed, 30 Dec 2020 16:44:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 818FBF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HCKeDJ0K"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 413BD20725;
 Wed, 30 Dec 2020 15:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609343088;
 bh=B6KEEyF4RQKJhn/Tlgm2gPhwOX1a1c48tzMAbskoqNY=;
 h=From:To:Cc:Subject:Date:From;
 b=HCKeDJ0KSZ7nc1CoEISb/ZRNzccPTaWWh06Nn2VIZBsId6eP9cn0oGFUJlOABZZZO
 iI0X3/jv9pxyQ5bU7W/XqVpiwAVKTetRviaE1CBU80GpLg/jmLlz66OeoO4ZhibBqQ
 PjjjdalMW1Zz2BoWMBZ8kelnigjz4DMVLkz9RLZvfhx2BBPns1SB0TRK+cYujQxlOH
 8MnDwDJqOqRtqV2yMQCPacw1DfF9pBrJ/RhsJA8R+VJ3BdV7xvpCIPfiT77gwd3boZ
 PiTBMWGGCaRfDf7RBRjRMAgbFOqHd28vArCHhJoja2QAirqWZnxT1vUTZKPDO8Anij
 h3IyOvDVmuzrg==
From: Arnd Bergmann <arnd@kernel.org>
To: Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: fsl: fix -Wmaybe-uninitialized warning
Date: Wed, 30 Dec 2020 16:44:15 +0100
Message-Id: <20201230154443.656997-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Takashi Iwai <tiwai@suse.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>, clang-built-linux@googlegroups.com,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Nathan Chancellor <natechancellor@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, linux-arm-kernel@lists.infradead.org
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

From: Arnd Bergmann <arnd@arndb.de>

Clang points out a code path that returns an undefined value
in an error case:

sound/soc/fsl/imx-hdmi.c:165:6: error: variable 'ret' is used uninitialized whenever 'if' condition is true [-Werror,-Wsom
etimes-uninitialized]
        if ((hdmi_out && hdmi_in) || (!hdmi_out && !hdmi_in)) {
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/fsl/imx-hdmi.c:212:9: note: uninitialized use occurs here
        return ret;

The driver returns -EINVAL for other broken DT properties, so do
it the same way here.

Fixes: 6a5f850aa83a ("ASoC: fsl: Add imx-hdmi machine driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/fsl/imx-hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index 2c2a76a71940..ede4a9ad1054 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -164,6 +164,7 @@ static int imx_hdmi_probe(struct platform_device *pdev)
 
 	if ((hdmi_out && hdmi_in) || (!hdmi_out && !hdmi_in)) {
 		dev_err(&pdev->dev, "Invalid HDMI DAI link\n");
+		ret = -EINVAL;
 		goto fail;
 	}
 
-- 
2.29.2


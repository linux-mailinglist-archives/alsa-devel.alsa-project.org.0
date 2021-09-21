Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42989413C35
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 23:17:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D68311664;
	Tue, 21 Sep 2021 23:16:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D68311664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632259041;
	bh=9kvioNqkIrsS8HBoj2GlyRdysXDxOgoRAuVJFCeoBUo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vY6NVkGreow5iqixZGkBl0vvSwqw/JLhhssVNI8asK0AdU4ILnqoXbR6vKdtNbRSD
	 PASI+BVd3HuTHthImikU63XtrtH4OTSmMK51iepK9kUSfSQexhptNo6erRYqQvpb10
	 pR9kLH5oH1g9el6hTg4WzIHFcE3EwPsEST3+X+Kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76469F8053E;
	Tue, 21 Sep 2021 23:12:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0C13F8053D; Tue, 21 Sep 2021 23:12:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01E33F8053A
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 23:12:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01E33F8053A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WPw3Keic"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C5F461183;
 Tue, 21 Sep 2021 21:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632258725;
 bh=9kvioNqkIrsS8HBoj2GlyRdysXDxOgoRAuVJFCeoBUo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WPw3Keicx/StpuJlgsVRUIJ3NBGqv79ilvarBKprCu4aQnxZHRvO9uX5h4hWF84OV
 WYaZQQZIFtsfpUEXvoMbchL4i04fTMfp6+bb3QdCW/x9cgag11vqJQPhxiEqppLpNq
 1E75jCj5dxnDW+YR3wD/kVZa+CAaf4H1uuVZl4xsQJ23XPxYx6Uiq7kPNso8ueHpCf
 ypi0EV40iFgMLF1pn8ItgYJATkQv5OwV93+jEhhT57zcUG8ud2yKERWboU67GY+7DA
 YyjZfO6IyxzSn8uDauvhHi82c9pHTCFdkObHmcrWJrme63JgdfehFmOdxZirNSVtI8
 zzgrklEjf9njg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH 16/16] ASoC: pl1022_rdk: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:10:40 +0100
Message-Id: <20210921211040.11624-16-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921211040.11624-1-broonie@kernel.org>
References: <20210921211040.11624-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=845; h=from:subject;
 bh=9kvioNqkIrsS8HBoj2GlyRdysXDxOgoRAuVJFCeoBUo=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhkQvz+fzJiz+8G4yz8z3wT4qpw/5756dzCET0Tgpv2e/4fV9
 Vx5kdjIaszAwcjHIiimyrH2WsSo9XGLr/EfzX8EMYmUCmcLAxSkAE9HKZf+nei/3FOehZZfurE7rj2
 yaEbR45RUGY4tE8w9z01p+93ktEom584Z//oo/1ffzBbQ8daeZ2cxwLXRqcFuremvhKV0PuZb4dZX5
 qWyVk+9dPKDSah/+snj7Ite/Pi3fko81JOyP5FNqSDq4/3KdWL861z+lA7XVJjUX+YQKXzROnegrdn
 uyxXnj4kylrccS9FZml8vO3cTndVzfty+w0XJ797/bqebLr2lKzLRQqNeXYIwK+eS6Ii8t/jBjUZNj
 kNDrRT4l7ov2rWfefsH3V4oGd81Fsf4k0b6IqIO25vezAnmLWBVNf27xPZ7PPPe/2qYvU6x0el9VcU
 axHnK9UiCRrxX+ZeZTp/abPCfqAA==
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
the pl1022_rdk driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/p1022_rdk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/p1022_rdk.c b/sound/soc/fsl/p1022_rdk.c
index 714515b8081f..b395adabe823 100644
--- a/sound/soc/fsl/p1022_rdk.c
+++ b/sound/soc/fsl/p1022_rdk.c
@@ -265,7 +265,7 @@ static int p1022_rdk_probe(struct platform_device *pdev)
 	 * only one way to configure the SSI.
 	 */
 	mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
-		SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBM_CFM;
+		SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBP_CFP;
 	mdata->codec_clk_direction = SND_SOC_CLOCK_OUT;
 	mdata->cpu_clk_direction = SND_SOC_CLOCK_IN;
 
-- 
2.20.1


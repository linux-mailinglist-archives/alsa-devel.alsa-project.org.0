Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF07D413C31
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 23:16:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7381816AB;
	Tue, 21 Sep 2021 23:15:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7381816AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632259001;
	bh=ndW6JLnsPPrjKQ932C1Mn3KiDfrgW/GYFDGEKcx9/Y0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vN4V6N5YigoWJeH7cU5lJzM6AynSCaiOWAEchc4gWRCleN2lrx9sONlm6iu02HtsS
	 nJY315UJJ0hLpfbhgqiSCNNQhQuFADh0pAb91VTsTgJb9psSRkNj0wqW8YgV/gV5pa
	 gNuxjWhlQznyd8/Br9pTU3/8aQNgzJHFqCRmhK7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBAC9F80535;
	Tue, 21 Sep 2021 23:12:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0543F80519; Tue, 21 Sep 2021 23:11:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5065F804F1
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 23:11:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5065F804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a5jWUBXq"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DD9A61186;
 Tue, 21 Sep 2021 21:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632258714;
 bh=ndW6JLnsPPrjKQ932C1Mn3KiDfrgW/GYFDGEKcx9/Y0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a5jWUBXqC9WxdOcxxjue14bmoy5Xc0CTINOhUgGqNsuODMkeJdWYg1gm+hUpwOnLV
 J4pmDT5CfL2X1HHKJOlv40s01GiBg/R3ncDlPqe9XJzMdUzGbC8VUDKG243p0YDusf
 rLOgfpTelQFEImdLcTjaCc44M2Zi/P1gIBNWBWCexgLieEE2vuZhMabmiTBimw2K99
 OuTQxA5KcwMtJP/v5RIwCxM3p39jmb1t/fpyQEa6jPJocQ8ks0i/q303jlKYSgivM/
 3kprg0DL31SsZVdfWsbsW0+Olnx/3zaJaydHVG5HWXz6E10onVcqLIu7tguh5QEKW5
 meQfl0hHjZIEw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH 12/16] ASoC: imx-rpmsg: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:10:36 +0100
Message-Id: <20210921211040.11624-12-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921211040.11624-1-broonie@kernel.org>
References: <20210921211040.11624-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=838; h=from:subject;
 bh=ndW6JLnsPPrjKQ932C1Mn3KiDfrgW/GYFDGEKcx9/Y0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSknkc4E4mSomofqAFk5UnxTqcP6GbNg1W968mi1x
 ptA+SNaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpJ5AAKCRAk1otyXVSH0DKfB/
 93vQb4IRMFzXxh39ImutnDkNxQyHEOYLvxmd9+SKxYUVsLHeE9KFcQTeP71xChfKHG134+eT0FFbEA
 cgEYksdQu6SHBbYAzdphmll9Jzx/M63RuaQihvhOTGWUzDPWXB9J3WHHFsWrv2zZkLqbX7vk/O4+F9
 dkT4xTc2Zy356cBviQD3SZxIDVVyTXS5qr3+0fCT6YWkj/tTAZzBJVe8lcrRLxPRPayd4RFcQdOKt/
 GpDPjGGXXSfQDK+WzDhUyJLzCWkjCqNyuS+0XuAdBiSDIgMItD+8BiOUBvE8ceh6YL7mhXfT32/Edt
 gqhsRLP2OoaQFm7PnYCa4dEZlTGZQL
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
the imx-rpmsg driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/imx-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index f96fe4ff8425..2e117311e582 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -64,7 +64,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	data->dai.stream_name = "rpmsg hifi";
 	data->dai.dai_fmt = SND_SOC_DAIFMT_I2S |
 			    SND_SOC_DAIFMT_NB_NF |
-			    SND_SOC_DAIFMT_CBS_CFS;
+			    SND_SOC_DAIFMT_CBC_CFC;
 
 	/* Optional codec node */
 	ret = of_parse_phandle_with_fixed_args(np, "audio-codec", 0, 0, &args);
-- 
2.20.1


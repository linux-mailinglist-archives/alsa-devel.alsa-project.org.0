Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72029413CBE
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 23:41:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F6F816BC;
	Tue, 21 Sep 2021 23:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F6F816BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632260498;
	bh=ZYj9NVMXeaIG3c9cdYAHfhF0zFKiS0Xyjbv1Scqzlvo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SEK8hbsHFBYEPZGHGSoIKBGLuXwTYN8zmehMwW/hlzmWsgAl0XDGOTNQtzrTJT5kr
	 7mpchepFBnPbr3yarCJaHg6FaAO2cWxQwNQdWr2U6yFLFL5zRnPADoS6kRXueeZM1t
	 d4dmu2rIxI+0Xv7OcqEeUE/FRa09QhO5njUXD8N8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EC32F80535;
	Tue, 21 Sep 2021 23:37:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FC0CF80533; Tue, 21 Sep 2021 23:37:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11717F8051C
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 23:37:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11717F8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lUL1fePJ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D21CB61019;
 Tue, 21 Sep 2021 21:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632260233;
 bh=ZYj9NVMXeaIG3c9cdYAHfhF0zFKiS0Xyjbv1Scqzlvo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lUL1fePJJ+l08vQDTaLC1nDCkhxxrcg8XCtJj5sVOVslxJah25CFI6aMuUaBFC43P
 Ldxgim6k/nh6ltEAs46dd8bG4lkrhqT67vjlTz7vGNYS70lJqqzD2AJ7h4PcFPYp1e
 WSdobh33AuDg/r6GCBCzPUrRLSzwVULmj9P4FtovVTkXiDIawyQ6J6TbEe0XYbmJ/b
 a7bkJeN7SwwrNlfqw0JbHfN7QMGOemdgXV8tTWCvU/a+jxUHWZWna+QJyiROseKGcx
 UQ22iaNFQCqw7R0wiv7lfTBBaLnv+jpL4F8rOSQWIJbn9rOrkLGoEtp/CQn+Rk3T3I
 TUI2t8gooOrbA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH v2 11/16] ASoC: imx-hdmi: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:35:37 +0100
Message-Id: <20210921213542.31688-11-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921213542.31688-1-broonie@kernel.org>
References: <20210921213542.31688-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089; h=from:subject;
 bh=ZYj9NVMXeaIG3c9cdYAHfhF0zFKiS0Xyjbv1Scqzlvo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSk8btcMsmrJyiDMZhALEfCUW3kcme+k7rrv2Ads1
 L4E5sfqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpPGwAKCRAk1otyXVSH0K3rCA
 CF0PPF9QARqyJn6B3T39jzKQ7AUYqRw/DFiEP/ns5fMFYsLGfr9ntuS2r1qJt3MxXF5oGGGM1s6u3Q
 lkd19J2wZwZEPEsCbMTaHEnC2rykOsvX1YcqUQd3Wu2hD9OtEvNjm4KoEHeaS8fVvuas9sRzTBVaQv
 IUWhj9HCgSU+oxO4lZeI4CdzgFDSiS3p44UbNMA1WIxrhkNTadelvdnK9l8vdylp7o0gXDvz8IroYv
 BGX7lr7GoHMWCGc6qsjWW8RGaup3XP5JscbR5b/9BlKAyNCNM21T0IOg1LzSeGUrABKHT6E4mmzk88
 Qby6ZGCcCRGQQg6/lRhF3BxmBNjs5T
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


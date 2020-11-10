Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 362392ACCCE
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 04:57:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D021116CE;
	Tue, 10 Nov 2020 04:56:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D021116CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604980652;
	bh=FMWQJ4lahrISE8QnBwTCGxGSH1tt32tcmINfITuIt2U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s+aABy5d93WjvzXOWzIhMG/4E7Nv32OTQ6Xu1fAzM3P+n+b/EVsbk1VQNqfeyZd+2
	 jJVbi/yQ1+C7iXMg/TDS4874GJgi581tOhwrF9d09firXGfUg9oKnsdGxSvtSi/4uq
	 ajiTl8TxJJ+lvyV7pZyqjU+ERJaUooz4zwkfs3HE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DD86F804ED;
	Tue, 10 Nov 2020 04:54:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2205F804ED; Tue, 10 Nov 2020 04:54:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA0DCF800AE
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 04:54:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA0DCF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tLjVUw2O"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0CA8E20870;
 Tue, 10 Nov 2020 03:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604980482;
 bh=FMWQJ4lahrISE8QnBwTCGxGSH1tt32tcmINfITuIt2U=;
 h=From:To:Cc:Subject:Date:From;
 b=tLjVUw2O+c1BI1bVuCukj8TwdYg6rS5w1EEQs8e2FXveb/gLjTHHazvrywdyTi33d
 eAqTQRHMHm1XypJF+g+vFZQWcTzjxCGD6moPMoIGwjnYsl+ylBhoXhDFOp5O7CdFip
 /8ohMMaN+hZXCKbFVrII1eW9OmKpYA4O5O171aNM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 01/42] ASoC: qcom: sdm845: set driver name
 correctly
Date: Mon,  9 Nov 2020 22:53:59 -0500
Message-Id: <20201110035440.424258-1-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

[ Upstream commit 3f48b6eba15ea342ef4cb420b580f5ed6605669f ]

With the current state of code, we would endup with something like
below in /proc/asound/cards for 2 machines based on this driver.

Machine 1:
 0 [DB845c            ]: DB845c - DB845c
                       DB845c
Machine 2:
 0 [LenovoYOGAC6301]: Lenovo-YOGA-C63 - Lenovo-YOGA-C630-13Q50
                     LENOVO-81JL-LenovoYOGAC630_13Q50-LNVNB161216

This is not very UCM friendly both w.r.t to common up configs and
card identification, and UCM2 became totally not usefull with just
one ucm sdm845.conf for two machines which have different setups
w.r.t HDMI and other dais.

Reasons for such thing is partly because Qualcomm machine drivers never
cared to set driver_name.

This patch sets up driver name for the this driver to sort out the
UCM integration issues!

after this patch contents of /proc/asound/cards:

Machine 1:
 0 [DB845c         ]: sdm845 - DB845c
                      DB845c
Machine 2:
 0 [LenovoYOGAC6301]: sdm845 - Lenovo-YOGA-C630-13Q50
                     LENOVO-81JL-LenovoYOGAC630_13Q50-LNVNB161216

with this its possible to align with what UCM2 expects and we can have
sdm845/DB845.conf
sdm845/LENOVO-81JL-LenovoYOGAC630_13Q50-LNVNB161216.conf
... for board variants. This should scale much better!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20201023095849.22894-1-srinivas.kandagatla@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/qcom/sdm845.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 7e6c41e63d8e1..23e1de61e92e4 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -16,6 +16,7 @@
 #include "qdsp6/q6afe.h"
 #include "../codecs/rt5663.h"
 
+#define DRIVER_NAME	"sdm845"
 #define DEFAULT_SAMPLE_RATE_48K		48000
 #define DEFAULT_MCLK_RATE		24576000
 #define TDM_BCLK_RATE		6144000
@@ -407,6 +408,7 @@ static int sdm845_snd_platform_probe(struct platform_device *pdev)
 		goto data_alloc_fail;
 	}
 
+	card->driver_name = DRIVER_NAME;
 	card->dapm_widgets = sdm845_snd_widgets;
 	card->num_dapm_widgets = ARRAY_SIZE(sdm845_snd_widgets);
 	card->dev = dev;
-- 
2.27.0


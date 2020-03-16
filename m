Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC591862B9
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Mar 2020 03:39:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FEFF1882;
	Mon, 16 Mar 2020 03:38:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FEFF1882
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584326367;
	bh=HDWemFmS6sNHHvqLejbRyMAPEs6e+okEDrDeTOhqVWg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KnVUt6H+Li30xNnndtP0m1KZPKuIN6UOAiDX5yWBC6goMgEVmaZedwo1LIAh0DVn4
	 y0K409bHdc7h3T6YyIjpEfSZUrDOLWc6cBDC4oYgcsix2gGnFG86u8nAF9XOpgDqVK
	 /uJrR+sE7RIJ8y3okuk8NPfAIF4OjyO+MxNxsza0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36109F8022B;
	Mon, 16 Mar 2020 03:37:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F33FF801F9; Mon, 16 Mar 2020 03:35:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E6BAF801F9
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 03:33:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E6BAF801F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sWoGXueo"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E197E206BE;
 Mon, 16 Mar 2020 02:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584326034;
 bh=HDWemFmS6sNHHvqLejbRyMAPEs6e+okEDrDeTOhqVWg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sWoGXueoh9RRb9ZfMtqEouGMFCL9su9O4nrtnMEYxzO7hijuqz8FKpnxfH81EoccB
 w/SNJcnkP5oPSyAJvIzeTlxsAd3g+Z3e1n6OkGEfDXHk+kfY3HNI/UZ4zro6+n3Rby
 iVX22a/EeVg6vnFjla588hMJKfoFrL74BAX8xMg8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 29/41] ASoC: stm32: sai: manage rebind issue
Date: Sun, 15 Mar 2020 22:33:07 -0400
Message-Id: <20200316023319.749-29-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316023319.749-1-sashal@kernel.org>
References: <20200316023319.749-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Olivier Moysan <olivier.moysan@st.com>, Mark Brown <broonie@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

From: Olivier Moysan <olivier.moysan@st.com>

[ Upstream commit 0d6defc7e0e437a9fd53622f7fd85740f38d5693 ]

The commit e894efef9ac7 ("ASoC: core: add support to card rebind")
allows to rebind the sound card after a rebind of one of its component.
With this commit, the sound card is actually rebound,
but may be no more functional. The following problems have been seen
with STM32 SAI driver.

1) DMA channel is not requested:

With the sound card rebind the simplified call sequence is:
stm32_sai_sub_probe
	snd_soc_register_component
		snd_soc_try_rebind_card
			snd_soc_instantiate_card
	devm_snd_dmaengine_pcm_register

The problem occurs because the pcm must be registered,
before snd_soc_instantiate_card() is called.

Modify SAI driver, to change the call sequence as follows:
stm32_sai_sub_probe
	devm_snd_dmaengine_pcm_register
	snd_soc_register_component
		snd_soc_try_rebind_card

2) DMA channel is not released:

dma_release_channel() is not called when
devm_dmaengine_pcm_release() is executed.
This occurs because SND_DMAENGINE_PCM_DRV_NAME component,
has already been released through devm_component_release().

devm_dmaengine_pcm_release() should be called before
devm_component_release() to avoid this problem.

Call snd_dmaengine_pcm_unregister() and snd_soc_unregister_component()
explicitly from SAI driver, to have the right sequence.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
Message-Id: <20200304102406.8093-1-olivier.moysan@st.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/stm/stm32_sai_sub.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 30bcd5d3a32a8..10eb4b8e8e7ee 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1543,20 +1543,20 @@ static int stm32_sai_sub_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_snd_soc_register_component(&pdev->dev, &stm32_component,
-					      &sai->cpu_dai_drv, 1);
+	ret = snd_dmaengine_pcm_register(&pdev->dev, conf, 0);
+	if (ret) {
+		dev_err(&pdev->dev, "Could not register pcm dma\n");
+		return ret;
+	}
+
+	ret = snd_soc_register_component(&pdev->dev, &stm32_component,
+					 &sai->cpu_dai_drv, 1);
 	if (ret)
 		return ret;
 
 	if (STM_SAI_PROTOCOL_IS_SPDIF(sai))
 		conf = &stm32_sai_pcm_config_spdif;
 
-	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, conf, 0);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not register pcm dma\n");
-		return ret;
-	}
-
 	return 0;
 }
 
@@ -1565,6 +1565,8 @@ static int stm32_sai_sub_remove(struct platform_device *pdev)
 	struct stm32_sai_sub_data *sai = dev_get_drvdata(&pdev->dev);
 
 	clk_unprepare(sai->pdata->pclk);
+	snd_dmaengine_pcm_unregister(&pdev->dev);
+	snd_soc_unregister_component(&pdev->dev);
 
 	return 0;
 }
-- 
2.20.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0FD57AB92
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 03:14:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E127C165D;
	Wed, 20 Jul 2022 03:13:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E127C165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658279648;
	bh=JRE4eCEHL7qHZzSMJ0Aj8TxGJBqLd3iO3wdnG87vjeU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SnGrHGaJ1vWhd5eWGTnKnU9LCh1G8bb8gtiypgKqkj7BoouipRdnKl0AH8KI2vVfO
	 1E3s7PfQeLus8E+UF11udn+TDgH0+Tp8oRRYDoWaMwaKXMpTgrW+0ZPwGkMHG+dC8Y
	 uVA8ab0wJ6fDk9IIUT1c/YjSgc0nTa8c09xqrqE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FA21F80125;
	Wed, 20 Jul 2022 03:13:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19813F8028B; Wed, 20 Jul 2022 03:13:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B16C9F80169
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 03:12:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B16C9F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bmuM9g4Y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 012C061756;
 Wed, 20 Jul 2022 01:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84030C341C6;
 Wed, 20 Jul 2022 01:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658279572;
 bh=JRE4eCEHL7qHZzSMJ0Aj8TxGJBqLd3iO3wdnG87vjeU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bmuM9g4Y6LS3qTW/btb5nmAf8ucPH6x8KnZr3M2nIULxRFJEkx8oKc3tFouLWZQH+
 L19tRFpQkBw5HCUgbcP02ypqI0mOaYnOtB5jeoOiFuhmuGWEVDSrzNOeF4m1eflgmg
 gUSrSqGobp4apMiLJyS2h2/JfBLDKi8nOz7xn4XA0gDT+9SpT2gHmtw1U4+P4qO+v3
 nffRa0g4l1yU6pPq2Y+MK1ZTgArl38VAEHjnXVs1/ZqvlxCIjYWathtyFEci5erPXp
 8JPj3j/+NZ0J14na31EmsJq872l3yi3oYaL3fDhDi6V5sfpR+7LjJ/5oQRd+LgC0CX
 7KCJoO055wroQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 36/54] ASoC: ti: omap-mcbsp: duplicate sysfs error
Date: Tue, 19 Jul 2022 21:10:13 -0400
Message-Id: <20220720011031.1023305-36-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720011031.1023305-1-sashal@kernel.org>
References: <20220720011031.1023305-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 David Owens <daowens01@gmail.com>, David Owens <dowens@precisionplanting.com>,
 tiwai@suse.com, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 linux-omap@vger.kernel.org, peter.ujfalusi@gmail.com, jarkko.nikula@bitmer.com
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

From: David Owens <daowens01@gmail.com>

[ Upstream commit f0d96937d31c4615a6418e4bed5cee50a952040e ]

Convert to managed versions of sysfs and clk allocation to simplify
unbinding and error handling in probe.  Managed sysfs node
creation specifically addresses the following error seen the second time
probe is attempted after sdma_pcm_platform_register() previously requsted
probe deferral:

sysfs: cannot create duplicate filename '/devices/platform/68000000.ocp/49022000.mcbsp/max_tx_thres'

Signed-off-by: David Owens <dowens@precisionplanting.com>
Link: https://lore.kernel.org/r/20220620183744.3176557-1-dowens@precisionplanting.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/ti/omap-mcbsp-priv.h |  2 --
 sound/soc/ti/omap-mcbsp-st.c   | 14 ++------------
 sound/soc/ti/omap-mcbsp.c      | 19 ++-----------------
 3 files changed, 4 insertions(+), 31 deletions(-)

diff --git a/sound/soc/ti/omap-mcbsp-priv.h b/sound/soc/ti/omap-mcbsp-priv.h
index 7865cda4bf0a..da519ea1f303 100644
--- a/sound/soc/ti/omap-mcbsp-priv.h
+++ b/sound/soc/ti/omap-mcbsp-priv.h
@@ -316,8 +316,6 @@ static inline int omap_mcbsp_read(struct omap_mcbsp *mcbsp, u16 reg,
 
 /* Sidetone specific API */
 int omap_mcbsp_st_init(struct platform_device *pdev);
-void omap_mcbsp_st_cleanup(struct platform_device *pdev);
-
 int omap_mcbsp_st_start(struct omap_mcbsp *mcbsp);
 int omap_mcbsp_st_stop(struct omap_mcbsp *mcbsp);
 
diff --git a/sound/soc/ti/omap-mcbsp-st.c b/sound/soc/ti/omap-mcbsp-st.c
index 0bc7d26c660a..7e8179cae92e 100644
--- a/sound/soc/ti/omap-mcbsp-st.c
+++ b/sound/soc/ti/omap-mcbsp-st.c
@@ -347,7 +347,7 @@ int omap_mcbsp_st_init(struct platform_device *pdev)
 	if (!st_data)
 		return -ENOMEM;
 
-	st_data->mcbsp_iclk = clk_get(mcbsp->dev, "ick");
+	st_data->mcbsp_iclk = devm_clk_get(mcbsp->dev, "ick");
 	if (IS_ERR(st_data->mcbsp_iclk)) {
 		dev_warn(mcbsp->dev,
 			 "Failed to get ick, sidetone might be broken\n");
@@ -359,7 +359,7 @@ int omap_mcbsp_st_init(struct platform_device *pdev)
 	if (!st_data->io_base_st)
 		return -ENOMEM;
 
-	ret = sysfs_create_group(&mcbsp->dev->kobj, &sidetone_attr_group);
+	ret = devm_device_add_group(mcbsp->dev, &sidetone_attr_group);
 	if (ret)
 		return ret;
 
@@ -368,16 +368,6 @@ int omap_mcbsp_st_init(struct platform_device *pdev)
 	return 0;
 }
 
-void omap_mcbsp_st_cleanup(struct platform_device *pdev)
-{
-	struct omap_mcbsp *mcbsp = platform_get_drvdata(pdev);
-
-	if (mcbsp->st_data) {
-		sysfs_remove_group(&mcbsp->dev->kobj, &sidetone_attr_group);
-		clk_put(mcbsp->st_data->mcbsp_iclk);
-	}
-}
-
 static int omap_mcbsp_st_info_volsw(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_info *uinfo)
 {
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 4479d74f0a45..9933b33c80ca 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -702,8 +702,7 @@ static int omap_mcbsp_init(struct platform_device *pdev)
 		mcbsp->max_tx_thres = max_thres(mcbsp) - 0x10;
 		mcbsp->max_rx_thres = max_thres(mcbsp) - 0x10;
 
-		ret = sysfs_create_group(&mcbsp->dev->kobj,
-					 &additional_attr_group);
+		ret = devm_device_add_group(mcbsp->dev, &additional_attr_group);
 		if (ret) {
 			dev_err(mcbsp->dev,
 				"Unable to create additional controls\n");
@@ -711,16 +710,7 @@ static int omap_mcbsp_init(struct platform_device *pdev)
 		}
 	}
 
-	ret = omap_mcbsp_st_init(pdev);
-	if (ret)
-		goto err_st;
-
-	return 0;
-
-err_st:
-	if (mcbsp->pdata->buffer_size)
-		sysfs_remove_group(&mcbsp->dev->kobj, &additional_attr_group);
-	return ret;
+	return omap_mcbsp_st_init(pdev);
 }
 
 /*
@@ -1431,11 +1421,6 @@ static int asoc_mcbsp_remove(struct platform_device *pdev)
 	if (cpu_latency_qos_request_active(&mcbsp->pm_qos_req))
 		cpu_latency_qos_remove_request(&mcbsp->pm_qos_req);
 
-	if (mcbsp->pdata->buffer_size)
-		sysfs_remove_group(&mcbsp->dev->kobj, &additional_attr_group);
-
-	omap_mcbsp_st_cleanup(pdev);
-
 	return 0;
 }
 
-- 
2.35.1


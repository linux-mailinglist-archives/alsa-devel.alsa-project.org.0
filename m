Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8957557AC1F
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 03:19:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DAAB177C;
	Wed, 20 Jul 2022 03:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DAAB177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658279984;
	bh=sjgCMzzlr0pgAEg0sZVpHJj8s3ynOX+/T3ir9+DuS+o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r7pg+ZNd7uMyAZK+xj+89eJDmOCKd5SMw1sxghHyyARFO+37XyjLpd1WUK7aDGspO
	 r7USVBVfiFxeK0TJ3LLrmFnycn+aaUKigL0LAzSY/1pApO1Zjcl3YWtOuBrcJUjSCM
	 Ti8TuGrqbCGCS2pgzYvv2VvdigjP38wx9W7SGQqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68215F80552;
	Wed, 20 Jul 2022 03:18:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DCEEF8055A; Wed, 20 Jul 2022 03:18:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03ECDF8028B
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 03:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03ECDF8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KDAVb+6A"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E0BC2617EC;
 Wed, 20 Jul 2022 01:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 052CAC341CA;
 Wed, 20 Jul 2022 01:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658279879;
 bh=sjgCMzzlr0pgAEg0sZVpHJj8s3ynOX+/T3ir9+DuS+o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KDAVb+6Alc/YosFC8CnRYpqkZelGLgCjDA6IK9ob914yEVXAM0VP3nezGcyZUKRgt
 rdGdSI18Xm3enwoYuRG3FHUjgBUqbhl6KpFdtHS2mJ3AzRN+KbnUnzL9PFRa9LBuwk
 1NAn2Ijqicg3Wj5Q1N+3bGTLu95G3sqlKGRKEZWHp8YU+r+36IFg0LuRZ+L9fsnaO9
 q1rtg0K5zYyLI1cCt3LCBA26bTIN3kEaaoHkXKocwr9YxbsqHuf0BPcq6Q1mdngaiP
 KMvTcZmOmNhMdAuQEZqQYFg1O74JBzJn5roXe60whk+sw1F7hHM3ZxEpqM0vzUZYmV
 MrzkLQBBl7nOA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 10/16] ASoC: ti: omap-mcbsp: duplicate sysfs error
Date: Tue, 19 Jul 2022 21:17:24 -0400
Message-Id: <20220720011730.1025099-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720011730.1025099-1-sashal@kernel.org>
References: <20220720011730.1025099-1-sashal@kernel.org>
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
index 1a3fe854e856..23dc35192e39 100644
--- a/sound/soc/ti/omap-mcbsp-st.c
+++ b/sound/soc/ti/omap-mcbsp-st.c
@@ -350,7 +350,7 @@ int omap_mcbsp_st_init(struct platform_device *pdev)
 	if (!st_data)
 		return -ENOMEM;
 
-	st_data->mcbsp_iclk = clk_get(mcbsp->dev, "ick");
+	st_data->mcbsp_iclk = devm_clk_get(mcbsp->dev, "ick");
 	if (IS_ERR(st_data->mcbsp_iclk)) {
 		dev_warn(mcbsp->dev,
 			 "Failed to get ick, sidetone might be broken\n");
@@ -362,7 +362,7 @@ int omap_mcbsp_st_init(struct platform_device *pdev)
 	if (!st_data->io_base_st)
 		return -ENOMEM;
 
-	ret = sysfs_create_group(&mcbsp->dev->kobj, &sidetone_attr_group);
+	ret = devm_device_add_group(mcbsp->dev, &sidetone_attr_group);
 	if (ret)
 		return ret;
 
@@ -371,16 +371,6 @@ int omap_mcbsp_st_init(struct platform_device *pdev)
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
index 3273b317fa3b..8f9d4a2c1d71 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -706,8 +706,7 @@ static int omap_mcbsp_init(struct platform_device *pdev)
 		mcbsp->max_tx_thres = max_thres(mcbsp) - 0x10;
 		mcbsp->max_rx_thres = max_thres(mcbsp) - 0x10;
 
-		ret = sysfs_create_group(&mcbsp->dev->kobj,
-					 &additional_attr_group);
+		ret = devm_device_add_group(mcbsp->dev, &additional_attr_group);
 		if (ret) {
 			dev_err(mcbsp->dev,
 				"Unable to create additional controls\n");
@@ -715,16 +714,7 @@ static int omap_mcbsp_init(struct platform_device *pdev)
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
@@ -1435,11 +1425,6 @@ static int asoc_mcbsp_remove(struct platform_device *pdev)
 	if (pm_qos_request_active(&mcbsp->pm_qos_req))
 		pm_qos_remove_request(&mcbsp->pm_qos_req);
 
-	if (mcbsp->pdata->buffer_size)
-		sysfs_remove_group(&mcbsp->dev->kobj, &additional_attr_group);
-
-	omap_mcbsp_st_cleanup(pdev);
-
 	return 0;
 }
 
-- 
2.35.1


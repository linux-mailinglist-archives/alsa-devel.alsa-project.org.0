Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2CDA1C84
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:16:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D34721667;
	Thu, 29 Aug 2019 16:15:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D34721667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567088179;
	bh=feiMEyG4fPZksa5Z1iFSc6wsdbom0ykdz97USpN/308=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=H7gw47PflZEz8w47qWUUMC1C60x/9cbIWlApnbIOKPQpTvT2l6u8HPYMQXyhjNpRf
	 eZL5WPClyn/mCdScMOuVDg4tuI+dUbw5f1kvwIYGi0LgnQzZa+IEdaTTNn3+4qO0Sh
	 VTUnk+UK3vjNsy1r9oZOrRmHXPq5VAsbKI7N12Tc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C5A9F80756;
	Tue, 27 Aug 2019 21:59:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC6B3F80713; Tue, 27 Aug 2019 21:58:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2871DF806E7
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 21:58:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2871DF806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="rdUvuQAD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=SMpBfeT+YDhqJweugt2P+5XqpdoS58HJr3ntKvBbvys=; b=rdUvuQADUu8y
 YOUw8UIHoHFn8G2ft08JGELR9nsT16JBO8VGYyLpIUStf/q0X/H21ClcULYngx2hGb+8jVoGC+RFn
 YzC1KXA+TSxiH/nsO03vywzrxuMpm8PSdtBN5MqgdlK4GASE0/MZMDch0UJzjd55bY/Mjz0rvcqWd
 cWm0E=;
Received: from 188.28.18.107.threembb.co.uk ([188.28.18.107]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i2hbc-0001Cs-1g; Tue, 27 Aug 2019 19:58:16 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id A25CFD02CE9; Tue, 27 Aug 2019 20:58:14 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190823125939.30012-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190827195814.A25CFD02CE9@fitzroy.sirena.org.uk>
Date: Tue, 27 Aug 2019 20:58:14 +0100 (BST)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 daniel.baluta@nxp.com, s.hauer@pengutronix.de, tiwai@suse.com,
 yuehaibing@huawei.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>, Mark Brown <broonie@kernel.org>,
 linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org,
 festevam@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: SOF: imx8: Make some functions static"
	to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: imx8: Make some functions static

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From b9a4805a4ac1200326ee0c78df0ae3faceabad49 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 23 Aug 2019 20:59:39 +0800
Subject: [PATCH] ASoC: SOF: imx8: Make some functions static

Fix sparse warnings:

sound/soc/sof/imx/imx8.c:104:6: warning: symbol 'imx8_dsp_handle_reply' was not declared. Should it be static?
sound/soc/sof/imx/imx8.c:115:6: warning: symbol 'imx8_dsp_handle_request' was not declared. Should it be static?
sound/soc/sof/imx/imx8.c:336:5: warning: symbol 'imx8_get_bar_index' was not declared. Should it be static?
sound/soc/sof/imx/imx8.c:341:6: warning: symbol 'imx8_ipc_msg_data' was not declared. Should it be static?
sound/soc/sof/imx/imx8.c:348:5: warning: symbol 'imx8_ipc_pcm_params' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Link: https://lore.kernel.org/r/20190823125939.30012-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/imx/imx8.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index e502f584207f..640472491037 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -101,7 +101,7 @@ static int imx8_get_window_offset(struct snd_sof_dev *sdev, u32 id)
 	return MBOX_OFFSET;
 }
 
-void imx8_dsp_handle_reply(struct imx_dsp_ipc *ipc)
+static void imx8_dsp_handle_reply(struct imx_dsp_ipc *ipc)
 {
 	struct imx8_priv *priv = imx_dsp_get_data(ipc);
 	unsigned long flags;
@@ -112,7 +112,7 @@ void imx8_dsp_handle_reply(struct imx_dsp_ipc *ipc)
 	spin_unlock_irqrestore(&priv->sdev->ipc_lock, flags);
 }
 
-void imx8_dsp_handle_request(struct imx_dsp_ipc *ipc)
+static void imx8_dsp_handle_request(struct imx_dsp_ipc *ipc)
 {
 	struct imx8_priv *priv = imx_dsp_get_data(ipc);
 
@@ -333,21 +333,21 @@ static int imx8_remove(struct snd_sof_dev *sdev)
 }
 
 /* on i.MX8 there is 1 to 1 match between type and BAR idx */
-int imx8_get_bar_index(struct snd_sof_dev *sdev, u32 type)
+static int imx8_get_bar_index(struct snd_sof_dev *sdev, u32 type)
 {
 	return type;
 }
 
-void imx8_ipc_msg_data(struct snd_sof_dev *sdev,
-		       struct snd_pcm_substream *substream,
-		       void *p, size_t sz)
+static void imx8_ipc_msg_data(struct snd_sof_dev *sdev,
+			      struct snd_pcm_substream *substream,
+			      void *p, size_t sz)
 {
 	sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
 }
 
-int imx8_ipc_pcm_params(struct snd_sof_dev *sdev,
-			struct snd_pcm_substream *substream,
-			const struct sof_ipc_pcm_params_reply *reply)
+static int imx8_ipc_pcm_params(struct snd_sof_dev *sdev,
+			       struct snd_pcm_substream *substream,
+			       const struct sof_ipc_pcm_params_reply *reply)
 {
 	return 0;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

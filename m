Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 213E11FDB49
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 03:11:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6DF9167E;
	Thu, 18 Jun 2020 03:10:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6DF9167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592442683;
	bh=082nMbW7W4EL25ot2oiMRYNGZ531syXYTu7mVW7Gabo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hPN3yw/ieke8SxexZLLiJVOfY1MnSud11l7pZ2f5eytSvenKyyDClhSdxYUh6yMpn
	 +BvHOWC74HHbci0oa92R+s7UK3NY8l2iHMgzSacdOpheDjVqfrjkxvr57J+LZ1aers
	 MwRyDzS9k9cnXCBL0AHVoVEHDV7zRGjUkF08yl3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DE96F802DB;
	Thu, 18 Jun 2020 03:08:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C74DF8028F; Thu, 18 Jun 2020 03:08:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C2D3F8028F
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 03:08:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C2D3F8028F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="05DUXdz8"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 586F721D7D;
 Thu, 18 Jun 2020 01:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442503;
 bh=082nMbW7W4EL25ot2oiMRYNGZ531syXYTu7mVW7Gabo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=05DUXdz8UVIOEo+t+X6SJz3GeSlKJHHr3PhWvf831NjgrbuM/1PlmeRdMZYq+supg
 oE2KETg9lvggBe2wZLcZGZpVK3oWYlqxtrajnxV1esko+almnn4bVPLobfy7OwTgQz
 Rc+M8SltyNaB4a/oBL3RmOK69Nk1XrqEhIHuioP4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 013/388] ASoC: fsl_esai: Disable exception
 interrupt before scheduling tasklet
Date: Wed, 17 Jun 2020 21:01:50 -0400
Message-Id: <20200618010805.600873-13-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org
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

From: Shengjiu Wang <shengjiu.wang@nxp.com>

[ Upstream commit 1fecbb71fe0e46b886f84e3b6decca6643c3af6d ]

Disable exception interrupt before scheduling tasklet, otherwise if
the tasklet isn't handled immediately, there will be endless xrun
interrupt.

Fixes: 7ccafa2b3879 ("ASoC: fsl_esai: recover the channel swap after xrun")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Link: https://lore.kernel.org/r/a8f2ad955aac9e52587beedc1133b3efbe746895.1587968824.git.shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/fsl_esai.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index c7a49d03463a..84290be778f0 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -87,6 +87,10 @@ static irqreturn_t esai_isr(int irq, void *devid)
 	if ((saisr & (ESAI_SAISR_TUE | ESAI_SAISR_ROE)) &&
 	    esai_priv->reset_at_xrun) {
 		dev_dbg(&pdev->dev, "reset module for xrun\n");
+		regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
+				   ESAI_xCR_xEIE_MASK, 0);
+		regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
+				   ESAI_xCR_xEIE_MASK, 0);
 		tasklet_schedule(&esai_priv->task);
 	}
 
-- 
2.25.1


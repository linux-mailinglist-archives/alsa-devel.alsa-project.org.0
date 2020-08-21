Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1783924DACD
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 18:28:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD81616BD;
	Fri, 21 Aug 2020 18:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD81616BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598027289;
	bh=fbGa6hXFYDUx0qQvVLBElXseSMxRIENuGCkKMVoNJdE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p+iWhutadm5W8kiYYjZcRpJg+5tbZtLI5q2GlutDJbTJ7olld1JZ5P93/XAZhogiT
	 myPJgIsjd5wa7h69WXpmbePK7TJa1KB2owUYOKcHmjiU5B/7ouFhcvYUIKXo7EsDQL
	 sFWVNR59q+rfgCNa/AL2+/xh+RWpdHppuMmrAqNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DCFAF8036B;
	Fri, 21 Aug 2020 18:17:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA487F8036A; Fri, 21 Aug 2020 18:17:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B556F80360
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 18:17:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B556F80360
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kFT9zhTH"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 620BB21741;
 Fri, 21 Aug 2020 16:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598026631;
 bh=fbGa6hXFYDUx0qQvVLBElXseSMxRIENuGCkKMVoNJdE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kFT9zhTHU5nRFNWPk3Vb9WZ8TO1gF3GvyhXI7XNSQrDDhjM7++kDzxbiwmNbE7DX7
 CkAXZnxf/6yBJlLklzH6zrcS1aOAiYC44BhKv50FhuXDCyiVrDFvoWZRjIZ7T6MZoP
 /Ckv8FItRxlQwazjM+J2LNit4o3Q1BjNP6F3AKNM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 05/48] ASoC: img: Fix a reference count leak in
 img_i2s_in_set_fmt
Date: Fri, 21 Aug 2020 12:16:21 -0400
Message-Id: <20200821161704.348164-5-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821161704.348164-1-sashal@kernel.org>
References: <20200821161704.348164-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Qiushi Wu <wu000273@umn.edu>
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

From: Qiushi Wu <wu000273@umn.edu>

[ Upstream commit c4c59b95b7f7d4cef5071b151be2dadb33f3287b ]

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code, causing incorrect ref count if
pm_runtime_put_noidle() is not called in error handling paths.
Thus call pm_runtime_put_noidle() if pm_runtime_get_sync() fails.

Signed-off-by: Qiushi Wu <wu000273@umn.edu>
Link: https://lore.kernel.org/r/20200614033749.2975-1-wu000273@umn.edu
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/img/img-i2s-in.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/img/img-i2s-in.c b/sound/soc/img/img-i2s-in.c
index 869fe0068cbd3..bb668551dd4b2 100644
--- a/sound/soc/img/img-i2s-in.c
+++ b/sound/soc/img/img-i2s-in.c
@@ -343,8 +343,10 @@ static int img_i2s_in_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	chan_control_mask = IMG_I2S_IN_CH_CTL_CLK_TRANS_MASK;
 
 	ret = pm_runtime_get_sync(i2s->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(i2s->dev);
 		return ret;
+	}
 
 	for (i = 0; i < i2s->active_channels; i++)
 		img_i2s_in_ch_disable(i2s, i);
-- 
2.25.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EF61194F9
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 22:19:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D26886E;
	Tue, 10 Dec 2019 22:18:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D26886E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576012754;
	bh=Dm14vA+jY2cGMQzabOK2qNyJPqR9boVhDVJkB1ocHEY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AHyllIfa3ZG2qumjucsU/Zz41kXWK9joSRXkRN/EZ2PqM/obkVvY6mU73Xfh8jamk
	 lSVnDtfCYcWkqNv3kBdamA419BKJxlAugNoFQ0XeIDFYISoa6cDu3pVmRYvmjIYmcA
	 dRkrabm6bANT6I9wbKTKNP/fZcJSuUJkBwW9jsTw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AD82F8025A;
	Tue, 10 Dec 2019 22:13:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 860FEF802A1; Tue, 10 Dec 2019 22:13:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE8F4F80299
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 22:12:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE8F4F80299
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Hm8Gk2vf"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6863222464;
 Tue, 10 Dec 2019 21:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576012378;
 bh=2jmLvshvkcZRQ15mLsyjwl2ryVz5NqiA9+p1Nim49Ik=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hm8Gk2vfg72U2OfC7/vaGf0BNXtfz6a6QWYaWePcbeVFMWob/ZRkCD6Db+55LypW7
 /ePVhPjrhQYtpBmZs87QnfwXsZKDlba7NFa770Wbe/WmeWtN1zTdMoMkKnShgQphkH
 0Rq+LfxxT2gjLAUymz65mu0dZUpoAetFJLOD06L0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 10 Dec 2019 16:06:47 -0500
Message-Id: <20191210210735.9077-263-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Chuhong Yuan <hslester96@gmail.com>
Subject: [alsa-devel] [PATCH AUTOSEL 5.4 302/350] ASoC: wm2200: add missed
	operations in remove and probe failure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Chuhong Yuan <hslester96@gmail.com>

[ Upstream commit 2dab09be49a1e7a4dd13cb47d3a1441a2ef33a87 ]

This driver misses calls to pm_runtime_disable and regulator_bulk_disable
in remove and a call to free_irq in probe failure.
Add the calls to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
Link: https://lore.kernel.org/r/20191118073633.28237-1-hslester96@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm2200.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/wm2200.c b/sound/soc/codecs/wm2200.c
index cf64e109c6587..7b087d94141bd 100644
--- a/sound/soc/codecs/wm2200.c
+++ b/sound/soc/codecs/wm2200.c
@@ -2410,6 +2410,8 @@ static int wm2200_i2c_probe(struct i2c_client *i2c,
 
 err_pm_runtime:
 	pm_runtime_disable(&i2c->dev);
+	if (i2c->irq)
+		free_irq(i2c->irq, wm2200);
 err_reset:
 	if (wm2200->pdata.reset)
 		gpio_set_value_cansleep(wm2200->pdata.reset, 0);
@@ -2426,12 +2428,15 @@ static int wm2200_i2c_remove(struct i2c_client *i2c)
 {
 	struct wm2200_priv *wm2200 = i2c_get_clientdata(i2c);
 
+	pm_runtime_disable(&i2c->dev);
 	if (i2c->irq)
 		free_irq(i2c->irq, wm2200);
 	if (wm2200->pdata.reset)
 		gpio_set_value_cansleep(wm2200->pdata.reset, 0);
 	if (wm2200->pdata.ldo_ena)
 		gpio_set_value_cansleep(wm2200->pdata.ldo_ena, 0);
+	regulator_bulk_disable(ARRAY_SIZE(wm2200->core_supplies),
+			       wm2200->core_supplies);
 
 	return 0;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

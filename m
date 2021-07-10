Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 539873C3008
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:43:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7013172F;
	Sat, 10 Jul 2021 04:43:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7013172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625885037;
	bh=cjFLiYvpXgJg5R8/A0oRgy/TxHOhY+yBWW71dNTeMZw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SS2vKEYmuog+fFvjcGbLfXzoIXYT9y9eE0gdLhv4n0NOn3or3SdIsbRlSrLCpGmW1
	 gfBLH/u9oK/q90tKyfDKnI0hK2Vz9WkpIPxnY16joK3Lz56g2IwFOn4WkDGUl1wTzR
	 daNcm+NDaFDeeFKJqNgJw6fT9mf3f0J2Y+mmVxsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2114EF8062E;
	Sat, 10 Jul 2021 04:27:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52D4DF8062E; Sat, 10 Jul 2021 04:27:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E640F80624
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:27:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E640F80624
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RAPYi8Yb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D51461418;
 Sat, 10 Jul 2021 02:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625884049;
 bh=cjFLiYvpXgJg5R8/A0oRgy/TxHOhY+yBWW71dNTeMZw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RAPYi8YbQiSbENerZKu0d421JUr8WFn0J6mmkkyzPCgkG+MmTUlw9uHspvU/DhIEt
 j2hate/RrPFBBeYJjod21QPl2geCv1wBnqdyu6ePbw5dKzXIOZkeuB9rFmuSJGiiS+
 YlzAUj2Iv/532E5EV+AIMcQhJ6jUkvOWwJONzlChO0rlfGPHwRggnIXXW8KamqPa69
 4+0nPWoHnob5qDEjGWaXLYGN6GhIEkO4PFv9Ca9RYs3n1wPBDuhD2rdXhkqwtDfGH1
 zsBP3r+V04mFj3AkZFl+OAH5CQy6IgsdG1ZzzWiZI1WZKAdCzjnM2UGJ+YVLQoUJ7Z
 qW7DJajIgDd5w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 16/63] ALSA: ac97: fix PM reference leak in
 ac97_bus_remove()
Date: Fri,  9 Jul 2021 22:26:22 -0400
Message-Id: <20210710022709.3170675-16-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710022709.3170675-1-sashal@kernel.org>
References: <20210710022709.3170675-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Hulk Robot <hulkci@huawei.com>,
 alsa-devel@alsa-project.org, Yufen Yu <yuyufen@huawei.com>,
 Sasha Levin <sashal@kernel.org>
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

From: Yufen Yu <yuyufen@huawei.com>

[ Upstream commit a38e93302ee25b2ca6f4ee76c6c974cf3637985e ]

pm_runtime_get_sync will increment pm usage counter even it failed.
Forgetting to putting operation will result in reference leak here.
Fix it by replacing it with pm_runtime_resume_and_get to keep usage
counter balanced.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yufen Yu <yuyufen@huawei.com>
Link: https://lore.kernel.org/r/20210524093811.612302-1-yuyufen@huawei.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/ac97/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/ac97/bus.c b/sound/ac97/bus.c
index 7985dd8198b6..99e1728b52ae 100644
--- a/sound/ac97/bus.c
+++ b/sound/ac97/bus.c
@@ -520,7 +520,7 @@ static int ac97_bus_remove(struct device *dev)
 	struct ac97_codec_driver *adrv = to_ac97_driver(dev->driver);
 	int ret;
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
 		return ret;
 
-- 
2.30.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48007410548
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Sep 2021 11:04:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4FB4174E;
	Sat, 18 Sep 2021 11:03:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4FB4174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631955857;
	bh=pjj1ypj+FrNnG/MjgiroKjU4ifzH3Tjae9nb7z/kwFU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JHJ91kIBRayD3f54+3/76SI0aop9/gZYnf+0Trh0BtWYc1u7ej/yYN5GMsFEZJExu
	 dIu+WtNhOW/JjSW7MsKe45G1vfK2MN0lC5ROVdDCIjTowduKf1TEEcL9oZkwjQ/oFi
	 RlUqwURzArZjO0h8SJS4opjb/zya/Ddgh3ApIFBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12663F80137;
	Sat, 18 Sep 2021 11:03:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EC70F8025E; Sat, 18 Sep 2021 11:02:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D772EF80218
 for <alsa-devel@alsa-project.org>; Sat, 18 Sep 2021 11:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D772EF80218
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0UomJtwg_1631955766; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UomJtwg_1631955766) by smtp.aliyun-inc.com(127.0.0.1);
 Sat, 18 Sep 2021 17:02:49 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: oder_chiou@realtek.com
Subject: [PATCH] ASoC: rt5682s: make rt5682s_aif2_dai_ops and
 rt5682s_soc_component_dev
Date: Sat, 18 Sep 2021 17:02:06 +0800
Message-Id: <1631955726-77693-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 tiwai@suse.com, broonie@kernel.org
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

This symbol is not used outside of rt5682s.c, so marks it static.

Fix the following sparse warning:

sound/soc/codecs/rt5682s.c:2848:39: warning: symbol
'rt5682s_soc_component_dev' was not declared. Should it be static?

sound/soc/codecs/rt5682s.c:2842:30: warning: symbol
'rt5682s_aif2_dai_ops' was not declared. Should it be static?

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 sound/soc/codecs/rt5682s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index d878a20..d3e965b 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -2839,13 +2839,13 @@ static int rt5682s_resume(struct snd_soc_component *component)
 	.set_bclk_ratio = rt5682s_set_bclk1_ratio,
 };
 
-const struct snd_soc_dai_ops rt5682s_aif2_dai_ops = {
+static const struct snd_soc_dai_ops rt5682s_aif2_dai_ops = {
 	.hw_params = rt5682s_hw_params,
 	.set_fmt = rt5682s_set_dai_fmt,
 	.set_bclk_ratio = rt5682s_set_bclk2_ratio,
 };
 
-const struct snd_soc_component_driver rt5682s_soc_component_dev = {
+static const struct snd_soc_component_driver rt5682s_soc_component_dev = {
 	.probe = rt5682s_probe,
 	.remove = rt5682s_remove,
 	.suspend = rt5682s_suspend,
-- 
1.8.3.1


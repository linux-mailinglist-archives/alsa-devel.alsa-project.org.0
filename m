Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B2B6423A9
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 08:36:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99BF51749;
	Mon,  5 Dec 2022 08:35:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99BF51749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670225793;
	bh=M03xM7qJ2MpwudTDpCzyKHZLdd9FRo6F+rw0Z5XlfRA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hQkefcFYGnGBA16OrqYiz5PcLUyv7kZiMYAh8lrXVYLv7vLQ3rKVKX3O58f550/f9
	 8DeVPwSEzXeUqZ4usv037TAxeHEQPMpPMOo5FLUFCJdTywWjrrYugIV/zaIU5WNiNT
	 TMejqRIh0bnQUa2T98HwzJU9Dotf71ESmqEby+5c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDFA5F8047C;
	Mon,  5 Dec 2022 08:35:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56CDBF800BD; Mon,  5 Dec 2022 08:35:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2810F80155
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 08:35:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2810F80155
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=jiapeng.chong@linux.alibaba.com; NM=0; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VWPrFg9_1670225710; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VWPrFg9_1670225710) by smtp.aliyun-inc.com;
 Mon, 05 Dec 2022 15:35:24 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: srinivas.kandagatla@linaro.org
Subject: [PATCH] ASoC: codecs: wcd-clsh: Remove the unused function
Date: Mon,  5 Dec 2022 15:35:07 +0800
Message-Id: <20221205073507.36071-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, bgoswami@quicinc.com
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

The function wcd_clsh_set_buck_mode() is defined in the wcd-clsh-v2.c
file, but not called elsewhere, so remove this unused function.

sound/soc/codecs/wcd-clsh-v2.c:133:20: warning: unused function 'wcd_clsh_enable_status'.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3348
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 sound/soc/codecs/wcd-clsh-v2.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/wcd-clsh-v2.c b/sound/soc/codecs/wcd-clsh-v2.c
index 4c7ebc7fb400..a75db27e5205 100644
--- a/sound/soc/codecs/wcd-clsh-v2.c
+++ b/sound/soc/codecs/wcd-clsh-v2.c
@@ -130,12 +130,6 @@ static inline void wcd_enable_clsh_block(struct wcd_clsh_ctrl *ctrl,
 		ctrl->clsh_users = 0;
 }
 
-static inline bool wcd_clsh_enable_status(struct snd_soc_component *comp)
-{
-	return snd_soc_component_read(comp, WCD9XXX_A_CDC_CLSH_CRC) &
-					WCD9XXX_A_CDC_CLSH_CRC_CLK_EN_MASK;
-}
-
 static inline void wcd_clsh_set_buck_mode(struct snd_soc_component *comp,
 					  int mode)
 {
-- 
2.20.1.7.g153144c


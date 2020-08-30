Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2E5258C99
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 12:18:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79F2117A4;
	Tue,  1 Sep 2020 12:17:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79F2117A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598955508;
	bh=sznte5OD6jPMQy5iCc1sEj6cfoFo4deEUP/VWEqG1Ys=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FEeeSw9bZlueKd4PVbCzLCi4shitfwdgAhO40HcolgKC9aFxGFkTOuflstGaLIeBF
	 Jj6PP3fG+UaxpAW6F6ITcR3UNdzjmb5fYFCxwglOOX82QYUAnCcUVaD91LksSzVFWl
	 QJOA5p8YhjotdE4s5+0pN+0QMAOZRMg/t5WpB69k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2E7AF802D2;
	Tue,  1 Sep 2020 12:15:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02A6DF8020D; Sun, 30 Aug 2020 11:51:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net
 (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
 by alsa1.perex.cz (Postfix) with SMTP id 85190F80058
 for <alsa-devel@alsa-project.org>; Sun, 30 Aug 2020 11:51:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85190F80058
Received: from oslab.tsinghua.edu.cn (unknown [166.111.139.154])
 by app-3 (Coremail) with SMTP id EQQGZQAHFSyLdktfA2XQAA--.26948S2;
 Sun, 30 Aug 2020 17:51:27 +0800 (CST)
From: Tuo Li <t-li20@mails.tsinghua.edu.cn>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 heiko@sntech.de, baijiaju1990@gmail.com
Subject: [PATCH] ALSA: rockchip: fix a possible divide-by-zero bug in
 rockchip_i2s_hw_params()
Date: Sun, 30 Aug 2020 17:51:06 +0800
Message-Id: <20200830095106.4412-1-t-li20@mails.tsinghua.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: EQQGZQAHFSyLdktfA2XQAA--.26948S2
X-Coremail-Antispam: 1UD129KBjvdXoWruFy5ur1kKFWkJr13Gw4fuFg_yoWDurbEqw
 47Xr95Xr18Xr13t3WDA3ykAr4qywnxuF1kCFWj9r1UJa4UJr4rKF1kJ34aka43WF9akr10
 gr1DXr1DAFyxAjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbf8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
 YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrw
 CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
 14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
 x2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjAsqPUUUUU==
X-CM-SenderInfo: nwnoxj2q6ptxtovo32xlqjx3vdohv3gofq/
X-Mailman-Approved-At: Tue, 01 Sep 2020 12:15:51 +0200
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 Tuo Li <t-li20@mails.tsinghua.edu.cn>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

The variable bclk_rate is checked in:
  if (bclk_rate && mclk_rate % bclk_rate)

This indicates that bclk_rate can be zero.
If so, a divide-by-zero bug will occur:
  div_bclk = mclk_rate / bclk_rate;

To fix this possible bug, the function returns -EINVAL when bclk_rate is
zero.

Signed-off-by: Tuo Li <t-li20@mails.tsinghua.edu.cn>
---
 sound/soc/rockchip/rockchip_i2s.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index d1438753edb4..dd0836c32639 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -279,7 +279,9 @@ static int rockchip_i2s_hw_params(struct snd_pcm_substream *substream,
 	if (i2s->is_master_mode) {
 		mclk_rate = clk_get_rate(i2s->mclk);
 		bclk_rate = 2 * 32 * params_rate(params);
-		if (bclk_rate && mclk_rate % bclk_rate)
+		if (bclk_rate == 0)
+			return -EINVAL;
+		if (mclk_rate % bclk_rate)
 			return -EINVAL;
 
 		div_bclk = mclk_rate / bclk_rate;
-- 
2.17.1


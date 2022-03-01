Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E09E64C8562
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 08:41:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ACF51B13;
	Tue,  1 Mar 2022 08:40:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ACF51B13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646120472;
	bh=+8VwSJ78Lj58lv+iom/RK+p+UlAVgI+zWrGNBgE0du4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H/WS+GnPM+6gPc4WN3Uw4F4pmm/eFTFzohxPii5cRzwT88StNYO/1MI/HanWNx0jz
	 joJ9AyUHZIM613/xjNrR8p1/ntA45SmEXe4Hf0bar8WC1OF5mPWYKSlyICBBd4to3V
	 fhtC+WtkVg8Hz/ZVi22YHwu6MfJAA/qik9sSX9E4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBE90F802D2;
	Tue,  1 Mar 2022 08:40:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 621B1F80227; Tue,  1 Mar 2022 08:40:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
 by alsa1.perex.cz (Postfix) with ESMTP id 92E0AF80167
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 08:39:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92E0AF80167
Received: from localhost.localdomain (unknown [124.16.138.126])
 by APP-05 (Coremail) with SMTP id zQCowAAH6vLHzR1il43WAQ--.23837S2;
 Tue, 01 Mar 2022 15:39:51 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, kafai@fb.com,
 songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@kernel.org, f.suligoi@asem.it, kuninori.morimoto.gx@renesas.com
Subject: [PATCH] ASoC: fsi: Add check for clk_enable
Date: Tue,  1 Mar 2022 15:39:49 +0800
Message-Id: <20220301073949.3678707-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAH6vLHzR1il43WAQ--.23837S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xr47tF15uFW3uw4kKFW7Arb_yoWDCwb_Aa
 yqg39xXa15urWfCF9rJr4DA34j9r42v3WUKry0qa1ftFWUJwnxur4UZ3sYvrn0qw1F93s3
 Za1DAr4xAr43CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb38FF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
 evJa73UjIFyTuYvjfUY-BMDUUUU
X-Originating-IP: [124.16.138.126]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
Cc: netdev@vger.kernel.org, alsa-devel@alsa-project.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>
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

As the potential failure of the clk_enable(),
it should be better to check it and return error
if fails.

Fixes: ab6f6d85210c ("ASoC: fsi: add master clock control functions")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 sound/soc/sh/fsi.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sh/fsi.c b/sound/soc/sh/fsi.c
index cdf3b7f69ba7..93cfa77b8b54 100644
--- a/sound/soc/sh/fsi.c
+++ b/sound/soc/sh/fsi.c
@@ -816,14 +816,26 @@ static int fsi_clk_enable(struct device *dev,
 			return ret;
 		}
 
-		clk_enable(clock->xck);
-		clk_enable(clock->ick);
-		clk_enable(clock->div);
+		ret = clk_enable(clock->xck);
+		if (ret)
+			goto err;
+		ret = clk_enable(clock->ick);
+		if (ret)
+			goto err;
+		ret = clk_enable(clock->div);
+		if (ret)
+			goto err;
 
 		clock->count++;
 	}
 
 	return ret;
+
+err:
+	clk_disable(clock->xck);
+	clk_disable(clock->ick);
+	clk_disable(clock->div);
+	return ret;
 }
 
 static int fsi_clk_disable(struct device *dev,
-- 
2.25.1


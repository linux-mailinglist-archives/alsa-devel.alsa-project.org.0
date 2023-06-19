Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B2F73828A
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 14:01:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03F23839;
	Wed, 21 Jun 2023 14:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03F23839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687348908;
	bh=h1Ouemq5zINcT+h/9hBAgaXTCu9Lwl3uaay3Z32vWBA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WVp77NihFb4SI0omQ9cj1PhQCAn07J8xGTb5fJtAFKaXEFP3imWHQiJCnFDuCBKgR
	 AK1Med+Ct6LBtn1BpChg2hoYmAzNndndtEH8hx7BB+l7EfE7CZ9/atY4kjfyGwxDut
	 Bch29cqoih1fld25aPr08zxN6gtCuqgGD72LthPc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FE0DF805C2; Wed, 21 Jun 2023 13:59:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F189F805BF;
	Wed, 21 Jun 2023 13:59:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1907AF80217; Mon, 19 Jun 2023 09:47:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id A8D7FF80130
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 09:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8D7FF80130
Received: from loongson.cn (unknown [10.180.13.124])
	by gateway (Coremail) with SMTP id _____8Cx_eoHCJBkgcgGAA--.14183S3;
	Mon, 19 Jun 2023 15:47:20 +0800 (CST)
Received: from localhost.localdomain (unknown [10.180.13.124])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxXMoECJBkZf8fAA--.15854S4;
	Mon, 19 Jun 2023 15:47:16 +0800 (CST)
From: YingKun Meng <mengyingkun@loongson.cn>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Cc: harshit.m.mogalapalli@oracle.com,
	krzysztof.kozlowski@linaro.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	YingKun Meng <mengyingkun@loongson.cn>
Subject: [PATCH v1] ASoC: loongson: change the type of variable irq to int
Date: Mon, 19 Jun 2023 15:46:49 +0800
Message-Id: <20230619074649.3608726-1-mengyingkun@loongson.cn>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxXMoECJBkZf8fAA--.15854S4
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQAHDGSO9AIDRgAEsX
X-Coremail-Antispam: 1Uk129KBj9xXoWrury5KryDXw1kCrWfKFW7trc_yoWDCrX_Ga
	42qan5uryUJFy7Wa4UWrW8AryaqFyfA3W5CF17tFn7W3W7tr1Sk34kCr15uFy3XrW0vFZx
	Zr48Wr4xZw1FyosvyTuYvTs0mTUanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbSxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7-B_UUUUU
X-MailFrom: mengyingkun@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PNLWTBNCPLR3SRJLXFDIIUO6KBXTK7BI
X-Message-ID-Hash: PNLWTBNCPLR3SRJLXFDIIUO6KBXTK7BI
X-Mailman-Approved-At: Wed, 21 Jun 2023 11:59:38 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PNLWTBNCPLR3SRJLXFDIIUO6KBXTK7BI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We use variable 'irq' to store the return value of fwnode_get_irq_byname().
A negative value indicates that the operation failed. If the type of 'irq'
is unsigned int, we never know if the operation failed.

Reported-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Closes: https://lore.kernel.org/loongarch/325dd825-6fa5-0ebc-4b7e-7acf2d2840e4@loongson.cn/
Signed-off-by: YingKun Meng <mengyingkun@loongson.cn>
---
 sound/soc/loongson/loongson_i2s.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/loongson/loongson_i2s.h b/sound/soc/loongson/loongson_i2s.h
index 52788f6a94ad..89492eebf834 100644
--- a/sound/soc/loongson/loongson_i2s.h
+++ b/sound/soc/loongson/loongson_i2s.h
@@ -45,7 +45,7 @@
 struct loongson_dma_data {
 	dma_addr_t dev_addr;		/* device physical address for DMA */
 	void __iomem *order_addr;	/* DMA order register */
-	u32 irq;			/* DMA irq */
+	int irq;			/* DMA irq */
 };
 
 struct loongson_i2s {
-- 
2.33.0


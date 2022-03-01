Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECF54CA007
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:55:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E72081FA8;
	Wed,  2 Mar 2022 09:54:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E72081FA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646211335;
	bh=xQnp5gkfTHCva63LtIo9A18C5qI+tePbDXF8tiPv/6I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eOdMMCQq6KbHBr2vQs1mKFrun5qdfDUoXSev6Xgim1MW2JQliGEgbw52er1mZ+lCI
	 fGPW4BWo6pmwxKCsysbtP4GazrRmi3ayz9VcTRvKoBNsrN0Q6dvE+ty93uBoZOg+DL
	 xx71p8zSlLq5bN6NhDUkfYQp+z1+fDxfPQwdFHv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94B43F80764;
	Wed,  2 Mar 2022 09:34:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 332CFF80054; Tue,  1 Mar 2022 09:56:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99295F80054
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 09:55:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99295F80054
X-QQ-mid: bizesmtp72t1646124947t9a9zs3n
Received: from localhost.localdomain (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 01 Mar 2022 16:55:42 +0800 (CST)
X-QQ-SSF: 0140000000800050D000B00B0000000
X-QQ-FEAT: Mx1dxJbW4IWBoPudVZz/5q9bo01rO9o9bK3W/8F7ds9vRdzxmheGoY543WGL3
 jbPXzUhhuCNdKKHuLozaT23OJHKYAt8QW6foFXYvus/lbfbkGhSFRf0+Ug11ZLxDrrxgAGI
 MySXFsvsgKmWIin8kEafaQpMUNwDokN/yM0XqEhIkiTitC2d7RqD5Vn9m1P2QS8pNIjWds2
 1ML05bpuRBCLRPUjaPXqL6l2I0IXZr4CXcoL0mxFnlfZTNZKWJmBe8IrUFqnNIidsXUI6U/
 4v8DBp3FDzsUSF7iB7e3Br5WZXKlSaDT42kf1e/eNphncPDEEnCpOVwsc7n2Baxgv06zEKG
 5ipd7gNM8FJ0JHe05A=
X-QQ-GoodBg: 2
From: Zhen Ni <nizhen@uniontech.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: n64: Use platform_get_irq() to get the interrupt
Date: Tue,  1 Mar 2022 16:55:36 +0800
Message-Id: <20220301085536.24599-1-nizhen@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:35 +0100
Cc: Zhen Ni <nizhen@uniontech.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
allocation of IRQ resources in DT core code, this causes an issue
when using hierarchical interrupt domains using "interrupts" property
in the node as this bypassed the hierarchical setup and messed up the
irq chaining.

In preparation for removal of static setup of IRQ resource from DT core
code use platform_get_irq().

Signed-off-by: Zhen Ni <nizhen@uniontech.com>
---
 sound/mips/snd-n64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/mips/snd-n64.c b/sound/mips/snd-n64.c
index 463a6fe589eb..19365aab15ba 100644
--- a/sound/mips/snd-n64.c
+++ b/sound/mips/snd-n64.c
@@ -289,7 +289,7 @@ static int __init n64audio_probe(struct platform_device *pdev)
 	struct snd_card *card;
 	struct snd_pcm *pcm;
 	struct n64audio *priv;
-	struct resource *res;
+	int irq;
 	int err;
 
 	err = snd_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1,
@@ -337,12 +337,12 @@ static int __init n64audio_probe(struct platform_device *pdev)
 	strcpy(card->shortname, "N64 Audio");
 	strcpy(card->longname, "N64 Audio");
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
 		err = -EINVAL;
 		goto fail_dma_alloc;
 	}
-	if (devm_request_irq(&pdev->dev, res->start, n64audio_isr,
+	if (devm_request_irq(&pdev->dev, irq, n64audio_isr,
 				IRQF_SHARED, "N64 Audio", priv)) {
 		err = -EBUSY;
 		goto fail_dma_alloc;
-- 
2.20.1




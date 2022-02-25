Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2363B4C460E
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:23:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A41F01EF0;
	Fri, 25 Feb 2022 14:22:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A41F01EF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645795408;
	bh=tniIWU1QndGtacVBhKNUVG+10zbjpnJWTlLWjn/TGjQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pXyoRqrdq91L7QloWgcmAaEVxfaEqDGWimD1/iq2GV8RY3pjcLbPcODS4kukNuI7h
	 km0/wILFc8aHJbH8O38xaLuAggazJEdovF2id2HuXBn2q4evERiC22YrCEWb+K2CiB
	 rD2gIfwny729FJ3C4SvhkE8Q7inshaSF6TnN+wFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CA41F80508;
	Fri, 25 Feb 2022 14:11:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51BDDF800B6; Fri, 25 Feb 2022 12:20:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A680F800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 12:19:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A680F800B6
X-QQ-mid: bizesmtp74t1645787977tb99bvk4
Received: from localhost.localdomain (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 25 Feb 2022 19:19:31 +0800 (CST)
X-QQ-SSF: 01400000002000C0F000000A0000000
X-QQ-FEAT: JRmPfD6HWhwtEx95bUE3TkDE0Zl0T/p5bw+l9Du6N8AbfR6XjS0YDNEzACYAx
 IjtVDQf6ogeyNJNbXUefxDlGFp79P85xICFE3BGBqXvxNhTOhwZ7OBVIF5R5745EUA81A90
 wdr6B/k31D97kERdVqHlr6COgAOzp0lSQmIFIXQWVjqFrNaLRsYVzx5nx/31HA3MuOCmqOp
 oCkW7IIAilf12fRNwDuFT7UCYiZEnsed1W1QB9tJFgbSEXhM1WW77Q81BeXvqmbGrXvG3MP
 xA9AZxoZ+Nt/54JB3VZkqSiP+1gpGIV2SgYgNFeshXA43FvbgjIwatMnaJBkEd6cJ+vhsH1
 TuKAVs/hqP4yWB2otd3RenxbL6N8ELgQ9PgymW2SdsrfK4rsJA=
X-QQ-GoodBg: 1
From: Meng Tang <tangmeng@uniontech.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] sound/mips: Use platform_get_irq() to get the interrupt
Date: Fri, 25 Feb 2022 19:19:29 +0800
Message-Id: <20220225111929.17194-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Fri, 25 Feb 2022 14:11:19 +0100
Cc: Meng Tang <tangmeng@uniontech.com>, alsa-devel@alsa-project.org,
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

Signed-off-by: Meng Tang <tangmeng@uniontech.com>
---
 sound/mips/snd-n64.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/mips/snd-n64.c b/sound/mips/snd-n64.c
index 463a6fe589eb..bff6d85b8fe2 100644
--- a/sound/mips/snd-n64.c
+++ b/sound/mips/snd-n64.c
@@ -289,8 +289,7 @@ static int __init n64audio_probe(struct platform_device *pdev)
 	struct snd_card *card;
 	struct snd_pcm *pcm;
 	struct n64audio *priv;
-	struct resource *res;
-	int err;
+	int err, irq;
 
 	err = snd_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1,
 			   SNDRV_DEFAULT_STR1,
@@ -337,12 +336,12 @@ static int __init n64audio_probe(struct platform_device *pdev)
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




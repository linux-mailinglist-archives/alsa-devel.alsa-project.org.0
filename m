Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E845A729D42
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:48:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7990D83A;
	Fri,  9 Jun 2023 16:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7990D83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322136;
	bh=VFuQDOwOKGBmFGktbg29b9I5qIBycBgJ/9yfUKsIUtc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=foBoZ+dw12ux2ji8f1se7eQb6VzLSHqFgwxxVPn5fES0pRy6jVnuAfWVHG3jU458+
	 o+wBlseTRjLni97CgQ5AMPoexY9yrVCs/p6fEdEdVgflQINPqJ6zO4cM42PY5cI6Z0
	 VMlruA2vUPSGSgI+TXUrIoiKYNHZZHJOFrw6/RLY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DEAEF80579; Fri,  9 Jun 2023 16:47:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11B2DF80578;
	Fri,  9 Jun 2023 16:47:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6537F80199; Wed,  7 Jun 2023 11:23:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id A9934F8016C
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 11:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9934F8016C
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8DxSuo6TIBkXRcAAA--.344S3;
	Wed, 07 Jun 2023 17:22:02 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxNeQ2TIBkvzcEAA--.14996S6;
	Wed, 07 Jun 2023 17:22:01 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: tiwai@suse.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	perex@perex.cz,
	chenhuacai@loongson.cn,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	Yingkun Meng <mengyingkun@loongson.cn>
Subject: [PATCH RESEND v3 4/4] ALSA: hda/intel: Workaround for WALLCLK
 register for loongson controller
Date: Wed,  7 Jun 2023 17:21:52 +0800
Message-Id: 
 <185df71ef413ab190460eb377703214ee7288aeb.1686128807.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
In-Reply-To: <cover.1686128807.git.siyanteng@loongson.cn>
References: <cover.1686128807.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxNeQ2TIBkvzcEAA--.14996S6
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZrW8ZF1fZw4rXrykAFW8uFX_yoWDArcEgw
	sFvryDX3s8GFsxKr1rZr1DXFW3taykAFyxW3Z7tr47JayfKFZ5X34kZrnxCFy7Zw4kXFs0
	krnFqrWF9r1UKosvyTuYvTs0mTUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb3AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Cr1j6rxdM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjxU7aZXUUUUU
X-MailFrom: siyanteng@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UG4CQCOL4NRNY2AUHSK5U2GT673S4R6P
X-Message-ID-Hash: UG4CQCOL4NRNY2AUHSK5U2GT673S4R6P
X-Mailman-Approved-At: Fri, 09 Jun 2023 14:46:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UG4CQCOL4NRNY2AUHSK5U2GT673S4R6P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On loongson controller, the value of WALLCLK register
is always 0, which is meaningless, so we return directly.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
---
 sound/pci/hda/hda_intel.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index fc4787c7782a..ef831770ca7d 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -655,6 +655,13 @@ static int azx_position_ok(struct azx *chip, struct azx_dev *azx_dev)
 	unsigned int pos;
 	snd_pcm_uframes_t hwptr, target;
 
+	/*
+	 * The value of the WALLCLK register is always 0
+	 * on the Loongson controller, so we return directly.
+	 */
+	if (chip->driver_type == AZX_DRIVER_LOONGSON)
+		return 1;
+
 	wallclk = azx_readl(chip, WALLCLK) - azx_dev->core.start_wallclk;
 	if (wallclk < (azx_dev->core.period_wallclk * 2) / 3)
 		return -1;	/* bogus (too early) interrupt */
-- 
2.31.4


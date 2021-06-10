Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EA03A2256
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jun 2021 04:44:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 046EE16FA;
	Thu, 10 Jun 2021 04:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 046EE16FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623293056;
	bh=WykyMegb7I7ymAv5jLD5iOfZUSfm9ZN1gdz9sdbf3fs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W2d1K8dm/m7n+/9bXInkajFLjCgWaYEqH+ivU9Xw6AEZrypcV/n6/LZK3xevAtGXW
	 n3y/FXa7+cmtBDZUVzXzFHvJPgjV1qQD06ZjiT7SHGu9ibqLYaV42QSnqvomTj/F9j
	 7sVeviAL/0lDru+GryLekuXmxeQq1sKqdPK9PQdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71093F800FC;
	Thu, 10 Jun 2021 04:42:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A56D2F80218; Thu, 10 Jun 2021 04:42:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
 by alsa1.perex.cz (Postfix) with ESMTP id 69D5CF801EC
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 04:42:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69D5CF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.b="Ob3bPwE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=w8moP
 c3hHLCFUQuSedhYS174W2JUhWhhiPc7iombNd0=; b=Ob3bPwE29KUeYSMy80hYv
 5YwzPzLBYIvSB6kNJXyMRKRS+fTNkU+/5n7SNrB7BIvASp7+Zriq9gnBKA1Nl/40
 qouRpFEGjF39ru7uNVVXK1tvB85eeMYjNYT3SufFap+aNuYG2HkdxdDIeyQBx+j9
 rvUxGpCe8YJCfT1IyFUpeA=
Received: from COOL-20201210PM.ccdomain.com (unknown [218.94.48.178])
 by smtp11 (Coremail) with SMTP id D8CowADn75+te8FgtmN8AA--.6S2;
 Thu, 10 Jun 2021 10:42:34 +0800 (CST)
From: zuoqilin1@163.com
To: daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH] sound/arm: Remove unnecessary variables
Date: Thu, 10 Jun 2021 10:40:53 +0800
Message-Id: <20210610024053.1217-1-zuoqilin1@163.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: D8CowADn75+te8FgtmN8AA--.6S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF4DJF4kXryDWw47Cry8Zrb_yoW3Zwb_ta
 yIqF4kWryIvw1Svw1fAw15XFW0qF47uF4rWr10kF15ZF45X39Y9ryDJr17uryFva109r43
 W3y2qry3Cr9a9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1ZNVJUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 52xr1xpolqiqqrwthudrp/1tbiTgCsiVUDKBc7vgABsG
Cc: zuoqilin <zuoqilin@yulong.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

From: zuoqilin <zuoqilin@yulong.com>

There is no need to define the variable "ret" to receive.

Signed-off-by: zuoqilin <zuoqilin@yulong.com>
---
 sound/arm/pxa2xx-ac97.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/arm/pxa2xx-ac97.c b/sound/arm/pxa2xx-ac97.c
index 6322e639..a67e668 100644
--- a/sound/arm/pxa2xx-ac97.c
+++ b/sound/arm/pxa2xx-ac97.c
@@ -47,9 +47,7 @@ static unsigned short pxa2xx_ac97_legacy_read(struct snd_ac97 *ac97,
 static void pxa2xx_ac97_legacy_write(struct snd_ac97 *ac97,
 				     unsigned short reg, unsigned short val)
 {
-	int __always_unused ret;
-
-	ret = pxa2xx_ac97_write(ac97->num, reg, val);
+	pxa2xx_ac97_write(ac97->num, reg, val);
 }
 
 static const struct snd_ac97_bus_ops pxa2xx_ac97_ops = {
-- 
1.9.1


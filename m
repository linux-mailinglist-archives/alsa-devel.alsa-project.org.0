Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5393C2FA2
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:30:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FB0716F0;
	Sat, 10 Jul 2021 04:29:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FB0716F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625884216;
	bh=1BWtIQ+bDDju4B6IewjLGl2AaJcRH26LIim6FejbrmU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N6qa3WkAqGmALw0roj28m2YuycLRE5gkDqBXtK017XVD811tgwIj2uWq9Lrqx6NUI
	 B2T+wTpdhl4Ykllr4u6jVrbMs3Mm14DSXhOcv+YkePlfUOwQWD00++yYwKqavoQ4Ed
	 PPVXleJ6oQn7ZEVug2MMVioD0xqrhbOMRt5pqPXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2817DF80529;
	Sat, 10 Jul 2021 04:23:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60F5CF80568; Sat, 10 Jul 2021 04:23:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B528F8052E
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:23:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B528F8052E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QlJ7/5hp"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 90C71613F5;
 Sat, 10 Jul 2021 02:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625883798;
 bh=1BWtIQ+bDDju4B6IewjLGl2AaJcRH26LIim6FejbrmU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QlJ7/5hpWyftET1sIKSPHj7x0KOKyT+x9VqcjDg9FEY6c+izpjYswKB+u0VahFaIP
 hp9NdSCTOZXpLiSL2Uoth0UpR/9SxWpbaMXvGL1BDwcGxoveDXFyQDJ0S2s2gL3jBQ
 3/Y81a6te2m8COBprCNeW6bZZcz8TWtDmfK5lvN8lwn525R0nyRM4335TldR19mJKx
 lbj3xeE2nxw3z3/pFc7hBeSOBCcxiZWVvUC4ugV+ff4Gt7aztXq5ZRPeGbhpIZje0g
 63buXgb2UHsZ4+e0/+Rq1FcyO0Qn2j0tw6gFuPbiQU3HK8J8r7jcYEa7pvu9qr3Xe2
 Dc8tyOPHXnuWw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 062/104] ALSA: n64: check return value after
 calling platform_get_resource()
Date: Fri,  9 Jul 2021 22:21:14 -0400
Message-Id: <20210710022156.3168825-62-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710022156.3168825-1-sashal@kernel.org>
References: <20210710022156.3168825-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Yang Yingliang <yangyingliang@huawei.com>
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

From: Yang Yingliang <yangyingliang@huawei.com>

[ Upstream commit be471fe332f7f14aa6828010b220d7e6902b91a0 ]

It will cause null-ptr-deref if platform_get_resource() returns NULL,
we need check the return value.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
Link: https://lore.kernel.org/r/20210610124958.116142-1-yangyingliang@huawei.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/mips/snd-n64.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/mips/snd-n64.c b/sound/mips/snd-n64.c
index e35e93157755..463a6fe589eb 100644
--- a/sound/mips/snd-n64.c
+++ b/sound/mips/snd-n64.c
@@ -338,6 +338,10 @@ static int __init n64audio_probe(struct platform_device *pdev)
 	strcpy(card->longname, "N64 Audio");
 
 	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+	if (!res) {
+		err = -EINVAL;
+		goto fail_dma_alloc;
+	}
 	if (devm_request_irq(&pdev->dev, res->start, n64audio_isr,
 				IRQF_SHARED, "N64 Audio", priv)) {
 		err = -EBUSY;
-- 
2.30.2


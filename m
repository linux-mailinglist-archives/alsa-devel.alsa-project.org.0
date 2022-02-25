Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A57D24C4625
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:23:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 392C31ED7;
	Fri, 25 Feb 2022 14:22:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 392C31ED7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645795424;
	bh=Q4okMBwAoHe+CM9dWEK1eYwSgxVw9Rb51hAluDJ8/rc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b1lu94zhanQJ1y9LLHmtkMgmc8quxM7ctfZuwfC6sdpLz31opA2szKROolVzMQsvY
	 nU+EI0N1fbhXAoiXkfVHxbx8E9j4SrldE228ZQUIFc6bWEzEAopA5D9N6W0CqM17px
	 27tCtSNNfNwo8Y6JuoJGbAZxA6+35Jt6UCY75Eco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0B4FF80614;
	Fri, 25 Feb 2022 14:11:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEB13F80271; Fri, 25 Feb 2022 12:24:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29E8EF8012F
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 12:24:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29E8EF8012F
X-QQ-mid: bizesmtp79t1645788245t49j8khg
Received: from localhost.localdomain ( [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 25 Feb 2022 19:24:00 +0800 (CST)
X-QQ-SSF: 01400000002000C0F000000A0000000
X-QQ-FEAT: geCjBjpTnm6nZW6W2+e1/q58vY6DH81pScFqhQy7CQF522ZdEZ1R/hd3i/nDP
 9bNj0+q1XoLitfPhMytuSWuV/QE7ioTdsZfPlNSrT/xsx04CZq7JqnidPKcK/RYB6R9IOqQ
 B1+aS9IPnWWjCZM8UPw7saIUW0q+ASTmODMfx//MPl+HJUW2DaJKxGM0QGofwUbRqOgAreS
 ZecbB2w31GVdrjdAm1nHPQ9Or0fjOAMIcKJMgJqyLGAYJY6Vyv7O8YRtanbrV9gKxepZiqa
 XsfT4d0E/oandwpcxjbUW3lDkRAJQ1h+fXKfdy5Xo+14T0SyZl6rikxpaTge4kvgJmXpeXb
 y0L77S0J5FUakoc12SwnPnFZ5BY6VvkQgpYU0lIvymSN4NOAC8=
X-QQ-GoodBg: 1
From: Meng Tang <tangmeng@uniontech.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] sound/soc/amd: Use platform_get_irq_byname() to get the
 interrupt
Date: Fri, 25 Feb 2022 19:23:58 +0800
Message-Id: <20220225112358.19403-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Fri, 25 Feb 2022 14:11:19 +0100
Cc: Meng Tang <tangmeng@uniontech.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

platform_get_resource_byname(pdev, IORESOURCE_IRQ, ..) relies on static
allocation of IRQ resources in DT core code, this causes an issue
when using hierarchical interrupt domains using "interrupts" property
in the node as this bypasses the hierarchical setup and messes up the
irq chaining.

In preparation for removal of static setup of IRQ resource from DT core
code use platform_get_irq_byname().

Signed-off-by: Meng Tang <tangmeng@uniontech.com>
---
 sound/soc/amd/acp/acp-renoir.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index d06ad5ce7fec..d4deac821300 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -265,13 +265,10 @@ static int renoir_audio_probe(struct platform_device *pdev)
 	if (!adata->acp_base)
 		return -ENOMEM;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_IRQ, "acp_dai_irq");
-	if (!res) {
-		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
+	adata->i2s_irq = platform_get_irq_byname(pdev, "acp_dai_irq");
+	if (adata->i2s_irq < 0)
 		return -ENODEV;
-	}
 
-	adata->i2s_irq = res->start;
 	adata->dev = dev;
 	adata->dai_driver = acp_renoir_dai;
 	adata->num_dai = ARRAY_SIZE(acp_renoir_dai);
-- 
2.20.1




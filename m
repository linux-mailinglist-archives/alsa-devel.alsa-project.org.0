Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FEE1B2DDC
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 19:13:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BA8516D0;
	Tue, 21 Apr 2020 19:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BA8516D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587489219;
	bh=ujtJ5MWWM1gpHtl5QZvnWY0jmKDRN/oiua+7N/mE4ek=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JtXjbhg05DvTuq2w3Ps8R5sz1onRjtvdJBtjrU/OkOJQPSgmbJNs7+qcuBqYP8hqq
	 SLiLM7fLI+RQ1DGbmPjuS9IvtQMXmZYWRhfqQ2BW/rc00zs7lwkpTwebnkOAld2crC
	 xLuJxYLGtbVWp6MG80i0w3odAj0y5XQyEcHKu274=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93DD2F80143;
	Tue, 21 Apr 2020 19:11:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 704E9F801EC; Tue, 21 Apr 2020 19:11:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0D92F8012F
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 19:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0D92F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="BRO4OCuu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=xMLWV9qUz2Kq+HU+SuvKkLN0sIi+JERmUN3FP8EgqbE=; b=BRO4OCuub7TidtMr0d3CfcsE0Q
 aBxPOLXKWRHjvySfrJwNZCX+Te/X8W39/uf6WP1e4upe0YrkJawzY097ZZk0ddaUJ49NQWFw0rYwt
 +UUKiloKolNzbWQnFlpMGF3JQhhJLUFy0S4ams3wgXP+6/Met8SmGBuhwR1o53+cD7feXlupTGLbP
 lQC5O+j5agK6bLaOUwReoKejU25ml3Yq6ol7hqouTDrWi5JMpdAM+NN1cpM/f7Wr2j9uP9U5lFBEt
 b7T5bEhmIdjaTQQWrqlQlhskkUpwS8NgXPyMBXl8VII/YeAcPtoHkAtgbtgoG8rPHJja44p9Jt2GK
 ULHh2syA==;
Received: from [2001:4bb8:191:e12c:c70:4a89:bc61:3] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQwQu-0002rT-PC; Tue, 21 Apr 2020 17:11:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: tsbogend@alpha.franken.de
Subject: [PATCH] ASoC: txx9: add back the hack for a too small resource_size_t
Date: Tue, 21 Apr 2020 19:11:36 +0200
Message-Id: <20200421171136.288216-1-hch@lst.de>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, linux-mips@vger.kernel.org
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

Looks like I misread the Kconfig magic and this driver can be compiled
into 32-bit kernels.  Add back the hack to extent the range of the
resource_size_t, and include the header with the txx9-specific ioremap
magic for that.

Fixes: acfaaf52ebfd ("ASoC: txx9: don't work around too small resource_size_t")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 sound/soc/txx9/txx9aclc-ac97.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/txx9/txx9aclc-ac97.c b/sound/soc/txx9/txx9aclc-ac97.c
index 7402448bdb09..d9e348444bd0 100644
--- a/sound/soc/txx9/txx9aclc-ac97.c
+++ b/sound/soc/txx9/txx9aclc-ac97.c
@@ -14,6 +14,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/gfp.h>
+#include <asm/mach-tx39xx/ioremap.h> /* for TXX9_DIRECTMAP_BASE */
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
@@ -175,8 +176,6 @@ static int txx9aclc_ac97_dev_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	BUILD_BUG_ON(sizeof(drvdata->physbase) > sizeof(r->start));
-
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
@@ -192,6 +191,10 @@ static int txx9aclc_ac97_dev_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, drvdata);
 	drvdata->physbase = r->start;
+	if (sizeof(drvdata->physbase) > sizeof(r->start) &&
+	    r->start >= TXX9_DIRECTMAP_BASE &&
+	    r->start < TXX9_DIRECTMAP_BASE + 0x400000)
+		drvdata->physbase |= 0xf00000000ull;
 	err = devm_request_irq(&pdev->dev, irq, txx9aclc_ac97_irq,
 			       0, dev_name(&pdev->dev), drvdata);
 	if (err < 0)
-- 
2.26.1


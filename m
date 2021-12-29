Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BF5480E0D
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 01:07:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AA2F16C0;
	Wed, 29 Dec 2021 01:06:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AA2F16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640736442;
	bh=V/lJylJTg4YM9FYcXGKKOACKyUM+Fr5OhX6M0O1XnBk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B2v34uEgG6qd/zGj+cBrFoCvGcS/nEgXUM+YONzA1r+dUu8oQRHu+Uzbty6c8MfKq
	 W6ZOKi0G2SIbY5p0kut4F8oM5X1h6l2/PXbpznycQjYt6WReljJ1zCJjxR08HFQ7SO
	 iZNdgFngssbjFcVZ21vHx3jz6rZmI7fRaIhIUA2o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4056F800D1;
	Wed, 29 Dec 2021 01:06:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8253EF80224; Wed, 29 Dec 2021 01:06:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86129F800D1
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 01:06:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86129F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="CYihfF7t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=p+8t8GMXlh3yCxmWJKyVKZavUzB1s6mehdcQbUgFZJw=; b=CYihfF7tg9nCiccnNGQ9HrdKvM
 PNTBIDaOf2pAYw3CawqlelF7GTAbwhNfI2ZdQAICFn4uzGUor9sKQgncfTfd9O0bVqfKjlVohyfM4
 fJESCZIEpqXbVJcRfwnjzwVWKuLg7YXp0s3yhhhaH1Bd3g9uv5bjMA1VAoy/4CK2jkPmUXCLO6LeY
 gtd5ZVchH2rgsmjAn+gchHpPZb6nhNjMTNm4bSzkQjd1woACpi2uOdD4MHxi5mIcR2ehLDDlrAqvX
 lnn1V7BiB8JoJVnMfc8Kzd+hEU0HnBmJqNdEMQFcI+uiCIlXXn8mXocRMsN0dm3vNQ3eObENGGyld
 nJ6FQ8Nw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2MTa-001zrq-HO; Wed, 29 Dec 2021 00:05:54 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH] mips: bcm63xx: add support for clk_set_parent()
Date: Tue, 28 Dec 2021 16:05:53 -0800
Message-Id: <20211229000553.32240-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Florian Fainelli <f.fainelli@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>,
 Paul Cercueil <paul@crapouillou.net>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, bcm-kernel-feedback-list@broadcom.com,
 Jonathan Cameron <jic23@kernel.org>
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

The MIPS BMC63XX subarch does not provide/support clk_set_parent().
This causes build errors in a few drivers, so add a simple implementation
of that function so that callers of it will build without errors.

Fixes these build errors:

ERROR: modpost: "clk_set_parent" [sound/soc/jz4740/snd-soc-jz4740-i2s.ko] undefined!
ERROR: modpost: "clk_set_parent" [sound/soc/atmel/snd-soc-atmel-i2s.ko] undefined!

Fixes: e7300d04bd08 ("MIPS: BCM63xx: Add support for the Broadcom BCM63xx family of SOCs." )
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 arch/mips/bcm63xx/clk.c |    6 ++++++
 1 file changed, 6 insertions(+)

--- linux-next-20211224.orig/arch/mips/bcm63xx/clk.c
+++ linux-next-20211224/arch/mips/bcm63xx/clk.c
@@ -387,6 +387,12 @@ struct clk *clk_get_parent(struct clk *c
 }
 EXPORT_SYMBOL(clk_get_parent);
 
+int clk_set_parent(struct clk *clk, struct clk *parent)
+{
+	return 0;
+}
+EXPORT_SYMBOL(clk_set_parent);
+
 unsigned long clk_get_rate(struct clk *clk)
 {
 	if (!clk)

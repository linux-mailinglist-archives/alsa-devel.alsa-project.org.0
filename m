Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B921FDBDB
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 03:15:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CACD81685;
	Thu, 18 Jun 2020 03:14:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CACD81685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592442923;
	bh=ZeP8K0zOh9XWf/M6ZeyFsdFt9/ZjTz/WXT7NJMGHJ0w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uII3DBcQqs7ezYXJsSNbHYGIJimRM9jeGgOxXTS/4iz209JfQHc2PNM5yy4yfO3ws
	 ++EkKrkwlzHeidp+HVmRfQ1eTpesj/Ee1pj7lsXnW4RMku23Qmzl4Qlcc2t477zb0F
	 iJNEDFfFbImgfnHsiaBlqCKTzYf9D1MfIVQYFAF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE50DF802FF;
	Thu, 18 Jun 2020 03:10:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24F5DF802BD; Thu, 18 Jun 2020 03:10:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5D5FF8028F
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 03:10:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5D5FF8028F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aCZxilbw"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 937F321974;
 Thu, 18 Jun 2020 01:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442613;
 bh=ZeP8K0zOh9XWf/M6ZeyFsdFt9/ZjTz/WXT7NJMGHJ0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aCZxilbwtxz18Z/u+R/SCS+fnsOc4+WeUA3Fe94ursURI6skcMPYo0e5I9PnThSoF
 4MzTalCn66s7PnSPQtbSUtprrZVPkrBEJ5cPEJo9WpokznXFtLnxWwaXzYxrFsGQrp
 fsOTBW9ML/GODNtnzuEPay0uq2FO2kplNUhZWMSo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 094/388] ASoC: meson: fix memory leak of links if
 allocation of ldata fails
Date: Wed, 17 Jun 2020 21:03:11 -0400
Message-Id: <20200618010805.600873-94-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 Colin Ian King <colin.king@canonical.com>,
 linux-arm-kernel@lists.infradead.org
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

From: Colin Ian King <colin.king@canonical.com>

[ Upstream commit 6e801dc411329aff592fbd48fb116183d0acdb00 ]

Currently if the allocation of ldata fails the error return path
does not kfree the allocated links object.  Fix this by adding
an error exit return path that performs the necessary kfree'ing.

Fixes: 7864a79f37b5 ("ASoC: meson: add axg sound card support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Addresses-Coverity: ("Resource leak")
Link: https://lore.kernel.org/r/20200604171216.60043-1-colin.king@canonical.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/meson/meson-card-utils.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index 2ca8c98e204f..5a4a91c88734 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -49,19 +49,26 @@ int meson_card_reallocate_links(struct snd_soc_card *card,
 	links = krealloc(priv->card.dai_link,
 			 num_links * sizeof(*priv->card.dai_link),
 			 GFP_KERNEL | __GFP_ZERO);
+	if (!links)
+		goto err_links;
+
 	ldata = krealloc(priv->link_data,
 			 num_links * sizeof(*priv->link_data),
 			 GFP_KERNEL | __GFP_ZERO);
-
-	if (!links || !ldata) {
-		dev_err(priv->card.dev, "failed to allocate links\n");
-		return -ENOMEM;
-	}
+	if (!ldata)
+		goto err_ldata;
 
 	priv->card.dai_link = links;
 	priv->link_data = ldata;
 	priv->card.num_links = num_links;
 	return 0;
+
+err_ldata:
+	kfree(links);
+err_links:
+	dev_err(priv->card.dev, "failed to allocate links\n");
+	return -ENOMEM;
+
 }
 EXPORT_SYMBOL_GPL(meson_card_reallocate_links);
 
-- 
2.25.1


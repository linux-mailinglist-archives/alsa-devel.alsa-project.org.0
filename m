Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C9789F72
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 15:18:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC0161669;
	Mon, 12 Aug 2019 15:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC0161669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565615933;
	bh=304l7nZJbcKtprkXkSGVdhe+v0NJGzhkIn7CVaaakBk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gg/OwXJjcI3M9xP0fQ+FbhUmRHKCn5li+J2uzgamso2X7xvxljrcG2aXMlcZ8B/6l
	 CMz3ry2t35JGAJusu/Wf0qHOKT6GnX75K9K+qWkHdyUq4+umBJuXsBJqLuZ/OuLUXh
	 RrQa+biJXHfX7zig6HRWqT7LVIrWYjD3n1TFQ/Bk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFDF3F805AA;
	Mon, 12 Aug 2019 15:15:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11C54F80268; Mon, 12 Aug 2019 15:10:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 523CAF80446
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 15:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 523CAF80446
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ktfWXSNR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=726K291caKRqeiB2KOs9bhqJM6YwCvuRpeAmBC8Mkio=; b=ktfWXSNR+l0P
 q5iJ5adjeOtLSykywMzb8U5/PwlMfF0qOvFzNeM4ApqXoF6j29TXCCdueFh6t6JBOQVmfX9mHexQr
 5zknyGi1AFf5SNP8+DxpGCR60/MDOGHEh9hFw80PZZbGO8ssAsyByjklT8qv6tw8qnmX0p46Pj2Dn
 7AXV8=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hxA5B-0001Mg-HX; Mon, 12 Aug 2019 13:09:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E77BF2740CBD; Mon, 12 Aug 2019 14:09:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190808143507.66788-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190812130952.E77BF2740CBD@ypsilon.sirena.org.uk>
Date: Mon, 12 Aug 2019 14:09:52 +0100 (BST)
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>, Mark Brown <broonie@kernel.org>,
 allison@lohutok.net
Subject: [alsa-devel] Applied "ASoC: max9850: remove unused variable
	'max9850_reg'" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: max9850: remove unused variable 'max9850_reg'

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From c86102a333f77dcd0f7ef20ba836c6f13f1a077a Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 8 Aug 2019 22:35:07 +0800
Subject: [PATCH] ASoC: max9850: remove unused variable 'max9850_reg'

sound/soc/codecs/max9850.c:31:33: warning:
 max9850_reg defined but not used [-Wunused-const-variable=]

It is not used since commit 068416620c0d ("ASoC:
max9850: Convert to direct regmap API usage")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190808143507.66788-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max9850.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/sound/soc/codecs/max9850.c b/sound/soc/codecs/max9850.c
index f50ee8f5fe93..6f43748f9239 100644
--- a/sound/soc/codecs/max9850.c
+++ b/sound/soc/codecs/max9850.c
@@ -27,19 +27,6 @@ struct max9850_priv {
 	unsigned int sysclk;
 };
 
-/* max9850 register cache */
-static const struct reg_default max9850_reg[] = {
-	{  2, 0x0c },
-	{  3, 0x00 },
-	{  4, 0x00 },
-	{  5, 0x00 },
-	{  6, 0x00 },
-	{  7, 0x00 },
-	{  8, 0x00 },
-	{  9, 0x00 },
-	{ 10, 0x00 },
-};
-
 /* these registers are not used at the moment but provided for the sake of
  * completeness */
 static bool max9850_volatile_register(struct device *dev, unsigned int reg)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE33C157AD
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 04:33:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6584818EB;
	Tue,  7 May 2019 04:32:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6584818EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557196404;
	bh=6NnB+mnYkNduhT0CrXufbMRots5mgHNwV6efZlv/+bc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ueBLrB5kdlAcrdq1+QRM+JNH/1k8VQv72SNtZc9qqRUZvV8YDdzqqcIef4h4fO629
	 pAyxE3gCHgZmaG7dAzk+J+UhCLfvrBCaX7SZjn5KhP2Ax9GyTOUqeyJG+kT6nBimpF
	 ERBofyY0RvDKOjVbEgKsEhZzJtca+cbB7605qK8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDE80F8972B;
	Tue,  7 May 2019 04:29:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2DC6F8972E; Tue,  7 May 2019 04:29:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 128F3F8972A
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 04:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 128F3F8972A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="rfA3IRgx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=phCyYc6+/oDWykNAAsC9mw8vfQxfKnt3DjDLiC3saao=; b=rfA3IRgxgQ3b
 EWkJhp8l7EWTJxTAlA1Ml6Akuyy18pmRPPOuhPW2zggsFxAc8n2b417Z9TlZavWlkcafpQiULs/DI
 h7LmJxkBj50T/fyaW72wOs3VmB8YpfZD8R2i9Ia/b2vqK4maHrsmelX3Yb7uN+DFhDCJMF+mLy+OK
 y3gR8=;
Received: from kd111239185057.au-net.ne.jp ([111.239.185.57]
 helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hNpqs-0003Rd-57; Tue, 07 May 2019 02:29:06 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 7CFD3440010; Tue,  7 May 2019 03:29:02 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@chromium.org>
In-Reply-To: <20190503193342.241330-1-cujomalainey@chromium.org>
X-Patchwork-Hint: ignore
Message-Id: <20190507022902.7CFD3440010@finisterre.sirena.org.uk>
Date: Tue,  7 May 2019 03:29:02 +0100 (BST)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>
Subject: [alsa-devel] Applied "ASoC: rt5677-spi: Rename driver to
	differentiate from main codec" to the asoc tree
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

   ASoC: rt5677-spi: Rename driver to differentiate from main codec

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From b9960f6ea22da072c2fb27305a1a51517c3643fe Mon Sep 17 00:00:00 2001
From: Curtis Malainey <cujomalainey@chromium.org>
Date: Fri, 3 May 2019 12:33:42 -0700
Subject: [PATCH] ASoC: rt5677-spi: Rename driver to differentiate from main
 codec

Currently the SPI driver and the main codec share the same name. This
will become confusing when looking up components when using both
drivers.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5677-spi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 167a02773a0b..1efc37ee625f 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -29,6 +29,8 @@
 
 #include "rt5677-spi.h"
 
+#define DRV_NAME "rt5677spi"
+
 #define RT5677_SPI_BURST_LEN	240
 #define RT5677_SPI_HEADER	5
 #define RT5677_SPI_FREQ		6000000
@@ -235,7 +237,7 @@ MODULE_DEVICE_TABLE(acpi, rt5677_spi_acpi_id);
 
 static struct spi_driver rt5677_spi_driver = {
 	.driver = {
-		.name = "rt5677",
+		.name = DRV_NAME,
 		.acpi_match_table = ACPI_PTR(rt5677_spi_acpi_id),
 	},
 	.probe = rt5677_spi_probe,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

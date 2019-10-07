Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5301CEB9D
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 20:16:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36C0D42;
	Mon,  7 Oct 2019 20:16:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36C0D42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570472215;
	bh=BHnsCsagyy9Ki+2LoVudoDIZHL4//C1D2nIWB23WcHc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Yz29u8edfxaVYwd0BDNlXjqflEW9SoT22hlZa/tmDRqsUIN86fG/6buIAA4bMVwYx
	 iP42Y8e1AM/8jPQThV5wBVMu86jee0Mi1zcRVqzXYSUL+nttJtYnikDmaIpmFioP5H
	 9aZyaEW+yMDdX4Des47lw25MncqBSINd9ZXi/osE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9CDCF800BF;
	Mon,  7 Oct 2019 20:13:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81708F80137; Mon,  7 Oct 2019 20:13:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3158F80137
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 20:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3158F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="JNe81tPr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=dlfa46lGCXB+/J0deOqs/W09rBlwYzs099ZfVzI+9RM=; b=JNe81tPrJrrH
 VkighFnutBYOUCjjUr2NKOzNc0lmT86d6oIAdhojEKNGH6z8dbbOsLJ5mFn9Nm+g3M6VF8sC0etWz
 GcyY17vAMPbIvUUh4iVmR7pRxyvbajIEnv7mSlVWF1oS/owSLzCbazZQoRkWIlXXbtG6sT9r35a/e
 hNl4c=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHXVe-0004GE-2f; Mon, 07 Oct 2019 18:13:26 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7EAD52741D8E; Mon,  7 Oct 2019 19:13:25 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
In-Reply-To: <20191007171157.17813-3-dmurphy@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20191007181325.7EAD52741D8E@ypsilon.sirena.org.uk>
Date: Mon,  7 Oct 2019 19:13:25 +0100 (BST)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, navada@ti.com, Mark Brown <broonie@kernel.org>,
 shifu0704@thundersoft.com
Subject: [alsa-devel] Applied "ASoc: tas2770: Remove unused defines and
	variables" to the asoc tree
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

   ASoc: tas2770: Remove unused defines and variables

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 40f90ef0a77bab65c8f959ba1d264bb674f7234b Mon Sep 17 00:00:00 2001
From: Dan Murphy <dmurphy@ti.com>
Date: Mon, 7 Oct 2019 12:11:57 -0500
Subject: [PATCH] ASoc: tas2770: Remove unused defines and variables

Remove unused defines and structure variables that are not
referenced by the code.  If these are needed for future
enhancements then they should be added at that time.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
Link: https://lore.kernel.org/r/20191007171157.17813-3-dmurphy@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tas2770.h | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/sound/soc/codecs/tas2770.h b/sound/soc/codecs/tas2770.h
index d597a8280707..cbb858369fe6 100644
--- a/sound/soc/codecs/tas2770.h
+++ b/sound/soc/codecs/tas2770.h
@@ -125,40 +125,19 @@
 #define ERROR_UNDER_VOLTAGE 0x0000008
 #define ERROR_BROWNOUT      0x0000010
 #define ERROR_CLASSD_PWR    0x0000020
-#define TAS2770_SLOT_16BIT  16
-#define TAS2770_SLOT_32BIT  32
-#define TAS2770_I2C_RETRY_COUNT      3
-
-struct tas2770_register {
-	int book;
-	int page;
-	int reg;
-};
-
-struct tas2770_dai_cfg {
-	unsigned int dai_fmt;
-	unsigned int tdm_delay;
-};
 
 struct tas2770_priv {
 	struct device *dev;
 	struct regmap *regmap;
-	struct snd_soc_codec *codec;
 	struct snd_soc_component *component;
-	struct mutex dev_lock;
-	struct hrtimer mtimer;
 	int power_state;
 	int asi_format;
 	struct gpio_desc *reset_gpio;
 	int sampling_rate;
-	int frame_size;
 	int channel_size;
 	int slot_width;
 	int v_sense_slot;
 	int i_sense_slot;
-	bool runtime_suspend;
-	unsigned int err_code;
-	struct mutex codec_lock;
 };
 
 #endif /* __TAS2770__ */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

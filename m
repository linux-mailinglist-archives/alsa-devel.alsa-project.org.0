Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A0D3003D
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2019 18:36:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1484A168F;
	Thu, 30 May 2019 18:35:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1484A168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559234208;
	bh=D6mMHWccv2UJ1lJLr8soKdxYwBrp2y6++NXri3GJDXY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=KOYYk/3JqrzU8kH3J1Tz7yJWyD8EW4voUfO6ZO0QVp9R+6ojidCozPDPLtI8mOWoN
	 xfAc/4Nn/kKHzZYJo8lSLUDZHSk6v5nrDEgMFEFt5i9aoqGq1hlQKofAbu0UQh4heL
	 /x3fraBmKkIBJKbOoX1sP+yjz+gFZ8F57w2Q98l0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DE19F89734;
	Thu, 30 May 2019 18:33:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 222D7F8972F; Thu, 30 May 2019 18:33:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7D8DF8972B
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 18:33:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7D8DF8972B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="si+vzlTT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=egPd9XxsEJJSXQTaQpXe8PT5czP8iq91D62QCpvtFnk=; b=si+vzlTTy2V3
 X6CU60KA6cFwVigJyOZP9FSVsjhbJ68Z+ZFnLhtzpo/iK17KcJSnQgPjA1BY8iKXXKHJmW5JNvzb9
 eQTW5chvKT5Ei1zX3kIcc1N8AG3NgcW9udIR/ZH87NSOVG1mQ2wKwehzNBG8cjN7D8m489sXXgSd2
 7p8UE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hWNzO-0007GW-E2; Thu, 30 May 2019 16:33:14 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 9705E440046; Thu, 30 May 2019 17:33:13 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@chromium.org>
In-Reply-To: <20190529193048.14145-1-cujomalainey@chromium.org>
X-Patchwork-Hint: ignore
Message-Id: <20190530163313.9705E440046@finisterre.sirena.org.uk>
Date: Thu, 30 May 2019 17:33:13 +0100 (BST)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>
Subject: [alsa-devel] Applied "ASoC: rt5677: Add missing voice activation
	register definitions" to the asoc tree
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

   ASoC: rt5677: Add missing voice activation register definitions

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

From f499edf9fa90f184af9f457fd0912a788754af25 Mon Sep 17 00:00:00 2001
From: Curtis Malainey <cujomalainey@chromium.org>
Date: Wed, 29 May 2019 12:30:48 -0700
Subject: [PATCH] ASoC: rt5677: Add missing voice activation register
 definitions

Most of the voice activation definitions were missing, they will be
needed for when hotwording is added. Also the source bits are only 2
wide not 3 and needed to be corrected.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5677.h | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5677.h b/sound/soc/codecs/rt5677.h
index 11a2ffceec3b..076e5161d8da 100644
--- a/sound/soc/codecs/rt5677.h
+++ b/sound/soc/codecs/rt5677.h
@@ -1456,9 +1456,37 @@
 #define RT5677_I2S4_CLK_SEL_MASK		(0xf)
 #define RT5677_I2S4_CLK_SEL_SFT			0
 
+/* VAD Function Control 1 (0x9c) */
+#define RT5677_VAD_MIN_DUR_MASK			(0x3 << 13)
+#define RT5677_VAD_MIN_DUR_SFT			13
+#define RT5677_VAD_ADPCM_BYPASS			(1 << 10)
+#define RT5677_VAD_ADPCM_BYPASS_BIT		10
+#define RT5677_VAD_FG2ENC			(1 << 9)
+#define RT5677_VAD_FG2ENC_BIT			9
+#define RT5677_VAD_BUF_OW			(1 << 8)
+#define RT5677_VAD_BUF_OW_BIT			8
+#define RT5677_VAD_CLR_FLAG			(1 << 7)
+#define RT5677_VAD_CLR_FLAG_BIT			7
+#define RT5677_VAD_BUF_POP			(1 << 6)
+#define RT5677_VAD_BUF_POP_BIT			6
+#define RT5677_VAD_BUF_PUSH			(1 << 5)
+#define RT5677_VAD_BUF_PUSH_BIT			5
+#define RT5677_VAD_DET_ENABLE			(1 << 4)
+#define RT5677_VAD_DET_ENABLE_BIT		4
+#define RT5677_VAD_FUNC_ENABLE			(1 << 3)
+#define RT5677_VAD_FUNC_ENABLE_BIT		3
+#define RT5677_VAD_FUNC_RESET			(1 << 2)
+#define RT5677_VAD_FUNC_RESET_BIT		2
+
 /* VAD Function Control 4 (0x9f) */
-#define RT5677_VAD_SRC_MASK			(0x7 << 8)
+#define RT5677_VAD_OUT_SRC_RATE_MASK		(0x1 << 11)
+#define RT5677_VAD_OUT_SRC_RATE_SFT		11
+#define RT5677_VAD_OUT_SRC_MASK			(0x1 << 10)
+#define RT5677_VAD_OUT_SRC_SFT			10
+#define RT5677_VAD_SRC_MASK			(0x3 << 8)
 #define RT5677_VAD_SRC_SFT			8
+#define RT5677_VAD_LV_DIFF_MASK			(0xff << 0)
+#define RT5677_VAD_LV_DIFF_SFT			0
 
 /* DSP InBound Control (0xa3) */
 #define RT5677_IB01_SRC_MASK			(0x7 << 12)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

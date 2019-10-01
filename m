Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD5BC333B
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 13:46:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C158A1678;
	Tue,  1 Oct 2019 13:45:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C158A1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569930372;
	bh=9VEvfY+b14Tg89sQVbeNMebqaCxGFXAKJ+lTcTgqMdI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gTXSlnHX0rFVYvqgMR11eukwA2ApiBAyB1YTCQMXXtaifo/NdbxnOKZgOwPoTx70x
	 vn9gZ23uMnXLq9MqXZ1/nmNd/UsKrgrrwawDBa14wnJfpyUCv37o8rXZxqu+5Ujm9A
	 iZG1MQ6o/tw54kwuvAaaNe1LvUoEUiv28FWD8emE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90E93F80600;
	Tue,  1 Oct 2019 13:41:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3175CF80659; Tue,  1 Oct 2019 13:40:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA98CF805F8
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 13:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA98CF805F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ukEO4Ubf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=WERVSR+BAQJwf3PYWWyXu5R8XD5gifIGU8k5q5E4VGw=; b=ukEO4Ubfs4C5
 e1EtMwu3yNT9/lC1hpLzQoFaXSxdrgrdBa2Pzi2yVPVmti3JfFiBgAESsr49bHkXbEIUqnP9Vr1Bm
 XQ1uPFV8VeDkyRKhKv+GQ5kaxYZ+WjMfvoeb7ReGSUTWi8m9lMwbxPP6SwbRDtSXBbQvkkZK1D/tS
 yIXBU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFGWN-0004Sz-Tb; Tue, 01 Oct 2019 11:40:47 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6CF3527429C0; Tue,  1 Oct 2019 12:40:47 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Colin Ian King <colin.king@canonical.com>
In-Reply-To: <20190925111023.7771-1-colin.king@canonical.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001114047.6CF3527429C0@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 12:40:47 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] Applied "ASoC: wcd9335: clean up indentation issue" to
	the asoc tree
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

   ASoC: wcd9335: clean up indentation issue

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

From 944eedd8c021893d08d02a8eec8e5161327316cd Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 25 Sep 2019 12:10:23 +0100
Subject: [PATCH] ASoC: wcd9335: clean up indentation issue

There is an if statement that is indented one level too deeply,
remove the extraneous tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Link: https://lore.kernel.org/r/20190925111023.7771-1-colin.king@canonical.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wcd9335.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index f318403133e9..f11ffa28683b 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -2837,11 +2837,11 @@ static int wcd9335_codec_enable_dec(struct snd_soc_dapm_widget *w,
 				   TX_HPF_CUT_OFF_FREQ_MASK) >> 5;
 		snd_soc_component_update_bits(comp, tx_vol_ctl_reg, 0x10, 0x10);
 		snd_soc_component_update_bits(comp, dec_cfg_reg, 0x08, 0x00);
-			if (hpf_coff_freq != CF_MIN_3DB_150HZ) {
-				snd_soc_component_update_bits(comp, dec_cfg_reg,
-						    TX_HPF_CUT_OFF_FREQ_MASK,
-						    hpf_coff_freq << 5);
-			}
+		if (hpf_coff_freq != CF_MIN_3DB_150HZ) {
+			snd_soc_component_update_bits(comp, dec_cfg_reg,
+						      TX_HPF_CUT_OFF_FREQ_MASK,
+						      hpf_coff_freq << 5);
+		}
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		snd_soc_component_update_bits(comp, tx_vol_ctl_reg, 0x10, 0x00);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

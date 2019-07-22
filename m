Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C083F6FFD6
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 14:36:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D18D17A9;
	Mon, 22 Jul 2019 14:35:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D18D17A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563799000;
	bh=CITMrlmus0JmkrjrL14DpSSIaVzyB/Xhg31Z9GkdDcw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=fQLEFJW9Bd6T9cFdGbCzlaw2Vxa7qxJG19nMpFHU++Oq/F7WGhvBBVGCa09WnrWq/
	 yyixBNZPupP3X2NEzsEjx431SV5lUYZgR2wZKG8lkO1wfW22Gpn4kGFG45bJvYC17F
	 EGhiJMejXHQmw+cIda87d/KTH9evKqZbH3EH+TWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E015BF803D6;
	Mon, 22 Jul 2019 14:23:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45B02F803D7; Mon, 22 Jul 2019 14:22:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 471EDF803D5
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 14:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 471EDF803D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="RboBkKS4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=9h4twfMse+bpRdSQEbk2Fkn3CfXBXCZxKLlK6NUxSIw=; b=RboBkKS4GOdY
 ufyFR4x+qnoRNAITBEszT10BFTm0/570Cp/M13jaPW6456e8h23orAj40KLXlrydLBXXojEB6yaFa
 9s1PNf/21OdvzeCy7h0ZoSPd1Huo3S2JwPbXEb+gVkohsyu8U+P2FsHpLZXRVscr35aOoGV/B7zgI
 sOPM8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpXKT-0007dZ-Vh; Mon, 22 Jul 2019 12:22:10 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6CBB02740463; Mon, 22 Jul 2019 13:22:09 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Joe Perches <joe@perches.com>
In-Reply-To: <92e31a9f321fe731d428ec3ec9d4654ea8a16d1b.1562734889.git.joe@perches.com>
X-Patchwork-Hint: ignore
Message-Id: <20190722122209.6CBB02740463@ypsilon.sirena.org.uk>
Date: Mon, 22 Jul 2019 13:22:09 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: [alsa-devel] Applied "ASoC: wcd9335: Fix misuse of GENMASK macro"
	to the asoc tree
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

   ASoC: wcd9335: Fix misuse of GENMASK macro

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

From f7408a3d5b5fd10571a653d1a81ce9167c62727f Mon Sep 17 00:00:00 2001
From: Joe Perches <joe@perches.com>
Date: Tue, 9 Jul 2019 22:04:25 -0700
Subject: [PATCH] ASoC: wcd9335: Fix misuse of GENMASK macro

Arguments are supposed to be ordered high then low.

Signed-off-by: Joe Perches <joe@perches.com>
Link: https://lore.kernel.org/r/92e31a9f321fe731d428ec3ec9d4654ea8a16d1b.1562734889.git.joe@perches.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wcd-clsh-v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd-clsh-v2.c b/sound/soc/codecs/wcd-clsh-v2.c
index c397d713f01a..cc5a9c9b918b 100644
--- a/sound/soc/codecs/wcd-clsh-v2.c
+++ b/sound/soc/codecs/wcd-clsh-v2.c
@@ -65,7 +65,7 @@ struct wcd_clsh_ctrl {
 #define WCD9XXX_FLYBACK_EN_PWDN_WITH_DELAY			0
 #define WCD9XXX_RX_BIAS_FLYB_BUFF			WCD9335_REG(0x6, 0xC7)
 #define WCD9XXX_RX_BIAS_FLYB_VNEG_5_UA_MASK		GENMASK(7, 4)
-#define WCD9XXX_RX_BIAS_FLYB_VPOS_5_UA_MASK		GENMASK(0, 3)
+#define WCD9XXX_RX_BIAS_FLYB_VPOS_5_UA_MASK		GENMASK(3, 0)
 #define WCD9XXX_HPH_L_EN				WCD9335_REG(0x6, 0xD3)
 #define WCD9XXX_HPH_CONST_SEL_L_MASK			GENMASK(7, 3)
 #define WCD9XXX_HPH_CONST_SEL_BYPASS			0
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

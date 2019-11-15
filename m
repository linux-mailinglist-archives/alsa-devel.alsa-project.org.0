Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9A8FDDD5
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 13:28:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 868A5165E;
	Fri, 15 Nov 2019 13:27:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 868A5165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573820905;
	bh=HN63BBMRmJdapNyKEiJM3IMNvNczvI3DI6JRWt1KfwI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CoLWNPbhxe1bpbwui85NjbsuXmjeh6xQnTlG5QcfJP87//2GzObInpBh/efUQe9qt
	 fnDSh66keUOErpqtIHjA/dz4DZ+q8er8gklSyEmXBkcOMNyGcZAaa40A1IVT9NdyIi
	 p6u/4iDgGVoLq+2sGMW1dF8Bd9scg1ef4JPo7Ri8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37789F8010C;
	Fri, 15 Nov 2019 13:25:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50E0CF80115; Fri, 15 Nov 2019 13:25:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 065DDF80105
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 13:25:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 065DDF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="QRjZC54+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=QOB4aMRlgA+LHKRMvAHsPw0xC2j4uos8racGtXtSIPM=; b=QRjZC54+TxAG
 NV68fYvIXO4BEmmvUtJZSYpIBaTXhzxRh+nI/Z5UpnFWc9F5WYIfMtJuImGckXCMrf9iP6fRqhvry
 ZCAQLmQCMG6h2r2ZXXMsUzgm7zYjaN+Dg4SSOawhe8PDgmYYNhF5v+Ch4rlrlC/F+J2GYux0OeaVx
 Cbr2U=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iVaer-0000Jn-E4; Fri, 15 Nov 2019 12:25:01 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id DC9EA27429B4; Fri, 15 Nov 2019 12:25:00 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r22c4lub.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191115122500.DC9EA27429B4@ypsilon.sirena.org.uk>
Date: Fri, 15 Nov 2019 12:25:00 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: call snd_soc_dapm_shutdown()
	at soc_cleanup_card_resources()" to the asoc tree
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

   ASoC: soc-core: call snd_soc_dapm_shutdown() at soc_cleanup_card_resources()

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

From 2a6f0892bda954dc2688b002060093ee0fe38528 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 13 Nov 2019 10:16:29 +0900
Subject: [PATCH] ASoC: soc-core: call snd_soc_dapm_shutdown() at
 soc_cleanup_card_resources()

It is easy to read code if it is cleanly using paired function/naming,
like start <-> stop, register <-> unregister, etc, etc.
But, current ALSA SoC code is very random, unbalance, not paired, etc.
It is easy to create bug at the such code, and it will be difficult to
debug.

snd_soc_bind_card() is calling snd_soc_dapm_init() for both
card and component.
Let's call paired snd_soc_dapm_shutdown() at paired
soc_cleanup_card_resources().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87r22c4lub.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 92260a9569a2..216000ae3e20 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1953,6 +1953,8 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 		card->snd_card = NULL;
 	}
 
+	snd_soc_dapm_shutdown(card);
+
 	/* remove and free each DAI */
 	soc_remove_link_dais(card);
 
@@ -2389,7 +2391,6 @@ static void snd_soc_unbind_card(struct snd_soc_card *card, bool unregister)
 {
 	if (card->instantiated) {
 		card->instantiated = false;
-		snd_soc_dapm_shutdown(card);
 		snd_soc_flush_all_delayed_work(card);
 
 		soc_cleanup_card_resources(card);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

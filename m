Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BB24B7BE
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 14:13:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B37A16BE;
	Wed, 19 Jun 2019 14:13:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B37A16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560946435;
	bh=YrXY5H27m9JyycOrN7uy9dvzcow+KSq4/uHNtFLohIQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CGjmuHJSuKiRXT1sAyemGQCpxRHSxXCa+P3F6aNU5BTGhQxx/xNBDA9cUpWrVK5o5
	 YDLgcKYyqxGcfXqO5g8E2W+hqJpVHSJHyJBOupSEkN/VHjZJfGWxGNNKafm1Wj+l2n
	 DuN3JPC34egN7oJW7thAU06BZ7iuGZu90Ln+RG5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3500FF89759;
	Wed, 19 Jun 2019 14:12:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4A5CF89740; Wed, 19 Jun 2019 14:12:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3B2BF80C87
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 14:12:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3B2BF80C87
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="G0GDGjJR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=3WGohTD06Npbqr+JmPV64+kBTyColbEyZ8DTSJYatSM=; b=G0GDGjJRrwV7
 BGjmhJTpCaCuM6UPx1d1t+VIvp6xPPKhW9kkFUcFMHIlhQMOcUuisixfPdGYti+t1vOvaC8flaLAB
 tZok4UeT3KtdWKtIwzHvdThwWW8Rq7dsAfAdmMfD1Zaofwiz8q4ECtz7i8AhZjVRHPdpGnOVbOj9P
 VwufI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdZRX-00078Q-J7; Wed, 19 Jun 2019 12:11:59 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id E355D440046; Wed, 19 Jun 2019 13:11:58 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: 
X-Patchwork-Hint: ignore
Message-Id: <20190619121158.E355D440046@finisterre.sirena.org.uk>
Date: Wed, 19 Jun 2019 13:11:58 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc.h: dobj is used only when
	SND_SOC_TOPOLOGY" to the asoc tree
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

   ASoC: soc.h: dobj is used only when SND_SOC_TOPOLOGY

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 9b3941a8fcdd77d9f17f36f48d84bf6f1ba1a0fb Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 19 Jun 2019 10:28:02 +0900
Subject: [PATCH] ASoC: soc.h: dobj is used only when SND_SOC_TOPOLOGY

snd_soc_dobj is used only when SND_SOC_TOPOLOGY was selected.
Let's enable it under SND_SOC_TOPOLOGY.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 64405cdab8bb..4dbfb21c14cf 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -990,7 +990,9 @@ struct snd_soc_dai_link {
 	unsigned int ignore:1;
 
 	struct list_head list; /* DAI link list of the soc card */
+#ifdef CONFIG_SND_SOC_TOPOLOGY
 	struct snd_soc_dobj dobj; /* For topology */
+#endif
 };
 #define for_each_link_codecs(link, i, codec)				\
 	for ((i) = 0;							\
@@ -1297,7 +1299,9 @@ struct soc_mixer_control {
 	unsigned int sign_bit;
 	unsigned int invert:1;
 	unsigned int autodisable:1;
+#ifdef CONFIG_SND_SOC_TOPOLOGY
 	struct snd_soc_dobj dobj;
+#endif
 };
 
 struct soc_bytes {
@@ -1308,8 +1312,9 @@ struct soc_bytes {
 
 struct soc_bytes_ext {
 	int max;
+#ifdef CONFIG_SND_SOC_TOPOLOGY
 	struct snd_soc_dobj dobj;
-
+#endif
 	/* used for TLV byte control */
 	int (*get)(struct snd_kcontrol *kcontrol, unsigned int __user *bytes,
 			unsigned int size);
@@ -1333,7 +1338,9 @@ struct soc_enum {
 	const char * const *texts;
 	const unsigned int *values;
 	unsigned int autodisable:1;
+#ifdef CONFIG_SND_SOC_TOPOLOGY
 	struct snd_soc_dobj dobj;
+#endif
 };
 
 /**
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

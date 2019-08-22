Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9023299EFB
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 20:39:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17C301616;
	Thu, 22 Aug 2019 20:38:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17C301616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566499146;
	bh=eyu797TxJzdcV3CktH181vV8lkYynBf22SClIeGwoos=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mkXxMZo7zrr749M1THio2RtZ3Nnh6TpDgnWVR9tIhUtbw81/RtvpNttxDkUmENA69
	 I/LWQiPV1qnUQaRqbZPKQgYNL2EHUmAoZnG55tlbut3w/lT2Ec1739zATfb10LKnek
	 eS+UlDQyTjZaXt8FzxK8GWfCy+UEhLBzcQ4dhpRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14F41F80391;
	Thu, 22 Aug 2019 20:33:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C89AF8036D; Thu, 22 Aug 2019 20:33:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F33E6F803D5
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 20:33:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F33E6F803D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="p1caDDbG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=iFZe39M67z/JmKu5jimKcVa3gqItd3KlkJf0UNsy4uk=; b=p1caDDbG0vtW
 U9GwFOb5dLwJkWFSbyJZUkGxWPs3YFZN1kqqH5g8iwP2ANIkS0xrN/RF1EmAWKt22wpGxOOj63Xru
 UXMrRZF9q9WumOBig27jJq82Yj00f/qT9gqvlnoW4PYnDq48jP8ojka1bdIXSBYzzPjjg7j7pvc7R
 mJbOk=;
Received: from 92.40.26.78.threembb.co.uk ([92.40.26.78]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i0rtR-0007fY-BW; Thu, 22 Aug 2019 18:33:05 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 02AD2D02CD3; Thu, 22 Aug 2019 19:32:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874l2c1ldi.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190822183257.02AD2D02CD3@fitzroy.sirena.org.uk>
Date: Thu, 22 Aug 2019 19:32:57 +0100 (BST)
Cc: Sridharan@sirena.org.uk, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Ranjani <ranjani.sridharan@intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: add NOTE to
	snd_soc_rtdcom_lookup()" to the asoc tree
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

   ASoC: soc-core: add NOTE to snd_soc_rtdcom_lookup()

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

From a33c0d166cc5bcb3b9718649b84974216709acb1 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 20 Aug 2019 14:05:02 +0900
Subject: [PATCH] ASoC: soc-core: add NOTE to snd_soc_rtdcom_lookup()

We can find specified name component via snd_soc_rtdcom_lookup().
But, it is not enough under multi CPU/Codec/Platform, because many
components which have same driver name might be connected to same rtd.

Not using this function as much as possible is best solution,
but some drivers are already deeply depended to it.

We can expand this function, for example having "num" which specifies
found order at parameter, etc (In such case, it need to have fixed
probing order).
Or, use different driver name in such component, etc.

We will have such issue if multi CPU/Codec/Platform were supported.
To indicate it, this patch adds NOTE to this function.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/874l2c1ldi.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 3860d8521734..0ed6576bfef4 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -315,6 +315,14 @@ struct snd_soc_component *snd_soc_rtdcom_lookup(struct snd_soc_pcm_runtime *rtd,
 	if (!driver_name)
 		return NULL;
 
+	/*
+	 * NOTE
+	 *
+	 * snd_soc_rtdcom_lookup() will find component from rtd by using
+	 * specified driver name.
+	 * But, if many components which have same driver name are connected
+	 * to 1 rtd, this function will return 1st found component.
+	 */
 	for_each_rtdcom(rtd, rtdcom) {
 		const char *component_name = rtdcom->component->driver->name;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

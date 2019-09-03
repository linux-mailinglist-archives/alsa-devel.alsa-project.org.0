Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F363DA67F1
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2019 13:59:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97C2E1682;
	Tue,  3 Sep 2019 13:58:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97C2E1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567511971;
	bh=HL/FRwnaybmHeBgyOkvrlzYIyt6PrGI7RA3ay9uPhrM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=lmrwM7GH/VypC36cQPISUahDx7GRet8G4L1m/KlHamyO+cC06N5kR84QTlwwclVwN
	 EgGckYcEDLU/x9/KCyBi6mgMjVO4qgqG1FOwEOCEDmbmeYLmq8ANqV6EEOjeJS8fvt
	 1tyMxj89Vxe9Rt7N/PUUxb9PYajmLfpJzx8IrsYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9139DF8045F;
	Tue,  3 Sep 2019 13:57:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0654F8011E; Tue,  3 Sep 2019 13:57:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FF95F803D7
 for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2019 13:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FF95F803D7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="SVsuZ9ij"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=feqR13iLTK93ThZ0dqKPmkCbd1pVHNXg2Y/qIxMSMvE=; b=SVsuZ9ij67kB
 i+tkwORc0g9NcYHjJNMa2DqgOrAG00ndgZsNHF3U2840o/Ugie3hOhpCpklI7kQWbc3Q6oN1JlYNx
 zlySh5Zgtl7FOqTiJocROEC/NmQOeVEwXjw6Z2G6BNtd9k5q/SSsl0LFJ2acKaUMpbRFcipQEN/jb
 hk5rI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i57RK-0008Lb-Qn; Tue, 03 Sep 2019 11:57:38 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2AEBE2742D39; Tue,  3 Sep 2019 12:57:38 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tv9tu75x.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190903115738.2AEBE2742D39@ypsilon.sirena.org.uk>
Date: Tue,  3 Sep 2019 12:57:38 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: simple-card: indicate rebind issue" to
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

   ASoC: simple-card: indicate rebind issue

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

From 39c66b6ef6f3aaf5bac61555db70ffb2864161c6 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 3 Sep 2019 17:15:54 +0900
Subject: [PATCH] ASoC: simple-card: indicate rebind issue

ALSA SoC try to rebind Sound Card if Card/CPU/Codec/Platform
were unbinded and re-binded again.
But, Simple Card might can't rebind again if user do for example

	unbind CPU or Codec driver
	bind   CPU or Codec driver

Because Simple Card is still pointing old/unbinded
CPU or Codec driver's DAI name at dlc->dai_name.

To avoid this issue, it needs to alloc memory and keep DAI name
even though if CPU or Codec driver was unbinded.
Or, always do unbind/bind at Sound Card.

For now, this patch indicates this issue as FIXME.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87tv9tu75x.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/generic/simple-card.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 0eac3bcb9736..fc9c753db8dd 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -46,7 +46,25 @@ static int asoc_simple_parse_dai(struct device_node *node,
 	if (ret)
 		return ret;
 
-	/* Get dai->name */
+	/*
+	 * FIXME
+	 *
+	 * Here, dlc->dai_name is pointer to CPU/Codec DAI name.
+	 * If user unbinded CPU or Codec driver, but not for Sound Card,
+	 * dlc->dai_name is keeping unbinded CPU or Codec
+	 * driver's pointer.
+	 *
+	 * If user re-bind CPU or Codec driver again, ALSA SoC will try
+	 * to rebind Card via snd_soc_try_rebind_card(), but because of
+	 * above reason, it might can't bind Sound Card.
+	 * Because Sound Card is pointing to released dai_name pointer.
+	 *
+	 * To avoid this rebind Card issue,
+	 * 1) It needs to alloc memory to keep dai_name eventhough
+	 *    CPU or Codec driver was unbinded, or
+	 * 2) user need to rebind Sound Card everytime
+	 *    if he unbinded CPU or Codec.
+	 */
 	ret = snd_soc_of_get_dai_name(node, &dlc->dai_name);
 	if (ret < 0)
 		return ret;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

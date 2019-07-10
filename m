Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BADEA649DA
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 17:40:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51E6F1695;
	Wed, 10 Jul 2019 17:39:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51E6F1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562773237;
	bh=iV7Rx/hHOPmpDRDkrbKAwmrNTSoK/Ha1rHDzMljTapg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=iBxtHO0WCj7Q/1U+6TNIDBVDPJ1RpLyYwsTdzm7kQbbhyca3god0pcnwT/6UPbXiC
	 /cG/72gjq1lT3ef8CsbV4SOddo85uu4/CKWxyc9ElwSAMRnL9DNw1eoju/RZs3yJDr
	 s3IIny8V+M/bJYC70QoT/xCIN9NgxfXdcqjCl9R0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52D0DF803A6;
	Wed, 10 Jul 2019 17:35:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8E1CF8036A; Wed, 10 Jul 2019 17:34:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDAE5F80321
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 17:34:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDAE5F80321
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="S7FySVjt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=denYDrjvA4bYgY1cJ+m3/UL/39v/KfvpB7zH8JzvWVM=; b=S7FySVjtsNJW
 nDiCTM/6C2IXZB9/VGYN/q9J4uX2hIk7iMUL0GbEdQVIndF07CyKUobfJyZD7q2/sv3vtcMcJLzOG
 w1FHQl5RA0aX1tVPp1JGBtONq01NYz/GeQnQPmxZi5aRuLwZIKcnUc5hRUqcZMU35T1WBZWWlduQw
 SJGgk=;
Received: from [217.140.106.53] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hlEcL-00083C-H5; Wed, 10 Jul 2019 15:34:49 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 3C6F5D02D8E; Wed, 10 Jul 2019 16:34:49 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o922gw4u.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190710153449.3C6F5D02D8E@fitzroy.sirena.org.uk>
Date: Wed, 10 Jul 2019 16:34:49 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: simple_card_utils.h: care NULL dai at
	asoc_simple_debug_dai()" to the asoc tree
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

   ASoC: simple_card_utils.h: care NULL dai at asoc_simple_debug_dai()

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

From 52db6685932e326ed607644ab7ebdae8c194adda Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 10 Jul 2019 16:59:55 +0900
Subject: [PATCH] ASoC: simple_card_utils.h: care NULL dai at
 asoc_simple_debug_dai()

props->xxx_dai might be NULL when DPCM.
This patch cares it for debug.

Fixes: commit 0580dde59438 ("ASoC: simple-card-utils: add asoc_simple_debug_info()")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87o922gw4u.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/simple_card_utils.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 954563ee2277..985a5f583de4 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -141,6 +141,10 @@ inline void asoc_simple_debug_dai(struct asoc_simple_priv *priv,
 {
 	struct device *dev = simple_priv_to_dev(priv);
 
+	/* dai might be NULL */
+	if (!dai)
+		return;
+
 	if (dai->name)
 		dev_dbg(dev, "%s dai name = %s\n",
 			name, dai->name);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

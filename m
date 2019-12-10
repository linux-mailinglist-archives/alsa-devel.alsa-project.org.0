Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB7E118A0A
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 14:39:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAC651615;
	Tue, 10 Dec 2019 14:39:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAC651615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575985198;
	bh=LrO+vKe7ZZSl0Q5KGBHEUp3qB9kPAAEY4U4xWjw5st8=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=PDcYFwMcMPqALq8oBT6FFds2uaAlGnA/yXiovRyWkcSQfdM1A4bd+Zx4Bop7mjiA7
	 a9IzU1/bwI7V0od0bES1MHFUOcq1ZfQ7GC+HTleZxxtIAH65g/cfR2Ti0CXxw2q42c
	 NhhDxL0unJ2eXQGDF10aSnpsBFAgLHn2kKYocb2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28799F8037D;
	Tue, 10 Dec 2019 14:23:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB18DF80369; Tue, 10 Dec 2019 14:23:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E841DF80362
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:23:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E841DF80362
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6ECA61396;
 Tue, 10 Dec 2019 05:23:35 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E387D3F52E;
 Tue, 10 Dec 2019 05:23:34 -0800 (PST)
Date: Tue, 10 Dec 2019 13:23:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20191209135353.17427-1-daniel.baluta@nxp.com>
Message-Id: <applied-20191209135353.17427-1-daniel.baluta@nxp.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [alsa-devel] Applied "ASoC: simple-card: Don't create separate link
	when platform is present" to the asoc tree
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

   ASoC: simple-card: Don't create separate link when platform is present

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

From 5525cf07d15f7c7eab619707627c31aa8e39dff1 Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Mon, 9 Dec 2019 15:53:53 +0200
Subject: [PATCH] ASoC: simple-card: Don't create separate link when platform
 is present

In normal sound case all DAIs are detected as CPU-Codec.
simple_dai_link_of supports the presence of a platform but it counts
it as a CPU DAI resulting in the creation of an extra link.

Adding a platform property to a link description like:

simple-audio-card,dai-link {
	cpu {
		sound-dai = <&sai1>;
	};
	plat {
		sound-dai = <&dsp>;
	};
	codec {
		sound-dai = <&wm8960>;
	}

will result in the creation of two links:
	* sai1 <-> wm8960
	* dsp  <-> wm8960

which is obviously not what we want. We just want one single link
with:
	* sai1 <-> wm8960 (and platform set to dsp).

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/20191209135353.17427-1-daniel.baluta@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/generic/simple-card.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 10b82bf043d1..55e9f8800b3e 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -371,6 +371,7 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 	do {
 		struct asoc_simple_data adata;
 		struct device_node *codec;
+		struct device_node *plat;
 		struct device_node *np;
 		int num = of_get_child_count(node);
 
@@ -381,6 +382,9 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 			ret = -ENODEV;
 			goto error;
 		}
+		/* get platform */
+		plat = of_get_child_by_name(node, is_top ?
+					    PREFIX "plat" : "plat");
 
 		/* get convert-xxx property */
 		memset(&adata, 0, sizeof(adata));
@@ -389,6 +393,8 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 
 		/* loop for all CPU/Codec node */
 		for_each_child_of_node(node, np) {
+			if (plat == np)
+				continue;
 			/*
 			 * It is DPCM
 			 * if it has many CPUs,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

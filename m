Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0A95A201
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 19:12:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AC0B169E;
	Fri, 28 Jun 2019 19:11:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AC0B169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561741932;
	bh=LY5xoDu/kAVcDHGFKTUoIPCYzoXGxhoeSqrVkzWWXjI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=rXzGmpEX2WjGXl2t4OdnPMFzyYdOidwVuM7oLGeFvsgog1OwpB5jiZwlSQi0PJM0A
	 3beKWdOLzbux0ATTH134s4NgThgX5FAy+IF+6EvHcTbXSYbYIvnVN/hjxqSj7123dm
	 rCCxFuZo5ZqUkPyfCPq0mov73xN88na3y7tTdgws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E39DBF89798;
	Fri, 28 Jun 2019 18:57:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4E5EF89765; Fri, 28 Jun 2019 18:56:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A398F89736
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 18:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A398F89736
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="MjhOlbTy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=QiUR0XujXg5taNrS+kJdBiXuCJwBz6zcAxTFdLW8GE4=; b=MjhOlbTyn/1K
 zYqHgqDD+uRmXw1sFDNvpmJnqVZU3xF0eIhvcB6IPMcZdFG3vK6YIM3SwegiELG4LKqMzGeYdMBFs
 S6GAEK+b1bHRtp1z/npd23Z1X82HFSFTZKoTtCa6PmAHup5CEcQsXAAmIcRP5+h2JLMi4+D3dcdYs
 okSWI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hguAj-00078f-Bw; Fri, 28 Jun 2019 16:56:25 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id E7715440046; Fri, 28 Jun 2019 17:56:24 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875zoqv5wa.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190628165624.E7715440046@finisterre.sirena.org.uk>
Date: Fri, 28 Jun 2019 17:56:24 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: tegra: tegra_alc5632: consider
	CPU-Platform possibility" to the asoc tree
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

   ASoC: tegra: tegra_alc5632: consider CPU-Platform possibility

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

From bae05f2cbf9a8aeaed3408f35759cf1afae3c391 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 28 Jun 2019 10:48:40 +0900
Subject: [PATCH] ASoC: tegra: tegra_alc5632: consider CPU-Platform possibility

commit e7fc99e641da ("ASoC: tegra: tegra_alc5632: don't select unnecessary
Platform")

Current ALSA SoC avoid to add duplicate component to rtd,
and this driver was selecting CPU component as Platform component.
Thus, above patch removed Platform settings from this driver,
because it assumed these are same component.

But, some CPU driver is using generic DMAEngine, in such case, both
CPU component and Platform component will have same of_node/name.
In other words, there are some components which are different but
have same of_node/name.

In such case, Card driver definitely need to select Platform even
though it is same as CPU.
It is depends on CPU driver, but is difficult to know it from Card driver.
This patch reverts above patch.

Fixes: commit e7fc99e641da ("ASoC: tegra: tegra_alc5632: don't select unnecessary Platform")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra_alc5632.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index 8f689ef2110e..9e8b1497efd3 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -123,7 +123,8 @@ static int tegra_alc5632_asoc_init(struct snd_soc_pcm_runtime *rtd)
 
 SND_SOC_DAILINK_DEFS(pcm,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "alc5632-hifi")));
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "alc5632-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 static struct snd_soc_dai_link tegra_alc5632_dai = {
 	.name = "ALC5632",
@@ -194,6 +195,8 @@ static int tegra_alc5632_probe(struct platform_device *pdev)
 		goto err_put_codec_of_node;
 	}
 
+	tegra_alc5632_dai.platforms->of_node = tegra_alc5632_dai.cpus->of_node;
+
 	ret = tegra_asoc_utils_init(&alc5632->util_data, &pdev->dev);
 	if (ret)
 		goto err_put_cpu_of_node;
@@ -212,6 +215,7 @@ static int tegra_alc5632_probe(struct platform_device *pdev)
 err_put_cpu_of_node:
 	of_node_put(tegra_alc5632_dai.cpus->of_node);
 	tegra_alc5632_dai.cpus->of_node = NULL;
+	tegra_alc5632_dai.platforms->of_node = NULL;
 err_put_codec_of_node:
 	of_node_put(tegra_alc5632_dai.codecs->of_node);
 	tegra_alc5632_dai.codecs->of_node = NULL;
@@ -230,6 +234,7 @@ static int tegra_alc5632_remove(struct platform_device *pdev)
 
 	of_node_put(tegra_alc5632_dai.cpus->of_node);
 	tegra_alc5632_dai.cpus->of_node = NULL;
+	tegra_alc5632_dai.platforms->of_node = NULL;
 	of_node_put(tegra_alc5632_dai.codecs->of_node);
 	tegra_alc5632_dai.codecs->of_node = NULL;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

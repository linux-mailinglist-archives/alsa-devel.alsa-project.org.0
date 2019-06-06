Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0937138030
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:02:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AE5116E0;
	Fri,  7 Jun 2019 00:01:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AE5116E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559858548;
	bh=Fi5uY7+cxlPUsJujuWCwKFN5hlhSdAlX2fai+hTCv+Y=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gBjwWCghdqyag6CPlYyRCyVF2RxK/lhGdwM/dJM1PIws7WJPNo2M4M3Dpvax92pv9
	 JdIYXJ4g9kzdjANrvRYgAzSzwcfmmVkHttCkYIBLw2JfX9hUw/bCConDWVquAZ/pNq
	 md1Qf1cF0/Z9QQDkQ8KqXc4nkJ8pH0vzA0tE7Uxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DF21F897EB;
	Thu,  6 Jun 2019 23:29:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCC1DF8981F; Thu,  6 Jun 2019 23:27:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC237F89779
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC237F89779
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="LP8FvdWR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=rC8ZHvLN1YIytqHTV4XwcmSc5vAf1u377rP/REen58Q=; b=LP8FvdWRLj3E
 bxY/vILMgSgm3UL35bnBQlVo93HW6N6jEml1OUHq57eRK3M9jcSWAtd3NQ4vXuGpjg77sSAou6blS
 3Eh7E1VCI5L+UYTV9fbdbD9Vk859O2uTUsP2bPN21TzQS2bPRc1xiz/KNo0djbgMsz7I+T1rvHFRf
 0jsBw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYztx-0007Lp-EY; Thu, 06 Jun 2019 21:26:25 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id EEF31440046; Thu,  6 Jun 2019 22:26:24 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87muivgy4q.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212624.EEF31440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:24 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: qcom: apq8016_sbc: use modern dai_link
	style" to the asoc tree
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

   ASoC: qcom: apq8016_sbc: use modern dai_link style

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

From 98b232ca9e0e7fb0f3be80653f647c8ce369556d Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:17:04 +0900
Subject: [PATCH] ASoC: qcom: apq8016_sbc: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/apq8016_sbc.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 4b559932adc3..717542c61d04 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -126,6 +126,7 @@ static struct apq8016_sbc_data *apq8016_sbc_parse_of(struct snd_soc_card *card)
 	struct snd_soc_dai_link *link;
 	struct device_node *np, *codec, *cpu, *node  = dev->of_node;
 	struct apq8016_sbc_data *data;
+	struct snd_soc_dai_link_component *dlc;
 	int ret, num_links;
 
 	ret = snd_soc_of_parse_card_name(card, "qcom,model");
@@ -158,6 +159,16 @@ static struct apq8016_sbc_data *apq8016_sbc_parse_of(struct snd_soc_card *card)
 
 	link = data->dai_link;
 
+	dlc = devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
+	if (!dlc)
+		return ERR_PTR(-ENOMEM);
+
+	link->cpus	= &dlc[0];
+	link->platforms	= &dlc[1];
+
+	link->num_cpus		= 1;
+	link->num_platforms	= 1;
+
 	for_each_child_of_node(node, np) {
 		cpu = of_get_child_by_name(np, "cpu");
 		codec = of_get_child_by_name(np, "codec");
@@ -168,14 +179,14 @@ static struct apq8016_sbc_data *apq8016_sbc_parse_of(struct snd_soc_card *card)
 			goto error;
 		}
 
-		link->cpu_of_node = of_parse_phandle(cpu, "sound-dai", 0);
-		if (!link->cpu_of_node) {
+		link->cpus->of_node = of_parse_phandle(cpu, "sound-dai", 0);
+		if (!link->cpus->of_node) {
 			dev_err(card->dev, "error getting cpu phandle\n");
 			ret = -EINVAL;
 			goto error;
 		}
 
-		ret = snd_soc_of_get_dai_name(cpu, &link->cpu_dai_name);
+		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name);
 		if (ret) {
 			dev_err(card->dev, "error getting cpu dai name\n");
 			goto error;
@@ -188,7 +199,7 @@ static struct apq8016_sbc_data *apq8016_sbc_parse_of(struct snd_soc_card *card)
 			goto error;
 		}
 
-		link->platform_of_node = link->cpu_of_node;
+		link->platforms->of_node = link->cpus->of_node;
 		ret = of_property_read_string(np, "link-name", &link->name);
 		if (ret) {
 			dev_err(card->dev, "error getting codec dai_link name\n");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

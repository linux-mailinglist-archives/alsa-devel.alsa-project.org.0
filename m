Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C3615F859
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 22:00:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1FF31664;
	Fri, 14 Feb 2020 22:00:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1FF31664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581714055;
	bh=KviUh3piVBE31jW4MydhykcexrqGU84+uRBS86c5TQY=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gzdea3QuIAc1dvY6lz+gqVePL53oGBMHXEZAhZhpY7pPMOCrsiqzJTIs+BueUqYtF
	 pnhu5e4t21+GrAvYKzXX0pTE0K54j/HfX4bAMlXIr/RCSpOZmG1YB+aB6hHNuhOad/
	 i+vzb4jf4JujxN3yVsB6jnd874fmlgpkQ11kbV+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97E74F802A0;
	Fri, 14 Feb 2020 21:56:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E2A0F8029A; Fri, 14 Feb 2020 21:56:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E7E33F80290
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 21:56:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7E33F80290
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE26D30E;
 Fri, 14 Feb 2020 12:56:40 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 624433F68F;
 Fri, 14 Feb 2020 12:56:40 -0800 (PST)
Date: Fri, 14 Feb 2020 20:56:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20200214134704.342501-1-jbrunet@baylibre.com>
Message-Id: <applied-20200214134704.342501-1-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] Applied "ASoC: core: ensure component names are
	unique" to the asoc tree
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

   ASoC: core: ensure component names are unique

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

From b2354e4009a773c00054b964d937e1b81cb92078 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 14 Feb 2020 14:47:04 +0100
Subject: [PATCH] ASoC: core: ensure component names are unique

Make sure each ASoC component is registered with a unique name.
The component is derived from the device name. If a device registers more
than one component, the component names will be the same.

This usually brings up a warning about the debugfs directory creation of
the component since directory already exists.

In such case, start numbering the component of the device so the names
don't collide anymore.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20200214134704.342501-1-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 03b87427faa7..6a58a8f6e3c4 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2446,6 +2446,33 @@ static int snd_soc_register_dais(struct snd_soc_component *component,
 	return ret;
 }
 
+static char *snd_soc_component_unique_name(struct device *dev,
+					   struct snd_soc_component *component)
+{
+	struct snd_soc_component *pos;
+	int count = 0;
+	char *name, *unique;
+
+	name = fmt_single_name(dev, &component->id);
+	if (!name)
+		return name;
+
+	/* Count the number of components registred by the device */
+	for_each_component(pos) {
+		if (dev == pos->dev)
+			count++;
+	}
+
+	/* Keep naming as it is for the 1st component */
+	if (!count)
+		return name;
+
+	unique = devm_kasprintf(dev, GFP_KERNEL, "%s-%d", name, count);
+	devm_kfree(dev, name);
+
+	return unique;
+}
+
 static int snd_soc_component_initialize(struct snd_soc_component *component,
 	const struct snd_soc_component_driver *driver, struct device *dev)
 {
@@ -2454,7 +2481,7 @@ static int snd_soc_component_initialize(struct snd_soc_component *component,
 	INIT_LIST_HEAD(&component->card_list);
 	mutex_init(&component->io_mutex);
 
-	component->name = fmt_single_name(dev, &component->id);
+	component->name = snd_soc_component_unique_name(dev, component);
 	if (!component->name) {
 		dev_err(dev, "ASoC: Failed to allocate name\n");
 		return -ENOMEM;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

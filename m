Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F5E104205
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 18:23:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D69941742;
	Wed, 20 Nov 2019 18:22:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D69941742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574270599;
	bh=rlwmnStREPdtQgbv4QjBF5M9AQqLw7lXvbpKHCABZSI=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=kU9MtgXIXxw2yLH2T2ebFAGChLr/4mlM8+egoZYwZpOtv8hZpAbog/zx4Yl3CX9eT
	 QGahEUaAgpZxxPqBCBxtcjgQq6NCU/w+GTN9mKchUjP7EpcwqM8R6iaSG8iZwWreH8
	 5o2tUhpTKLjk0L7rqFeRAhTI1W4/04iNKKOVVwJk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2B04F801F8;
	Wed, 20 Nov 2019 18:18:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59665F80161; Wed, 20 Nov 2019 18:18:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 89C19F8015A
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 18:18:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89C19F8015A
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 857EF1063;
 Wed, 20 Nov 2019 09:18:14 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 054BD3F703;
 Wed, 20 Nov 2019 09:18:13 -0800 (PST)
Date: Wed, 20 Nov 2019 17:18:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20191119174933.25526-1-perex@perex.cz>
Message-Id: <applied-20191119174933.25526-1-perex@perex.cz>
X-Patchwork-Hint: ignore
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: add control components management" to
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

   ASoC: add control components management

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

From dc73d73aa7145f55412611f3eead1e85ae026785 Mon Sep 17 00:00:00 2001
From: Jaroslav Kysela <perex@perex.cz>
Date: Tue, 19 Nov 2019 18:49:32 +0100
Subject: [PATCH] ASoC: add control components management

This ASCII string can carry additional information about
soundcard components or configuration. Add the possibility
to set this string via the ASoC card.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20191119174933.25526-1-perex@perex.cz
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h  |  1 +
 sound/soc/soc-core.c | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index e0855dc08d30..bd943b5d7d45 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -982,6 +982,7 @@ struct snd_soc_card {
 	const char *name;
 	const char *long_name;
 	const char *driver_name;
+	const char *components;
 	char dmi_longname[80];
 	char topology_shortname[32];
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e3a53ef1db04..cc0ef0fcc005 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2108,6 +2108,19 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	soc_setup_card_name(card->snd_card->driver,
 			    card->driver_name, card->name, 1);
 
+	if (card->components) {
+		/* the current implementation of snd_component_add() accepts */
+		/* multiple components in the string separated by space, */
+		/* but the string collision (identical string) check might */
+		/* not work correctly */
+		ret = snd_component_add(card->snd_card, card->components);
+		if (ret < 0) {
+			dev_err(card->dev, "ASoC: %s snd_component_add() failed: %d\n",
+				card->name, ret);
+			goto probe_end;
+		}
+	}
+
 	if (card->late_probe) {
 		ret = card->late_probe(card);
 		if (ret < 0) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

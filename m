Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D159614684F
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 13:45:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D29AF1664;
	Thu, 23 Jan 2020 13:44:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D29AF1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579783520;
	bh=e3/HzhvwNpwgRiCFrVtj8DIfXct25zy1rTwPHRfUpUw=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=L1OvtU1nAxnJb58Ij7lBRa72obl7nJErG6/kR5bO1dAo7FVkJgwxCGACo10gVqpO2
	 SUg7Gx0S4Vcliekg+xC291iXxlgUsSioj+GSI0xEik6aSAyWxTwcy7eOlQRTwu0xma
	 ZXfGspZ9p+NGi2sJ81mZllQhAYFHiFQPdZuAXH/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32B58F80304;
	Thu, 23 Jan 2020 13:36:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77AF8F802EC; Thu, 23 Jan 2020 13:36:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 71230F802E7
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 13:36:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71230F802E7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD26D106F;
 Thu, 23 Jan 2020 04:36:23 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CBA83F6C4;
 Thu, 23 Jan 2020 04:36:23 -0800 (PST)
Date: Thu, 23 Jan 2020 12:36:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20200122104143.16725-1-ckeepax@opensource.cirrus.com>
Message-Id: <applied-20200122104143.16725-1-ckeepax@opensource.cirrus.com>
X-Patchwork-Hint: ignore
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
Subject: [alsa-devel] Applied "ASoC: madera: Correct DMIC only input hook
	ups" to the asoc tree
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

   ASoC: madera: Correct DMIC only input hook ups

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

From ca34fa860fd34b0b22ff829aeb51884429a3a753 Mon Sep 17 00:00:00 2001
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Wed, 22 Jan 2020 10:41:43 +0000
Subject: [PATCH] ASoC: madera: Correct DMIC only input hook ups

Both the data and clock should be connected to both the left and right
inputs for DMIC only inputs, add the missing routes.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20200122104143.16725-1-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs47l85.c | 6 ++++++
 sound/soc/codecs/cs47l90.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index a69311008134..33ecff45bd6e 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -2005,12 +2005,18 @@ static const struct snd_soc_dapm_route cs47l85_dapm_routes[] = {
 	{ "IN3R", NULL, "IN3R Mode" },
 
 	{ "IN4L", NULL, "DMICCLK4" },
+	{ "IN4L", NULL, "DMICDAT4" },
+	{ "IN4R", NULL, "DMICCLK4" },
 	{ "IN4R", NULL, "DMICDAT4" },
 
 	{ "IN5L", NULL, "DMICCLK5" },
+	{ "IN5L", NULL, "DMICDAT5" },
+	{ "IN5R", NULL, "DMICCLK5" },
 	{ "IN5R", NULL, "DMICDAT5" },
 
 	{ "IN6L", NULL, "DMICCLK6" },
+	{ "IN6L", NULL, "DMICDAT6" },
+	{ "IN6R", NULL, "DMICCLK6" },
 	{ "IN6R", NULL, "DMICDAT6" },
 
 	MADERA_MIXER_ROUTES("OUT1L", "HPOUT1L"),
diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 5448e4506741..16504d26dcf2 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -1935,12 +1935,18 @@ static const struct snd_soc_dapm_route cs47l90_dapm_routes[] = {
 	{ "IN2R", NULL, "IN2R Mode" },
 
 	{ "IN3L", NULL, "DMICCLK3" },
+	{ "IN3L", NULL, "DMICDAT3" },
+	{ "IN3R", NULL, "DMICCLK3" },
 	{ "IN3R", NULL, "DMICDAT3" },
 
 	{ "IN4L", NULL, "DMICCLK4" },
+	{ "IN4L", NULL, "DMICDAT4" },
+	{ "IN4R", NULL, "DMICCLK4" },
 	{ "IN4R", NULL, "DMICDAT4" },
 
 	{ "IN5L", NULL, "DMICCLK5" },
+	{ "IN5L", NULL, "DMICDAT5" },
+	{ "IN5R", NULL, "DMICCLK5" },
 	{ "IN5R", NULL, "DMICDAT5" },
 
 	MADERA_MIXER_ROUTES("OUT1L", "HPOUT1L"),
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

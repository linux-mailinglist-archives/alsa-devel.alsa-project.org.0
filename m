Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F04D0161D2C
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 23:08:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C4F115E5;
	Mon, 17 Feb 2020 23:07:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C4F115E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581977306;
	bh=s4MfkWBkTrbCl1kuQ+rgtQ1051/vqgVwEJRhNyVBe3o=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=PAt/wmVJYaQgKO82BOK1CsPP28aGj9wgUWthD+tAidGK4RDfmBlXhxGoaR1F9iHJp
	 WU7jQua5+MK3P4JXlVhJ5syzM8PCxqe3HJsHmiWAiF4RqSQKtJQHfMGEq30asZNebS
	 cjN/QnwzOtLNtGQlMlwVRfnWdLpn/KJlQoYWGc6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE022F8028B;
	Mon, 17 Feb 2020 23:04:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92A9FF8028E; Mon, 17 Feb 2020 23:04:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 9CE26F8028B
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 23:04:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CE26F8028B
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F24EA106F;
 Mon, 17 Feb 2020 14:04:13 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76E393F703;
 Mon, 17 Feb 2020 14:04:13 -0800 (PST)
Date: Mon, 17 Feb 2020 22:04:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Applied "ASoC: hdmi-codec: set plugged_cb to NULL when component
 removing" to the asoc tree
In-Reply-To: <20200217105513.1.Icc323daaf71ad02f191fd8d91136b01b61eca5e3@changeid>
Message-Id: <applied-20200217105513.1.Icc323daaf71ad02f191fd8d91136b01b61eca5e3@changeid>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tzungbi@google.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, matthias.bgg@gmail.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 daniel@ffwll.ch, ck.hu@mediatek.com, p.zabel@pengutronix.de, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: hdmi-codec: set plugged_cb to NULL when component removing

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

From 4aadf4b49ec7d80c5db842ca28479d07108c9484 Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 17 Feb 2020 11:16:52 +0800
Subject: [PATCH] ASoC: hdmi-codec: set plugged_cb to NULL when component
 removing

Sets plugged_cb to NULL when component removing to notify its consumers
: no further plugged status report is required.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20200217105513.1.Icc323daaf71ad02f191fd8d91136b01b61eca5e3@changeid
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/hdmi-codec.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 543363102d03..bc2903d27e6e 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -779,7 +779,17 @@ static int hdmi_of_xlate_dai_id(struct snd_soc_component *component,
 	return ret;
 }
 
+static void hdmi_remove(struct snd_soc_component *component)
+{
+	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
+
+	if (hcp->hcd.ops->hook_plugged_cb)
+		hcp->hcd.ops->hook_plugged_cb(component->dev->parent,
+					      hcp->hcd.data, NULL, NULL);
+}
+
 static const struct snd_soc_component_driver hdmi_driver = {
+	.remove			= hdmi_remove,
 	.dapm_widgets		= hdmi_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(hdmi_widgets),
 	.of_xlate_dai_id	= hdmi_of_xlate_dai_id,
-- 
2.20.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C411836A2
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 17:54:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1579F173A;
	Thu, 12 Mar 2020 17:53:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1579F173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584032059;
	bh=8NgqFcLoh0BxbM56rj/f9wx74WZzrJ/WT0KIO/7dVEc=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=epOXXyZZbIC88nD4gtE7KqbOpk+1nZDsOzWdrMko12PLDTrCW4UVB2AUUc/IGbxHO
	 5OPeovJXITAC2DgsREuYgbqdY3nZprciLgUN27wQWxoN9/lL68l7HJLUFtZXTh0DWF
	 sdRwsjRCVBI7ih0MT7/Z5LQV91GV5dvcDDwPlgbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 290CBF80086;
	Thu, 12 Mar 2020 17:52:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10274F8020C; Thu, 12 Mar 2020 17:52:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 MIME_8BIT_HEADER, SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 015F4F8013E
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 17:52:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 015F4F8013E
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48C6430E;
 Thu, 12 Mar 2020 09:52:30 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF3973F6CF;
 Thu, 12 Mar 2020 09:52:29 -0700 (PDT)
Date: Thu, 12 Mar 2020 16:52:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Subject: Applied "ASoC: topology: Perform component check upfront" to the asoc
 tree
In-Reply-To: <20200312122239.14489-1-amadeuszx.slawinski@linux.intel.com>
Message-Id: <applied-20200312122239.14489-1-amadeuszx.slawinski@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
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

   ASoC: topology: Perform component check upfront

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

From c42464a4e67383d8daeeaa668ff875e399a38105 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Date: Thu, 12 Mar 2020 08:22:39 -0400
Subject: [PATCH] ASoC: topology: Perform component check upfront
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Function soc_tplg_dbytes_create(), calls soc_tplg_init_kcontrol() to
perform additional driver specific initialization. While
soc_tplg_init_kcontrol() ensures that component is valid before invoking
ops->control_load, there is no such check at the end of
soc_tplg_dbytes_create() where list_add() is used.

Also in quite a few places, there is reference of tplg->comp->dapm or
tplg->comp->card, without any checks for tplg->comp.

In consequence of the above this may lead to referencing NULL pointer.

This allows for removal of now unnecessary checks.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/20200312122239.14489-1-amadeuszx.slawinski@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-topology.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 22c38df40d5a..c98766957c10 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -251,7 +251,7 @@ static int soc_tplg_vendor_load_(struct soc_tplg *tplg,
 {
 	int ret = 0;
 
-	if (tplg->comp && tplg->ops && tplg->ops->vendor_load)
+	if (tplg->ops && tplg->ops->vendor_load)
 		ret = tplg->ops->vendor_load(tplg->comp, tplg->index, hdr);
 	else {
 		dev_err(tplg->dev, "ASoC: no vendor load callback for ID %d\n",
@@ -283,7 +283,7 @@ static int soc_tplg_vendor_load(struct soc_tplg *tplg,
 static int soc_tplg_widget_load(struct soc_tplg *tplg,
 	struct snd_soc_dapm_widget *w, struct snd_soc_tplg_dapm_widget *tplg_w)
 {
-	if (tplg->comp && tplg->ops && tplg->ops->widget_load)
+	if (tplg->ops && tplg->ops->widget_load)
 		return tplg->ops->widget_load(tplg->comp, tplg->index, w,
 			tplg_w);
 
@@ -295,7 +295,7 @@ static int soc_tplg_widget_load(struct soc_tplg *tplg,
 static int soc_tplg_widget_ready(struct soc_tplg *tplg,
 	struct snd_soc_dapm_widget *w, struct snd_soc_tplg_dapm_widget *tplg_w)
 {
-	if (tplg->comp && tplg->ops && tplg->ops->widget_ready)
+	if (tplg->ops && tplg->ops->widget_ready)
 		return tplg->ops->widget_ready(tplg->comp, tplg->index, w,
 			tplg_w);
 
@@ -307,7 +307,7 @@ static int soc_tplg_dai_load(struct soc_tplg *tplg,
 	struct snd_soc_dai_driver *dai_drv,
 	struct snd_soc_tplg_pcm *pcm, struct snd_soc_dai *dai)
 {
-	if (tplg->comp && tplg->ops && tplg->ops->dai_load)
+	if (tplg->ops && tplg->ops->dai_load)
 		return tplg->ops->dai_load(tplg->comp, tplg->index, dai_drv,
 			pcm, dai);
 
@@ -318,7 +318,7 @@ static int soc_tplg_dai_load(struct soc_tplg *tplg,
 static int soc_tplg_dai_link_load(struct soc_tplg *tplg,
 	struct snd_soc_dai_link *link, struct snd_soc_tplg_link_config *cfg)
 {
-	if (tplg->comp && tplg->ops && tplg->ops->link_load)
+	if (tplg->ops && tplg->ops->link_load)
 		return tplg->ops->link_load(tplg->comp, tplg->index, link, cfg);
 
 	return 0;
@@ -327,7 +327,7 @@ static int soc_tplg_dai_link_load(struct soc_tplg *tplg,
 /* tell the component driver that all firmware has been loaded in this request */
 static void soc_tplg_complete(struct soc_tplg *tplg)
 {
-	if (tplg->comp && tplg->ops && tplg->ops->complete)
+	if (tplg->ops && tplg->ops->complete)
 		tplg->ops->complete(tplg->comp);
 }
 
@@ -684,7 +684,7 @@ EXPORT_SYMBOL_GPL(snd_soc_tplg_widget_bind_event);
 static int soc_tplg_init_kcontrol(struct soc_tplg *tplg,
 	struct snd_kcontrol_new *k, struct snd_soc_tplg_ctl_hdr *hdr)
 {
-	if (tplg->comp && tplg->ops && tplg->ops->control_load)
+	if (tplg->ops && tplg->ops->control_load)
 		return tplg->ops->control_load(tplg->comp, tplg->index, k,
 			hdr);
 
@@ -1174,7 +1174,7 @@ static int soc_tplg_kcontrol_elems_load(struct soc_tplg *tplg,
 static int soc_tplg_add_route(struct soc_tplg *tplg,
 	struct snd_soc_dapm_route *route)
 {
-	if (tplg->comp && tplg->ops && tplg->ops->dapm_route_load)
+	if (tplg->ops && tplg->ops->dapm_route_load)
 		return tplg->ops->dapm_route_load(tplg->comp, tplg->index,
 			route);
 
@@ -2563,7 +2563,7 @@ static int soc_tplg_manifest_load(struct soc_tplg *tplg,
 	}
 
 	/* pass control to component driver for optional further init */
-	if (tplg->comp && tplg->ops && tplg->ops->manifest)
+	if (tplg->ops && tplg->ops->manifest)
 		ret = tplg->ops->manifest(tplg->comp, tplg->index, _manifest);
 
 	if (!abi_match)	/* free the duplicated one */
@@ -2735,6 +2735,10 @@ int snd_soc_tplg_component_load(struct snd_soc_component *comp,
 	struct soc_tplg tplg;
 	int ret;
 
+	/* component needs to exist to keep and reference data while parsing */
+	if (!comp)
+		return -EINVAL;
+
 	/* setup parsing context */
 	memset(&tplg, 0, sizeof(tplg));
 	tplg.fw = fw;
-- 
2.20.1


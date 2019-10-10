Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17446D2C62
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 16:25:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A29371680;
	Thu, 10 Oct 2019 16:25:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A29371680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570717557;
	bh=ySnOfaFAGDr1HaA4XoMgZDs810wZtBOb2MIw9BzLW58=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=rsjm7YKOe3+8PpH61dmwUkhxFbCzW7ul9rnO7S6MvijVr9RFWxkFTBcl08wfPZYZ9
	 KSLXu+VrfH4EcA/WIaxvmudEO+YUrNgODTH01BZdEw/DKgh7xlyQGToFPX0sf5wkbl
	 nVQ+G6gSl52GxLRVNDP8V6hxZwhlXqw/vmQXoILE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2935CF80610;
	Thu, 10 Oct 2019 16:22:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16FCDF805FB; Thu, 10 Oct 2019 16:22:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F24C5F804CA
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 16:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F24C5F804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="vwtbLpND"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=v3l6NbZKSuoPRbUgwA3pYd8Lr3Gani+G3ec5vq6bYxk=; b=vwtbLpND8zj9
 w2Xu5n3j9xLo8RfS03+SxoG1FWBN+YPRgfZeceujpoqiCDDHsceTP8b+5BhE4RE2ec+tSyRs2f4oO
 cqkhu00l6/uHsBNpwr15aehl3gdLhFKO48kosDr8eRGeolEkMkQNmNB4iSo3xQUgGqJz88n4lMYGT
 oIbA8=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iIZKq-0001Zu-Aw; Thu, 10 Oct 2019 14:22:32 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id E9BB2D0003B; Thu, 10 Oct 2019 15:22:31 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jaska Uimonen <jaska.uimonen@linux.intel.com>
In-Reply-To: <20191008164443.1358-8-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191010142231.E9BB2D0003B@fitzroy.sirena.org.uk>
Date: Thu, 10 Oct 2019 15:22:31 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: enable dual control for pga" to
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

   ASoC: SOF: enable dual control for pga

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

From a68c6b6cc77b841dc37c17a5d9a7074e26801af5 Mon Sep 17 00:00:00 2001
From: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Date: Tue, 8 Oct 2019 11:44:41 -0500
Subject: [PATCH] ASoC: SOF: enable dual control for pga

Currently sof pga element supports only 1 kcontrol and you can't create
for example a mixer element with combined volume slider and mute switch.
So enable sof pga to have more than 1 kcontrol associated with it. Also
check for possible NULL tlv pointer as switch element might not have it.

Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191008164443.1358-8-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/topology.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 0aabb3190ddc..a0b1c38e666b 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1580,7 +1580,7 @@ static int sof_widget_load_pga(struct snd_soc_component *scomp, int index,
 	if (!volume)
 		return -ENOMEM;
 
-	if (le32_to_cpu(tw->num_kcontrols) != 1) {
+	if (!le32_to_cpu(tw->num_kcontrols)) {
 		dev_err(sdev->dev, "error: invalid kcontrol count %d for volume\n",
 			tw->num_kcontrols);
 		ret = -EINVAL;
@@ -1617,7 +1617,8 @@ static int sof_widget_load_pga(struct snd_soc_component *scomp, int index,
 	swidget->private = volume;
 
 	list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
-		if (scontrol->comp_id == swidget->comp_id) {
+		if (scontrol->comp_id == swidget->comp_id &&
+		    scontrol->volume_table) {
 			min_step = scontrol->min_volume_step;
 			max_step = scontrol->max_volume_step;
 			volume->min_value = scontrol->volume_table[min_step];
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

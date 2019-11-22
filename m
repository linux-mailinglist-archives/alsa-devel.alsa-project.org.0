Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF8D10682D
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 09:40:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B617B181A;
	Fri, 22 Nov 2019 09:39:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B617B181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574412017;
	bh=pf5Qg6ZtBXDTjmotHIZPmIxBdrIuJWkn6j1D7CZl07U=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XgleZYylQq2B40bXkJgWZ/tknJsJG6vK4ye4aGYM4QniTgxQX9HyasCMmaatL48CV
	 Mo7s94d2NqpEu7bZmI2tHnq9Ez6NG1Uxt2/mlAn2ExVBi3AyM2qpTMDL11KX4bXcRY
	 mjkWhZnVX4f2iEpDfmLCYvJRv/NN+7H3PUMVlOyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38433F80140;
	Fri, 22 Nov 2019 09:38:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64FC2F80140; Fri, 22 Nov 2019 09:38:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C4DDF800EF
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 09:38:27 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6E8ACA0040;
 Fri, 22 Nov 2019 09:38:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6E8ACA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1574411907; bh=tKfxXjLxc/azMmFKi7AvgQDSmEoQdd+O593sLsPgIQE=;
 h=From:To:Cc:Subject:Date:From;
 b=IyH9oGzgdORRYL0tgrsPjmAYq5sRdLOXlfnKgc0s8XCGMlaCPwbKvWVhgUnRnClQd
 EHHnlNPQR+UZoxug7k/zHW7rk6hsxF6o/FiDCiChOb0J3XMzXvGoVVLvpqhnkoTX84
 5Ix8NqEeCFCOO3e6QxX8WDMrza4yvFvoiHOtiQgw=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 22 Nov 2019 09:38:22 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Date: Fri, 22 Nov 2019 09:38:00 +0100
Message-Id: <20191122083800.9924-1-perex@perex.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: SOF - topology - do not change the link
	triger order for old firmare
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

BugLink: https://github.com/thesofproject/sof/issues/2102
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/topology.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 143b8259a70a..d24268794a03 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2935,6 +2935,7 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 	struct snd_soc_tplg_private *private = &cfg->priv;
 	struct sof_ipc_dai_config config;
 	struct snd_soc_tplg_hw_config *hw_config;
+	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
 	int num_hw_configs;
 	int ret;
 	int i = 0;
@@ -2952,9 +2953,12 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 	if (!link->no_pcm) {
 		link->nonatomic = true;
 
-		/* set trigger order */
-		link->trigger[0] = SND_SOC_DPCM_TRIGGER_POST;
-		link->trigger[1] = SND_SOC_DPCM_TRIGGER_POST;
+		/* this causes DSP panic on firmware v1.3 */
+		if (SOF_ABI_VER(v->major, v->minor, v->micro) > SOF_ABI_VER(3, 7, 0)) {
+			/* set trigger order */
+			link->trigger[0] = SND_SOC_DPCM_TRIGGER_POST;
+			link->trigger[1] = SND_SOC_DPCM_TRIGGER_POST;
+		}
 
 		/* nothing more to do for FE dai links */
 		return 0;
-- 
2.20.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

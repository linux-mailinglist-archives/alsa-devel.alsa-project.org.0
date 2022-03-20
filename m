Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 866E54E1A61
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Mar 2022 07:23:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1353416D9;
	Sun, 20 Mar 2022 07:22:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1353416D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647757427;
	bh=YmXEzMXdV/yx3DihvQSFjl7G2HFhGQoaBjuuxzrXDk0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cPqwkvE9cFQLJW369yVzUFi6qOqrySNraZK+hQd2U87wdjYS1HEl46NgDJGlovLzf
	 61s9gY4TLflX3ly8FrwtkNMwVIrQIqV3g9XE9lH8TeIGgnmF2g2ZI2nuE8NRHc3z0L
	 2ZwGTI0kBu3lbl2Va8mOW1doUe7CvjV7Q1jsave0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 898E9F80254;
	Sun, 20 Mar 2022 07:22:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA933F80155; Sun, 20 Mar 2022 07:22:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp09.smtpout.orange.fr
 [80.12.242.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0464F80054
 for <alsa-devel@alsa-project.org>; Sun, 20 Mar 2022 07:22:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0464F80054
Received: from pop-os.home ([90.126.236.122]) by smtp.orange.fr with ESMTPA
 id VoxRnDXVQAWDQVoxRnHo6V; Sun, 20 Mar 2022 07:22:31 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 20 Mar 2022 07:22:31 +0100
X-ME-IP: 90.126.236.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: SOF: topology: Avoid open coded arithmetic in memory
 allocation
Date: Sun, 20 Mar 2022 07:22:26 +0100
Message-Id: <3bbf03cfd1966bc6fb6dd0939e039fc161078a61.1647757329.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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

Use kcalloc() instead of kzalloc()+open coded multiplication.
This is safer and saves a few lines of code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/sof/topology.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 369693cc6d10..8e9d8e079d68 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1096,7 +1096,6 @@ static int sof_widget_parse_tokens(struct snd_soc_component *scomp, struct snd_s
 	const struct sof_token_info *token_list = ipc_tplg_ops->token_list;
 	struct snd_soc_tplg_private *private = &tw->priv;
 	int num_tuples = 0;
-	size_t size;
 	int ret, i;
 
 	if (count > 0 && !object_token_list) {
@@ -1109,8 +1108,7 @@ static int sof_widget_parse_tokens(struct snd_soc_component *scomp, struct snd_s
 		num_tuples += token_list[object_token_list[i]].count;
 
 	/* allocate memory for tuples array */
-	size = sizeof(struct snd_sof_tuple) * num_tuples;
-	swidget->tuples = kzalloc(size, GFP_KERNEL);
+	swidget->tuples = kcalloc(num_tuples, sizeof(*swidget->tuples), GFP_KERNEL);
 	if (!swidget->tuples)
 		return -ENOMEM;
 
@@ -1547,7 +1545,6 @@ static int sof_link_load(struct snd_soc_component *scomp, int index, struct snd_
 	const struct sof_token_info *token_list = ipc_tplg_ops->token_list;
 	struct snd_soc_tplg_private *private = &cfg->priv;
 	struct snd_sof_dai_link *slink;
-	size_t size;
 	u32 token_id = 0;
 	int num_tuples = 0;
 	int ret, num_sets;
@@ -1659,8 +1656,7 @@ static int sof_link_load(struct snd_soc_component *scomp, int index, struct snd_
 	}
 
 	/* allocate memory for tuples array */
-	size = sizeof(struct snd_sof_tuple) * num_tuples;
-	slink->tuples = kzalloc(size, GFP_KERNEL);
+	slink->tuples = kcalloc(num_tuples, sizeof(*slink->tuples), GFP_KERNEL);
 	if (!slink->tuples) {
 		kfree(slink->hw_configs);
 		kfree(slink);
-- 
2.32.0


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1418D59BD2C
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 11:53:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C958857;
	Mon, 22 Aug 2022 11:53:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C958857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661162036;
	bh=h7IIUsnhhr2IFdQ2ofa8qBmm7lv7dRJZSJR4udCx/Mg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zs+Y8NeqOXiT7PmKTZb6FJpxb/Ley3xBuoOrM4MR9k7BYXRu1AmC2SxFo8/Ngv4OU
	 cIHCZlHFZ54OUMkzFgfloN1h2A0YLoe/V+lp7JN+Gbi2SDoNz01tiXTant1xzUDSjW
	 C7AKB57aivgLwVygao4DDRgjqWqwCdg9cQm/FkCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E12DF800ED;
	Mon, 22 Aug 2022 11:52:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BB92F8026A; Mon, 22 Aug 2022 11:52:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A12F6F800ED
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 11:52:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A12F6F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="f7I3ouv1"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1661161966; bh=vlMP781/oXy0hq0r4ltXOAMB3iba6lm5wXlI3u78Kgw=;
 h=From:To:Cc:Subject:Date;
 b=f7I3ouv1HuHUcHG2reTt21c57K0g62OrI/HNlNy7838nkBYjVjP8isR/FQU00B6Vg
 5xsWVT7cICDooy/rVlSEz/t84v2/r5P8254lrPDzBqDzuoLNKPNC2bmfZLdb9XvW11
 7CRTyQ6hTgcBIANPVcqLZTCy/7Ptxca9/yEsS0JM=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: dapm: Export new 'graph.dot' file in debugfs
Date: Mon, 22 Aug 2022 11:52:42 +0200
Message-Id: <20220822095242.3779-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
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

Provide a DOT summary of the DAPM graph in a newly added 'graph.dot'
file in debugfs, placed in the card's DAPM directory.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---

Sample output: https://cutebit.org/macaudio-j274.svg
(With unupstreamed sound drivers on Mac mini (2020))

The helper bufprintf macro triggers checkpath.pl:

ERROR: Macros with complex values should be enclosed in parentheses
#47: FILE: sound/soc/soc-dapm.c:2235:
+#define bufprintf(...) \
+               ret += scnprintf(buf + ret, bufsize - ret, __VA_ARGS__)

but adding in {} to the macro body interferes with the if/else
constructions later, so I left it as-is.

 sound/soc/soc-dapm.c | 141 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 73b8bd452ca7..86524908c3fd 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2210,6 +2210,143 @@ static const struct file_operations dapm_bias_fops = {
 	.llseek = default_llseek,
 };
 
+static ssize_t dapm_graph_read_file(struct file *file, char __user *user_buf,
+				    size_t count, loff_t *ppos)
+{
+	struct snd_soc_card *card = file->private_data;
+	struct snd_soc_dapm_context *dapm;
+	struct snd_soc_dapm_path *p;
+	struct snd_soc_dapm_widget *w;
+	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dapm_widget *wdone[16];
+	struct snd_soc_dai *dai;
+	int i, num_wdone = 0, cluster = 0;
+	char *buf;
+	ssize_t bufsize;
+	ssize_t ret = 0;
+
+	bufsize = 1024 * card->num_dapm_widgets;
+	buf = kmalloc(bufsize, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	mutex_lock(&card->dapm_mutex);
+
+#define bufprintf(...) \
+		ret += scnprintf(buf + ret, bufsize - ret, __VA_ARGS__)
+
+	bufprintf("digraph dapm {\n");
+	bufprintf("label=\"%s\";\n", card->name);
+
+	/*
+	 * Print the user-visible PCM devices of the card.
+	 */
+	bufprintf("subgraph cluster_%d {\n", cluster++);
+	bufprintf("label=\"PCM devices\";style=filled;fillcolor=lightgray;\n");
+	for_each_card_rtds(card, rtd) {
+		if (rtd->dai_link->no_pcm)
+			continue;
+
+		bufprintf("w%pK [label=\"%d: %s\"];\n", rtd,
+			  rtd->pcm->device, rtd->dai_link->name);
+	}
+	bufprintf("};\n");
+
+	/*
+	 * Print the playback/capture widgets of CPU-side DAIs, and link
+	 * them to the PCM devices. Keep a list of already printed
+	 * widgets in 'wdone', so they will be skipped later. Do not put
+	 * these widgets in a component cluster like we will do with
+	 * the other widgets later, since that just clutters the graph.
+	 */
+	for_each_card_rtds(card, rtd) {
+		for_each_rtd_cpu_dais(rtd, i, dai) {
+			if (dai->playback_widget) {
+				w = dai->playback_widget;
+				bufprintf("w%pK [label=\"%s\"];\n", w, w->name);
+				if (!rtd->dai_link->no_pcm)
+					bufprintf("w%pK -> w%pK;\n", rtd, w);
+				wdone[num_wdone] = w;
+				if (num_wdone < ARRAY_SIZE(wdone))
+					num_wdone++;
+			}
+
+			if (dai->capture_widget) {
+				w = dai->capture_widget;
+				bufprintf("w%pK [label=\"%s\"];\n", w, w->name);
+				if (!rtd->dai_link->no_pcm)
+					bufprintf("w%pK -> w%pK;\n", w, rtd);
+				wdone[num_wdone] = w;
+				if (num_wdone < ARRAY_SIZE(wdone))
+					num_wdone++;
+			}
+		}
+	}
+
+	for_each_card_dapms(card, dapm) {
+		const char *prefix = soc_dapm_prefix(dapm);
+
+		if (dapm != &card->dapm) {
+			bufprintf("subgraph cluster_%d {\n", cluster++);
+			if (prefix && dapm->component)
+				bufprintf("label=\"%s (%s)\";\n", prefix,
+					  dapm->component->name);
+			else if (dapm->component)
+				bufprintf("label=\"%s\";\n",
+					  dapm->component->name);
+		}
+
+		for_each_card_widgets(dapm->card, w) {
+			const char *name = w->name;
+			bool skip = false;
+
+			if (w->dapm != dapm)
+				continue;
+
+			if (list_empty(&w->edges[0]) && list_empty(&w->edges[1]))
+				continue;
+
+			for (i = 0; i < num_wdone; i++)
+				if (wdone[i] == w)
+					skip = true;
+			if (skip)
+				continue;
+
+			if (prefix && strlen(name) > strlen(prefix) + 1)
+				name += strlen(prefix) + 1;
+
+			bufprintf("w%pK [label=\"%s\"];\n", w, name);
+		}
+
+		if (dapm != &card->dapm)
+			bufprintf("}\n");
+	}
+
+	list_for_each_entry(p, &card->paths, list) {
+		if (p->name)
+			bufprintf("w%pK -> w%pK [label=\"%s\"];\n",
+				  p->source, p->sink, p->name);
+		else
+			bufprintf("w%pK -> w%pK;\n", p->source, p->sink);
+	}
+
+	bufprintf("}\n");
+#undef bufprintf
+
+	mutex_unlock(&card->dapm_mutex);
+
+	ret = simple_read_from_buffer(user_buf, count, ppos, buf, ret);
+
+	kfree(buf);
+	return ret;
+}
+
+static const struct file_operations dapm_graph_fops = {
+	.open = simple_open,
+	.read = dapm_graph_read_file,
+	.llseek = default_llseek,
+};
+
 void snd_soc_dapm_debugfs_init(struct snd_soc_dapm_context *dapm,
 	struct dentry *parent)
 {
@@ -2220,6 +2357,10 @@ void snd_soc_dapm_debugfs_init(struct snd_soc_dapm_context *dapm,
 
 	debugfs_create_file("bias_level", 0444, dapm->debugfs_dapm, dapm,
 			    &dapm_bias_fops);
+
+	if (dapm == &dapm->card->dapm)
+		debugfs_create_file("graph.dot", 0444, dapm->debugfs_dapm,
+				    dapm->card, &dapm_graph_fops);
 }
 
 static void dapm_debugfs_add_widget(struct snd_soc_dapm_widget *w)
-- 
2.33.0


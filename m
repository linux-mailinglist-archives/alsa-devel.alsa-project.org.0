Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2FA14EBE9
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jan 2020 12:46:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A29FF1680;
	Fri, 31 Jan 2020 12:45:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A29FF1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580471197;
	bh=g4ttbvhWUFCdDDG/j5mJYAuXP6ywZubeustKrJl/vKc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aDK+UJOdjXTUGImwK0HXJFFGTaiGm1s+B48+eOHDMidg7zWFOm5N7i4VyHer7GDE9
	 1M9WTKFX2GKO19ISaUIcsXfIMDzcW+sQXqgyFw+Mpjb8BzvPP5kMPSHOwPqRQzLdxw
	 AUL1/h5z/lzmaRmfqJl4vamKIR1bz81P6/+WCxQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B2DBF8021E;
	Fri, 31 Jan 2020 12:44:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85BE4F80234; Fri, 31 Jan 2020 12:44:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F18EDF80082;
 Fri, 31 Jan 2020 12:44:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F18EDF80082
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 03:43:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,385,1574150400"; d="scan'208";a="430343384"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.38.16])
 by fmsmga006.fm.intel.com with ESMTP; 31 Jan 2020 03:43:57 -0800
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 31 Jan 2020 12:43:53 +0100
Message-Id: <20200131114355.17301-2-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200131114355.17301-1-guennadi.liakhovetski@linux.intel.com>
References: <20200131114355.17301-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Cc: sound-open-firmware@alsa-project.org
Subject: [alsa-devel] [PATCH 1/3] ASoC: (cosmetic) simplify
	dpcm_prune_paths()
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

Currently dpcm_prune_paths() has up to 4 nested condition and loop
levels, which forces the code to use flags for flow control.
Extracting widget status verification code from dpcm_prune_paths()
into a separate function simplifies the code.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/soc-pcm.c | 46 +++++++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index ff1b7c7..9b51f45 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1395,37 +1395,41 @@ int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
 	return paths;
 }
 
-static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
-	struct snd_soc_dapm_widget_list **list_)
+static bool dpcm_be_is_active(struct snd_soc_dpcm *dpcm, int stream,
+			      struct snd_soc_dapm_widget_list *list)
 {
-	struct snd_soc_dpcm *dpcm;
-	struct snd_soc_dapm_widget_list *list = *list_;
 	struct snd_soc_dapm_widget *widget;
 	struct snd_soc_dai *dai;
-	int prune = 0;
-	int do_prune;
+	unsigned int i;
 
-	/* Destroy any old FE <--> BE connections */
-	for_each_dpcm_be(fe, stream, dpcm) {
-		unsigned int i;
+	/* is there a valid CPU DAI widget for this BE */
+	widget = dai_get_widget(dpcm->be->cpu_dai, stream);
+
+	/* prune the BE if it's no longer in our active list */
+	if (widget && widget_in_list(list, widget))
+		return true;
 
-		/* is there a valid CPU DAI widget for this BE */
-		widget = dai_get_widget(dpcm->be->cpu_dai, stream);
+	/* is there a valid CODEC DAI widget for this BE */
+	for_each_rtd_codec_dai(dpcm->be, i, dai) {
+		widget = dai_get_widget(dai, stream);
 
 		/* prune the BE if it's no longer in our active list */
 		if (widget && widget_in_list(list, widget))
-			continue;
+			return true;
+	}
 
-		/* is there a valid CODEC DAI widget for this BE */
-		do_prune = 1;
-		for_each_rtd_codec_dai(dpcm->be, i, dai) {
-			widget = dai_get_widget(dai, stream);
+	return false;
+}
 
-			/* prune the BE if it's no longer in our active list */
-			if (widget && widget_in_list(list, widget))
-				do_prune = 0;
-		}
-		if (!do_prune)
+static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
+	struct snd_soc_dapm_widget_list **list_)
+{
+	struct snd_soc_dpcm *dpcm;
+	int prune = 0;
+
+	/* Destroy any old FE <--> BE connections */
+	for_each_dpcm_be(fe, stream, dpcm) {
+		if (dpcm_be_is_active(dpcm, stream, *list_))
 			continue;
 
 		dev_dbg(fe->dev, "ASoC: pruning %s BE %s for %s\n",
-- 
1.9.3

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

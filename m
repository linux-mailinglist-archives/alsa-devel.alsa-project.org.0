Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CDC4F69AC
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 21:17:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4AE816F2;
	Wed,  6 Apr 2022 21:16:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4AE816F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649272652;
	bh=mhSrerEOmLiasL1zry0iVEzK6vlX2eafsP1T8cbb9Ns=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pcFf7iSN4H+G35Qe3sOQ/++gYt7cnNhClDDGvc4VnnvMXD6w+KX4Na8onn12+Iq5/
	 fW0aU0/zQbIl3+nD8UtPAhQ/LHfu+MbEYLWSkLac6TJ4Crnxh3bvUjXkcKndwBNYtd
	 imPLbk580YdhEkWSdFCDQswgDo6O1f23dFJQu1RA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 049E9F80054;
	Wed,  6 Apr 2022 21:16:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B574F80054; Wed,  6 Apr 2022 21:16:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8448F80054
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 21:16:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8448F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SnjDYFBn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649272588; x=1680808588;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mhSrerEOmLiasL1zry0iVEzK6vlX2eafsP1T8cbb9Ns=;
 b=SnjDYFBn4XiF3FQdmQf1YaSyzfvD7Zo+2StcTT65iP2rsKJR6yFSe5x6
 G/qSojGPVCuLbdhfs+LN+IAcqnySk0hIssDwFbTA6IoIQo3x2/mfkDmLY
 YFwrTCDGwUuxPKxECyJbSjIu0DDjJR7vqJrRmRnCBJvT7PNjhVcR+mbi3
 4Kh+MWD5Bl8O4SDbXMmStDpbcKHbB0Hh/5yVt2GaJmwp9E9F4Bir3fQdU
 GAUDXOs8Au9r1YBNtlzlHEIPPfBZiyRfLgmJylYNOlLN4hCTj0fJeyOEs
 TrmnTiSDxhEX06NVVLwwJa0PlYUs2znaX06S0qgzyN1TIG/9q7qtqMSVH w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="261314234"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="261314234"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:16:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="549683627"
Received: from cbok-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.137.86])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:16:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: topology: cleanup dailinks on widget unload
Date: Wed,  6 Apr 2022 14:16:06 -0500
Message-Id: <20220406191606.254576-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

We set the cpu_dai capture_ or playback_widget on widget_ready but
never clear them, which leads to failures when unloading/reloading a
topology in modprobe/rmmod tests

BugLink: https://github.com/thesofproject/linux/issues/3535
Fixes: 311ce4fe7637 ("ASoC: SOF: Add support for loading topologies")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/topology.c | 43 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index f7e1de860931..c3f264f01e21 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1081,6 +1081,46 @@ static int sof_connect_dai_widget(struct snd_soc_component *scomp,
 	return 0;
 }
 
+static void sof_disconnect_dai_widget(struct snd_soc_component *scomp,
+				      struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_card *card = scomp->card;
+	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dai *cpu_dai;
+	int i;
+
+	if (!w->sname)
+		return;
+
+	list_for_each_entry(rtd, &card->rtd_list, list) {
+		/* does stream match DAI link ? */
+		if (!rtd->dai_link->stream_name ||
+		    strcmp(w->sname, rtd->dai_link->stream_name))
+			continue;
+
+		switch (w->id) {
+		case snd_soc_dapm_dai_out:
+			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+				if (cpu_dai->capture_widget == w) {
+					cpu_dai->capture_widget = NULL;
+					break;
+				}
+			}
+			break;
+		case snd_soc_dapm_dai_in:
+			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+				if (cpu_dai->playback_widget == w) {
+					cpu_dai->playback_widget = NULL;
+					break;
+				}
+			}
+			break;
+		default:
+			break;
+		}
+	}
+}
+
 /* bind PCM ID to host component ID */
 static int spcm_bind(struct snd_soc_component *scomp, struct snd_sof_pcm *spcm,
 		     int dir)
@@ -1366,6 +1406,9 @@ static int sof_widget_unload(struct snd_soc_component *scomp,
 
 		if (dai)
 			list_del(&dai->list);
+
+		sof_disconnect_dai_widget(scomp, widget);
+
 		break;
 	default:
 		break;
-- 
2.30.2


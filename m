Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2BC42CF1
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 19:03:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A1C917BB;
	Wed, 12 Jun 2019 19:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A1C917BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560359032;
	bh=ZUE09X4sVw5nbKBxHcIOetAjqGF95M3HOYCOJNMRV1g=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IIVZqwTWE9s8tDWyFiGvRUqhQzTWvEdIYCppjzwDuAWv4pmRZEPznRzRSxNShdgiy
	 mUwI1a7DiyJd72zXpTOeJWc2tL+k0+wejG2QNEr9TxdXKT5EWXX9dfZNS2A7DL8EvS
	 fBb7e5STm4ubkQ2okn/keJo3FbujGS3Qnu92fLo4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C99F7F896E3;
	Wed, 12 Jun 2019 19:02:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BC93F89728; Wed, 12 Jun 2019 19:02:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E97D2F806F5
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 19:02:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E97D2F806F5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 10:02:03 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2019 10:02:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 12:01:46 -0500
Message-Id: <20190612170148.15327-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612170148.15327-1-pierre-louis.bossart@linux.intel.com>
References: <20190612170148.15327-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/4] ASoC: SOF: topology: pass volume min/max
	linear value to FW
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

From: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>

The driver currently passes the volume ramp type and length
topology tokens to firmware, but the min and max volume are
not set. This patch provides a correction to convert the
information from the topology file and pass the linear volume
min/max value to the firmware to improve transitions.

Signed-off-by: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 1c661dec8dd4..bbad8053b1bc 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1552,6 +1552,9 @@ static int sof_widget_load_pga(struct snd_soc_component *scomp, int index,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &tw->priv;
 	struct sof_ipc_comp_volume *volume;
+	struct snd_sof_control *scontrol;
+	int min_step;
+	int max_step;
 	int ret;
 
 	volume = kzalloc(sizeof(*volume), GFP_KERNEL);
@@ -1594,6 +1597,17 @@ static int sof_widget_load_pga(struct snd_soc_component *scomp, int index,
 
 	swidget->private = volume;
 
+	list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
+		if (scontrol->comp_id == swidget->comp_id) {
+			min_step = scontrol->min_volume_step;
+			max_step = scontrol->max_volume_step;
+			volume->min_value = scontrol->volume_table[min_step];
+			volume->max_value = scontrol->volume_table[max_step];
+			volume->channels = scontrol->num_channels;
+			break;
+		}
+	}
+
 	ret = sof_ipc_tx_message(sdev->ipc, volume->comp.hdr.cmd, volume,
 				 sizeof(*volume), r, sizeof(*r));
 	if (ret >= 0)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

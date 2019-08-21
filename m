Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 968E89868E
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 23:24:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE0841669;
	Wed, 21 Aug 2019 23:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE0841669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566422676;
	bh=LUkGY63Saao6Ct9nLJNwaJNwbCzAWEkpxycxnjOQNrI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NV6OBuRwCI4hnkPB3REljTNFHK68W3QuXQIYkq59KZ1X4shCUZHt5eyD8WTCfS5e0
	 uuy43VBhgGEsd3X2o4rnqjEqvyAm06Z694rBqEhoPHSjWKjDv79ylSw21Ydi4I5c0y
	 8w6UcQMck0uy23UI04hp7ysMzbeq9OyXHIcDOtT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1C17F80308;
	Wed, 21 Aug 2019 23:22:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BEFCF80306; Wed, 21 Aug 2019 23:22:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F25E0F802E0
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 23:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F25E0F802E0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Aug 2019 14:22:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,414,1559545200"; d="scan'208";a="190342290"
Received: from kekkonen.fi.intel.com ([10.237.72.156])
 by orsmga002.jf.intel.com with ESMTP; 21 Aug 2019 14:22:41 -0700
From: Jaska Uimonen <jaska.uimonen@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 00:11:38 +0300
Message-Id: <20190821211138.14618-1-jaska.uimonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Cc: Jaska Uimonen <jaska.uimonen@intel.com>, broonie@kernel.org
Subject: [alsa-devel] [PATCH v2] ASoC: SOF: topology: fix get control data
	return type and arguments
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

From: Jaska Uimonen <jaska.uimonen@intel.com>

sof_get_control_data returns negative values even though the return
value is defined unsigned (size_t). So change the return value type to
int and add the data size as pointer argument to sof_get_control_data to
avoid ambiquity in the meaning of the return type.

Fixes: cac974a51ebb ("ASoC: SOF: topology: use set_get_data in process load")
Reported by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Jaska Uimonen <jaska.uimonen@intel.com>
---
 sound/soc/sof/topology.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 28a7a6e06a53..fc85efbad378 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1752,17 +1752,19 @@ static int sof_widget_load_siggen(struct snd_soc_component *scomp, int index,
 	return ret;
 }
 
-static size_t sof_get_control_data(struct snd_sof_dev *sdev,
-				   struct snd_soc_dapm_widget *widget,
-				   struct sof_widget_data *wdata)
+static int sof_get_control_data(struct snd_sof_dev *sdev,
+				struct snd_soc_dapm_widget *widget,
+				struct sof_widget_data *wdata,
+				size_t *size)
 {
 	const struct snd_kcontrol_new *kc;
 	struct soc_mixer_control *sm;
 	struct soc_bytes_ext *sbe;
 	struct soc_enum *se;
-	size_t size = 0;
 	int i;
 
+	*size = 0;
+
 	for (i = 0; i < widget->num_kcontrols; i++) {
 		kc = &widget->kcontrol_news[i];
 
@@ -1800,7 +1802,7 @@ static size_t sof_get_control_data(struct snd_sof_dev *sdev,
 		if (wdata[i].pdata->magic != SOF_ABI_MAGIC)
 			return -EINVAL;
 
-		size += wdata[i].pdata->size;
+		*size += wdata[i].pdata->size;
 
 		/* get data type */
 		switch (wdata[i].control->cmd) {
@@ -1819,7 +1821,7 @@ static size_t sof_get_control_data(struct snd_sof_dev *sdev,
 		}
 	}
 
-	return size;
+	return 0;
 }
 
 static int sof_process_load(struct snd_soc_component *scomp, int index,
@@ -1855,12 +1857,11 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
 			return -ENOMEM;
 
 		/* get possible component controls and get size of all pdata */
-		ipc_data_size = sof_get_control_data(sdev, widget, wdata);
+		ret = sof_get_control_data(sdev, widget, wdata,
+					   &ipc_data_size);
 
-		if (ipc_data_size <= 0) {
-			ret = ipc_data_size;
+		if (ret < 0)
 			goto out;
-		}
 	}
 
 	ipc_size = sizeof(struct sof_ipc_comp_process) +
-- 
2.13.6

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

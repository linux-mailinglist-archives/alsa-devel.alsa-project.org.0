Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A59F476050
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 19:10:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFB7E1ACF;
	Wed, 15 Dec 2021 19:09:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFB7E1ACF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639591816;
	bh=KDLNHdW8UsZ5hZfnutB9+v1aw0u8bf1MWI8mW3tg9xE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D2fQUKHtGHa6SSaA5AxKp6W9Njv0HqaxzOfCX+MwORZUUfOZjnJPmaMTBjs0o8rKS
	 1fftiUicOf4Edjrfkqsm4+H2FnuHBFO2266u6c76ugX0A+fPzR9FB7IvZMQN3jbfjD
	 b5WdrANnyNzFQNrQ+cwArULdJVbVRckpDS5gGraw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50CA7F8030F;
	Wed, 15 Dec 2021 19:07:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EBADF8051C; Wed, 15 Dec 2021 19:07:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C1E9F80311
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 19:06:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C1E9F80311
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="302671003"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="302671003"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 10:04:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="662015059"
Received: from manamie-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.37.3])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 10:04:13 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/8] ASoC: SOF: control: Do not handle control notification
 with component type
Date: Wed, 15 Dec 2021 10:04:02 -0800
Message-Id: <20211215180404.53254-7-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215180404.53254-1-ranjani.sridharan@linux.intel.com>
References: <20211215180404.53254-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

The component type is not used in firmware nor in the kernel currently and
it is not even clear how it should be handled.

Do not even try to handle it to avoid errors.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/control.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 9297b29d65cd..dac0b630b6a0 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -577,6 +577,13 @@ void snd_sof_control_notify(struct snd_sof_dev *sdev,
 	bool found = false;
 	int i, type;
 
+	if (cdata->type == SOF_CTRL_TYPE_VALUE_COMP_GET ||
+	    cdata->type == SOF_CTRL_TYPE_VALUE_COMP_SET) {
+		dev_err(sdev->dev,
+			"Component data is not supported in control notification\n");
+		return;
+	}
+
 	/* Find the swidget first */
 	list_for_each_entry(swidget, &sdev->widget_list, list) {
 		if (swidget->comp_id == cdata->comp_id) {
@@ -643,11 +650,6 @@ void snd_sof_control_notify(struct snd_sof_dev *sdev,
 		expected_size += cdata->num_elems *
 				 sizeof(struct sof_ipc_ctrl_value_chan);
 		break;
-	case SOF_CTRL_TYPE_VALUE_COMP_GET:
-	case SOF_CTRL_TYPE_VALUE_COMP_SET:
-		expected_size += cdata->num_elems *
-				 sizeof(struct sof_ipc_ctrl_value_comp);
-		break;
 	case SOF_CTRL_TYPE_DATA_GET:
 	case SOF_CTRL_TYPE_DATA_SET:
 		expected_size += cdata->num_elems + sizeof(struct sof_abi_hdr);
-- 
2.25.1


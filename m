Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B258C224E0
	for <lists+alsa-devel@lfdr.de>; Sat, 18 May 2019 22:34:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C77A1674;
	Sat, 18 May 2019 22:33:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C77A1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558211664;
	bh=TgTigxzXG0H6jWyHbdgeVvyYmlnDrSTzzchyBUyKd4U=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uO9zVdjqUSQRlQTNA4Tn2eYfIIazXVbnT3iXEp23bjqJ1v2K500dlHP0nrs9g/t0v
	 mp1eF1q/YHArodCrAWNwIdO3LaUhRlDZQKh2zzdsZ0OYmmoRHO7S6a5hQQ5MrT1Q6c
	 PS38vWMOk80nD7iTMuZFB7WdsGO3Y9bYb0jr3jOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC253F8974B;
	Sat, 18 May 2019 22:27:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86540F896CB; Sat, 18 May 2019 22:27:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2CA2F896EC
 for <alsa-devel@alsa-project.org>; Sat, 18 May 2019 22:27:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2CA2F896EC
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 May 2019 13:27:26 -0700
X-ExtLoop1: 1
Received: from bmaster1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.134.14])
 by orsmga002.jf.intel.com with ESMTP; 18 May 2019 13:27:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Sat, 18 May 2019 15:26:59 -0500
Message-Id: <20190518202704.7772-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190518202704.7772-1-pierre-louis.bossart@linux.intel.com>
References: <20190518202704.7772-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 07/12] ASoC: SOF: control: correct the copy
	size for bytes kcontrol put
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

From: Keyon Jie <yang.jie@linux.intel.com>

The size for the bytes kcontrol should include the abi header, that is,
data->size + sizeof(*data), it is also aligned with get method after
this change.

Fixes: c3078f53970 ("ASoC: SOF: Add Sound Open Firmware KControl support")
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/control.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 11762c4580f1..84e2cbfbbcbb 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -349,6 +349,7 @@ int snd_sof_bytes_put(struct snd_kcontrol *kcontrol,
 	struct snd_sof_dev *sdev = scontrol->sdev;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	struct sof_abi_hdr *data = cdata->data;
+	size_t size = data->size + sizeof(*data);
 	int ret, err;
 
 	if (be->max > sizeof(ucontrol->value.bytes.data)) {
@@ -358,10 +359,10 @@ int snd_sof_bytes_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	if (data->size > be->max) {
+	if (size > be->max) {
 		dev_err_ratelimited(sdev->dev,
-				    "error: size too big %d bytes max is %d\n",
-				    data->size, be->max);
+				    "error: size too big %zu bytes max is %d\n",
+				    size, be->max);
 		return -EINVAL;
 	}
 
@@ -375,7 +376,7 @@ int snd_sof_bytes_put(struct snd_kcontrol *kcontrol,
 	}
 
 	/* copy from kcontrol */
-	memcpy(data, ucontrol->value.bytes.data, data->size);
+	memcpy(data, ucontrol->value.bytes.data, size);
 
 	/* notify DSP of byte control updates */
 	snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE01326836
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 18:28:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 345D915E0;
	Wed, 22 May 2019 18:27:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 345D915E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558542497;
	bh=RaWMjc4hMxGipKHZZZExBo7SeTEOKi1+k/hwo2+0uxs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OjGbeb7pUzizlcMVLoFaOl2gPAKNDbLjGYwXeQPRn0+Q/n5s9FVGnei2W8Zcb39oP
	 fC6/mP/hvRe65HgHjjrH6fEhGS9CbRjbDtQABDXeocDfzjgD11dmktwVqo2PY3c/m+
	 pC1cHNL4yJiS6cGhyEdap+KzFSASDK1UctygOFSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63F02F89746;
	Wed, 22 May 2019 18:22:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3EDBF89730; Wed, 22 May 2019 18:22:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D50DF896E9
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 18:21:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D50DF896E9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 09:21:55 -0700
X-ExtLoop1: 1
Received: from avcaesar-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.140.52])
 by fmsmga001.fm.intel.com with ESMTP; 22 May 2019 09:21:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 22 May 2019 11:21:37 -0500
Message-Id: <20190522162142.11525-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522162142.11525-1-pierre-louis.bossart@linux.intel.com>
References: <20190522162142.11525-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 07/12] ASoC: SOF: control: correct the copy
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
Reviewed-by: Takashi Iwai <tiwai@suse.de>
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

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF365121D1
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 20:53:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9843986E;
	Wed, 27 Apr 2022 20:52:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9843986E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651085591;
	bh=NHQYI3Vhw9MnDdWzlP/cexGyEJdg43ldqI7MQDdp9Ac=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=df9whmoGXSPy4t5ifX70R8UCFAOk9/YEnEV5nP3ZSOWpMv7gCpd/YuLeYmxGyS8kv
	 vi+IOQ64vOWNQdOp4US6LztsKWhZNU6o0LLcIHNwUCDUEIYxDiQucKA0TZoXGte0r2
	 5wLJtEaN5IdofPIymqv4kVZDM4ny5Iec3jevPn6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D71B4F80253;
	Wed, 27 Apr 2022 20:52:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00553F8016E; Wed, 27 Apr 2022 20:52:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D622CF80152
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 20:52:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D622CF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="W5eTMbGK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651085524; x=1682621524;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NHQYI3Vhw9MnDdWzlP/cexGyEJdg43ldqI7MQDdp9Ac=;
 b=W5eTMbGKLywLiakuiVmveRwzHSl3NgBcFwhjDJkKWvPZ3fC/HrqA+4rW
 lYaz1clazk5OH3tkNG/PB0eKyG4KEpe1Uy1cBaB8X+gdynGDvSLSTzChe
 AvlHKCeDz+qzXKz2vPpaLOkw/e0y5zXT5n2H9hzh79I2UkDh7Ctrh9L2q
 pWuAjCoZb9l7WJBN/FVkn7xKsEXZ8Wr7EHFXIsUw0hDqwmJ0m5N2Bpn8h
 NBf14wEMYP4+1nLVUDFA/gc2mhDm8QEfzmbmAx1AB9Dvc0i/L7kgdV1qG
 01VWwGCpTCr9NYn1MeovMoB3GGdfXYYtH77mZyA1PPWclD1cjxvp+sNvu w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="263623528"
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="263623528"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 11:51:58 -0700
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="580762651"
Received: from rajamsri-mobl2.gar.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.132])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 11:51:56 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, senozhatsky@chromium.org
Subject: [PATCH v4] ASoC: SOF: ipc3-topology: Correct get_control_data for non
 bytes payload
Date: Wed, 27 Apr 2022 21:52:21 +0300
Message-Id: <20220427185221.28928-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: cujomalainey@google.com, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

It is possible to craft a topology where sof_get_control_data() would do
out of bounds access because it expects that it is only called when the
payload is bytes type.
Confusingly it also handles other types of controls, but the payload
parsing implementation is only valid for bytes.

Fix the code to count the non bytes controls and instead of storing a
pointer to sof_abi_hdr in sof_widget_data (which is only valid for bytes),
store the pointer to the data itself and add a new member to save the size
of the data.

In case of non bytes controls we store the pointer to the chanv itself,
which is just an array of values at the end.

In case of bytes control, drop the wrong cdata->data (wdata[i].pdata) check
against NULL since it is incorrect and invalid in this context.
The data is pointing to the end of cdata struct, so it should never be
null.

Reported-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
Hi,

Changes since v3:
- Move the comment about validating data along with the code which validates the
  data (checks the SOF_ABI_MAGIC)

Changes since v2:
- Drop the cdata->data check against NULL as it is not a valid test and since we
  are in sof_get_control_data() the memory has been already allocated

changes since v1:
- adjust the payload size for non bytes controls by subtracting the size of the
  sof_ipc_ctrl_data struct, plus add comment to note this

Regards,
Peter
 sound/soc/sof/ipc3-topology.c | 39 +++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 572bcbfdb356..bc848f556b88 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -20,7 +20,8 @@
 struct sof_widget_data {
 	int ctrl_type;
 	int ipc_cmd;
-	struct sof_abi_hdr *pdata;
+	void *pdata;
+	size_t pdata_size;
 	struct snd_sof_control *control;
 };
 
@@ -784,16 +785,26 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
 		}
 
 		cdata = wdata[i].control->ipc_control_data;
-		wdata[i].pdata = cdata->data;
-		if (!wdata[i].pdata)
-			return -EINVAL;
 
-		/* make sure data is valid - data can be updated at runtime */
-		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES &&
-		    wdata[i].pdata->magic != SOF_ABI_MAGIC)
-			return -EINVAL;
+		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES) {
+			/* make sure data is valid - data can be updated at runtime */
+			if (cdata->data->magic != SOF_ABI_MAGIC)
+				return -EINVAL;
+
+			wdata[i].pdata = cdata->data->data;
+			wdata[i].pdata_size = cdata->data->size;
+		} else {
+			/* points to the control data union */
+			wdata[i].pdata = cdata->chanv;
+			/*
+			 * wdata[i].control->size is calculated with struct_size
+			 * and includes the size of struct sof_ipc_ctrl_data
+			 */
+			wdata[i].pdata_size = wdata[i].control->size -
+					      sizeof(struct sof_ipc_ctrl_data);
+		}
 
-		*size += wdata[i].pdata->size;
+		*size += wdata[i].pdata_size;
 
 		/* get data type */
 		switch (cdata->cmd) {
@@ -876,10 +887,12 @@ static int sof_process_load(struct snd_soc_component *scomp,
 	 */
 	if (ipc_data_size) {
 		for (i = 0; i < widget->num_kcontrols; i++) {
-			memcpy(&process->data[offset],
-			       wdata[i].pdata->data,
-			       wdata[i].pdata->size);
-			offset += wdata[i].pdata->size;
+			if (!wdata[i].pdata_size)
+				continue;
+
+			memcpy(&process->data[offset], wdata[i].pdata,
+			       wdata[i].pdata_size);
+			offset += wdata[i].pdata_size;
 		}
 	}
 
-- 
2.36.0


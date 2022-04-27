Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D18E2511531
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 12:53:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B96017A8;
	Wed, 27 Apr 2022 12:52:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B96017A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651056825;
	bh=9CwBxMJhY9a9yeQFMUfoifcNgz+Iayjgl+3mROuqsYw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Pmy4E5VPgYmATaOk+Cp8YydylJrp2Q/IRo2ffn0rw8o8b35vk0lt5qDuif7EnOCTD
	 17JlPAGqJCeYLe0fevuHXFJpSMBDA8ojTgh07G6W0x0NDdXhqGldYDqY1Y15ajQZtB
	 tLxr3gFNGT1yrkP8IbqtKZmZn2MpkzIpDRQXk0UU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6CADF80253;
	Wed, 27 Apr 2022 12:52:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EAD4F80100; Wed, 27 Apr 2022 12:52:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A1D4F80100
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 12:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A1D4F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nf/8Ezch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651056758; x=1682592758;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9CwBxMJhY9a9yeQFMUfoifcNgz+Iayjgl+3mROuqsYw=;
 b=nf/8EzchMMwvk9StxUg3FFSr4sNz6Tj+QtlOYgRuGlgiwb8Qt1AOtDF/
 kI9EENiJRkiXDp96mHlPXpMC2D1Gab4MxWf/nxorHQ03XPlMRRjqy7uPp
 EcT80nJXKsstd6PgkXDp6AWfhXYkE+rvTx/fiPOjxZQIZX8419jqopKDV
 AzS5jH8n4Q2E8BUzZZRqPTjIxdteqnHJuLmXx4GQb9CEafn4CoPjsKCMi
 eTM8M0zpwTNEUUH6Ggjt3PUmyML7uxl4jRBJOsBfjTARavz8keFF/NzMD
 92UijYeyV96RI1mVgaiuEXINg751QCPZ/cccQXRqKwV7ApWcFbOLbxdLu g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="265699713"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="265699713"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 03:52:33 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="580529275"
Received: from rdegreef-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.32.27])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 03:52:30 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, senozhatsky@chromium.org
Subject: [PATCH v2] ASoC: SOF: ipc3-topology: Correct get_control_data for non
 bytes payload
Date: Wed, 27 Apr 2022 13:52:53 +0300
Message-Id: <20220427105253.16640-1-peter.ujfalusi@linux.intel.com>
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

Reported-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
Hi,

changes since v1:
- adjust the payload size for non bytes controls by subtracting the size of the
  sof_ipc_ctrl_data struct, plus add comment to note this

Regards,
Peter

 sound/soc/sof/ipc3-topology.c | 40 ++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 572bcbfdb356..f9f37e01edfa 100644
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
 
@@ -784,16 +785,29 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
 		}
 
 		cdata = wdata[i].control->ipc_control_data;
-		wdata[i].pdata = cdata->data;
-		if (!wdata[i].pdata)
-			return -EINVAL;
 
 		/* make sure data is valid - data can be updated at runtime */
-		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES &&
-		    wdata[i].pdata->magic != SOF_ABI_MAGIC)
-			return -EINVAL;
+		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES) {
+			if (!cdata->data)
+				return -EINVAL;
+
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
@@ -876,10 +890,12 @@ static int sof_process_load(struct snd_soc_component *scomp,
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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C641537BF7
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 15:29:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 301E31B15;
	Mon, 30 May 2022 15:28:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 301E31B15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653917343;
	bh=4jTvK2lpoiEdeQm+qpzHyCZoxAUPXJcXPmcaCJ93CzI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D6X5U+uRrivKJ12YoOSha6GugtNnD3OEbMXn9pWs4fgvlzxUiMvNWI9rbehEh0JVo
	 tDYxFPKphHuO31wzuI13D0MxUfQkv4kLC1Uqt/WJgyRYUpFEZPYLNppMJsAJJOWJIU
	 QfnzTGuKsaCUzpf9FYIbG2VFDUnZiOvSuzbL/Cr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCFCCF800DE;
	Mon, 30 May 2022 15:28:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C92CF80516; Mon, 30 May 2022 15:28:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9ED02F804B4;
 Mon, 30 May 2022 15:27:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ED02F804B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cqW93jEs"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0761E60EE0;
 Mon, 30 May 2022 13:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECEE7C3411A;
 Mon, 30 May 2022 13:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653917276;
 bh=4jTvK2lpoiEdeQm+qpzHyCZoxAUPXJcXPmcaCJ93CzI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cqW93jEsrqqXY0AzoRFlkys8p7tt9Kus03VSkStKcYOM+bNmQBfTGNWx7304tShiZ
 sk63qLxMQjiEzRv2YTHReHQffJltg1myUxxRUqkoIjSvHrhH9NyoqZ71BtOXOgiDAv
 Rj7W5dDlnztnevCakoQ4eVjR8fmrpQffS0wzs5pF6HOTtH6U+krMQ8qcjQrsiRjkq/
 tyWDRneOfRcnKfRKxmLv+kDKYTjk//LBGPTWO6alTMgFTDFrhSSYdzIm7XKqfc8Aro
 3iEIOku+Hy6VvGvkN2IRBV8NxBw7TdOn5uHWq3xH0/xr7sINqXARx2IbstmLra+L0b
 HX08WTgM4kZ7g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 079/159] ASoC: SOF: ipc3-topology: Correct
 get_control_data for non bytes payload
Date: Mon, 30 May 2022 09:23:04 -0400
Message-Id: <20220530132425.1929512-79-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530132425.1929512-1-sashal@kernel.org>
References: <20220530132425.1929512-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Mark Brown <broonie@kernel.org>,
 ranjani.sridharan@linux.intel.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

[ Upstream commit a962890a5a3cce903ff7c7a19fadee63ed9efdc7 ]

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
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Tested-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Link: https://lore.kernel.org/r/20220427185221.28928-1-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/ipc3-topology.c | 39 +++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 2f8450a8c0a1..af1bbd34213c 100644
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
2.35.1


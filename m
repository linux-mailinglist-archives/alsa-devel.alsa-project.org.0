Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B79A5113CC
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 10:51:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5F861768;
	Wed, 27 Apr 2022 10:50:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5F861768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651049462;
	bh=sbHu40pZpen0VSdlUtzSwDAran4O8UrTshTDDHdNOhE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jp3Eg8YYgXUwKjBMaTu1O5YlvpaZbokTu5mM2bgVJsdX3F5glwJprqhJ7oQj0ME/O
	 b4RWvz86B5M7v/ivcZTMfRJnn5OvtuGSL27FHTr+td20QNxSMYSwsJuFAzhDeGC2MN
	 A+pMy664+9ZRi/lMi4Nxlri3jGaWj1vR1PPMJkYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C4D6F80253;
	Wed, 27 Apr 2022 10:50:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF344F8016E; Wed, 27 Apr 2022 10:50:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3DFAF800AE
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 10:49:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3DFAF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Uqzv6LS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651049395; x=1682585395;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sbHu40pZpen0VSdlUtzSwDAran4O8UrTshTDDHdNOhE=;
 b=Uqzv6LS4rPGGNEpTO+lN8wQ4WZdoeo3uz2zuC0UXLHvrjTGrEEZ30iQ4
 9p20CpxiNi/fblSdA4IuUpjX07Ls9AL9h6k7lGyAxg7vdjDqnuxrzGm4q
 s4PC9MOX9V9kzWhcU8YuzI40n/VXh5LaFSHjFWO7D2EBnIVJlW1qL2fWi
 wwfke5+Jxx1S1qG1xZMF2WuYuE5mX4OPEz1rXnTUux/y+aFr/Eoz7qInM
 skHjvPbAs27PN+Icq/g/Qhbg/aZZQWWJ6y+iQmoRL57hdGGRbNdvd1oc7
 kvcsntkRhaGQ2lTJhmRW+/FA+O5kiFcd4S5hYJJEtDrfDwnrtSBpRYT30 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="352302310"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="352302310"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 01:49:50 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="580475367"
Received: from rdegreef-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.32.27])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 01:49:47 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, senozhatsky@chromium.org
Subject: [PATCH] ASoC: SOF: ipc3-topology: Correct get_control_data for non
 bytes payload
Date: Wed, 27 Apr 2022 11:50:11 +0300
Message-Id: <20220427085011.21805-1-peter.ujfalusi@linux.intel.com>
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

This should fix the out of bounds access, but I'm not sure what would be
expected in case of non bytes type of controls, so this patch will consider their
size(s) into the counting and copying.

Sergey, can you check if it is easy to backport for 5.10.111? There were changes
around this (code move to ipc3-topology.c and renames) but the logic remained the
same.

Regards,
Peter

 sound/soc/sof/ipc3-topology.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 572bcbfdb356..8a083fd547ba 100644
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
 
@@ -784,16 +785,23 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
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
+			wdata[i].pdata = cdata->chanv; /* points to the control data union */
+			wdata[i].pdata_size = wdata[i].control->size;
+		}
 
-		*size += wdata[i].pdata->size;
+		*size += wdata[i].pdata_size;
 
 		/* get data type */
 		switch (cdata->cmd) {
@@ -876,10 +884,12 @@ static int sof_process_load(struct snd_soc_component *scomp,
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


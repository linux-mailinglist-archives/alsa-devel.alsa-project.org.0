Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B93D64EAF9
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Dec 2022 12:54:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B55471704;
	Fri, 16 Dec 2022 12:54:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B55471704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671191691;
	bh=jfIMJ6TmP1cWJ87QRad98d693nmAOv5PARrxjq9F8lE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=kVecdX8EYJq55PUmD6FHXyyajCQuGbxgXu275L/KZFOCCl4jaaP9t8Xk7CTesYtw2
	 V0X1hSF5pFYjbR+nWJ58/w647AfG2muyhiSxRahgJuKhx4hkUL0meQf2U2R23GuYmd
	 q1kfE0M/itpIRR1K8UH+CewvQQ1dALd4Ei0nXMXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 516B6F804CB;
	Fri, 16 Dec 2022 12:53:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7056F804E2; Fri, 16 Dec 2022 12:53:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EF46F804CB
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 12:53:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EF46F804CB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HoHAA9CQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671191630; x=1702727630;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jfIMJ6TmP1cWJ87QRad98d693nmAOv5PARrxjq9F8lE=;
 b=HoHAA9CQli3YBtlzotUYOK0JBQCys+pp7OIJdRrep+P7Qh89db8ZQUAo
 87msDc36v8PE68uev1sG8wUNv3pheXzfYHYpS45H/I/bnePAj2M4bKjTk
 3Gw1DBL3hkqfNWf5UdrzYVcPyBV31b2Q/jRYZbzd/VC8mlbrKygr8MmZj
 EvzcamvD6wEmTK2LQtrRj0P8O6SuCd/seUFlVj1Vi7JFKT3SZQum82pLK
 9hGza/2gDtg3T0z4e85BSfRTvxyA8G5WLOvIfOXuuIP7CzcXcxNySXlhb
 eoI4WL0L6+Q4CpmVLDz2mR2yT2SW+W90CuliaklO4U9D9uWb6UEuV+qNK A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="405209220"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="405209220"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 03:53:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="680474569"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="680474569"
Received: from emnevill-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.6.47])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 03:53:44 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: IPC3 topology: Print the conflicting bytes sizes
Date: Fri, 16 Dec 2022 13:53:50 +0200
Message-Id: <20221216115350.28260-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 seppo.ingalsuo@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>

The error "Conflict in bytes vs. priv size." is too brief. With
the printed sizes it's a lot easier to find the size issue in
for binary control if such happens.

Signed-off-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index b94cc40485ed..989395999d6e 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -1651,6 +1651,7 @@ static int sof_ipc3_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *
 static int sof_ipc3_control_load_bytes(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol)
 {
 	struct sof_ipc_ctrl_data *cdata;
+	size_t priv_size_check;
 	int ret;
 
 	if (scontrol->max_size < (sizeof(*cdata) + sizeof(struct sof_abi_hdr))) {
@@ -1694,8 +1695,10 @@ static int sof_ipc3_control_load_bytes(struct snd_sof_dev *sdev, struct snd_sof_
 			goto err;
 		}
 
-		if (cdata->data->size + sizeof(struct sof_abi_hdr) != scontrol->priv_size) {
-			dev_err(sdev->dev, "Conflict in bytes vs. priv size.\n");
+		priv_size_check = cdata->data->size + sizeof(struct sof_abi_hdr);
+		if (priv_size_check != scontrol->priv_size) {
+			dev_err(sdev->dev, "Conflict in bytes (%zu) vs. priv size (%zu).\n",
+				priv_size_check, scontrol->priv_size);
 			ret = -EINVAL;
 			goto err;
 		}
-- 
2.39.0


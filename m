Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A424545FFD
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 10:48:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09F631FE8;
	Fri, 10 Jun 2022 10:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09F631FE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654850894;
	bh=7iqw2caWuf+KVVvzQ6NnaJrcrgTEvkTKcJsf01oHIVs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LZdEdi017df5aLqqAo510o2uS4YuWjK8pcmBpIrqbLUrbRwuTosAYivLknUu+TLkm
	 HoJgr9YndmE0oI7yUVjcokYjvhk2QS/LTKSxXopLrNh6PGBwSKqkqkLpIjusZMmtgR
	 2Nb9ul1SJ0CyrTHiYAAgAOK5hHp8c38OdKGdVtFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C005F800C7;
	Fri, 10 Jun 2022 10:47:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E33C4F804D2; Fri, 10 Jun 2022 10:47:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56D8EF800DF
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 10:47:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56D8EF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="U1P0J884"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654850828; x=1686386828;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7iqw2caWuf+KVVvzQ6NnaJrcrgTEvkTKcJsf01oHIVs=;
 b=U1P0J884j1nLvFCEI20AYq7ZwXVTV+OLRMhsFH4ttxmWQ2tuoUL2QliF
 QEMMWJo5keLs1KKZzhhtBsXUhWrPRsh42wEPQ/8/MB2XI5p65vd4qu1+m
 X3k8jf4AqHuh6Hb2GME0CJ80BYoJq2uQda7M6XTg+262oFh431ElZ3z4Z
 esoldHAyeLhJllt1hVfeuboDFMI2JN8+ESsMyKDqD4GQrpXP9iqUNwMi0
 /IOvSpoEvZt5NWwZn2wmevlRdGjbWkQ5vUJUFo/L4NwdmtFYvYu+lEMjt
 zep7f+FZpP/0Y0s6VDaFoBWqI8zImLDBg9KQDleoQf9WMlxkuFypn6Pa4 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="257998280"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="257998280"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:47:02 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="616399581"
Received: from nuribebu-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.215.108])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:47:00 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc3-topology: Move and correct size checks in
 sof_ipc3_control_load_bytes()
Date: Fri, 10 Jun 2022 11:47:35 +0300
Message-Id: <20220610084735.19397-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 jaska.uimonen@linux.intel.com
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

Move the size checks prior to allocating memory as these checks do not need
the data to be allocated and in case of an error we would not need to free
the allocation.

The max size must not be less than the size of
struct sof_ipc_ctrl_data + struct sof_abi_hdr as the ABI header needs to
be present under all circumstances.
The check was incorrectly used or between the two size checks.

Fixes: b5cee8feb1d4 ("ASoC: SOF: topology: Make control parsing IPC agnostic")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 043554d7cb4a..10740c55294d 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -1577,24 +1577,23 @@ static int sof_ipc3_control_load_bytes(struct snd_sof_dev *sdev, struct snd_sof_
 	struct sof_ipc_ctrl_data *cdata;
 	int ret;
 
-	scontrol->ipc_control_data = kzalloc(scontrol->max_size, GFP_KERNEL);
-	if (!scontrol->ipc_control_data)
-		return -ENOMEM;
-
-	if (scontrol->max_size < sizeof(*cdata) ||
-	    scontrol->max_size < sizeof(struct sof_abi_hdr)) {
-		ret = -EINVAL;
-		goto err;
+	if (scontrol->max_size < (sizeof(*cdata) + sizeof(struct sof_abi_hdr))) {
+		dev_err(sdev->dev, "%s: insufficient size for a bytes control: %zu.\n",
+			__func__, scontrol->max_size);
+		return -EINVAL;
 	}
 
-	/* init the get/put bytes data */
 	if (scontrol->priv_size > scontrol->max_size - sizeof(*cdata)) {
-		dev_err(sdev->dev, "err: bytes data size %zu exceeds max %zu.\n",
+		dev_err(sdev->dev,
+			"%s: bytes data size %zu exceeds max %zu.\n", __func__,
 			scontrol->priv_size, scontrol->max_size - sizeof(*cdata));
-		ret = -EINVAL;
-		goto err;
+		return -EINVAL;
 	}
 
+	scontrol->ipc_control_data = kzalloc(scontrol->max_size, GFP_KERNEL);
+	if (!scontrol->ipc_control_data)
+		return -ENOMEM;
+
 	scontrol->size = sizeof(struct sof_ipc_ctrl_data) + scontrol->priv_size;
 
 	cdata = scontrol->ipc_control_data;
-- 
2.36.1


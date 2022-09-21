Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B995BFCF3
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 13:29:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1CC51607;
	Wed, 21 Sep 2022 13:28:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1CC51607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663759747;
	bh=azeYHTE4Cxj/yTYbAGp/wdk3a0HOQ1gAwOBtS0qeOdc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dn65pIoDgCO/PhZaUw+t7br05yPvT/9EeDcxcjHtycImpJw3FRDpmW+h6knqqFcit
	 hS5d9siq0eKIKEksFUnOSSBcAlnzaO3PYvSzQkPSCRP14Zr2MRS6YF5X5iHIzJE32A
	 8ey7pqUyIxxhXY5WLj4ATJfOcEO3Q4nMGNOJrG6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0C96F80425;
	Wed, 21 Sep 2022 13:28:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9D1AF80256; Wed, 21 Sep 2022 13:28:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96A3CF800F3
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 13:27:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96A3CF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="es+lyzUr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663759677; x=1695295677;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=azeYHTE4Cxj/yTYbAGp/wdk3a0HOQ1gAwOBtS0qeOdc=;
 b=es+lyzUrNl+YAr/tMZgvPSXNMaQKheo/kkIKGxpa3bjxBCUAXWHf4hbm
 sfgc/dgDjmOKnyhD4yL5KzRhGJ9EzMAkBRoqPT1YOA2cKBrDy6Fd5vvOH
 M16pKXfkJ13g4rgd2ZZNOy7nZoOmox+3eAHuHmwKdPIY3yLPbcMKqe7JL
 80rZrbG3n5JwppkmhWkJeRPTccYN7LWtMD+2kgvdPZk0juxE8DQsjZ8g8
 93rNhjU89M9lx4R2frLOl7KQ1dDUvMV8eq+gPZyS6vaFLliRWZVd1K496
 +OVYk8RWzd+JUP8RvhqeFvCttOPl+3EVCNzZYYQcDUX11XomtrEFdkc/t A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="386260321"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="386260321"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 04:27:44 -0700
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="744919743"
Received: from pjmcenea-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.2.141])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 04:27:41 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc4-topology: Free the ida when IPC fails in
 sof_ipc4_widget_setup()
Date: Wed, 21 Sep 2022 14:27:51 +0300
Message-Id: <20220921112751.9253-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
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

The allocated ida needs to be freed up if the IPC message fails since
next time when we try again to set up the widget we are going to try to
allocate another ID and given enough tries, we are going to run out of
unique IDs.

Fixes: 711d0427c713 ("ASoC: SOF: ipc4-topology: move ida allocate/free to widget_setup/free")

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 64929dc9af39..340d92452d7c 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1544,9 +1544,16 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 	msg->data_ptr = ipc_data;
 
 	ret = sof_ipc_tx_message(sdev->ipc, msg, ipc_size, NULL, 0);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(sdev->dev, "failed to create module %s\n", swidget->widget->name);
 
+		if (swidget->id != snd_soc_dapm_scheduler) {
+			struct sof_ipc4_fw_module *fw_module = swidget->module_info;
+
+			ida_free(&fw_module->m_ida, swidget->instance_id);
+		}
+	}
+
 	return ret;
 }
 
-- 
2.37.3


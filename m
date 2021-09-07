Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 263BA402E89
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Sep 2021 20:47:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1470F172F;
	Tue,  7 Sep 2021 20:46:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1470F172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631040438;
	bh=m+6LbtEc+SMMw/9Pu4es6FOVzhtDiYYpaIuqynUc7K0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I28Ke028g3IHCU/ubE/CAWBalqPh8MMGZQtYxaZ22IMGcAsEmp4DFyiaigog5Fbhc
	 QesBJInUToskjQMSxClhlwimr3JYcTtjeZkFfGa2nw/Yi4u9Qj+vwLQgJNw+AxOyB5
	 rBXAxEtKcKwDDUxAuuAdTdPSkLoQYBJQlYYLv3Pw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92870F802A9;
	Tue,  7 Sep 2021 20:46:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2E4FF80253; Tue,  7 Sep 2021 20:46:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C11BF800BC
 for <alsa-devel@alsa-project.org>; Tue,  7 Sep 2021 20:46:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C11BF800BC
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="199820961"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="199820961"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 11:46:14 -0700
X-IronPort-AV: E=Sophos;i="5.85,276,1624345200"; d="scan'208";a="503192193"
Received: from fdiasmor-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.186.104])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 11:46:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: fix a typo in put operations for kcontrol
Date: Tue,  7 Sep 2021 13:46:03 -0500
Message-Id: <20210907184603.33243-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
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

From: Rander Wang <rander.wang@intel.com>

SOF_CTRL_TYPE_VALUE_CHAN_SET should be used for put operations
for consistency. The current use of _GET is obviously incorrect
but _GET and _SET result in the same action so there is no
functional change introduced by this patch.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/control.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index a5dd728c580a..504500dd4d43 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -108,7 +108,7 @@ int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 	if (pm_runtime_active(scomp->dev))
 		snd_sof_ipc_set_get_comp_data(scontrol,
 					      SOF_IPC_COMP_SET_VALUE,
-					      SOF_CTRL_TYPE_VALUE_CHAN_GET,
+					      SOF_CTRL_TYPE_VALUE_CHAN_SET,
 					      SOF_CTRL_CMD_VOLUME,
 					      true);
 	return change;
@@ -179,7 +179,7 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
 	if (pm_runtime_active(scomp->dev))
 		snd_sof_ipc_set_get_comp_data(scontrol,
 					      SOF_IPC_COMP_SET_VALUE,
-					      SOF_CTRL_TYPE_VALUE_CHAN_GET,
+					      SOF_CTRL_TYPE_VALUE_CHAN_SET,
 					      SOF_CTRL_CMD_SWITCH,
 					      true);
 
@@ -226,7 +226,7 @@ int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
 	if (pm_runtime_active(scomp->dev))
 		snd_sof_ipc_set_get_comp_data(scontrol,
 					      SOF_IPC_COMP_SET_VALUE,
-					      SOF_CTRL_TYPE_VALUE_CHAN_GET,
+					      SOF_CTRL_TYPE_VALUE_CHAN_SET,
 					      SOF_CTRL_CMD_ENUM,
 					      true);
 
-- 
2.25.1


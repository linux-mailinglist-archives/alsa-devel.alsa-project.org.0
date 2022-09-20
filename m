Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 814845BE968
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 16:55:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C5AC9F6;
	Tue, 20 Sep 2022 16:55:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C5AC9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663685753;
	bh=ykfevg6ZoeMe+Ap6zzqFsfAcliUoOMeREUFDKueKetU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QY3CJzyfWUVh1Oea5y5kQdCL8uovPwKLaqa+gyucXMn9gVhGZPmQUOkmB/T4o6sja
	 O7FFCKfuK1DpAUopZEF1ZhhGnzj2MSUxhixNlCxtrzKPVSv4QjJW9OQNaKKefYkVqE
	 OBlkrrlxoe5a7L/kI+qdf9HkiG1xM9h8Cyot9MfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46AD3F804DA;
	Tue, 20 Sep 2022 16:54:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49FDDF804DA; Tue, 20 Sep 2022 16:54:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A42F0F800C9
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 16:54:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A42F0F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nKdhp4hf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663685665; x=1695221665;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ykfevg6ZoeMe+Ap6zzqFsfAcliUoOMeREUFDKueKetU=;
 b=nKdhp4hfsgsNZLXg1MiYpBU5jVzhKW7tZ+kQYenTPX0NegzSXy598Bil
 ssDErrqeCsusOMo1NzBGrzCCMSt3DY702d+m1/Nek9oSabS2T1/ZqYwM6
 dNnnnFuEUYkrTKpE+JD0ksFcA4gpeOr2KSMUfs5RQxgmR43b/82zsBbJv
 Cewj87H74LdLbDCtiR5vQadOJCnhA/Hh3dhOUBdxHbl8MaezRFsyiepCo
 a706+T2m9omJtXI/U+lEO7S2H2sxr9tUfumSmjYxHRcBrZbc5lHSgfOhy
 mMiKXgCqW64K4fVh6bP37Qr4nDCgyJe1Moj5eLbffMkIr/IyPr9CxxvpI w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="301095348"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="301095348"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 07:54:20 -0700
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="681341668"
Received: from atcamara-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.209.87])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 07:54:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: SOF: ipc4-topology: clarify calculation precedence
Date: Tue, 20 Sep 2022 16:54:04 +0200
Message-Id: <20220920145405.2089147-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920145405.2089147-1-pierre-louis.bossart@linux.intel.com>
References: <20220920145405.2089147-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Chao Song <chao.song@intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>
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

cppcheck warning:

sound/soc/sof/ipc4-topology.c:334:64: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
 type = fw_module->man4_module_entry.type & SOF_IPC4_MODULE_DP ? 1 : 0;
                                                               ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 64929dc9af397..1503e3c49e703 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -331,7 +331,7 @@ static int sof_ipc4_widget_setup_msg(struct snd_sof_widget *swidget, struct sof_
 	msg->extension = SOF_IPC4_MOD_EXT_PPL_ID(swidget->pipeline_id);
 	msg->extension |= SOF_IPC4_MOD_EXT_CORE_ID(swidget->core);
 
-	type = fw_module->man4_module_entry.type & SOF_IPC4_MODULE_DP ? 1 : 0;
+	type = (fw_module->man4_module_entry.type & SOF_IPC4_MODULE_DP) ? 1 : 0;
 	msg->extension |= SOF_IPC4_MOD_EXT_DOMAIN(type);
 
 	return 0;
-- 
2.34.1


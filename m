Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D1840D786
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 12:35:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4818A1878;
	Thu, 16 Sep 2021 12:34:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4818A1878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631788514;
	bh=9khwhZVvotO7tCLHuHMohh27UoXHDmO88BnwoHgO9Nc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u7q0QSGXq86Q6/9e+2rxAFOFnZ3mTqtzMwa57GDid3QEiV1IFdr3N4XMsw1dH73Yl
	 O/W0ZFXbGzwMdWz9DkJoya2nEkY6TKmdq9bik6JlbIsTZduQGmtiMUY14HsqxbT9bH
	 bFSmSXmgWQn0p3TLP0B54zb/X2g91I6W+xx3/l10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84E41F804FF;
	Thu, 16 Sep 2021 12:32:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 239B1F804FE; Thu, 16 Sep 2021 12:32:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2457AF804CA
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 12:32:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2457AF804CA
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="202031870"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="202031870"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 03:32:28 -0700
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="545473541"
Received: from gkapusti-mobl.ccr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.35.152])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 03:32:26 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 6/6] ASoC: SOF: sof-probes: Correct the function names used
 for snd_soc_cdai_ops
Date: Thu, 16 Sep 2021 13:32:11 +0300
Message-Id: <20210916103211.1573-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916103211.1573-1-peter.ujfalusi@linux.intel.com>
References: <20210916103211.1573-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
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

The snd_soc_cdai_ops have startup and shutdown callbacks defined unlike
the component callbacks where open and free is used.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/sof-probes.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/sof-probes.c b/sound/soc/sof/sof-probes.c
index e394fc524445..5586af9f1a25 100644
--- a/sound/soc/sof/sof-probes.c
+++ b/sound/soc/sof/sof-probes.c
@@ -230,8 +230,8 @@ int sof_ipc_probe_points_remove(struct snd_sof_dev *sdev,
 }
 EXPORT_SYMBOL(sof_ipc_probe_points_remove);
 
-static int sof_probe_compr_open(struct snd_compr_stream *cstream,
-				struct snd_soc_dai *dai)
+static int sof_probe_compr_startup(struct snd_compr_stream *cstream,
+				   struct snd_soc_dai *dai)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(dai->component);
 	int ret;
@@ -246,8 +246,8 @@ static int sof_probe_compr_open(struct snd_compr_stream *cstream,
 	return 0;
 }
 
-static int sof_probe_compr_free(struct snd_compr_stream *cstream,
-				struct snd_soc_dai *dai)
+static int sof_probe_compr_shutdown(struct snd_compr_stream *cstream,
+				    struct snd_soc_dai *dai)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(dai->component);
 	struct sof_probe_point_desc *desc;
@@ -322,8 +322,8 @@ static int sof_probe_compr_pointer(struct snd_compr_stream *cstream,
 }
 
 struct snd_soc_cdai_ops sof_probe_compr_ops = {
-	.startup	= sof_probe_compr_open,
-	.shutdown	= sof_probe_compr_free,
+	.startup	= sof_probe_compr_startup,
+	.shutdown	= sof_probe_compr_shutdown,
 	.set_params	= sof_probe_compr_set_params,
 	.trigger	= sof_probe_compr_trigger,
 	.pointer	= sof_probe_compr_pointer,
-- 
2.33.0


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 759D1545CF3
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 09:13:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10CF71F17;
	Fri, 10 Jun 2022 09:12:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10CF71F17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654845207;
	bh=dcibqKrlnQSgyjvKV7wgbSTUCkPIXDJeczq6dAMtNik=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=afHreeP4MKj7vFxVKjnarzVCGyFTcycxGKEM7d/wPcSuNXWtL652Zo6uBymG3eo6H
	 g0Y12w6RqeSCnTZibIBIzszn1ASBTeYkMeotJF2BR7YdB/9Rp31ZUiIRKVHyYEVlob
	 gCE/+STCsbio9s/nAO/WcxZYL4Z2LAd2t51kcKXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80B5DF800DF;
	Fri, 10 Jun 2022 09:12:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A6A2F800E5; Fri, 10 Jun 2022 09:12:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A17FBF800E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 09:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A17FBF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OAvmBGnq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654845140; x=1686381140;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dcibqKrlnQSgyjvKV7wgbSTUCkPIXDJeczq6dAMtNik=;
 b=OAvmBGnqdbfVkJN63RIB5iVF5PwZfmYpPcIQWphKXqRCooCU8agVN5Fo
 7Ja08jJlXjWyNWjVuV6oXYlhCfJ/ocxdDaTAf/cRNY5UVDKUR2T64FgQ/
 cMurbtP8PI+ROpfjZGnJEdRB7pET+0MFBgLy5hjVgU/OEpgP/aGvL1sPd
 bKK6m/FJsO338VyFD0sYguxSDL01HnbNbefaN2SggJuv0cya1aJj52PYZ
 Zi7t5KrwKg+X9Vp+rX1gLAc2zB9Mvzqu4m94lD7arAiSCaIsHz+GGVJsH
 55vCXzS6rIRqVRV4LkMHJpJsQTxLyIDpdQuH6hFN7Qn14PF4SYWbMMyyO Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="257371958"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="257371958"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 00:12:12 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="637987333"
Received: from nuribebu-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.215.108])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 00:12:10 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc3-dtrace: use pm_runtime_resume_and_get()
Date: Fri, 10 Jun 2022 10:12:45 +0300
Message-Id: <20220610071245.26576-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Use pm_runtime_resume_and_get() to replace the pm_runtime_get_sync() and
pm_runtime_put_noidle() pattern.

No functional changes.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc3-dtrace.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
index b4e1343f9138..45bf9c5dc412 100644
--- a/sound/soc/sof/ipc3-dtrace.c
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -157,9 +157,8 @@ static int ipc3_trace_update_filter(struct snd_sof_dev *sdev, int num_elems,
 	msg->elem_cnt = num_elems;
 	memcpy(&msg->elems[0], elems, num_elems * sizeof(*elems));
 
-	ret = pm_runtime_get_sync(sdev->dev);
+	ret = pm_runtime_resume_and_get(sdev->dev);
 	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_noidle(sdev->dev);
 		dev_err(sdev->dev, "enabling device failed: %d\n", ret);
 		goto error;
 	}
-- 
2.36.1


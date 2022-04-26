Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C922551054A
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 19:22:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64F9C18FD;
	Tue, 26 Apr 2022 19:21:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64F9C18FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650993738;
	bh=S5TCk5iAP8pphguCkQe/S/PP4bRqIuV5H3/5nB54mpM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ju4Wf8yzkjuxTM4dV+ppLPm5q7FhP+nEXUIfHdfL7UVigbMIzDUB5Cj6fEPyHot/V
	 zgRPDOp0+uD+sDk2fjeN1AZscULpHn/iFgItllZBJvA8zCTyJUeDJS7R0EjLq9Qi0c
	 ZnDTJ8NyPTBX9ZNa/leF3NxFVY8/OyVxmXoYXv0Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4ABFF80542;
	Tue, 26 Apr 2022 19:18:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFDA7F80508; Tue, 26 Apr 2022 19:18:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A452CF8052D
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 19:17:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A452CF8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="klG5K4V2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650993481; x=1682529481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S5TCk5iAP8pphguCkQe/S/PP4bRqIuV5H3/5nB54mpM=;
 b=klG5K4V2+9jsGjSwbEo/njPX7Y30zerE5Eh0HHIBbslg4v2AFKVA1egj
 yJ2D3EVIgDuP4cl2u6eTtQsj38hFMYtBs4fJrKiunEdPA569xPOkoHtwP
 1Q+DxLNj1d7l5OvRoZuyOVCEi34NgNGAbw34FXomNxwxI5IH80e+B91mg
 EJhdOFVv/zrg5p4VN85urnYq26dfGE/+4N+bkKW3QlWGCAKTsfHZC1Gzj
 5KUe7aiVyDHTaMCWHwoOnmx9LT5euD39fQlmh10N2HO8a+o221HKvipHK
 mLrbesQBybC5+SEYN/a1+W9aooloKEjmNmL3G76qyN3bDdpk2r9af3iwq w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="290807974"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="290807974"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:17:51 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="558431208"
Received: from shashinx-mobl.gar.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.0.53])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:17:50 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/11] ASoC: SOF: Add two new fields to struct snd_sof_widget
Date: Tue, 26 Apr 2022 10:17:39 -0700
Message-Id: <20220426171743.171061-8-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
References: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

Add two new fields, instance_id and module_info to struct
snd_sof_widget. instance_id for widgets will be assigned when they are
set up in the DSP and reset when the widgets are freed. module_info is
used to save information the firmware provides about each module in its
manifest.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 7ca87056b106..4deab3ded8a5 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -330,7 +330,12 @@ struct snd_sof_widget {
 	int complete;
 	int use_count; /* use_count will be protected by the PCM mutex held by the core */
 	int core;
-	int id;
+	int id; /* id is the DAPM widget type */
+	/*
+	 * Instance ID is set dynamically when the widget gets set up in the FW. It should be
+	 * unique for each module type across all pipelines. This will not be used in SOF_IPC.
+	 */
+	int instance_id;
 
 	/*
 	 * Flag indicating if the widget should be set up dynamically when a PCM is opened.
@@ -345,6 +350,7 @@ struct snd_sof_widget {
 	struct snd_soc_dapm_widget *widget;
 	struct list_head list;	/* list in sdev widget list */
 	struct snd_sof_widget *pipe_widget;
+	void *module_info;
 
 	const guid_t uuid;
 
-- 
2.25.1


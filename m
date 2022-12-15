Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F04E64E16B
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Dec 2022 19:55:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E4EA192F;
	Thu, 15 Dec 2022 19:55:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E4EA192F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671130556;
	bh=R3HG/Rh2QBhn5h9nrDhEplNPyBpnoPqfH5DA2PQMmI4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nmuEhzz8vD4s0ztfm9ko7oYnr92euhkuC+V5H/4lrKG7xY4nr3WcBp/iQOLqYPtC1
	 +awTutx85M+kMQ3rcLxr8vzwq8ykn7eeAisGvD8r6UA9ZzSRyPs4sHXrXl0A2nIh1n
	 qswHVEF3tjv4gdCHxlKvavReOdsN337xFzEovsl8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1708F80520;
	Thu, 15 Dec 2022 19:54:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7F55F80510; Thu, 15 Dec 2022 19:54:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2EB8F80141
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 19:54:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2EB8F80141
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VNXihaDp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671130456; x=1702666456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R3HG/Rh2QBhn5h9nrDhEplNPyBpnoPqfH5DA2PQMmI4=;
 b=VNXihaDp1u4mTRw4QIbSQrPBMxK25idMTfPr52GGDI+qFE+Qq+SmZ2eC
 n2/I9TOdxy3E0DdVgaH7D+I/VdmUjQUoyNydrwYBTymTLcbRomeYbvJAl
 cLsZLnvLqzy2RAdr5sNAK7boYAr8o5eWqWA+uQ46yIG5fmWH6nUl3eDHD
 elt2TFBra5JRE8w2LpQj8rdHFT85kANo3u2n2svuNL46pYqrdAGwSDSl1
 yB/llzJmg8TV6YttPgJUP9O7MgBqouDCqvMRbodl84V6xihOSUrO7+GPe
 QM4XhNQXes5inBwkg+BLjm9rkKu1SIPVEyKuEx8BwbBfFd55BIKU7GDoW Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="318819927"
X-IronPort-AV: E=Sophos;i="5.96,248,1665471600"; d="scan'208";a="318819927"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 10:54:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="738260653"
X-IronPort-AV: E=Sophos;i="5.96,248,1665471600"; d="scan'208";a="738260653"
Received: from mayurarx-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.35.200])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 10:54:05 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: SOF: pm: Always tear down pipelines before DSP
 suspend
Date: Thu, 15 Dec 2022 10:53:46 -0800
Message-Id: <20221215185347.1457541-3-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215185347.1457541-1-ranjani.sridharan@linux.intel.com>
References: <20221215185347.1457541-1-ranjani.sridharan@linux.intel.com>
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
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When the DSP is suspended while the firmware is in the crashed state, we
skip tearing down the pipelines. This means that the widget reference
counts will not get to reset to 0 before suspend. This will lead to
errors with resuming audio after system resume. To fix this, invoke the
tear_down_all_pipelines op before skipping to DSP suspend.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/pm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 5f88c4a01fa3..f153881db189 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -192,6 +192,9 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 	if (runtime_suspend && !sof_ops(sdev)->runtime_suspend)
 		return 0;
 
+	if (tplg_ops && tplg_ops->tear_down_all_pipelines)
+		tplg_ops->tear_down_all_pipelines(sdev, false);
+
 	if (sdev->fw_state != SOF_FW_BOOT_COMPLETE)
 		goto suspend;
 
-- 
2.25.1


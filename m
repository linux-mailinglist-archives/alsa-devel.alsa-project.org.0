Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 122B222939E
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 10:36:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFF431657;
	Wed, 22 Jul 2020 10:35:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFF431657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595406973;
	bh=fxUmcjScJArM28EecgGkTIgU6hp9dZ+hmxI7nw40B7s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C0zKoExlPsvq2m79Pre4JCUfkG4RPFdzRtSpuEO/F/dFY+2RPNKmTmIygSsrkaE4w
	 qiEHJqyWSFJz4hVTqW9ZXWS3T4nosGL59zYAvpVefH6/qOZNLKuN7lyqyFZ5lB7PWU
	 e5EVfxitw9lqpWOs5MReCxMQO7ehuQbIOIHDafCg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32EB7F802E0;
	Wed, 22 Jul 2020 10:32:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2160CF8015A; Wed, 22 Jul 2020 10:32:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BE0EF80141
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 10:32:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BE0EF80141
IronPort-SDR: s5jnIDSu7GROYzZNonpWNI6I8KcfG7T2w388/pvRTkQ5H303wNdWYuiJaz+LaOTr0h5PxSAUpo
 fVa8To0cgM4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="149457261"
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="149457261"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 01:32:01 -0700
IronPort-SDR: oSYQKsaUJt4GbZiQzRM0DKFa35YwmLMmSTtlC/YsLi8BAjXmrUUxmFr4Ib19krD3KZHGbAjJjU
 xXg6aKlPw4jA==
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="432303232"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 01:31:56 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 04/13] soundwire: intel: fix race condition on system resume
Date: Wed, 22 Jul 2020 04:37:14 +0800
Message-Id: <20200721203723.18305-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721203723.18305-1-yung-chuan.liao@linux.intel.com>
References: <20200721203723.18305-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

Previous patches took care of the case where the master device is
pm_runtime 'suspended' when a system suspend occurs.

In the case where the master device was not suspended, e.g. if suspend
occurred while streaming audio, Intel validation noticed a race
condition: the pm_runtime suspend may conflict with the enumeration
started by the system resume.

This can be simply fixed by updating the status before exiting system
resume.

GitHub issue: https://github.com/thesofproject/linux/issues/1482
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 284e5c9d240a..b7d8ea6b331e 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1531,6 +1531,18 @@ static int intel_resume(struct device *dev)
 		return ret;
 	}
 
+	/*
+	 * after system resume, the pm_runtime suspend() may kick in
+	 * during the enumeration, before any children device force the
+	 * master device to remain active.  Using pm_runtime_get()
+	 * routines is not really possible, since it'd prevent the
+	 * master from suspending.
+	 * A reasonable compromise is to update the pm_runtime
+	 * counters and delay the pm_runtime suspend by several
+	 * seconds, by when all enumeration should be complete.
+	 */
+	pm_runtime_mark_last_busy(dev);
+
 	return ret;
 }
 
-- 
2.17.1


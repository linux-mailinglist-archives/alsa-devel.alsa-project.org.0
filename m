Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7FD510CF2
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 01:58:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E433185A;
	Wed, 27 Apr 2022 01:57:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E433185A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651017521;
	bh=tA/0dx3kOuM/bOmv9rB+8wuyPRn5khLhY2aFJCWhgdE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OgUjxSXz491XhKEc6Ia/1td5ZypdxHacmhHrLgrurluzoa4BuPX0CNeVUt7hyIvTq
	 Ko6eacidObi6tfM06JzyQTTlIpRRADnE+ZwdvcBFVjylYLWj1SCJgw0NfDuJqUND2r
	 Jd2hvJFTitqi97556fDKfE2yOfuwDvYKgX7Fr8Ww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09412F80511;
	Wed, 27 Apr 2022 01:56:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 327BDF80152; Wed, 27 Apr 2022 01:56:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD067F800AE
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 01:56:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD067F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IR9gejep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651017402; x=1682553402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tA/0dx3kOuM/bOmv9rB+8wuyPRn5khLhY2aFJCWhgdE=;
 b=IR9gejepBKjNNBHosUgDfHmX/1cEiYiktRqy5OKaqS4NSfaKY+FPMl+i
 7USNkYrTk8eR5xdwivRrHmd0kh++Se+khJiMGBAZRfQwBuXilru9NyujF
 stqHnJjwa6rSoRnKgvLUDs2P03EVlVOysBXkL6UTc9e7xwFmmHKmQVE4T
 begX3RzUgkLCBrnASuqH/nVVRHXeZyvPoxnwiPeZfUSJmk1cbS4ALah5p
 qemsDcaBotc+St1Ey5qxyI2L2rRyKYGgkNA8ZSLk+geuLy1SX4pym2xCC
 001BbrYVvq+hUSbj9b2/UGCg6isMDVXJaFzXiZJBG/2y+qQ0+pB7OvggW w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="290908848"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="290908848"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 16:56:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="730515038"
Received: from htamura-mobl2.gar.corp.intel.com (HELO bard-pc.domain.name)
 ([10.252.185.30])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 16:56:36 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 3/5] soundwire: cadence: use pm_runtime_resume_and_get()
Date: Wed, 27 Apr 2022 07:56:21 +0800
Message-Id: <20220426235623.4253-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426235623.4253-1-yung-chuan.liao@linux.intel.com>
References: <20220426235623.4253-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 558390af44b6..a53a777f2241 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -386,12 +386,11 @@ static int cdns_parity_error_injection(void *data, u64 value)
 	 * Resume Master device. If this results in a bus reset, the
 	 * Slave devices will re-attach and be re-enumerated.
 	 */
-	ret = pm_runtime_get_sync(bus->dev);
+	ret = pm_runtime_resume_and_get(bus->dev);
 	if (ret < 0 && ret != -EACCES) {
 		dev_err_ratelimited(cdns->dev,
-				    "pm_runtime_get_sync failed in %s, ret %d\n",
+				    "pm_runtime_resume_and_get failed in %s, ret %d\n",
 				    __func__, ret);
-		pm_runtime_put_noidle(bus->dev);
 		return ret;
 	}
 
-- 
2.25.1


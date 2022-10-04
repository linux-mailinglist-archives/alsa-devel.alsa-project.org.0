Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C335F4264
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Oct 2022 13:52:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60AC416FE;
	Tue,  4 Oct 2022 13:51:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60AC416FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664884332;
	bh=ismF+AEGmGPx3QEX3gt85btPu4GDpT1W/+k8ZzsQIoc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lntAvjpdLDIPDDPvONP0VHel4yi5sDnRj7qAw0aB1xjUKC0SUmASdqihUM8nka7mg
	 lUUNka876sc3ca8t4emTx3gjhs9g8vWwRv16Kf1bLXNmo2sS8JoZJRwNmyHWx5mMRD
	 9e06a9ACGijH73cXAWJZlZ6+jfToo8xAqQ6YmgW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B752BF801F5;
	Tue,  4 Oct 2022 13:51:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D69CEF800C1; Tue,  4 Oct 2022 13:51:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8D23F800C1
 for <alsa-devel@alsa-project.org>; Tue,  4 Oct 2022 13:51:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8D23F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IuhF+C2s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664884272; x=1696420272;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ismF+AEGmGPx3QEX3gt85btPu4GDpT1W/+k8ZzsQIoc=;
 b=IuhF+C2sM7P0eoXPZJd6gFqCU3FyPWSzJqMx0hejNOfVYpljCijgSDbr
 kg1/jm7dKQ46lgJR6skLZq+kJQ00BuSkmwRZQofyTb+5hIixRkYW+Td5O
 bIQ/vvFNoxq1FjfQeDrfd5dr/lKJzU6sR6zHDUYzRk2/n61dXQik3TGhA
 y4ojKBS5ezEvO3OfttebCVezXRITsYPJFjBHgkS6mVCtzhF0ddfbcGCx9
 fxSB26O2ZI6+eYZ6bmHKcNrCgv8HU5S1OOH+YdVWSaBcC1fztEdVEWQaB
 OXPwUbWhqmpPM8WIZK3AIOyx7hCp+C8+1iUeeML65PdpZ2ow/XPp2980M A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="283257321"
X-IronPort-AV: E=Sophos;i="5.93,157,1654585200"; d="scan'208";a="283257321"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 04:51:07 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="692460120"
X-IronPort-AV: E=Sophos;i="5.93,157,1654585200"; d="scan'208";a="692460120"
Received: from apietrus-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.23.101])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 04:51:05 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	zhangqilong3@huawei.com
Subject: [PATCH] Revert "ASoC: soc-component: using pm_runtime_resume_and_get
 instead of pm_runtime_get_sync"
Date: Tue,  4 Oct 2022 14:51:21 +0300
Message-Id: <20221004115121.26180-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
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

From: Peter Ujfalusi <peter.ujfalusi@gmail.com>

This reverts commit 08fc2a7448afc1660ec2f1b5c437fcd14155a7ee.

The reverted commit causes the following warnigs:
Runtime PM usage count underflow!

This is due to the fact that the pm_runtime_resume_and_get() is calling
pm_runtime_put_noidle() in case of < 0 return value of
pm_runtime_get_sync() which includes the -EACCES.
The change is wrong as -EACCES is returned in case of 'nested' get_sync()
and it is a valid use of PM runtime.

Fixes: 08fc2a7448af ("ASoC: soc-component: using pm_runtime_resume_and_get instead of pm_runtime_get_sync")

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
 sound/soc/soc-component.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 659b9ade4158..e12f8244242b 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1213,9 +1213,11 @@ int snd_soc_pcm_component_pm_runtime_get(struct snd_soc_pcm_runtime *rtd,
 	int i;
 
 	for_each_rtd_components(rtd, i, component) {
-		int ret = pm_runtime_resume_and_get(component->dev);
-		if (ret < 0 && ret != -EACCES)
+		int ret = pm_runtime_get_sync(component->dev);
+		if (ret < 0 && ret != -EACCES) {
+			pm_runtime_put_noidle(component->dev);
 			return soc_component_ret(component, ret);
+		}
 		/* mark stream if succeeded */
 		soc_component_mark_push(component, stream, pm);
 	}
-- 
2.37.3


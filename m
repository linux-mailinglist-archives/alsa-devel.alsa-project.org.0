Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 131FE53F002
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 22:40:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B47841B44;
	Mon,  6 Jun 2022 22:39:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B47841B44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654548005;
	bh=pnD8LElz9CNXfUWsdTu8vF4x4a1ZomAejzhi0PjDOKw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EJ5aHgV2q1oaNsq/kVQQE9keZmkK5xAw5N9rYQMw7qlSv+0qjCsmsRlqooYoz6WN9
	 gN/+FdKnFC9DlfuczzBhoMX9bays5lHJOdv3vcNfQUvHfaqcb8UR1AaJ1Y6e5RbxUh
	 qEx4c+DW8jMFpYCY3EuT2z9vJpGPv3mLAkN5foZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D370F80533;
	Mon,  6 Jun 2022 22:38:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51172F80310; Mon,  6 Jun 2022 22:38:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BB94F80310
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 22:38:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BB94F80310
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QGm0q0P2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654547890; x=1686083890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pnD8LElz9CNXfUWsdTu8vF4x4a1ZomAejzhi0PjDOKw=;
 b=QGm0q0P2k+DGj0vi4EjFEthqPDo5wvUlYdxybpZ3ZfYNCvOrbGhqkDPn
 8UE3HfQEsL+2YhLZmJvG/s5M3E4SAvzO8wHeYEewkvu1N1tiJXjuSIcPR
 9Qbb+7n8H6X/H9zDlRtXmkJyCVOQ+mYWz5xdOjv8Nw90srOgSBESZY1KV
 Ih2EeJTUcMPjuO8+HCoF3v/oQBzmgU7oScRI355oXlaBxYC/cLbgv9dKf
 7jd5rpmhLp4amm1JAFYoKBs1oHmdviCrQV/QSsOomcYCb+HtRXaCGfhLn
 5lE5ByQEj/3zFji2NhFBooBtHZ3DAsoROaI38YsGsyJLiPPVizjAEKALK w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="276730867"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="276730867"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:38:02 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="647728091"
Received: from yantem-mobl9.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.24.154])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:38:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/7] ASoC: rt7*-sdw: harden jack_detect_handler
Date: Mon,  6 Jun 2022 15:37:50 -0500
Message-Id: <20220606203752.144159-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606203752.144159-1-pierre-louis.bossart@linux.intel.com>
References: <20220606203752.144159-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, vkoul@kernel.org, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Realtek headset codec drivers typically check if the card is
instantiated before proceeding with the jack detection.

The rt700, rt711 and rt711-sdca are however missing a check on the
card pointer, which can lead to NULL dereferences encountered in
driver bind/unbind tests.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/rt700.c      | 2 +-
 sound/soc/codecs/rt711-sdca.c | 2 +-
 sound/soc/codecs/rt711.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt700.c b/sound/soc/codecs/rt700.c
index af32295fa9b93..4a99d5f4706fd 100644
--- a/sound/soc/codecs/rt700.c
+++ b/sound/soc/codecs/rt700.c
@@ -162,7 +162,7 @@ static void rt700_jack_detect_handler(struct work_struct *work)
 	if (!rt700->hs_jack)
 		return;
 
-	if (!rt700->component->card->instantiated)
+	if (!rt700->component->card || !rt700->component->card->instantiated)
 		return;
 
 	reg = RT700_VERB_GET_PIN_SENSE | RT700_HP_OUT;
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index af73bcb4560a3..93b36f05cb567 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -294,7 +294,7 @@ static void rt711_sdca_jack_detect_handler(struct work_struct *work)
 	if (!rt711->hs_jack)
 		return;
 
-	if (!rt711->component->card->instantiated)
+	if (!rt711->component->card || !rt711->component->card->instantiated)
 		return;
 
 	/* SDW_SCP_SDCA_INT_SDCA_0 is used for jack detection */
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 1e35ba433a7e7..2f445b27305a4 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -242,7 +242,7 @@ static void rt711_jack_detect_handler(struct work_struct *work)
 	if (!rt711->hs_jack)
 		return;
 
-	if (!rt711->component->card->instantiated)
+	if (!rt711->component->card || !rt711->component->card->instantiated)
 		return;
 
 	if (pm_runtime_status_suspended(rt711->slave->dev.parent)) {
-- 
2.34.1


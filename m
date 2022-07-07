Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BBD56A21A
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 14:35:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2568C1681;
	Thu,  7 Jul 2022 14:34:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2568C1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657197337;
	bh=2fxn4vRcQMRgs0A91iQvkTNuZig6q13IIN+ZPUz7Q0Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CNbN1grbwNeUyDbZ6kYMAZvNeCCyv4EPQV4Pfp2jtCejwnxcoX7SXsoqjpQ+uGMvR
	 sS4OUMA7UqulkvGO2ZGJ+wj3Xa3a0e7GGe3FGV0QPA+HjyLMzFqVWSubQze4r5leFn
	 SzAltKACp9X8UX0BH7cdb0oLEZYB9vMkHjJsoyR4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3E74F80588;
	Thu,  7 Jul 2022 14:32:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6958F80587; Thu,  7 Jul 2022 14:32:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A277EF80557
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 14:32:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A277EF80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="G6A4tJDZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657197133; x=1688733133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2fxn4vRcQMRgs0A91iQvkTNuZig6q13IIN+ZPUz7Q0Q=;
 b=G6A4tJDZXnGoE+pSQrEBSbBAZD5MdG4A4c3V6g2zEQ3+JOUktePD4Xp+
 94ROQy2z17BkYWWG14RcTv/vhP2HZft85nQqbEKvdEqXp63eBOCfRBl7I
 rh8vLg3dXfBAcnRNK/5SxS9lRnJ1TVXOZh+hd21MZnDkSKdc3ToxEVJCE
 1i6c0/YnmjTn3Mp3Kh+QNVePNNv3YWPekwQ/IG8hBLkT9AZTOdpl5XSqY
 Y/n8hsvms/3IgCqufQSODQVAUGkPOmGFfAfYk61RaPN22/aAhTxtKHfhY
 IBuUm9SEzFYIX84cKnlp6cVuQGQ2ZvhnWJKyFd7PEdvde/n84JESWYQCn w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="272805957"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="272805957"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 05:32:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="593720695"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga002.jf.intel.com with ESMTP; 07 Jul 2022 05:32:08 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 11/12] ASoC: Intel: avs: Lower UNLOAD_MULTIPLE_MODULES IPC
 timeout
Date: Thu,  7 Jul 2022 14:41:52 +0200
Message-Id: <20220707124153.1858249-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707124153.1858249-1-cezary.rojewski@intel.com>
References: <20220707124153.1858249-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Module unloading operation performs memory unmapping and the weight of
the opration does not different from any other standard IPC. There is no
dependency on secondary task like in module loading scenario where
larger message timeout is recommended.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/messages.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index 28a948cf790f..d4bcee1aabcf 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -59,7 +59,7 @@ int avs_ipc_unload_modules(struct avs_dev *adev, u16 *mod_ids, u32 num_mod_ids)
 	request.data = mod_ids;
 	request.size = sizeof(*mod_ids) * num_mod_ids;
 
-	ret = avs_dsp_send_msg_timeout(adev, &request, NULL, AVS_CL_TIMEOUT_MS);
+	ret = avs_dsp_send_msg(adev, &request, NULL);
 	if (ret)
 		avs_ipc_err(adev, &request, "unload multiple modules", ret);
 
-- 
2.25.1


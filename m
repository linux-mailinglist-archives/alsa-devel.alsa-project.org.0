Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEB75F9E51
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 14:05:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A29B2975;
	Mon, 10 Oct 2022 14:04:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A29B2975
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665403536;
	bh=WITP0r5AgZxlVo1fQXrFXmw6o2iVJQ0gaMwaR+xtqFY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZNifPZeDW+BzwwAqMw/MvkSxJNiqoLLqx/CnnP9ZwDz+jIPXooiILWlACeJjCCuez
	 n35aZTkn/9YQwlhOm/5RuAA967YmLLXn09BJF79YsJFHznY8a5VyXaYfiAf8VeJOmC
	 uputDLTaH6+B2CavKwCkJgH3TCA4+c3hsZEW7oUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C0C4F80543;
	Mon, 10 Oct 2022 14:04:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E5A2F80155; Mon, 10 Oct 2022 14:03:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A8ECF80155
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 14:03:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A8ECF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ARhGHXK0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665403434; x=1696939434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WITP0r5AgZxlVo1fQXrFXmw6o2iVJQ0gaMwaR+xtqFY=;
 b=ARhGHXK0DwjZ0uo9GcNj+khbR8A0PHuRahtvKsJxxO/MPeMc0fYULWZR
 1sE3YtRsI8+LJ0LWktmlLRkyH4MJv+3f+soX8Evu00v5x0WO/0x7VVC+g
 siorGqQg0t6tFCk8V/QBu7Q6sVDsTkSQbLcsdAZpRKlspZyVOKEjvQE2X
 boUOXbWkNbFt+264a6XyTiIB2U0ZCJmI+WiEMZhx36AXEJdxPDgph9quC
 O7vyggWWSvQgSXaOGAHtRaTt82PYmTa/lfGUURbubEIDOFDHX3l+RACRK
 mGDLB0haMd1ZXcIBO4/P5kUalXQSM+h/2NubpCam7jXIXYWUMyFYHVdfL g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="368346067"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="368346067"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 05:03:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="871078870"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="871078870"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 10 Oct 2022 05:03:50 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 02/15] ASoC: Intel: avs: Fix potential RX buffer overflow
Date: Mon, 10 Oct 2022 14:19:42 +0200
Message-Id: <20221010121955.718168-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010121955.718168-1-cezary.rojewski@intel.com>
References: <20221010121955.718168-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 CoolStar <coolstarorganization@gmail.com>,
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

If an event caused firmware to return invalid RX size for
LARGE_CONFIG_GET, memcpy_fromio() could end up copying too many bytes.
Fix by utilizing min_t().

Reported-by: CoolStar <coolstarorganization@gmail.com>
Fixes: f14a1c5a9f83 ("ASoC: Intel: avs: Add module management requests")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/ipc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index 020d85c7520d..77da206f7dbb 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -192,7 +192,8 @@ static void avs_dsp_receive_rx(struct avs_dev *adev, u64 header)
 		/* update size in case of LARGE_CONFIG_GET */
 		if (msg.msg_target == AVS_MOD_MSG &&
 		    msg.global_msg_type == AVS_MOD_LARGE_CONFIG_GET)
-			ipc->rx.size = msg.ext.large_config.data_off_size;
+			ipc->rx.size = min_t(u32, AVS_MAILBOX_SIZE,
+					     msg.ext.large_config.data_off_size);
 
 		memcpy_fromio(ipc->rx.data, avs_uplink_addr(adev), ipc->rx.size);
 		trace_avs_msg_payload(ipc->rx.data, ipc->rx.size);
-- 
2.25.1


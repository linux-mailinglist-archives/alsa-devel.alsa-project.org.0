Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E20A5F9DFB
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 13:53:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CDBF28E5;
	Mon, 10 Oct 2022 13:52:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CDBF28E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665402803;
	bh=WITP0r5AgZxlVo1fQXrFXmw6o2iVJQ0gaMwaR+xtqFY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CBkOOhfSSKayp31dPrIRliNQJcjwgf8i0l2uxLpWvah7QmabLgE3rIGBDt4vB3KmY
	 RoAcKPKGd6LAKpz7EFwwmlPSErLJsxLbKheSeCGGCmLxDGZQftRpSd5lVfOH01C68o
	 HL7qIAMkttI8ws9KsB/w22l5teyERScvUfF8T8fs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33088F80552;
	Mon, 10 Oct 2022 13:51:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69A7DF80543; Mon, 10 Oct 2022 13:51:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98628F800B8
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 13:51:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98628F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KHR8eOTj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665402701; x=1696938701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WITP0r5AgZxlVo1fQXrFXmw6o2iVJQ0gaMwaR+xtqFY=;
 b=KHR8eOTjDeHsE4p/ZCdLj3fpxwhELcfOZy9WZoHgOmEA7NsykXrlXr4P
 PK7azGaq66ol6Ao64Aw0Li/LHP4wdqhw+M/EWau5Iq9jw2GD+iW89sLcE
 i5w456vaCyecwYcpNutFNWs0eHCdgihoztD8i2aUolDEBm3Zl0KWp2aFQ
 lUIXDYZl/kgZ8kjBfWya7jwWBldem6CVztFF/J/CDWa6/Rjn+Y3q3cAeR
 teYxUF+5K6eX6aWS3H1oyoPdK80ggvkLvtwFukql6tn0VPBkuT/mBtPag
 AKepem49wNfulVyEKqtVSOe1E3Ue9KSQTNxbX9G/CgfyyGhDgIOJuDB3J A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="390513215"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="390513215"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 04:51:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="954889042"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="954889042"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 10 Oct 2022 04:51:38 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 02/15] ASoC: Intel: avs: Fix potential RX buffer overflow
Date: Mon, 10 Oct 2022 14:07:36 +0200
Message-Id: <20221010120749.716499-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010120749.716499-1-cezary.rojewski@intel.com>
References: <20221010120749.716499-1-cezary.rojewski@intel.com>
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


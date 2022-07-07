Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A50956A21B
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 14:35:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC69B1674;
	Thu,  7 Jul 2022 14:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC69B1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657197352;
	bh=FcS/5pO861udjUryGuB3jacwCNWcBYXzpZo9rEa6svc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uUi6BDqkiadVHYQEJtYFOiNOsRrqDqfjcZ1E8B7unBToA4c+lq3iKZ24BewJNjh47
	 sdv5jZjmCKlesAd4tMTcbU+24fLrD8AmGsKUx+zRptPzhH1yJTxrU6aYyTA6HnWlCM
	 3S/+3KCe3T3QIZzoWvsAoutCIfe6uwTv8xZ62Q7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE34CF804F1;
	Thu,  7 Jul 2022 14:32:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16A06F80589; Thu,  7 Jul 2022 14:32:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 105DDF8052E
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 14:32:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 105DDF8052E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ath5xWYM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657197122; x=1688733122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FcS/5pO861udjUryGuB3jacwCNWcBYXzpZo9rEa6svc=;
 b=Ath5xWYMkx8hxUdbHizHG65q535gRn5mLv5iVdE5jxH3HG/wXD4cBZlR
 mBKB7BFiRN7Pwd9ojxVla3rkNV5q/QiCXafC8pkkxAUeKlZywzl3auvdY
 MnU++nUnTbw91Y2oymCIkcU2nvAPUV97cIreD83b0SyvdZsIcR1m9Pjja
 M/B3fGlrgbLoWZCDs4McgYhjN3qTkm+nxL3jIspthpc+6hg0f5rk40eCF
 Pz2o+yy0lucqSQmZPKeBHwWJS8rV3EN4wrm/+mnJmuEYauntB8LmTeQRa
 qCNHZU/Lz+TyBjP9fmzlFjOlfv8VdowdCi7Wzby/bXB0YguzdXkgwy9AZ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="272805920"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="272805920"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 05:32:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="593720618"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga002.jf.intel.com with ESMTP; 07 Jul 2022 05:31:58 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 06/12] ASoC: Intel: avs: Block IPC channel on suspend
Date: Thu,  7 Jul 2022 14:41:47 +0200
Message-Id: <20220707124153.1858249-7-cezary.rojewski@intel.com>
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

To allow for driver's filesystem interfaces e.g.: debugfs, to be touched
even when the device is asleep, mark IPC-channel as blocked when the
device is suspended. This causes any invocation of said interfaces that
do not toggle PM themselves to gracefully fail with "Operation not
permitted" message.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 664f87c33e9d..4234adeb3d1c 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -556,6 +556,7 @@ static int __maybe_unused avs_suspend_common(struct avs_dev *adev)
 		return AVS_IPC_RET(ret);
 	}
 
+	avs_ipc_block(adev->ipc);
 	avs_dsp_op(adev, int_control, false);
 	snd_hdac_ext_bus_ppcap_int_enable(bus, false);
 
-- 
2.25.1


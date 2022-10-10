Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B01645F9E0D
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 13:54:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 498142923;
	Mon, 10 Oct 2022 13:54:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 498142923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665402893;
	bh=xN+Dl4IyK8wO1+W3xgwz+tpP2k/nEyWk0uXkXJasap8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=okR2g160QGdMNuyePrxWTuxYg0DzZQiYdnJYWtRbEE5ZWxHOWL4Cai/hQTwpqc4wt
	 xQW7/R591L6KTDNQt64O/CZ0eYfq8gRtiWLrqhWrbweZNO8ZhvXykvdsq0Lh5s14Cl
	 TqZvcN3ukHGyxr7Z8ROcI/avwFNsdjjKjFU9U9i8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDD9EF80589;
	Mon, 10 Oct 2022 13:51:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A48EF80578; Mon, 10 Oct 2022 13:51:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3E39F80559
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 13:51:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3E39F80559
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Mlw995p8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665402712; x=1696938712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xN+Dl4IyK8wO1+W3xgwz+tpP2k/nEyWk0uXkXJasap8=;
 b=Mlw995p8uZ+jNesXUKdfXPl/yZ0WsrHMEwDy5drkVK+dL8rFXwi59N2f
 oNSTlqxfb9LTbedaCz4ivA8vY0M7JCj3iE8g5qDkx/BaRwVBpZNP80j5r
 Cq0OSGhPWU1bgakIFb0FQTKmz76t35jRheQWibCRdaFwvnWLoxcurSvfd
 24Sfb+o3jtGPdceOODKvG02mik84JFTcP/sUSU9bD56SIliILakhS+uDQ
 f6y0z7b0sJZUMHX4le/IQdHLqe5j94mrvLd70l4xmWFEl1sGUHoduoKgN
 xdr3G8Getdpd//H6zOvO4j5MTEaI3X3rYQ8VH6FMJkt2kaCjv3W+T1prz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="390513246"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="390513246"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 04:51:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="954889068"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="954889068"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 10 Oct 2022 04:51:49 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 08/15] ASoC: Intel: avs: Simplify d0ix disabling routine
Date: Mon, 10 Oct 2022 14:07:42 +0200
Message-Id: <20221010120749.716499-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010120749.716499-1-cezary.rojewski@intel.com>
References: <20221010120749.716499-1-cezary.rojewski@intel.com>
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

No need to atomic_add_return(1) when there is atomic_inc_return()
available.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index 77da206f7dbb..152f8d0bdf8e 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -74,7 +74,7 @@ int avs_dsp_disable_d0ix(struct avs_dev *adev)
 	struct avs_ipc *ipc = adev->ipc;
 
 	/* Prevent PG only on the first disable. */
-	if (atomic_add_return(1, &ipc->d0ix_disable_depth) == 1) {
+	if (atomic_inc_return(&ipc->d0ix_disable_depth) == 1) {
 		cancel_delayed_work_sync(&ipc->d0ix_work);
 		return avs_dsp_set_d0ix(adev, false);
 	}
-- 
2.25.1

